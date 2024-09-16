#!/usr/intel/bin/python3
import sys
sys.path.append("/usr/intel/pkgs/python3/3.6.3/modules/r1/lib64/python3.6/site-packages")
import datetime
import os
import shutil
import pandas as pd
import argparse
import logging
import re

global workarea
global user
global proj

workarea = os.getenv('WORKAREA')
user = os.getenv('USER')
proj = os.getenv('STEPPING')



def read_excel_sheets(file_path):
    try:
        # Read all sheets into a dictionary of DataFrames
        input_file = pd.read_excel(file_path, sheet_name=None)
        return input_file
    except Exception as e:
        print_and_log(f"error open the input path - {e}")
        exit()

def add_intel_prefix():
   return (f'''
//  INTEL TOP SECRET
//
//  Copyright 2018 Intel Corporation All Rights Reserved.
//
//  The source code contained or described herein and all documents related
//  to the source code (Material) are owned by Intel Corporation or its
//  suppliers or licensors. Title to the Material remains with Intel
//  Corporation or its suppliers and licensors. The Material contains trade
//  secrets and proprietary and confidential information of Intel or its
//  suppliers and licensors. The Material is protected by worldwide copyright
//  and trade secret laws and treaty provisions. No part of the Material may
//  be used, copied, reproduced, modified, published, uploaded, posted,
//  transmitted, distributed, or disclosed in any way without Intel's prior
//  express written permission.
//
//  No license under any patent, copyright, trade secret or other intellectual
//  property right is granted to or conferred upon you by disclosure or
//  delivery of the Materials, either expressly, by implication, inducement,
//  estoppel or otherwise. Any license under such intellectual property rights
//  must be express and approved by Intel in writing.
//  Inserted by Intel DSD.

//-----------------------------------------------------------------------------
// Project       : {proj}
//-----------------------------------------------------------------------------
// Author        : Automation script
// Current Owner : '''+user+'''
// Created       : '''+str(datetime.date.today())+'''
//-----------------------------------------------------------------------------
// Description   : Automated code 
//-----------------------------------------------------------------------------
// automation script output created by Ron Morag
//-----------------------------------------------------------------------------\n''')

def extract_manual_code(file_path, start_marker="//start of manual code//", end_marker="//end of manual code//", start=0):
    manual_code = ""
    if os.path.exists(file_path):
        try:
            with open(file_path, 'r') as file:
                # Read the entire content of the file
                content = file.read()
                content = content[start:]

                # Find the start and end indices of the manual code
                start_index = content.find(start_marker)
                end_index = content.find(end_marker)

                # If both markers are found, extract the manual code
                if start_index != -1 and end_index != -1:
                    # Find the beginning of the line for the start marker
                    newline_before_start = content.rfind('\n', 0, start_index)
                    if newline_before_start == -1:
                        # If no newline is found, start from the beginning of the file
                        newline_before_start = 0
                    else:
                        # Adjust to start from the next character after the newline
                        newline_before_start += 1

                    # Adjust the end index to include the length of end_marker
                    end_index += len(end_marker)

                    # Extract the manual code
                    manual_code = content[newline_before_start:end_index]
                else:
                    manual_code = f"{start_marker}\n\n{end_marker}\n"
        except FileNotFoundError:
            print(f"The file at {file_path} was not found.")
        except Exception as e:
            print(f"An error occurred: {e}")
    else:
        manual_code = f"{start_marker}\n\n{end_marker}\n"

    return manual_code

def create_parameters_file(df):
    try:
        required_columns = {'name', 'value', 'comments'}
        if not required_columns.issubset(df.columns):
            raise ValueError(f"DataFrame must contain the following columns: {required_columns}")

        file_path = f'{output_dir}/{ip_name}_parameters.sv'
        old_file_path = f'{output_dir}_old/{ip_name}_parameters.sv'
        define_string = f"""
`ifndef _{ip_name.upper()}_PARAMETERS_SV_
`define _{ip_name.upper()}_PARAMETERS_SV_\n
"""

        global parameters_man_code
        parameters_man_code = extract_manual_code(old_file_path)


        with open(file_path, 'w') as file:
            file.write(add_intel_prefix())
            file.write(define_string)

            for index, row in df.iterrows():
                file.write(f"\nparameter {row['name']} = {row['value']};\n")

    except Exception as e:
        print_and_log(f"error creating parameters file {e}")
        exit()

def append_types_to_file(df):
    try:

        # Check if the DataFrame has the required columns
        required_columns = {'definition', 'name', 'width', 'description', 'comments'}
        if not required_columns.issubset(df.columns):
            raise ValueError(f"DataFrame must contain the following columns: {required_columns}")

        file_path = f'{output_dir}/{ip_name}_parameters.sv'

        # Open the file in write mode
        with open(file_path, 'a') as file:
            # Iterate over the DataFrame rows
            for index, row in df.iterrows():
                if pd.isnull(row['definition']) or row['definition'].strip() == '' or row['definition'].strip() == 'none':
                    file.write(f"\ntypedef {row['width']} {row['name'].strip()};\n")

                # Check if the definition is 'enum'
                elif row['definition'].strip().lower() == 'enum':
                    # Write the enum typedef to the file
                    file.write(f"\ntypedef enum {row['width']} {{\n")
                    # Split the description into enum values and write them
                    enum_values = row['description'].split(',')
                    for value in enum_values[:-1]:
                        file.write(f"    {ip_name.upper()}_{value.strip()},\n")
                    file.write(f"    {ip_name.upper()}_{enum_values[-1].strip()}\n")
                    # Write the closing brace with the typedef name
                    file.write(f"}} {row['name'].strip()};\n")
            file.write(f"\n{parameters_man_code}\n")
            file.write('\n`endif')

    except Exception as e:
        print_and_log(f"error appending types to parameters file - {e}")
        exit()

def create_structs(df):

    try:

        # Initialize variables
        struct_code = ""
        struct_name = ""
        struct_body = ""
        in_struct = False

        output_path = f'{output_dir}/{ip_name}_structs.sv'
        old_output_path = f'{output_dir}_old/{ip_name}_structs.sv'
        define_string = f"""
`ifndef _{ip_name.upper()}_STRUCTS_SV_
`define _{ip_name.upper()}_STRUCTS_SV_\n
"""

        global structs_man_code
        structs_man_code = extract_manual_code(old_output_path)

        # Iterate over the DataFrame rows
        for index, row in df.iterrows():
            # Check if a new struct definition should start
            if pd.notna(row['class']):
                # If already in a struct, close the previous struct
                if in_struct:
                    struct_code += struct_body + "} " + struct_name + ";\n\n"
                    struct_body = ""
                # Start a new struct
                struct_name = f"{ip_name}_{row['class'].strip()}_s"
                struct_body += "typedef struct packed {\n"
                in_struct = True

            # Skip rows without a field name
            if pd.isna(row['field']):
                continue

            # Set default type to 'bit' if type is empty
            field_type = row['type'].strip() if pd.notna(row['type']) else 'bit'
            if field_type in common_classes_names:
                field_type = f"{ip_name}_{field_type}"
            # Set width if provided and adjust according to the rules
            if pd.notna(row['width']) and not ((field_type in ['bit','logic']) and row['width'] == 1):
                width_str = f"[{int(row['width'])-1}:0] " if field_type in ['bit','logic'] else ""
            else:
                width_str = ""

            # Add the field to the struct body
            struct_body += f"    {field_type} {width_str}{row['field'].strip()};\n"

        # Close the last struct if there was one
        if in_struct:
            struct_code += struct_body + "} " + struct_name + ";\n\n"

        # Write the generated code to the specified output file
        with open(output_path, 'w') as output_file:
            output_file.write(add_intel_prefix())
            output_file.write(define_string)
            output_file.write(struct_code)


    except Exception as e:
        print_and_log(f"error in creating structs file - {e}")
        exit()


def create_common_classes(df,pkg_path):

    try:

        global common_classes_names

        # Create the directory for the output files if it doesn't exist
        output_dir_path = f'{output_dir}/{ip_name}_common_classes'
        os.makedirs(output_dir_path, exist_ok=True)

        # Initialize variables
        current_class_name = None
        fields = {}  # Initialize the list of fields for the current class
        special_fields = {}
        total_width = 0
        class_code = ""

        # Iterate over the DataFrame rows
        for index, row in df.iterrows():
            # Check if a new class definition starts here
            if pd.notnull(row['class']):
                # If there is an ongoing class definition, end it and write to the file
                if current_class_name is not None:
                    class_code += generate_class_additional_parts(current_class_name, fields, total_width,cov_man_code)
                    class_code += f"\n{man_code}\n"
                    class_code += f"endclass : {current_class_name}\n"
                    write_class_to_file(output_dir_path, current_class_name, class_code)
                    class_code = ""
                    fields = {}
                    special_fields = {}
                    total_width = 0

                # Start a new class definition
                current_class_name = row['class'].strip()
                common_classes_names.append(current_class_name)
                current_class_name = f"{ip_name}_{current_class_name}"
                class_path = f"{output_dir_path}/{current_class_name}.sv"
                old_class_path = f"{output_dir_path}_old/{current_class_name}.sv"
                with open(pkg_path, 'a') as pkg_file:
                    pkg_file.write(f'\t`include "{ip_name}_common_classes/{current_class_name}.sv";\n\n')
                man_code = extract_manual_code(old_class_path)
                cov_man_code = extract_manual_code(old_class_path, "//start of coverage manual code//","//end of coverage manual code//")
                class_code += f"class {current_class_name} extends ipu_bfm_pkg::ipu_base_pkt;\n"

            # Skip rows without a field name or width
            if pd.isnull(row['field']) or pd.isnull(row['width']):
                continue

            # Extract field information and generate the field definition
            field_name = row['field'].strip()
            field_type = row['type'].strip() if pd.notnull(row['type']) else 'bit'
            field_width = int(row['width'])
            field_lsb = int(row['lsb'])
            field_msb = int(row['msb'])
            field_comments = row['comments'] if ((pd.notnull(row['comments'])) and (len(str(row['comments']))) < 40) else ""
            total_width += int(field_width)
            fields[field_name] = [field_width,field_type]
            if field_type in common_classes_names:
                field_type = f"{ip_name}_{field_type}"
                special_fields[field_name] = [field_type, field_msb, field_lsb]

            # Generate the field definition
            if field_type.lower() in ['bit', 'logic']:
                if pd.notnull(field_width) and field_width != 1:
                    field_def = "    rand {} [{}:{}] {}".format(field_type, field_width - 1, 0, field_name)
                else:
                    field_def = "    rand {} {}".format(field_type, field_name)
            else:
                field_def = "    rand {} {}".format(field_type, field_name)

            # Add comments if available
            if field_comments:
                field_def += "; // {}\n".format(field_comments)
            else:
                field_def += ";\n"

            # Append the field definition to the class code
            class_code += field_def

        # Write the last class definition to the file
        if current_class_name is not None:
            class_code += generate_class_additional_parts(current_class_name, fields, total_width,cov_man_code)
            class_code += f"\n{man_code}\n"
            class_code += f"endclass : {current_class_name}\n\n"
            write_class_to_file(output_dir_path, current_class_name, class_code)
    except Exception as e:
        print_and_log(f"error creating common classes - {e}")
        exit()

def write_class_to_file(output_dir_path, class_name, class_code):

    try:

        # Define the file path for the class
        class_file_path = os.path.join(output_dir_path, f"{class_name}.sv")
        define_string = f"""
`ifndef _{class_name.upper()}_SV_
`define _{class_name.upper()}_SV_\n
"""
        # Write the class code to its own file
        with open(class_file_path, 'w') as class_file:
            class_file.write(add_intel_prefix())
            class_file.write(define_string)
            class_file.write(class_code)
            class_file.write(f"`endif  // _{class_name.upper()}_SV_\n")

    except Exception as e:
        print_and_log(f"error writing {class_name} - {e}")
        exit()



def create_class (df, sheet_name):

    try:

        sheet_name = f"{ip_name}_{sheet_name}"
        output_path = f"{output_dir}/{sheet_name}.sv"
        old_output_path = f"{output_dir}_old/{sheet_name}.sv"
        define_string = f"""
`ifndef _{sheet_name.upper()}_SV_
`define _{sheet_name.upper()}_SV_\n
"""
        special_fields ={}
        man_code = extract_manual_code(old_output_path)
        cov_man_code = extract_manual_code(old_output_path,"//start of coverage manual code//", "//end of coverage manual code//")

        # Initialize variables
        class_name = sheet_name
        class_code = ""

        #Open the output file
        with open(output_path, 'w') as output_file:
            output_file.write(add_intel_prefix() + "\n")
            output_file.write(define_string + '\n')
            fields = {}  # Initialize the list of fields for the current class
            class_code += "class {} extends ipu_bfm_pkg::ipu_base_pkt;\n".format(class_name)
            total_width = 0
            # Iterate over the DataFrame rows
            for index, row in df.iterrows():
                # Skip rows without a field name or width
                if (pd.isnull(row['field']) or pd.isnull(row['width'])):
                    continue
                # Extract field information
                field_name = row['field'].strip()
                field_type = row['type'].strip() if pd.notnull(row['type']) else 'bit'
                field_width = int(row['width'])
                field_lsb = int(row['lsb'])
                field_msb = int(row['msb'])
                field_comments = row['comments'] if (("comments" in df.columns and pd.notnull(row['comments'])) and (len(str(row['comments']))) < 40) else ""
                total_width += int(field_width)
                fields[field_name] = [field_width,field_type]
                if field_type in common_classes_names:
                    field_type = f"{ip_name}_{field_type}"
                    special_fields[field_name] = [field_type,field_msb,field_lsb]



                # Generate the field definition
                if field_type.lower() in ['bit', 'logic']:
                    if pd.notnull(field_width) and field_width != 1:
                        field_def = "    rand {} [{}:{}] {}".format(field_type, field_width - 1, 0, field_name)
                    else:
                        field_def = "    rand {} {}".format(field_type, field_name)
                else:
                    field_def = "    rand {} {}".format(field_type, field_name)

                # Add comments if available
                if field_comments:
                    field_def += "; // {}\n".format(field_comments)
                else:
                    field_def += ";\n"

                # Append the field definition to the class code
                class_code += field_def

            # Write the last class definition to the file
            class_code += generate_class_additional_parts(class_name, fields, total_width, cov_man_code, special_fields)
            class_code += f"\n{man_code}\n\n"
            class_code += "endclass : {}\n".format(class_name)
            output_file.write(class_code)
            output_file.write('\n`endif')

    except Exception as e:
        print_and_log(f"error creating {sheet_name} - {e}")
        exit()



def create_struct_for_class(df, sheet_name, output_path):

    try:

        # Initialize variables
        struct_code = ""
        struct_name = f"{ip_name}_{sheet_name}_s"
        struct_body = ""
        struct_body += "typedef struct packed {\n"


        # Iterate over the DataFrame rows
        for index, row in df.iterrows():

            # Skip rows without a field name or width
            if (pd.isna(row['field']) or pd.isna(row['width'])):
                continue

            # Set default type to 'bit' if type is empty
            field_type = row['type'].strip() if pd.notna(row['type']) else 'bit'
            if field_type in common_classes_names:
                field_type = f"{ip_name}_{field_type}_s"
            # Set width if provided and adjust according to the rules
            if pd.notna(row['width']) and not ((field_type in ['bit', 'logic']) and row['width'] == 1):
                width_str = f"[{int(row['width'])-1}:0] " if field_type in ['bit', 'logic'] else ""
            else:
                width_str = ""

            # Add the field to the struct body
            struct_body += f"    {field_type} {width_str}{row['field'].strip()};\n"

        struct_code += struct_body + "} " + struct_name + ";\n\n"
        # Write the generated code to the specified output file
        with open(output_path, 'a') as output_file:
            output_file.write(f"{struct_code}")

    except Exception as e:
        print_and_log(f"error create sturct for {sheet_name} - {e}")
        exit()



def generate_class_additional_parts(class_name, fields, total_width,cov_man_code = "",special_fields ={},):
    # Generate the uvm_field_int macros for each field
    uvm_macros = ""
    for field_name in fields:
        if field_name in special_fields:
            uvm_macros+= f"\t\t`uvm_field_object({field_name}, UVM_DEFAULT|UVM_NOCOMPARE)\n"
        else:
            uvm_macros+= f"\t\t`uvm_field_int({field_name}, UVM_DEFAULT)\n"

    new_body = ""
    for field_name in fields:
        if field_name in special_fields:
            new_body += f'\t\t{field_name} = {special_fields[field_name][0]}::type_id::create("{field_name}");'

    # Generate the convert2string function body

    convert2string_body = ""
    for field_name in fields:
        if field_name in special_fields:
            convert2string_body += f"\t\tinfo = {{info, $sformatf(\"\\n {field_name} : '%s\", {field_name}.convert2string())}};\n"
        else:
            convert2string_body += f"\t\tinfo = {{info, $sformatf(\"\\n {field_name} : 'h%0h\", {field_name})}};\n"


    # Generate the do_compare function body

    do_compare_body = ""
    for field_name in fields:
        if field_name in special_fields:
            do_compare_body += f"\t\tdo_compare &= comparer.compare_object(\"{field_name}\", {field_name}, rhs_.{field_name});\n"
        else:
            do_compare_body += f"\t\tdo_compare &= comparer.compare_field(\"{field_name}\", {field_name}, rhs_.{field_name}, $bits(this.{field_name}));\n"




    unpack_body =""
    for field_name in fields:
        if field_name in special_fields:
            unpack_body += f"""\t\tbegin
            logic {field_name}_bits [];
            {field_name}_bits = new[$bits({special_fields[field_name][0]}_s)];
            {field_name}_bits = {{<<{{tmp_act.{field_name}}}}};
            {field_name}.unpack_bits({field_name}_bits);
        end\n"""
        else:
            unpack_body += f"\t\tthis.{field_name} = tmp_act.{field_name};\n"



    pack_body = ""

    for field_name in fields:
        if field_name not in special_fields:
            pack_body += f"\t\ttmp_act.{field_name} = this.{field_name};\n"

        else:
            pack_body += f"""\t\tbegin
            logic {field_name}_bits []; 
            {field_name}.pack_bits({field_name}_bits);
            for (int i = 0; i < $bits({field_name}_bits); i++) begin
                tmp_act.{field_name}[i] = {field_name}_bits[i];
            end
        end\n"""


    sample_body = ""
    for field_name in fields:
        if field_name in special_fields:
            sample_body += f"{field_name}.sample_pkt();\n"


    coverage_body = ""
    for field_name in fields:
        if field_name not in special_fields:
            if "[" in fields[field_name][1]:
                continue
            elif fields[field_name][0] == 1:
                coverage_body += f"""\n\t\t{field_name}_cp : coverpoint cov_pkt.{field_name} {{
                bins min = {{0}};
                bins max = {{1}};
        }}\n"""
            else:
                coverage_body += f"""\n\t\t{field_name}_cp : coverpoint cov_pkt.{field_name} {{
                bins min = {{0}};
                bins mid[2] = {{[1:2**($bits({field_name}))- 2]}};
                bins max = {{2**($bits({field_name}))- 1}};
        }}\n"""


    # Generate the additional parts of the class

    additional_parts = f"""
    `uvm_object_utils_begin({class_name})
{uvm_macros}
    `uvm_object_utils_end

    function new(string name = "{class_name}");
        super.new(name);
        {class_name}_cg = new();
{new_body}
    endfunction

    virtual function string convert2string();
        string info;
        info = "{class_name}:";

        
{convert2string_body}
        return info;
    endfunction

    virtual function void unpack_bits(const ref logic info[]);
        {class_name}_s tmp_act;

        for(int i = 0; i < $bits({class_name}_s); i++) begin
            tmp_act[i] = info [i];
        end
        
{unpack_body}        
        `uvm_info(get_full_name(), "{class_name} unpack_bits debug", UVM_HIGH)

    endfunction

    virtual function void pack_bits(ref logic info[]);
        
        {class_name}_s tmp_act;
        
{pack_body}        
        
        info = new[$bits({class_name}_s)];
        info = {{<<{{tmp_act}}}};
        
    endfunction

    virtual function bit do_compare(uvm_object rhs, uvm_comparer comparer);
        {class_name} rhs_;
        do_compare = super.do_compare(rhs, comparer);
        assert($cast(rhs_,rhs));

{do_compare_body}
        if(!do_compare)
            `uvm_info(get_full_name(), "{class_name} MISCOMPARE: lhs : ACTUAL, rhs : EXPECTED", UVM_LOW);

    endfunction

    virtual function void sample_pkt();
        {class_name}_cg.sample(this);
        {sample_body}
    endfunction

    covergroup {class_name}_cg with function sample ({class_name}  cov_pkt);

{coverage_body}
{cov_man_code}

    endgroup: {class_name}_cg
"""


    return additional_parts

def print_and_log(message):
    # Print to screen
    print(message)
    # Log to file
    logging.info(message)



def main():

    global log_en
    global ip_name
    global output_dir
    global common_classes_names
    common_classes_names = []

    # log_en = True #TODO remove
    output_dir = "./automation_results"
    # default_input_file_path = 'scripts/fxp/automation_project/automation_input.xlsx' ## sould be an argument
    default_input_file_path = f'{workarea}/scripts/fxp/automation_project/automation_input.xlsx' ## LAN's old script works only with <*>.xls files

    # Create the parser for  user arguments
    parser = argparse.ArgumentParser(description="My script that processes an Excel file.")

    # Add arguments with default values
    parser.add_argument('-file', type=str, default=default_input_file_path,
                        help=f'Path to the Excel file (default: {default_input_file_path})')

    parser.add_argument('-log_en', action='store_true', help='Enable logging')

    parser.add_argument('-ip', type=str, default='fxp', help='IP name (default: default_IP_name)')

    # Parse the arguments
    args = parser.parse_args()

    # Access the arguments
    input_file_path = args.file
    log_en = args.log_en
    ip_name = args.ip

    pkg_path = f"{output_dir}/{ip_name}_pkt_defs_pkg.sv"
    old_pkg_path = f"{output_dir}_old/{ip_name}_pkt_defs_pkg.sv"

    if not os.path.exists(output_dir):
        os.mkdir(output_dir)  ## creating new directory for the script results

    else:
        if os.path.exists(f"{output_dir}_old"):
            shutil.rmtree(f"{output_dir}_old")
        shutil.copytree(output_dir, f"{output_dir}_old")
        shutil.rmtree(output_dir)
        os.mkdir(output_dir)

    if log_en:
        logging.basicConfig(filename=f'{output_dir}/logfile.log', level=logging.INFO, format='%(asctime)s - %(message)s')

    print_and_log('Start of Automation pkt_defs script!')

    pkg_man_code = extract_manual_code(old_pkg_path)
    try:
        with open(pkg_path, 'w') as pkg_file:
            pkg_file.write(add_intel_prefix())
            define_string = f"""
`ifndef _{ip_name.upper()}_PKT_DEFS_PKG_SV_
`define _{ip_name.upper()}_PKT_DEFS_PKG_SV_
"""
            pkg_file.write(f"\n{define_string}\n")
            pkg_file.write(f"package {ip_name}_pkt_defs_pkg; \n\n")
            pkg_file.write(f'\timport uvm_pkg::*;\n\n')
            pkg_file.write(f'\t`include "uvm_macros.svh";\n\n')
    except Exception as e:
        print_and_log(f"error in writing {pkg_path} - {e}")
        exit()




    sheets_data = read_excel_sheets(input_file_path)
    for sheet_name, df in sheets_data.items():
        sheet_name = sheet_name.strip().lower().replace(" ", "_").replace("-","_")
        df.columns = df.columns.str.strip().str.lower()

        if (sheet_name[0] == '!'):
            print_and_log(f"skipping {sheet_name}")
            continue
        elif (sheet_name == '.parameters'):
            create_parameters_file(df)
            print_and_log('creating parameters file')
            with open(pkg_path, 'a') as pkg_file:
                pkg_file.write(f'\t`include "{ip_name}_parameters.sv";\n\n')

        elif (sheet_name == '.types'):
            append_types_to_file(df)
            print_and_log('adding types to prameters file')

        elif (sheet_name == '.common_classes'):
            print_and_log('creating common classes')
            create_structs(df)
            with open(pkg_path, 'a') as pkg_file:
                pkg_file.write(f'\t`include "{ip_name}_structs.sv";\n\n')
            create_common_classes(df,pkg_path)


        else :
            if sheet_name.startswith("."):
                sheet_name = sheet_name [1:]
            output_structs_path = f'{output_dir}/{ip_name}_structs.sv'
            with open(pkg_path, 'a') as pkg_file:
                pkg_file.write(f'\t`include "{ip_name}_{sheet_name}.sv";\n\n')
            create_class(df, sheet_name)
            print_and_log(f'creating {sheet_name} class file')
            create_struct_for_class(df, sheet_name,output_structs_path)

    if os.path.exists(output_structs_path):
        with open(output_structs_path, 'a') as file:
            file.write(f"{structs_man_code}\n")
            file.write('\n`endif')


    with open(pkg_path, 'a') as pkg_file:

        pkg_file.write(f"{pkg_man_code}\n\nendpackage\n\n`endif")

    if ip_name == 'lan':
        # rtl_proj_tools = os.getenv('RTL_PROJ_TOOLS')  # Get the environment variable for original lan script
        script_dir = os.path.dirname(sys.argv[0])
        command = f"{script_dir}/old_script.pl {input_file_path} {ip_name}"

        # Use os.system() to execute the command
        print_and_log("running LAN old script")
        return_code = os.system(command)

        # Check if the command was successful
        if return_code == 0:
            print("lan_old_script executed successfully!")
        else:
            print("lan_old_script failed with return code:", return_code)


main()




