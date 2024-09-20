
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

`ifndef _FXP_STRUCTS_SV_
`define _FXP_STRUCTS_SV_

typedef struct packed {
    bit [1:0] seg_type;
    bit sop;
    bit eop;
    bit [8:0] len;
    bit [2:0] next_len;
    bit [10:0] seg_id;
    bit [2:0] seg_src_id;
    bit rx_tx;
    bit [6:0] sc;
    bit [13:0] err;
    bit [13:0] pkt_len;
    bit [1:0] bc_mc;
    bit [6:0] drop;
    bit [1:0] seg_seq;
    bit [1:0] seg_cnt;
    bit [10:0] pkt_label;
    bit [2:0] tc;
    bit config_q_marker;
    bit bc_mc_marker;
    bit mir_marker;
    bit [5:0] pad_len;
    bit [2:0] cont_l2_crc_len;
    bit [2:0] out_l2_crc_len;
    bit [1:0] reinjection_stat;
    bit [8:0] rsvd;
} fxp_seg_meta_t_s;

typedef struct packed {
    logic vsi_id_valid;
    logic [10:0] vsi_id;
    logic switch_id_valid;
    logic [5:0] switch_id;
    logic [10:0] assign_set_id;
    logic [24:0] flow_counterid0;
    logic [24:0] flow_counterid1;
    logic [24:0] flow_counterid2;
    logic [24:0] flow_counterid3;
    logic [24:0] flow_counterid4;
    logic [24:0] flow_counterid5;
    logic [2:0] traffic_class;
    logic [1:0] packet_type;
    logic rx_tx;
    logic [2:0] act_commit;
    logic [1:0] bc_mc_pass;
    logic port2port;
    logic cfg_mkr_pkt;
    logic miss_prepend;
    logic mirror_copy;
    logic [1:0] reinjec_stat;
    logic parser_error;
    logic is_mirror;
    logic classify_drop;
    logic policer_drop;
    logic rate_limit_drop;
    logic internal_error_drop;
    logic inc_xlr_drop;
    logic other_errors;
    logic l3_l4_error;
    logic header_error;
    logic [7:0] count_mode;
    logic [13:0] post_mod_pkt_size;
    logic [13:0] pre_mod_pkt_size;
} fxp_evmout_cnt_act_s;

typedef struct packed {
    logic flush_last_pkt;
    logic sop;
    logic eop;
    logic [15:0] pkt_byte_cnt;
    logic [15:0] ctrl_q_id;
    logic func_vld;
    logic [1:0] func_type;
    logic [10:0] func_num;
    logic [5:0] pf;
    logic [2:0] host_id;
    logic ecc_parity_err;
    logic [39:0] time_stamp;
    logic notification_lost;
    logic [5:0] cause_evict_reason;
    logic [7:0] num_entries;
    logic [2:0] win_id;
    octet_t [63:0] data;
} fxp_cnt_evmout_notify_pkt_s;

//start of manual code//

//end of manual code//


`endif