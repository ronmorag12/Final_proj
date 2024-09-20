
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


`ifndef _FXP_CNT_EVMOUT_NOTIFY_PKT_SV_
`define _FXP_CNT_EVMOUT_NOTIFY_PKT_SV_


class fxp_cnt_evmout_notify_pkt extends ipu_bfm_pkg::ipu_base_pkt;
    rand logic flush_last_pkt;
    rand logic sop;
    rand logic eop;
    rand logic [15:0] pkt_byte_cnt;
    rand logic [15:0] ctrl_q_id;
    rand logic func_vld;
    rand logic [1:0] func_type;
    rand logic [10:0] func_num;
    rand logic [5:0] pf;
    rand logic [2:0] host_id;
    rand logic ecc_parity_err;
    rand logic [39:0] time_stamp;
    rand logic notification_lost;
    rand logic [5:0] cause_evict_reason;
    rand logic [7:0] num_entries;
    rand logic [2:0] win_id;
    rand octet_t [63:0] data;

    `uvm_object_utils_begin(fxp_cnt_evmout_notify_pkt)
		`uvm_field_int(flush_last_pkt, UVM_DEFAULT)
		`uvm_field_int(sop, UVM_DEFAULT)
		`uvm_field_int(eop, UVM_DEFAULT)
		`uvm_field_int(pkt_byte_cnt, UVM_DEFAULT)
		`uvm_field_int(ctrl_q_id, UVM_DEFAULT)
		`uvm_field_int(func_vld, UVM_DEFAULT)
		`uvm_field_int(func_type, UVM_DEFAULT)
		`uvm_field_int(func_num, UVM_DEFAULT)
		`uvm_field_int(pf, UVM_DEFAULT)
		`uvm_field_int(host_id, UVM_DEFAULT)
		`uvm_field_int(ecc_parity_err, UVM_DEFAULT)
		`uvm_field_int(time_stamp, UVM_DEFAULT)
		`uvm_field_int(notification_lost, UVM_DEFAULT)
		`uvm_field_int(cause_evict_reason, UVM_DEFAULT)
		`uvm_field_int(num_entries, UVM_DEFAULT)
		`uvm_field_int(win_id, UVM_DEFAULT)
		`uvm_field_int(data, UVM_DEFAULT)

    `uvm_object_utils_end

    function new(string name = "fxp_cnt_evmout_notify_pkt");
        super.new(name);
        fxp_cnt_evmout_notify_pkt_cg = new();

    endfunction

    virtual function string convert2string();
        string info;
        info = "fxp_cnt_evmout_notify_pkt:";

        
		info = {info, $sformatf("\n flush_last_pkt : 'h%0h", flush_last_pkt)};
		info = {info, $sformatf("\n sop : 'h%0h", sop)};
		info = {info, $sformatf("\n eop : 'h%0h", eop)};
		info = {info, $sformatf("\n pkt_byte_cnt : 'h%0h", pkt_byte_cnt)};
		info = {info, $sformatf("\n ctrl_q_id : 'h%0h", ctrl_q_id)};
		info = {info, $sformatf("\n func_vld : 'h%0h", func_vld)};
		info = {info, $sformatf("\n func_type : 'h%0h", func_type)};
		info = {info, $sformatf("\n func_num : 'h%0h", func_num)};
		info = {info, $sformatf("\n pf : 'h%0h", pf)};
		info = {info, $sformatf("\n host_id : 'h%0h", host_id)};
		info = {info, $sformatf("\n ecc_parity_err : 'h%0h", ecc_parity_err)};
		info = {info, $sformatf("\n time_stamp : 'h%0h", time_stamp)};
		info = {info, $sformatf("\n notification_lost : 'h%0h", notification_lost)};
		info = {info, $sformatf("\n cause_evict_reason : 'h%0h", cause_evict_reason)};
		info = {info, $sformatf("\n num_entries : 'h%0h", num_entries)};
		info = {info, $sformatf("\n win_id : 'h%0h", win_id)};
		info = {info, $sformatf("\n data : 'h%0h", data)};

        return info;
    endfunction

    virtual function void unpack_bits(const ref logic info[]);
        fxp_cnt_evmout_notify_pkt_s tmp_act;

        for(int i = 0; i < $bits(fxp_cnt_evmout_notify_pkt_s); i++) begin
            tmp_act[i] = info [i];
        end
        
		this.flush_last_pkt = tmp_act.flush_last_pkt;
		this.sop = tmp_act.sop;
		this.eop = tmp_act.eop;
		this.pkt_byte_cnt = tmp_act.pkt_byte_cnt;
		this.ctrl_q_id = tmp_act.ctrl_q_id;
		this.func_vld = tmp_act.func_vld;
		this.func_type = tmp_act.func_type;
		this.func_num = tmp_act.func_num;
		this.pf = tmp_act.pf;
		this.host_id = tmp_act.host_id;
		this.ecc_parity_err = tmp_act.ecc_parity_err;
		this.time_stamp = tmp_act.time_stamp;
		this.notification_lost = tmp_act.notification_lost;
		this.cause_evict_reason = tmp_act.cause_evict_reason;
		this.num_entries = tmp_act.num_entries;
		this.win_id = tmp_act.win_id;
		this.data = tmp_act.data;
        
        `uvm_info(get_full_name(), "fxp_cnt_evmout_notify_pkt unpack_bits debug", UVM_HIGH)

    endfunction

    virtual function void pack_bits(ref logic info[]);
        
        fxp_cnt_evmout_notify_pkt_s tmp_act;
        
		tmp_act.flush_last_pkt = this.flush_last_pkt;
		tmp_act.sop = this.sop;
		tmp_act.eop = this.eop;
		tmp_act.pkt_byte_cnt = this.pkt_byte_cnt;
		tmp_act.ctrl_q_id = this.ctrl_q_id;
		tmp_act.func_vld = this.func_vld;
		tmp_act.func_type = this.func_type;
		tmp_act.func_num = this.func_num;
		tmp_act.pf = this.pf;
		tmp_act.host_id = this.host_id;
		tmp_act.ecc_parity_err = this.ecc_parity_err;
		tmp_act.time_stamp = this.time_stamp;
		tmp_act.notification_lost = this.notification_lost;
		tmp_act.cause_evict_reason = this.cause_evict_reason;
		tmp_act.num_entries = this.num_entries;
		tmp_act.win_id = this.win_id;
		tmp_act.data = this.data;
        
        
        info = new[$bits(fxp_cnt_evmout_notify_pkt_s)];
        info = {<<{tmp_act}};
        
    endfunction

    virtual function bit do_compare(uvm_object rhs, uvm_comparer comparer);
        fxp_cnt_evmout_notify_pkt rhs_;
        do_compare = super.do_compare(rhs, comparer);
        assert($cast(rhs_,rhs));

		do_compare &= comparer.compare_field("flush_last_pkt", flush_last_pkt, rhs_.flush_last_pkt, $bits(this.flush_last_pkt));
		do_compare &= comparer.compare_field("sop", sop, rhs_.sop, $bits(this.sop));
		do_compare &= comparer.compare_field("eop", eop, rhs_.eop, $bits(this.eop));
		do_compare &= comparer.compare_field("pkt_byte_cnt", pkt_byte_cnt, rhs_.pkt_byte_cnt, $bits(this.pkt_byte_cnt));
		do_compare &= comparer.compare_field("ctrl_q_id", ctrl_q_id, rhs_.ctrl_q_id, $bits(this.ctrl_q_id));
		do_compare &= comparer.compare_field("func_vld", func_vld, rhs_.func_vld, $bits(this.func_vld));
		do_compare &= comparer.compare_field("func_type", func_type, rhs_.func_type, $bits(this.func_type));
		do_compare &= comparer.compare_field("func_num", func_num, rhs_.func_num, $bits(this.func_num));
		do_compare &= comparer.compare_field("pf", pf, rhs_.pf, $bits(this.pf));
		do_compare &= comparer.compare_field("host_id", host_id, rhs_.host_id, $bits(this.host_id));
		do_compare &= comparer.compare_field("ecc_parity_err", ecc_parity_err, rhs_.ecc_parity_err, $bits(this.ecc_parity_err));
		do_compare &= comparer.compare_field("time_stamp", time_stamp, rhs_.time_stamp, $bits(this.time_stamp));
		do_compare &= comparer.compare_field("notification_lost", notification_lost, rhs_.notification_lost, $bits(this.notification_lost));
		do_compare &= comparer.compare_field("cause_evict_reason", cause_evict_reason, rhs_.cause_evict_reason, $bits(this.cause_evict_reason));
		do_compare &= comparer.compare_field("num_entries", num_entries, rhs_.num_entries, $bits(this.num_entries));
		do_compare &= comparer.compare_field("win_id", win_id, rhs_.win_id, $bits(this.win_id));
		do_compare &= comparer.compare_field("data", data, rhs_.data, $bits(this.data));

        if(!do_compare)
            `uvm_info(get_full_name(), "fxp_cnt_evmout_notify_pkt MISCOMPARE: lhs : ACTUAL, rhs : EXPECTED", UVM_LOW);

    endfunction

    virtual function void sample_pkt();
        fxp_cnt_evmout_notify_pkt_cg.sample(this);
        
    endfunction

    covergroup fxp_cnt_evmout_notify_pkt_cg with function sample (fxp_cnt_evmout_notify_pkt  cov_pkt);


		flush_last_pkt_cp : coverpoint cov_pkt.flush_last_pkt {
                bins min = {0};
                bins max = {1};
        }

		sop_cp : coverpoint cov_pkt.sop {
                bins min = {0};
                bins max = {1};
        }

		eop_cp : coverpoint cov_pkt.eop {
                bins min = {0};
                bins max = {1};
        }

		pkt_byte_cnt_cp : coverpoint cov_pkt.pkt_byte_cnt {
                bins min = {0};
                bins mid[2] = {[1:2**($bits(pkt_byte_cnt))- 2]};
                bins max = {2**($bits(pkt_byte_cnt))- 1};
        }

		ctrl_q_id_cp : coverpoint cov_pkt.ctrl_q_id {
                bins min = {0};
                bins mid[2] = {[1:2**($bits(ctrl_q_id))- 2]};
                bins max = {2**($bits(ctrl_q_id))- 1};
        }

		func_vld_cp : coverpoint cov_pkt.func_vld {
                bins min = {0};
                bins max = {1};
        }

		func_type_cp : coverpoint cov_pkt.func_type {
                bins min = {0};
                bins mid[2] = {[1:2**($bits(func_type))- 2]};
                bins max = {2**($bits(func_type))- 1};
        }

		func_num_cp : coverpoint cov_pkt.func_num {
                bins min = {0};
                bins mid[2] = {[1:2**($bits(func_num))- 2]};
                bins max = {2**($bits(func_num))- 1};
        }

		pf_cp : coverpoint cov_pkt.pf {
                bins min = {0};
                bins mid[2] = {[1:2**($bits(pf))- 2]};
                bins max = {2**($bits(pf))- 1};
        }

		host_id_cp : coverpoint cov_pkt.host_id {
                bins min = {0};
                bins mid[2] = {[1:2**($bits(host_id))- 2]};
                bins max = {2**($bits(host_id))- 1};
        }

		ecc_parity_err_cp : coverpoint cov_pkt.ecc_parity_err {
                bins min = {0};
                bins max = {1};
        }

		time_stamp_cp : coverpoint cov_pkt.time_stamp {
                bins min = {0};
                bins mid[2] = {[1:2**($bits(time_stamp))- 2]};
                bins max = {2**($bits(time_stamp))- 1};
        }

		notification_lost_cp : coverpoint cov_pkt.notification_lost {
                bins min = {0};
                bins max = {1};
        }

		cause_evict_reason_cp : coverpoint cov_pkt.cause_evict_reason {
                bins min = {0};
                bins mid[2] = {[1:2**($bits(cause_evict_reason))- 2]};
                bins max = {2**($bits(cause_evict_reason))- 1};
        }

		num_entries_cp : coverpoint cov_pkt.num_entries {
                bins min = {0};
                bins mid[2] = {[1:2**($bits(num_entries))- 2]};
                bins max = {2**($bits(num_entries))- 1};
        }

		win_id_cp : coverpoint cov_pkt.win_id {
                bins min = {0};
                bins mid[2] = {[1:2**($bits(win_id))- 2]};
                bins max = {2**($bits(win_id))- 1};
        }

//start of coverage manual code//

//end of coverage manual code//


    endgroup: fxp_cnt_evmout_notify_pkt_cg

//start of manual code//

//end of manual code//


endclass : fxp_cnt_evmout_notify_pkt

`endif