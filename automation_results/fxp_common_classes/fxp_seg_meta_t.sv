
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

`ifndef _FXP_SEG_META_T_SV_
`define _FXP_SEG_META_T_SV_

class fxp_seg_meta_t extends ipu_bfm_pkg::ipu_base_pkt;
    rand bit [1:0] seg_type;
    rand bit sop;
    rand bit eop;
    rand bit [8:0] len;
    rand bit [2:0] next_len;
    rand bit [10:0] seg_id;
    rand bit [2:0] seg_src_id;
    rand bit rx_tx; // 0:rx, 1:tx
    rand bit [6:0] sc;
    rand bit [13:0] err;
    rand bit [13:0] pkt_len;
    rand bit [1:0] bc_mc;
    rand bit [6:0] drop;
    rand bit [1:0] seg_seq;
    rand bit [1:0] seg_cnt;
    rand bit [10:0] pkt_label;
    rand bit [2:0] tc;
    rand bit config_q_marker;
    rand bit bc_mc_marker;
    rand bit mir_marker;
    rand bit [5:0] pad_len;
    rand bit [2:0] cont_l2_crc_len;
    rand bit [2:0] out_l2_crc_len;
    rand bit [1:0] reinjection_stat;
    rand bit [8:0] rsvd;

    `uvm_object_utils_begin(fxp_seg_meta_t)
		`uvm_field_int(seg_type, UVM_DEFAULT)
		`uvm_field_int(sop, UVM_DEFAULT)
		`uvm_field_int(eop, UVM_DEFAULT)
		`uvm_field_int(len, UVM_DEFAULT)
		`uvm_field_int(next_len, UVM_DEFAULT)
		`uvm_field_int(seg_id, UVM_DEFAULT)
		`uvm_field_int(seg_src_id, UVM_DEFAULT)
		`uvm_field_int(rx_tx, UVM_DEFAULT)
		`uvm_field_int(sc, UVM_DEFAULT)
		`uvm_field_int(err, UVM_DEFAULT)
		`uvm_field_int(pkt_len, UVM_DEFAULT)
		`uvm_field_int(bc_mc, UVM_DEFAULT)
		`uvm_field_int(drop, UVM_DEFAULT)
		`uvm_field_int(seg_seq, UVM_DEFAULT)
		`uvm_field_int(seg_cnt, UVM_DEFAULT)
		`uvm_field_int(pkt_label, UVM_DEFAULT)
		`uvm_field_int(tc, UVM_DEFAULT)
		`uvm_field_int(config_q_marker, UVM_DEFAULT)
		`uvm_field_int(bc_mc_marker, UVM_DEFAULT)
		`uvm_field_int(mir_marker, UVM_DEFAULT)
		`uvm_field_int(pad_len, UVM_DEFAULT)
		`uvm_field_int(cont_l2_crc_len, UVM_DEFAULT)
		`uvm_field_int(out_l2_crc_len, UVM_DEFAULT)
		`uvm_field_int(reinjection_stat, UVM_DEFAULT)
		`uvm_field_int(rsvd, UVM_DEFAULT)

    `uvm_object_utils_end

    function new(string name = "fxp_seg_meta_t");
        super.new(name);
        fxp_seg_meta_t_cg = new();

    endfunction

    virtual function string convert2string();
        string info;
        info = "fxp_seg_meta_t:";

        
		info = {info, $sformatf("\n seg_type : 'h%0h", seg_type)};
		info = {info, $sformatf("\n sop : 'h%0h", sop)};
		info = {info, $sformatf("\n eop : 'h%0h", eop)};
		info = {info, $sformatf("\n len : 'h%0h", len)};
		info = {info, $sformatf("\n next_len : 'h%0h", next_len)};
		info = {info, $sformatf("\n seg_id : 'h%0h", seg_id)};
		info = {info, $sformatf("\n seg_src_id : 'h%0h", seg_src_id)};
		info = {info, $sformatf("\n rx_tx : 'h%0h", rx_tx)};
		info = {info, $sformatf("\n sc : 'h%0h", sc)};
		info = {info, $sformatf("\n err : 'h%0h", err)};
		info = {info, $sformatf("\n pkt_len : 'h%0h", pkt_len)};
		info = {info, $sformatf("\n bc_mc : 'h%0h", bc_mc)};
		info = {info, $sformatf("\n drop : 'h%0h", drop)};
		info = {info, $sformatf("\n seg_seq : 'h%0h", seg_seq)};
		info = {info, $sformatf("\n seg_cnt : 'h%0h", seg_cnt)};
		info = {info, $sformatf("\n pkt_label : 'h%0h", pkt_label)};
		info = {info, $sformatf("\n tc : 'h%0h", tc)};
		info = {info, $sformatf("\n config_q_marker : 'h%0h", config_q_marker)};
		info = {info, $sformatf("\n bc_mc_marker : 'h%0h", bc_mc_marker)};
		info = {info, $sformatf("\n mir_marker : 'h%0h", mir_marker)};
		info = {info, $sformatf("\n pad_len : 'h%0h", pad_len)};
		info = {info, $sformatf("\n cont_l2_crc_len : 'h%0h", cont_l2_crc_len)};
		info = {info, $sformatf("\n out_l2_crc_len : 'h%0h", out_l2_crc_len)};
		info = {info, $sformatf("\n reinjection_stat : 'h%0h", reinjection_stat)};
		info = {info, $sformatf("\n rsvd : 'h%0h", rsvd)};

        return info;
    endfunction

    virtual function void unpack_bits(const ref logic info[]);
        fxp_seg_meta_t_s tmp_act;

        for(int i = 0; i < $bits(fxp_seg_meta_t_s); i++) begin
            tmp_act[i] = info [i];
        end
        
		this.seg_type = tmp_act.seg_type;
		this.sop = tmp_act.sop;
		this.eop = tmp_act.eop;
		this.len = tmp_act.len;
		this.next_len = tmp_act.next_len;
		this.seg_id = tmp_act.seg_id;
		this.seg_src_id = tmp_act.seg_src_id;
		this.rx_tx = tmp_act.rx_tx;
		this.sc = tmp_act.sc;
		this.err = tmp_act.err;
		this.pkt_len = tmp_act.pkt_len;
		this.bc_mc = tmp_act.bc_mc;
		this.drop = tmp_act.drop;
		this.seg_seq = tmp_act.seg_seq;
		this.seg_cnt = tmp_act.seg_cnt;
		this.pkt_label = tmp_act.pkt_label;
		this.tc = tmp_act.tc;
		this.config_q_marker = tmp_act.config_q_marker;
		this.bc_mc_marker = tmp_act.bc_mc_marker;
		this.mir_marker = tmp_act.mir_marker;
		this.pad_len = tmp_act.pad_len;
		this.cont_l2_crc_len = tmp_act.cont_l2_crc_len;
		this.out_l2_crc_len = tmp_act.out_l2_crc_len;
		this.reinjection_stat = tmp_act.reinjection_stat;
		this.rsvd = tmp_act.rsvd;
        
        `uvm_info(get_full_name(), "fxp_seg_meta_t unpack_bits debug", UVM_HIGH)

    endfunction

    virtual function void pack_bits(ref logic info[]);
        
        fxp_seg_meta_t_s tmp_act;
        
		tmp_act.seg_type = this.seg_type;
		tmp_act.sop = this.sop;
		tmp_act.eop = this.eop;
		tmp_act.len = this.len;
		tmp_act.next_len = this.next_len;
		tmp_act.seg_id = this.seg_id;
		tmp_act.seg_src_id = this.seg_src_id;
		tmp_act.rx_tx = this.rx_tx;
		tmp_act.sc = this.sc;
		tmp_act.err = this.err;
		tmp_act.pkt_len = this.pkt_len;
		tmp_act.bc_mc = this.bc_mc;
		tmp_act.drop = this.drop;
		tmp_act.seg_seq = this.seg_seq;
		tmp_act.seg_cnt = this.seg_cnt;
		tmp_act.pkt_label = this.pkt_label;
		tmp_act.tc = this.tc;
		tmp_act.config_q_marker = this.config_q_marker;
		tmp_act.bc_mc_marker = this.bc_mc_marker;
		tmp_act.mir_marker = this.mir_marker;
		tmp_act.pad_len = this.pad_len;
		tmp_act.cont_l2_crc_len = this.cont_l2_crc_len;
		tmp_act.out_l2_crc_len = this.out_l2_crc_len;
		tmp_act.reinjection_stat = this.reinjection_stat;
		tmp_act.rsvd = this.rsvd;
        
        
        info = new[$bits(fxp_seg_meta_t_s)];
        info = {<<{tmp_act}};
        
    endfunction

    virtual function bit do_compare(uvm_object rhs, uvm_comparer comparer);
        fxp_seg_meta_t rhs_;
        do_compare = super.do_compare(rhs, comparer);
        assert($cast(rhs_,rhs));

		do_compare &= comparer.compare_field("seg_type", seg_type, rhs_.seg_type, $bits(this.seg_type));
		do_compare &= comparer.compare_field("sop", sop, rhs_.sop, $bits(this.sop));
		do_compare &= comparer.compare_field("eop", eop, rhs_.eop, $bits(this.eop));
		do_compare &= comparer.compare_field("len", len, rhs_.len, $bits(this.len));
		do_compare &= comparer.compare_field("next_len", next_len, rhs_.next_len, $bits(this.next_len));
		do_compare &= comparer.compare_field("seg_id", seg_id, rhs_.seg_id, $bits(this.seg_id));
		do_compare &= comparer.compare_field("seg_src_id", seg_src_id, rhs_.seg_src_id, $bits(this.seg_src_id));
		do_compare &= comparer.compare_field("rx_tx", rx_tx, rhs_.rx_tx, $bits(this.rx_tx));
		do_compare &= comparer.compare_field("sc", sc, rhs_.sc, $bits(this.sc));
		do_compare &= comparer.compare_field("err", err, rhs_.err, $bits(this.err));
		do_compare &= comparer.compare_field("pkt_len", pkt_len, rhs_.pkt_len, $bits(this.pkt_len));
		do_compare &= comparer.compare_field("bc_mc", bc_mc, rhs_.bc_mc, $bits(this.bc_mc));
		do_compare &= comparer.compare_field("drop", drop, rhs_.drop, $bits(this.drop));
		do_compare &= comparer.compare_field("seg_seq", seg_seq, rhs_.seg_seq, $bits(this.seg_seq));
		do_compare &= comparer.compare_field("seg_cnt", seg_cnt, rhs_.seg_cnt, $bits(this.seg_cnt));
		do_compare &= comparer.compare_field("pkt_label", pkt_label, rhs_.pkt_label, $bits(this.pkt_label));
		do_compare &= comparer.compare_field("tc", tc, rhs_.tc, $bits(this.tc));
		do_compare &= comparer.compare_field("config_q_marker", config_q_marker, rhs_.config_q_marker, $bits(this.config_q_marker));
		do_compare &= comparer.compare_field("bc_mc_marker", bc_mc_marker, rhs_.bc_mc_marker, $bits(this.bc_mc_marker));
		do_compare &= comparer.compare_field("mir_marker", mir_marker, rhs_.mir_marker, $bits(this.mir_marker));
		do_compare &= comparer.compare_field("pad_len", pad_len, rhs_.pad_len, $bits(this.pad_len));
		do_compare &= comparer.compare_field("cont_l2_crc_len", cont_l2_crc_len, rhs_.cont_l2_crc_len, $bits(this.cont_l2_crc_len));
		do_compare &= comparer.compare_field("out_l2_crc_len", out_l2_crc_len, rhs_.out_l2_crc_len, $bits(this.out_l2_crc_len));
		do_compare &= comparer.compare_field("reinjection_stat", reinjection_stat, rhs_.reinjection_stat, $bits(this.reinjection_stat));
		do_compare &= comparer.compare_field("rsvd", rsvd, rhs_.rsvd, $bits(this.rsvd));

        if(!do_compare)
            `uvm_info(get_full_name(), "fxp_seg_meta_t MISCOMPARE: lhs : ACTUAL, rhs : EXPECTED", UVM_LOW);

    endfunction

    virtual function void sample_pkt();
        fxp_seg_meta_t_cg.sample(this);
        
    endfunction

    covergroup fxp_seg_meta_t_cg with function sample (fxp_seg_meta_t  cov_pkt);


		seg_type_cp : coverpoint cov_pkt.seg_type {
                bins min = {0};
                bins mid[2] = {[1:2**($bits(seg_type))- 2]};
                bins max = {2**($bits(seg_type))- 1};
        }

		sop_cp : coverpoint cov_pkt.sop {
                bins min = {0};
                bins max = {1};
        }

		eop_cp : coverpoint cov_pkt.eop {
                bins min = {0};
                bins max = {1};
        }

		len_cp : coverpoint cov_pkt.len {
                bins min = {0};
                bins mid[2] = {[1:2**($bits(len))- 2]};
                bins max = {2**($bits(len))- 1};
        }

		next_len_cp : coverpoint cov_pkt.next_len {
                bins min = {0};
                bins mid[2] = {[1:2**($bits(next_len))- 2]};
                bins max = {2**($bits(next_len))- 1};
        }

		seg_id_cp : coverpoint cov_pkt.seg_id {
                bins min = {0};
                bins mid[2] = {[1:2**($bits(seg_id))- 2]};
                bins max = {2**($bits(seg_id))- 1};
        }

		seg_src_id_cp : coverpoint cov_pkt.seg_src_id {
                bins min = {0};
                bins mid[2] = {[1:2**($bits(seg_src_id))- 2]};
                bins max = {2**($bits(seg_src_id))- 1};
        }

		rx_tx_cp : coverpoint cov_pkt.rx_tx {
                bins min = {0};
                bins max = {1};
        }

		sc_cp : coverpoint cov_pkt.sc {
                bins min = {0};
                bins mid[2] = {[1:2**($bits(sc))- 2]};
                bins max = {2**($bits(sc))- 1};
        }

		err_cp : coverpoint cov_pkt.err {
                bins min = {0};
                bins mid[2] = {[1:2**($bits(err))- 2]};
                bins max = {2**($bits(err))- 1};
        }

		pkt_len_cp : coverpoint cov_pkt.pkt_len {
                bins min = {0};
                bins mid[2] = {[1:2**($bits(pkt_len))- 2]};
                bins max = {2**($bits(pkt_len))- 1};
        }

		bc_mc_cp : coverpoint cov_pkt.bc_mc {
                bins min = {0};
                bins mid[2] = {[1:2**($bits(bc_mc))- 2]};
                bins max = {2**($bits(bc_mc))- 1};
        }

		drop_cp : coverpoint cov_pkt.drop {
                bins min = {0};
                bins mid[2] = {[1:2**($bits(drop))- 2]};
                bins max = {2**($bits(drop))- 1};
        }

		seg_seq_cp : coverpoint cov_pkt.seg_seq {
                bins min = {0};
                bins mid[2] = {[1:2**($bits(seg_seq))- 2]};
                bins max = {2**($bits(seg_seq))- 1};
        }

		seg_cnt_cp : coverpoint cov_pkt.seg_cnt {
                bins min = {0};
                bins mid[2] = {[1:2**($bits(seg_cnt))- 2]};
                bins max = {2**($bits(seg_cnt))- 1};
        }

		pkt_label_cp : coverpoint cov_pkt.pkt_label {
                bins min = {0};
                bins mid[2] = {[1:2**($bits(pkt_label))- 2]};
                bins max = {2**($bits(pkt_label))- 1};
        }

		tc_cp : coverpoint cov_pkt.tc {
                bins min = {0};
                bins mid[2] = {[1:2**($bits(tc))- 2]};
                bins max = {2**($bits(tc))- 1};
        }

		config_q_marker_cp : coverpoint cov_pkt.config_q_marker {
                bins min = {0};
                bins max = {1};
        }

		bc_mc_marker_cp : coverpoint cov_pkt.bc_mc_marker {
                bins min = {0};
                bins max = {1};
        }

		mir_marker_cp : coverpoint cov_pkt.mir_marker {
                bins min = {0};
                bins max = {1};
        }

		pad_len_cp : coverpoint cov_pkt.pad_len {
                bins min = {0};
                bins mid[2] = {[1:2**($bits(pad_len))- 2]};
                bins max = {2**($bits(pad_len))- 1};
        }

		cont_l2_crc_len_cp : coverpoint cov_pkt.cont_l2_crc_len {
                bins min = {0};
                bins mid[2] = {[1:2**($bits(cont_l2_crc_len))- 2]};
                bins max = {2**($bits(cont_l2_crc_len))- 1};
        }

		out_l2_crc_len_cp : coverpoint cov_pkt.out_l2_crc_len {
                bins min = {0};
                bins mid[2] = {[1:2**($bits(out_l2_crc_len))- 2]};
                bins max = {2**($bits(out_l2_crc_len))- 1};
        }

		reinjection_stat_cp : coverpoint cov_pkt.reinjection_stat {
                bins min = {0};
                bins mid[2] = {[1:2**($bits(reinjection_stat))- 2]};
                bins max = {2**($bits(reinjection_stat))- 1};
        }

		rsvd_cp : coverpoint cov_pkt.rsvd {
                bins min = {0};
                bins mid[2] = {[1:2**($bits(rsvd))- 2]};
                bins max = {2**($bits(rsvd))- 1};
        }

//start of coverage manual code//

//end of coverage manual code//


    endgroup: fxp_seg_meta_t_cg

//start of manual code//

//end of manual code//

endclass : fxp_seg_meta_t

`endif  // _FXP_SEG_META_T_SV_
