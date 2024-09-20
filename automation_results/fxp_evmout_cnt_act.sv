
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
// Project       : mmg-a0
//-----------------------------------------------------------------------------
// Author        : Automation script
// Current Owner : rmorag
// Created       : 2024-09-17
//-----------------------------------------------------------------------------
// Description   : Automated code 
//-----------------------------------------------------------------------------
// automation script output created by Ron Morag
//-----------------------------------------------------------------------------


`ifndef _FXP_EVMOUT_CNT_ACT_SV_
`define _FXP_EVMOUT_CNT_ACT_SV_


class fxp_evmout_cnt_act extends ipu_bfm_pkg::ipu_base_pkt;
    rand logic vsi_id_valid;
    rand logic [10:0] vsi_id;
    rand logic switch_id_valid;
    rand logic [5:0] switch_id;
    rand logic [10:0] assign_set_id;
    rand logic [24:0] flow_counterid0;
    rand logic [24:0] flow_counterid1;
    rand logic [24:0] flow_counterid2;
    rand logic [24:0] flow_counterid3;
    rand logic [24:0] flow_counterid4;
    rand logic [24:0] flow_counterid5;
    rand logic [2:0] traffic_class;
    rand logic [1:0] packet_type;
    rand logic rx_tx;
    rand logic [2:0] act_commit;
    rand logic [1:0] bc_mc_pass;
    rand logic port2port;
    rand logic cfg_mkr_pkt;
    rand logic miss_prepend;
    rand logic mirror_copy;
    rand logic [1:0] reinjec_stat;
    rand logic parser_error;
    rand logic is_mirror;
    rand logic classify_drop;
    rand logic policer_drop;
    rand logic rate_limit_drop;
    rand logic internal_error_drop;
    rand logic inc_xlr_drop;
    rand logic other_errors;
    rand logic l3_l4_error;
    rand logic header_error;
    rand logic [7:0] count_mode;
    rand logic [13:0] post_mod_pkt_size;
    rand logic [13:0] pre_mod_pkt_size;

    `uvm_object_utils_begin(fxp_evmout_cnt_act)
		`uvm_field_int(vsi_id_valid, UVM_DEFAULT)
		`uvm_field_int(vsi_id, UVM_DEFAULT)
		`uvm_field_int(switch_id_valid, UVM_DEFAULT)
		`uvm_field_int(switch_id, UVM_DEFAULT)
		`uvm_field_int(assign_set_id, UVM_DEFAULT)
		`uvm_field_int(flow_counterid0, UVM_DEFAULT)
		`uvm_field_int(flow_counterid1, UVM_DEFAULT)
		`uvm_field_int(flow_counterid2, UVM_DEFAULT)
		`uvm_field_int(flow_counterid3, UVM_DEFAULT)
		`uvm_field_int(flow_counterid4, UVM_DEFAULT)
		`uvm_field_int(flow_counterid5, UVM_DEFAULT)
		`uvm_field_int(traffic_class, UVM_DEFAULT)
		`uvm_field_int(packet_type, UVM_DEFAULT)
		`uvm_field_int(rx_tx, UVM_DEFAULT)
		`uvm_field_int(act_commit, UVM_DEFAULT)
		`uvm_field_int(bc_mc_pass, UVM_DEFAULT)
		`uvm_field_int(port2port, UVM_DEFAULT)
		`uvm_field_int(cfg_mkr_pkt, UVM_DEFAULT)
		`uvm_field_int(miss_prepend, UVM_DEFAULT)
		`uvm_field_int(mirror_copy, UVM_DEFAULT)
		`uvm_field_int(reinjec_stat, UVM_DEFAULT)
		`uvm_field_int(parser_error, UVM_DEFAULT)
		`uvm_field_int(is_mirror, UVM_DEFAULT)
		`uvm_field_int(classify_drop, UVM_DEFAULT)
		`uvm_field_int(policer_drop, UVM_DEFAULT)
		`uvm_field_int(rate_limit_drop, UVM_DEFAULT)
		`uvm_field_int(internal_error_drop, UVM_DEFAULT)
		`uvm_field_int(inc_xlr_drop, UVM_DEFAULT)
		`uvm_field_int(other_errors, UVM_DEFAULT)
		`uvm_field_int(l3_l4_error, UVM_DEFAULT)
		`uvm_field_int(header_error, UVM_DEFAULT)
		`uvm_field_int(count_mode, UVM_DEFAULT)
		`uvm_field_int(post_mod_pkt_size, UVM_DEFAULT)
		`uvm_field_int(pre_mod_pkt_size, UVM_DEFAULT)

    `uvm_object_utils_end

    function new(string name = "fxp_evmout_cnt_act");
        super.new(name);
        fxp_evmout_cnt_act_cg = new();

    endfunction

    virtual function string convert2string();
        string info;
        info = "fxp_evmout_cnt_act:";

        
		info = {info, $sformatf("\n vsi_id_valid : 'h%0h", vsi_id_valid)};
		info = {info, $sformatf("\n vsi_id : 'h%0h", vsi_id)};
		info = {info, $sformatf("\n switch_id_valid : 'h%0h", switch_id_valid)};
		info = {info, $sformatf("\n switch_id : 'h%0h", switch_id)};
		info = {info, $sformatf("\n assign_set_id : 'h%0h", assign_set_id)};
		info = {info, $sformatf("\n flow_counterid0 : 'h%0h", flow_counterid0)};
		info = {info, $sformatf("\n flow_counterid1 : 'h%0h", flow_counterid1)};
		info = {info, $sformatf("\n flow_counterid2 : 'h%0h", flow_counterid2)};
		info = {info, $sformatf("\n flow_counterid3 : 'h%0h", flow_counterid3)};
		info = {info, $sformatf("\n flow_counterid4 : 'h%0h", flow_counterid4)};
		info = {info, $sformatf("\n flow_counterid5 : 'h%0h", flow_counterid5)};
		info = {info, $sformatf("\n traffic_class : 'h%0h", traffic_class)};
		info = {info, $sformatf("\n packet_type : 'h%0h", packet_type)};
		info = {info, $sformatf("\n rx_tx : 'h%0h", rx_tx)};
		info = {info, $sformatf("\n act_commit : 'h%0h", act_commit)};
		info = {info, $sformatf("\n bc_mc_pass : 'h%0h", bc_mc_pass)};
		info = {info, $sformatf("\n port2port : 'h%0h", port2port)};
		info = {info, $sformatf("\n cfg_mkr_pkt : 'h%0h", cfg_mkr_pkt)};
		info = {info, $sformatf("\n miss_prepend : 'h%0h", miss_prepend)};
		info = {info, $sformatf("\n mirror_copy : 'h%0h", mirror_copy)};
		info = {info, $sformatf("\n reinjec_stat : 'h%0h", reinjec_stat)};
		info = {info, $sformatf("\n parser_error : 'h%0h", parser_error)};
		info = {info, $sformatf("\n is_mirror : 'h%0h", is_mirror)};
		info = {info, $sformatf("\n classify_drop : 'h%0h", classify_drop)};
		info = {info, $sformatf("\n policer_drop : 'h%0h", policer_drop)};
		info = {info, $sformatf("\n rate_limit_drop : 'h%0h", rate_limit_drop)};
		info = {info, $sformatf("\n internal_error_drop : 'h%0h", internal_error_drop)};
		info = {info, $sformatf("\n inc_xlr_drop : 'h%0h", inc_xlr_drop)};
		info = {info, $sformatf("\n other_errors : 'h%0h", other_errors)};
		info = {info, $sformatf("\n l3_l4_error : 'h%0h", l3_l4_error)};
		info = {info, $sformatf("\n header_error : 'h%0h", header_error)};
		info = {info, $sformatf("\n count_mode : 'h%0h", count_mode)};
		info = {info, $sformatf("\n post_mod_pkt_size : 'h%0h", post_mod_pkt_size)};
		info = {info, $sformatf("\n pre_mod_pkt_size : 'h%0h", pre_mod_pkt_size)};

        return info;
    endfunction

    virtual function void unpack_bits(const ref logic info[]);
        fxp_evmout_cnt_act_s tmp_act;

        for(int i = 0; i < $bits(fxp_evmout_cnt_act_s); i++) begin
            tmp_act[i] = info [i];
        end
        
		this.vsi_id_valid = tmp_act.vsi_id_valid;
		this.vsi_id = tmp_act.vsi_id;
		this.switch_id_valid = tmp_act.switch_id_valid;
		this.switch_id = tmp_act.switch_id;
		this.assign_set_id = tmp_act.assign_set_id;
		this.flow_counterid0 = tmp_act.flow_counterid0;
		this.flow_counterid1 = tmp_act.flow_counterid1;
		this.flow_counterid2 = tmp_act.flow_counterid2;
		this.flow_counterid3 = tmp_act.flow_counterid3;
		this.flow_counterid4 = tmp_act.flow_counterid4;
		this.flow_counterid5 = tmp_act.flow_counterid5;
		this.traffic_class = tmp_act.traffic_class;
		this.packet_type = tmp_act.packet_type;
		this.rx_tx = tmp_act.rx_tx;
		this.act_commit = tmp_act.act_commit;
		this.bc_mc_pass = tmp_act.bc_mc_pass;
		this.port2port = tmp_act.port2port;
		this.cfg_mkr_pkt = tmp_act.cfg_mkr_pkt;
		this.miss_prepend = tmp_act.miss_prepend;
		this.mirror_copy = tmp_act.mirror_copy;
		this.reinjec_stat = tmp_act.reinjec_stat;
		this.parser_error = tmp_act.parser_error;
		this.is_mirror = tmp_act.is_mirror;
		this.classify_drop = tmp_act.classify_drop;
		this.policer_drop = tmp_act.policer_drop;
		this.rate_limit_drop = tmp_act.rate_limit_drop;
		this.internal_error_drop = tmp_act.internal_error_drop;
		this.inc_xlr_drop = tmp_act.inc_xlr_drop;
		this.other_errors = tmp_act.other_errors;
		this.l3_l4_error = tmp_act.l3_l4_error;
		this.header_error = tmp_act.header_error;
		this.count_mode = tmp_act.count_mode;
		this.post_mod_pkt_size = tmp_act.post_mod_pkt_size;
		this.pre_mod_pkt_size = tmp_act.pre_mod_pkt_size;
        
        `uvm_info(get_full_name(), "fxp_evmout_cnt_act unpack_bits debug", UVM_HIGH)

    endfunction

    virtual function void pack_bits(ref logic info[]);
        
        fxp_evmout_cnt_act_s tmp_act;
        
		tmp_act.vsi_id_valid = this.vsi_id_valid;
		tmp_act.vsi_id = this.vsi_id;
		tmp_act.switch_id_valid = this.switch_id_valid;
		tmp_act.switch_id = this.switch_id;
		tmp_act.assign_set_id = this.assign_set_id;
		tmp_act.flow_counterid0 = this.flow_counterid0;
		tmp_act.flow_counterid1 = this.flow_counterid1;
		tmp_act.flow_counterid2 = this.flow_counterid2;
		tmp_act.flow_counterid3 = this.flow_counterid3;
		tmp_act.flow_counterid4 = this.flow_counterid4;
		tmp_act.flow_counterid5 = this.flow_counterid5;
		tmp_act.traffic_class = this.traffic_class;
		tmp_act.packet_type = this.packet_type;
		tmp_act.rx_tx = this.rx_tx;
		tmp_act.act_commit = this.act_commit;
		tmp_act.bc_mc_pass = this.bc_mc_pass;
		tmp_act.port2port = this.port2port;
		tmp_act.cfg_mkr_pkt = this.cfg_mkr_pkt;
		tmp_act.miss_prepend = this.miss_prepend;
		tmp_act.mirror_copy = this.mirror_copy;
		tmp_act.reinjec_stat = this.reinjec_stat;
		tmp_act.parser_error = this.parser_error;
		tmp_act.is_mirror = this.is_mirror;
		tmp_act.classify_drop = this.classify_drop;
		tmp_act.policer_drop = this.policer_drop;
		tmp_act.rate_limit_drop = this.rate_limit_drop;
		tmp_act.internal_error_drop = this.internal_error_drop;
		tmp_act.inc_xlr_drop = this.inc_xlr_drop;
		tmp_act.other_errors = this.other_errors;
		tmp_act.l3_l4_error = this.l3_l4_error;
		tmp_act.header_error = this.header_error;
		tmp_act.count_mode = this.count_mode;
		tmp_act.post_mod_pkt_size = this.post_mod_pkt_size;
		tmp_act.pre_mod_pkt_size = this.pre_mod_pkt_size;
        
        
        info = new[$bits(fxp_evmout_cnt_act_s)];
        info = {<<{tmp_act}};
        
    endfunction

    virtual function bit do_compare(uvm_object rhs, uvm_comparer comparer);
        fxp_evmout_cnt_act rhs_;
        do_compare = super.do_compare(rhs, comparer);
        assert($cast(rhs_,rhs));

		do_compare &= comparer.compare_field("vsi_id_valid", vsi_id_valid, rhs_.vsi_id_valid, $bits(this.vsi_id_valid));
		do_compare &= comparer.compare_field("vsi_id", vsi_id, rhs_.vsi_id, $bits(this.vsi_id));
		do_compare &= comparer.compare_field("switch_id_valid", switch_id_valid, rhs_.switch_id_valid, $bits(this.switch_id_valid));
		do_compare &= comparer.compare_field("switch_id", switch_id, rhs_.switch_id, $bits(this.switch_id));
		do_compare &= comparer.compare_field("assign_set_id", assign_set_id, rhs_.assign_set_id, $bits(this.assign_set_id));
		do_compare &= comparer.compare_field("flow_counterid0", flow_counterid0, rhs_.flow_counterid0, $bits(this.flow_counterid0));
		do_compare &= comparer.compare_field("flow_counterid1", flow_counterid1, rhs_.flow_counterid1, $bits(this.flow_counterid1));
		do_compare &= comparer.compare_field("flow_counterid2", flow_counterid2, rhs_.flow_counterid2, $bits(this.flow_counterid2));
		do_compare &= comparer.compare_field("flow_counterid3", flow_counterid3, rhs_.flow_counterid3, $bits(this.flow_counterid3));
		do_compare &= comparer.compare_field("flow_counterid4", flow_counterid4, rhs_.flow_counterid4, $bits(this.flow_counterid4));
		do_compare &= comparer.compare_field("flow_counterid5", flow_counterid5, rhs_.flow_counterid5, $bits(this.flow_counterid5));
		do_compare &= comparer.compare_field("traffic_class", traffic_class, rhs_.traffic_class, $bits(this.traffic_class));
		do_compare &= comparer.compare_field("packet_type", packet_type, rhs_.packet_type, $bits(this.packet_type));
		do_compare &= comparer.compare_field("rx_tx", rx_tx, rhs_.rx_tx, $bits(this.rx_tx));
		do_compare &= comparer.compare_field("act_commit", act_commit, rhs_.act_commit, $bits(this.act_commit));
		do_compare &= comparer.compare_field("bc_mc_pass", bc_mc_pass, rhs_.bc_mc_pass, $bits(this.bc_mc_pass));
		do_compare &= comparer.compare_field("port2port", port2port, rhs_.port2port, $bits(this.port2port));
		do_compare &= comparer.compare_field("cfg_mkr_pkt", cfg_mkr_pkt, rhs_.cfg_mkr_pkt, $bits(this.cfg_mkr_pkt));
		do_compare &= comparer.compare_field("miss_prepend", miss_prepend, rhs_.miss_prepend, $bits(this.miss_prepend));
		do_compare &= comparer.compare_field("mirror_copy", mirror_copy, rhs_.mirror_copy, $bits(this.mirror_copy));
		do_compare &= comparer.compare_field("reinjec_stat", reinjec_stat, rhs_.reinjec_stat, $bits(this.reinjec_stat));
		do_compare &= comparer.compare_field("parser_error", parser_error, rhs_.parser_error, $bits(this.parser_error));
		do_compare &= comparer.compare_field("is_mirror", is_mirror, rhs_.is_mirror, $bits(this.is_mirror));
		do_compare &= comparer.compare_field("classify_drop", classify_drop, rhs_.classify_drop, $bits(this.classify_drop));
		do_compare &= comparer.compare_field("policer_drop", policer_drop, rhs_.policer_drop, $bits(this.policer_drop));
		do_compare &= comparer.compare_field("rate_limit_drop", rate_limit_drop, rhs_.rate_limit_drop, $bits(this.rate_limit_drop));
		do_compare &= comparer.compare_field("internal_error_drop", internal_error_drop, rhs_.internal_error_drop, $bits(this.internal_error_drop));
		do_compare &= comparer.compare_field("inc_xlr_drop", inc_xlr_drop, rhs_.inc_xlr_drop, $bits(this.inc_xlr_drop));
		do_compare &= comparer.compare_field("other_errors", other_errors, rhs_.other_errors, $bits(this.other_errors));
		do_compare &= comparer.compare_field("l3_l4_error", l3_l4_error, rhs_.l3_l4_error, $bits(this.l3_l4_error));
		do_compare &= comparer.compare_field("header_error", header_error, rhs_.header_error, $bits(this.header_error));
		do_compare &= comparer.compare_field("count_mode", count_mode, rhs_.count_mode, $bits(this.count_mode));
		do_compare &= comparer.compare_field("post_mod_pkt_size", post_mod_pkt_size, rhs_.post_mod_pkt_size, $bits(this.post_mod_pkt_size));
		do_compare &= comparer.compare_field("pre_mod_pkt_size", pre_mod_pkt_size, rhs_.pre_mod_pkt_size, $bits(this.pre_mod_pkt_size));

        if(!do_compare)
            `uvm_info(get_full_name(), "fxp_evmout_cnt_act MISCOMPARE: lhs : ACTUAL, rhs : EXPECTED", UVM_LOW);

    endfunction

    virtual function void sample_pkt();
        fxp_evmout_cnt_act_cg.sample(this);
        
    endfunction

    covergroup fxp_evmout_cnt_act_cg with function sample (fxp_evmout_cnt_act  cov_pkt);


		vsi_id_valid_cp : coverpoint cov_pkt.vsi_id_valid {
                bins min = {0};
                bins max = {1};
        }

		vsi_id_cp : coverpoint cov_pkt.vsi_id {
                bins min = {0};
                bins mid[2] = {[1:2**($bits(vsi_id))- 2]};
                bins max = {2**($bits(vsi_id))- 1};
        }

		switch_id_valid_cp : coverpoint cov_pkt.switch_id_valid {
                bins min = {0};
                bins max = {1};
        }

		switch_id_cp : coverpoint cov_pkt.switch_id {
                bins min = {0};
                bins mid[2] = {[1:2**($bits(switch_id))- 2]};
                bins max = {2**($bits(switch_id))- 1};
        }

		assign_set_id_cp : coverpoint cov_pkt.assign_set_id {
                bins min = {0};
                bins mid[2] = {[1:2**($bits(assign_set_id))- 2]};
                bins max = {2**($bits(assign_set_id))- 1};
        }

		flow_counterid0_cp : coverpoint cov_pkt.flow_counterid0 {
                bins min = {0};
                bins mid[2] = {[1:2**($bits(flow_counterid0))- 2]};
                bins max = {2**($bits(flow_counterid0))- 1};
        }

		flow_counterid1_cp : coverpoint cov_pkt.flow_counterid1 {
                bins min = {0};
                bins mid[2] = {[1:2**($bits(flow_counterid1))- 2]};
                bins max = {2**($bits(flow_counterid1))- 1};
        }

		flow_counterid2_cp : coverpoint cov_pkt.flow_counterid2 {
                bins min = {0};
                bins mid[2] = {[1:2**($bits(flow_counterid2))- 2]};
                bins max = {2**($bits(flow_counterid2))- 1};
        }

		flow_counterid3_cp : coverpoint cov_pkt.flow_counterid3 {
                bins min = {0};
                bins mid[2] = {[1:2**($bits(flow_counterid3))- 2]};
                bins max = {2**($bits(flow_counterid3))- 1};
        }

		flow_counterid4_cp : coverpoint cov_pkt.flow_counterid4 {
                bins min = {0};
                bins mid[2] = {[1:2**($bits(flow_counterid4))- 2]};
                bins max = {2**($bits(flow_counterid4))- 1};
        }

		flow_counterid5_cp : coverpoint cov_pkt.flow_counterid5 {
                bins min = {0};
                bins mid[2] = {[1:2**($bits(flow_counterid5))- 2]};
                bins max = {2**($bits(flow_counterid5))- 1};
        }

		traffic_class_cp : coverpoint cov_pkt.traffic_class {
                bins min = {0};
                bins mid[2] = {[1:2**($bits(traffic_class))- 2]};
                bins max = {2**($bits(traffic_class))- 1};
        }

		packet_type_cp : coverpoint cov_pkt.packet_type {
                bins min = {0};
                bins mid[2] = {[1:2**($bits(packet_type))- 2]};
                bins max = {2**($bits(packet_type))- 1};
        }

		rx_tx_cp : coverpoint cov_pkt.rx_tx {
                bins min = {0};
                bins max = {1};
        }

		act_commit_cp : coverpoint cov_pkt.act_commit {
                bins min = {0};
                bins mid[2] = {[1:2**($bits(act_commit))- 2]};
                bins max = {2**($bits(act_commit))- 1};
        }

		bc_mc_pass_cp : coverpoint cov_pkt.bc_mc_pass {
                bins min = {0};
                bins mid[2] = {[1:2**($bits(bc_mc_pass))- 2]};
                bins max = {2**($bits(bc_mc_pass))- 1};
        }

		port2port_cp : coverpoint cov_pkt.port2port {
                bins min = {0};
                bins max = {1};
        }

		cfg_mkr_pkt_cp : coverpoint cov_pkt.cfg_mkr_pkt {
                bins min = {0};
                bins max = {1};
        }

		miss_prepend_cp : coverpoint cov_pkt.miss_prepend {
                bins min = {0};
                bins max = {1};
        }

		mirror_copy_cp : coverpoint cov_pkt.mirror_copy {
                bins min = {0};
                bins max = {1};
        }

		reinjec_stat_cp : coverpoint cov_pkt.reinjec_stat {
                bins min = {0};
                bins mid[2] = {[1:2**($bits(reinjec_stat))- 2]};
                bins max = {2**($bits(reinjec_stat))- 1};
        }

		parser_error_cp : coverpoint cov_pkt.parser_error {
                bins min = {0};
                bins max = {1};
        }

		is_mirror_cp : coverpoint cov_pkt.is_mirror {
                bins min = {0};
                bins max = {1};
        }

		classify_drop_cp : coverpoint cov_pkt.classify_drop {
                bins min = {0};
                bins max = {1};
        }

		policer_drop_cp : coverpoint cov_pkt.policer_drop {
                bins min = {0};
                bins max = {1};
        }

		rate_limit_drop_cp : coverpoint cov_pkt.rate_limit_drop {
                bins min = {0};
                bins max = {1};
        }

		internal_error_drop_cp : coverpoint cov_pkt.internal_error_drop {
                bins min = {0};
                bins max = {1};
        }

		inc_xlr_drop_cp : coverpoint cov_pkt.inc_xlr_drop {
                bins min = {0};
                bins max = {1};
        }

		other_errors_cp : coverpoint cov_pkt.other_errors {
                bins min = {0};
                bins max = {1};
        }

		l3_l4_error_cp : coverpoint cov_pkt.l3_l4_error {
                bins min = {0};
                bins max = {1};
        }

		header_error_cp : coverpoint cov_pkt.header_error {
                bins min = {0};
                bins max = {1};
        }

		count_mode_cp : coverpoint cov_pkt.count_mode {
                bins min = {0};
                bins mid[2] = {[1:2**($bits(count_mode))- 2]};
                bins max = {2**($bits(count_mode))- 1};
        }

		post_mod_pkt_size_cp : coverpoint cov_pkt.post_mod_pkt_size {
                bins min = {0};
                bins mid[2] = {[1:2**($bits(post_mod_pkt_size))- 2]};
                bins max = {2**($bits(post_mod_pkt_size))- 1};
        }

		pre_mod_pkt_size_cp : coverpoint cov_pkt.pre_mod_pkt_size {
                bins min = {0};
                bins mid[2] = {[1:2**($bits(pre_mod_pkt_size))- 2]};
                bins max = {2**($bits(pre_mod_pkt_size))- 1};
        }

//start of coverage manual code//

//end of coverage manual code//


    endgroup: fxp_evmout_cnt_act_cg

//start of manual code//

//end of manual code//


endclass : fxp_evmout_cnt_act

`endif