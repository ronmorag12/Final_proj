
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

`ifndef _FXP_PARAMETERS_SV_
`define _FXP_PARAMETERS_SV_


parameter EIGHT = 8;

parameter W_SEG = 256;

parameter W_MOD_MAX = 256;

parameter W_INT_ID = 32;

parameter N_VSI = 1032;

parameter CNE_BASE = 28'h0720000;

parameter CNE_SIZE = 28'h0020000;

parameter CNE_MASK = 28'hFFFFFFF-CNE_SIZE+28'h1;

parameter N_CNT_EVM_BYTES = 64;

parameter N_EVMOUT_CNT_ACT_INITIAL_CREDIT = 64;

parameter N_CNT_EVMOUT_NOTIFY_PKT_INITIAL_CREDIT = 64;

parameter W_ACT_BUS = 20;

parameter CNT_RPL_JUNC_N_MGMT_TOKENS = 1;

parameter CNT_RPL_JUNC_NUM_INTR = 1;

parameter CNT_RPL_JUNC_BASE_ADDR = CNE_BASE;

parameter CNT_RPL_JUNC_BASE_MASK = CNE_MASK;

parameter FXP_CNT_RNM_DATA_W = 128;

typedef bit[1:0] bc_mc_t;

typedef enum bit [W_INT_ID-1:0] {
    FXP_EVM_RPL_JUNC_INT_ID       = 0,
    FXP_PAR_RPL_JUNC_INT_ID       = 1,
    FXP_WLPG_RPL_JUNC_INT_ID      = 3,
    FXP_WCM_RC_RPL_JUNC_INT_ID    = 4,
    FXP_WCM_GRP0_RPL_JUNC_INT_ID  = 5,
    FXP_WCM_GRP1_RPL_JUNC_INT_ID  = 6,
    FXP_LEM_RPL_JUNC_INT_ID       = 7,
    FXP_CSE_LEM_RPL_JUNC_INT_ID   = 8,
    FXP_PMC_RPL_JUNC_INT_ID       = 9,
    FXP_POL_RPL_JUNC_INT_ID       = 10,
    FXP_HASH_RPL_JUNC_INT_ID      = 11,
    FXP_CNT_RPL_JUNC_INT_ID       = 12,
    FXP_MOD_RPL_JUNC_INT_ID       = 13,
    FXP_EVMIN_RPL_JUNC_INT_ID     = 14,
    FXP_EVMOUT_RPL_JUNC_INT_ID    = 15,
    FXP_EVMIN_FAB_RPL_JUNC_INT_ID = 16,
    FXP_CSE_MOD_RPL_JUNC_INT_ID   = 18,
    FXP_SEM_MNGDP_RPL_JUNC_INT_ID = 19,
    FXP_SEM_LUE_RPL_JUNC_INT_ID   = 20,
    FXP_CSE_SEM_RPL_JUNC_INT_ID   = 21,
    FXP_SEM_ACT_RPL_JUNC_INT_ID   = 22,
    FXP_LPM_COMM_RPL_JUNC_INT_ID  = 23,
    FXP_CSE_LPM_RPL_JUNC_INT_ID   = 24,
    FXP_RNM0_RPL_JUNC_INT_ID      = 25,
    FXP_RNM1_RPL_JUNC_INT_ID      = 26
} fxp_rpl_junc_int_id_t;

typedef logic [1:0] seg_cnt_t;

typedef logic [7:0] octet_t;

//start of manual code//

//end of manual code//


`endif