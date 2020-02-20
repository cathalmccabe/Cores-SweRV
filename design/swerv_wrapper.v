// SPDX-License-Identifier: Apache-2.0
// Copyright 2019 Western Digital Corporation or its affiliates.
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
// http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

//********************************************************************************
// $Id$
//
// Function: Top wrapper file with swerv/mem instantiated inside
// Comments: 
//
//********************************************************************************
`include "build.h"
//`include "def.sv"
module swerv_wrapper_v
(
   input logic                       clk,
   input logic                       rst_l,
   input logic [31:1]                rst_vec,
   input logic                       nmi_int,
   input logic [31:1]                nmi_vec,                       
   input logic [31:1]                jtag_id,
                       

   output logic [63:0] trace_rv_i_insn_ip,
   output logic [63:0] trace_rv_i_address_ip,
   output logic [2:0]  trace_rv_i_valid_ip,
   output logic [2:0]  trace_rv_i_exception_ip,
   output logic [4:0]  trace_rv_i_ecause_ip,
   output logic [2:0]  trace_rv_i_interrupt_ip,
   output logic [31:0] trace_rv_i_tval_ip,

   // Bus signals

`ifdef RV_BUILD_AXI4
   //-------------------------- LSU AXI signals--------------------------
   // AXI Write Channels
   output logic                            lsu_axi_awvalid,
   input  logic                            lsu_axi_awready,
   output logic [`RV_LSU_BUS_TAG-1:0]      lsu_axi_awid,
   output logic [31:0]                     lsu_axi_awaddr,
   output logic [3:0]                      lsu_axi_awregion,
   output logic [7:0]                      lsu_axi_awlen,
   output logic [2:0]                      lsu_axi_awsize,
   output logic [1:0]                      lsu_axi_awburst,
   output logic                            lsu_axi_awlock,
   output logic [3:0]                      lsu_axi_awcache,
   output logic [2:0]                      lsu_axi_awprot,
   output logic [3:0]                      lsu_axi_awqos,
                                           
   output logic                            lsu_axi_wvalid,                                       
   input  logic                            lsu_axi_wready,
   output logic [63:0]                     lsu_axi_wdata,
   output logic [7:0]                      lsu_axi_wstrb,
   output logic                            lsu_axi_wlast,
                                           
   input  logic                            lsu_axi_bvalid,
   output logic                            lsu_axi_bready,
   input  logic [1:0]                      lsu_axi_bresp,
   input  logic [`RV_LSU_BUS_TAG-1:0]      lsu_axi_bid,
                                           
   // AXI Read Channels                    
   output logic                            lsu_axi_arvalid,
   input  logic                            lsu_axi_arready,
   output logic [`RV_LSU_BUS_TAG-1:0]      lsu_axi_arid,
   output logic [31:0]                     lsu_axi_araddr,
   output logic [3:0]                      lsu_axi_arregion,
   output logic [7:0]                      lsu_axi_arlen,
   output logic [2:0]                      lsu_axi_arsize,
   output logic [1:0]                      lsu_axi_arburst,
   output logic                            lsu_axi_arlock,
   output logic [3:0]                      lsu_axi_arcache,
   output logic [2:0]                      lsu_axi_arprot,
   output logic [3:0]                      lsu_axi_arqos,
                                           
   input  logic                            lsu_axi_rvalid,
   output logic                            lsu_axi_rready,
   input  logic [`RV_LSU_BUS_TAG-1:0]      lsu_axi_rid,
   input  logic [63:0]                     lsu_axi_rdata,
   input  logic [1:0]                      lsu_axi_rresp,
   input  logic                            lsu_axi_rlast,
   
   //-------------------------- IFU AXI signals--------------------------
   // AXI Write Channels
   output logic                            ifu_axi_awvalid,
   input  logic                            ifu_axi_awready,
   output logic [`RV_IFU_BUS_TAG-1:0]      ifu_axi_awid,
   output logic [31:0]                     ifu_axi_awaddr,
   output logic [3:0]                      ifu_axi_awregion,
   output logic [7:0]                      ifu_axi_awlen,
   output logic [2:0]                      ifu_axi_awsize,
   output logic [1:0]                      ifu_axi_awburst,
   output logic                            ifu_axi_awlock,
   output logic [3:0]                      ifu_axi_awcache,
   output logic [2:0]                      ifu_axi_awprot,
   output logic [3:0]                      ifu_axi_awqos,
                                           
   output logic                            ifu_axi_wvalid,                                       
   input  logic                            ifu_axi_wready,
   output logic [63:0]                     ifu_axi_wdata,
   output logic [7:0]                      ifu_axi_wstrb,
   output logic                            ifu_axi_wlast,
                                           
   input  logic                            ifu_axi_bvalid,
   output logic                            ifu_axi_bready,
   input  logic [1:0]                      ifu_axi_bresp,
   input  logic [`RV_IFU_BUS_TAG-1:0]      ifu_axi_bid,
                                           
   // AXI Read Channels                    
   output logic                            ifu_axi_arvalid,
   input  logic                            ifu_axi_arready,
   output logic [`RV_IFU_BUS_TAG-1:0]      ifu_axi_arid,
   output logic [31:0]                     ifu_axi_araddr,
   output logic [3:0]                      ifu_axi_arregion,
   output logic [7:0]                      ifu_axi_arlen,
   output logic [2:0]                      ifu_axi_arsize,
   output logic [1:0]                      ifu_axi_arburst,
   output logic                            ifu_axi_arlock,
   output logic [3:0]                      ifu_axi_arcache,
   output logic [2:0]                      ifu_axi_arprot,
   output logic [3:0]                      ifu_axi_arqos,
                                           
   input  logic                            ifu_axi_rvalid,
   output logic                            ifu_axi_rready,
   input  logic [`RV_IFU_BUS_TAG-1:0]      ifu_axi_rid,
   input  logic [63:0]                     ifu_axi_rdata,
   input  logic [1:0]                      ifu_axi_rresp,
   input  logic                            ifu_axi_rlast,

   //-------------------------- SB AXI signals--------------------------
   // AXI Write Channels
   output logic                            sb_axi_awvalid,
   input  logic                            sb_axi_awready,
   output logic [`RV_SB_BUS_TAG-1:0]       sb_axi_awid,
   output logic [31:0]                     sb_axi_awaddr,
   output logic [3:0]                      sb_axi_awregion,
   output logic [7:0]                      sb_axi_awlen,
   output logic [2:0]                      sb_axi_awsize,
   output logic [1:0]                      sb_axi_awburst,
   output logic                            sb_axi_awlock,
   output logic [3:0]                      sb_axi_awcache,
   output logic [2:0]                      sb_axi_awprot,
   output logic [3:0]                      sb_axi_awqos,
                                           
   output logic                            sb_axi_wvalid,                                       
   input  logic                            sb_axi_wready,
   output logic [63:0]                     sb_axi_wdata,
   output logic [7:0]                      sb_axi_wstrb,
   output logic                            sb_axi_wlast,
                                           
   input  logic                            sb_axi_bvalid,
   output logic                            sb_axi_bready,
   input  logic [1:0]                      sb_axi_bresp,
   input  logic [`RV_SB_BUS_TAG-1:0]       sb_axi_bid,
                                           
   // AXI Read Channels                    
   output logic                            sb_axi_arvalid,
   input  logic                            sb_axi_arready,
   output logic [`RV_SB_BUS_TAG-1:0]       sb_axi_arid,
   output logic [31:0]                     sb_axi_araddr,
   output logic [3:0]                      sb_axi_arregion,
   output logic [7:0]                      sb_axi_arlen,
   output logic [2:0]                      sb_axi_arsize,
   output logic [1:0]                      sb_axi_arburst,
   output logic                            sb_axi_arlock,
   output logic [3:0]                      sb_axi_arcache,
   output logic [2:0]                      sb_axi_arprot,
   output logic [3:0]                      sb_axi_arqos,
                                           
   input  logic                            sb_axi_rvalid,
   output logic                            sb_axi_rready,
   input  logic [`RV_SB_BUS_TAG-1:0]       sb_axi_rid,
   input  logic [63:0]                     sb_axi_rdata,
   input  logic [1:0]                      sb_axi_rresp,
   input  logic                            sb_axi_rlast,

   //-------------------------- DMA AXI signals--------------------------
   // AXI Write Channels
   input  logic                         dma_axi_awvalid,
   output logic                         dma_axi_awready,
   input  logic [`RV_DMA_BUS_TAG-1:0]   dma_axi_awid,
   input  logic [31:0]                  dma_axi_awaddr,
   input  logic [2:0]                   dma_axi_awsize,
   input  logic [2:0]                   dma_axi_awprot,
   input  logic [7:0]                   dma_axi_awlen,
   input  logic [1:0]                   dma_axi_awburst,


   input  logic                         dma_axi_wvalid,                                       
   output logic                         dma_axi_wready,
   input  logic [63:0]                  dma_axi_wdata,
   input  logic [7:0]                   dma_axi_wstrb,
   input  logic                         dma_axi_wlast,
                                        
   output logic                         dma_axi_bvalid,
   input  logic                         dma_axi_bready,
   output logic [1:0]                   dma_axi_bresp,
   output logic [`RV_DMA_BUS_TAG-1:0]   dma_axi_bid,

   // AXI Read Channels
   input  logic                         dma_axi_arvalid,
   output logic                         dma_axi_arready,
   input  logic [`RV_DMA_BUS_TAG-1:0]   dma_axi_arid,
   input  logic [31:0]                  dma_axi_araddr,                                     
   input  logic [2:0]                   dma_axi_arsize,
   input  logic [2:0]                   dma_axi_arprot,
   input  logic [7:0]                   dma_axi_arlen,
   input  logic [1:0]                   dma_axi_arburst,

   output logic                         dma_axi_rvalid,
   input  logic                         dma_axi_rready,
   output logic [`RV_DMA_BUS_TAG-1:0]   dma_axi_rid,
   output logic [63:0]                  dma_axi_rdata,
   output logic [1:0]                   dma_axi_rresp,
   output logic                         dma_axi_rlast,                 
                       
`endif

`ifdef RV_BUILD_AHB_LITE
 //// AHB LITE BUS
   output logic [31:0]               haddr,
   output logic [2:0]                hburst,
   output logic                      hmastlock,
   output logic [3:0]                hprot,
   output logic [2:0]                hsize,
   output logic [1:0]                htrans,
   output logic                      hwrite,

   input logic [63:0]                hrdata,
   input logic                       hready,
   input logic                       hresp,

   // LSU AHB Master
   output logic [31:0]               lsu_haddr,
   output logic [2:0]                lsu_hburst,
   output logic                      lsu_hmastlock,
   output logic [3:0]                lsu_hprot,
   output logic [2:0]                lsu_hsize,
   output logic [1:0]                lsu_htrans,
   output logic                      lsu_hwrite,
   output logic [63:0]               lsu_hwdata,

   input logic [63:0]                lsu_hrdata,
   input logic                       lsu_hready,
   input logic                       lsu_hresp,
   // Debug Syster Bus AHB
   output logic [31:0]               sb_haddr,
   output logic [2:0]                sb_hburst,
   output logic                      sb_hmastlock,
   output logic [3:0]                sb_hprot,
   output logic [2:0]                sb_hsize,
   output logic [1:0]                sb_htrans,
   output logic                      sb_hwrite,
   output logic [63:0]               sb_hwdata,
                                    
   input  logic [63:0]               sb_hrdata,
   input  logic                      sb_hready,
   input  logic                      sb_hresp,
   
   // DMA Slave
   input logic [31:0]                dma_haddr,
   input logic [2:0]                 dma_hburst,
   input logic                       dma_hmastlock,
   input logic [3:0]                 dma_hprot,
   input logic [2:0]                 dma_hsize,
   input logic [1:0]                 dma_htrans,
   input logic                       dma_hwrite,
   input logic [63:0]                dma_hwdata,
   input logic                       dma_hsel,
   input logic                       dma_hreadyin,                    
 
   output logic [63:0]               dma_hrdata,
   output logic                      dma_hreadyout,
   output logic                      dma_hresp,

`endif


   // clk ratio signals
   input logic                       lsu_bus_clk_en, // Clock ratio b/w cpu core clk & AHB master interface
   input logic                       ifu_bus_clk_en, // Clock ratio b/w cpu core clk & AHB master interface
   input logic                       dbg_bus_clk_en, // Clock ratio b/w cpu core clk & AHB master interface
   input logic                       dma_bus_clk_en, // Clock ratio b/w cpu core clk & AHB slave interface             

   
//   input logic                   ext_int,
   input logic                       timer_int,
   input logic [8:1] extintsrc_req,

   output logic [1:0] dec_tlu_perfcnt0, // toggles when perf counter 0 has an event inc
   output logic [1:0] dec_tlu_perfcnt1,
   output logic [1:0] dec_tlu_perfcnt2,
   output logic [1:0] dec_tlu_perfcnt3,

   // ports added by the soc team              
   input logic                       jtag_tck, // JTAG clk
   input logic                       jtag_tms, // JTAG TMS  
   input logic                       jtag_tdi, // JTAG tdi
   input logic                       jtag_trst_n, // JTAG Reset
   output logic                      jtag_tdo, // JTAG TDO
   // external MPC halt/run interface
   input logic mpc_debug_halt_req, // Async halt request
   input logic mpc_debug_run_req, // Async run request
   input logic mpc_reset_run_req, // Run/halt after reset
   output logic mpc_debug_halt_ack, // Halt ack
   output logic mpc_debug_run_ack, // Run ack
   output logic debug_brkpt_status, // debug breakpoint

   input logic                       i_cpu_halt_req, // Async halt req to CPU
   output logic                      o_cpu_halt_ack, // core response to halt
   output logic                      o_cpu_halt_status, // 1'b1 indicates core is halted
   output logic                      o_debug_mode_status, // Core to the PMU that core is in debug mode. When core is in debug mode, the PMU should refrain from sendng a halt or run request
   input logic                       i_cpu_run_req, // Async restart req to CPU
   output logic                      o_cpu_run_ack, // Core response to run req
   input logic                       scan_mode, // To enable scan mode
   input logic                       mbist_mode // to enable mbist 
);



  // Instantiate the SV module
   swerv_wrapper  swerv_wrapper (
 
 
	.clk(clk),
	.rst_l(rst_l),
	.rst_vec(rst_vec),
	.nmi_int(nmi_int),
	.nmi_vec(nmi_vec),
	.jtag_id(jtag_id),
 
 
	.trace_rv_i_insn_ip(trace_rv_i_insn_ip),
	.trace_rv_i_address_ip(trace_rv_i_address_ip),
	.trace_rv_i_valid_ip(trace_rv_i_valid_ip),
	.trace_rv_i_exception_ip(trace_rv_i_exception_ip),
	.trace_rv_i_ecause_ip(trace_rv_i_ecause_ip),
	.trace_rv_i_interrupt_ip(trace_rv_i_interrupt_ip),
	.trace_rv_i_tval_ip(trace_rv_i_tval_ip),
 
`ifdef RV_BUILD_AXI4 
 //-------------------------- LSU AXI signals-------------------------- 
 // AXI Write Channels 
	.lsu_axi_awvalid(lsu_axi_awvalid),
	.lsu_axi_awready(lsu_axi_awready),
	.lsu_axi_awid(lsu_axi_awid),
	.lsu_axi_awaddr(lsu_axi_awaddr),
	.lsu_axi_awregion(lsu_axi_awregion),
	.lsu_axi_awlen(lsu_axi_awlen),
	.lsu_axi_awsize(lsu_axi_awsize),
	.lsu_axi_awburst(lsu_axi_awburst),
	.lsu_axi_awlock(lsu_axi_awlock),
	.lsu_axi_awcache(lsu_axi_awcache),
	.lsu_axi_awprot(lsu_axi_awprot),
	.lsu_axi_awqos(lsu_axi_awqos),
 
	.lsu_axi_wvalid(lsu_axi_wvalid),
	.lsu_axi_wready(lsu_axi_wready),
	.lsu_axi_wdata(lsu_axi_wdata),
	.lsu_axi_wstrb(lsu_axi_wstrb),
	.lsu_axi_wlast(lsu_axi_wlast),
 
	.lsu_axi_bvalid(lsu_axi_bvalid),
	.lsu_axi_bready(lsu_axi_bready),
	.lsu_axi_bresp(lsu_axi_bresp),
	.lsu_axi_bid(lsu_axi_bid),
 
 // AXI Read Channels 
	.lsu_axi_arvalid(lsu_axi_arvalid),
	.lsu_axi_arready(lsu_axi_arready),
	.lsu_axi_arid(lsu_axi_arid),
	.lsu_axi_araddr(lsu_axi_araddr),
	.lsu_axi_arregion(lsu_axi_arregion),
	.lsu_axi_arlen(lsu_axi_arlen),
	.lsu_axi_arsize(lsu_axi_arsize),
	.lsu_axi_arburst(lsu_axi_arburst),
	.lsu_axi_arlock(lsu_axi_arlock),
	.lsu_axi_arcache(lsu_axi_arcache),
	.lsu_axi_arprot(lsu_axi_arprot),
	.lsu_axi_arqos(lsu_axi_arqos),
 
	.lsu_axi_rvalid(lsu_axi_rvalid),
	.lsu_axi_rready(lsu_axi_rready),
	.lsu_axi_rid(lsu_axi_rid),
	.lsu_axi_rdata(lsu_axi_rdata),
	.lsu_axi_rresp(lsu_axi_rresp),
	.lsu_axi_rlast(lsu_axi_rlast),
 
 //-------------------------- IFU AXI signals-------------------------- 
 // AXI Write Channels 
	.ifu_axi_awvalid(ifu_axi_awvalid),
	.ifu_axi_awready(ifu_axi_awready),
	.ifu_axi_awid(ifu_axi_awid),
	.ifu_axi_awaddr(ifu_axi_awaddr),
	.ifu_axi_awregion(ifu_axi_awregion),
	.ifu_axi_awlen(ifu_axi_awlen),
	.ifu_axi_awsize(ifu_axi_awsize),
	.ifu_axi_awburst(ifu_axi_awburst),
	.ifu_axi_awlock(ifu_axi_awlock),
	.ifu_axi_awcache(ifu_axi_awcache),
	.ifu_axi_awprot(ifu_axi_awprot),
	.ifu_axi_awqos(ifu_axi_awqos),
 
	.ifu_axi_wvalid(ifu_axi_wvalid),
	.ifu_axi_wready(ifu_axi_wready),
	.ifu_axi_wdata(ifu_axi_wdata),
	.ifu_axi_wstrb(ifu_axi_wstrb),
	.ifu_axi_wlast(ifu_axi_wlast),
 
	.ifu_axi_bvalid(ifu_axi_bvalid),
	.ifu_axi_bready(ifu_axi_bready),
	.ifu_axi_bresp(ifu_axi_bresp),
	.ifu_axi_bid(ifu_axi_bid),
 
	.// AXI Read Channels 
	.ifu_axi_arvalid(ifu_axi_arvalid),
	.ifu_axi_arready(ifu_axi_arready),
	.ifu_axi_arid(ifu_axi_arid),
	.ifu_axi_araddr(ifu_axi_araddr),
	.ifu_axi_arregion(ifu_axi_arregion),
	.ifu_axi_arlen(ifu_axi_arlen),
	.ifu_axi_arsize(ifu_axi_arsize),
	.ifu_axi_arburst(ifu_axi_arburst),
	.ifu_axi_arlock(ifu_axi_arlock),
	.ifu_axi_arcache(ifu_axi_arcache),
	.ifu_axi_arprot(ifu_axi_arprot),
	.ifu_axi_arqos(ifu_axi_arqos),
 
	.ifu_axi_rvalid(ifu_axi_rvalid),
	.ifu_axi_rready(ifu_axi_rready),
	.ifu_axi_rid(ifu_axi_rid),
	.ifu_axi_rdata(ifu_axi_rdata),
	.ifu_axi_rresp(ifu_axi_rresp),
	.ifu_axi_rlast(ifu_axi_rlast),
 
 //-------------------------- SB AXI signals-------------------------- 
 // AXI Write Channels 
	.sb_axi_awvalid(sb_axi_awvalid),
	.sb_axi_awready(sb_axi_awready),
	.sb_axi_awid(sb_axi_awid),
	.sb_axi_awaddr(sb_axi_awaddr),
	.sb_axi_awregion(sb_axi_awregion),
	.sb_axi_awlen(sb_axi_awlen),
	.sb_axi_awsize(sb_axi_awsize),
	.sb_axi_awburst(sb_axi_awburst),
	.sb_axi_awlock(sb_axi_awlock),
	.sb_axi_awcache(sb_axi_awcache),
	.sb_axi_awprot(sb_axi_awprot),
	.sb_axi_awqos(sb_axi_awqos),
 
	.sb_axi_wvalid(sb_axi_wvalid),
	.sb_axi_wready(sb_axi_wready),
	.sb_axi_wdata(sb_axi_wdata),
	.sb_axi_wstrb(sb_axi_wstrb),
	.sb_axi_wlast(sb_axi_wlast),
 
	.sb_axi_bvalid(sb_axi_bvalid),
	.sb_axi_bready(sb_axi_bready),
	.sb_axi_bresp(sb_axi_bresp),
	.sb_axi_bid(sb_axi_bid),
 
 // AXI Read Channels 
	.sb_axi_arvalid(sb_axi_arvalid),
	.sb_axi_arready(sb_axi_arready),
	.sb_axi_arid(sb_axi_arid),
	.sb_axi_araddr(sb_axi_araddr),
	.sb_axi_arregion(sb_axi_arregion),
	.sb_axi_arlen(sb_axi_arlen),
	.sb_axi_arsize(sb_axi_arsize),
	.sb_axi_arburst(sb_axi_arburst),
	.sb_axi_arlock(sb_axi_arlock),
	.sb_axi_arcache(sb_axi_arcache),
	.sb_axi_arprot(sb_axi_arprot),
	.sb_axi_arqos(sb_axi_arqos),
 
	.sb_axi_rvalid(sb_axi_rvalid),
	.sb_axi_rready(sb_axi_rready),
	.sb_axi_rid(sb_axi_rid),
	.sb_axi_rdata(sb_axi_rdata),
	.sb_axi_rresp(sb_axi_rresp),
	.sb_axi_rlast(sb_axi_rlast),
 
 //-------------------------- DMA AXI signals-------------------------- 
 // AXI Write Channels 
	.dma_axi_awvalid(dma_axi_awvalid),
	.dma_axi_awready(dma_axi_awready),
	.dma_axi_awid(dma_axi_awid),
	.dma_axi_awaddr(dma_axi_awaddr),
	.dma_axi_awsize(dma_axi_awsize),
	.dma_axi_awprot(dma_axi_awprot),
	.dma_axi_awlen(dma_axi_awlen),
	.dma_axi_awburst(dma_axi_awburst),
 
 
	.dma_axi_wvalid(dma_axi_wvalid),
	.dma_axi_wready(dma_axi_wready),
	.dma_axi_wdata(dma_axi_wdata),
	.dma_axi_wstrb(dma_axi_wstrb),
	.dma_axi_wlast(dma_axi_wlast),
 
	.dma_axi_bvalid(dma_axi_bvalid),
	.dma_axi_bready(dma_axi_bready),
	.dma_axi_bresp(dma_axi_bresp),
	.dma_axi_bid(dma_axi_bid),
 
 // AXI Read Channels 
	.dma_axi_arvalid(dma_axi_arvalid),
	.dma_axi_arready(dma_axi_arready),
	.dma_axi_arid(dma_axi_arid),
	.dma_axi_araddr(dma_axi_araddr),
	.dma_axi_arsize(dma_axi_arsize),
	.dma_axi_arprot(dma_axi_arprot),
	.dma_axi_arlen(dma_axi_arlen),
	.dma_axi_arburst(dma_axi_arburst),
 
	.dma_axi_rvalid(dma_axi_rvalid),
	.dma_axi_rready(dma_axi_rready),
	.dma_axi_rid(dma_axi_rid),
	.dma_axi_rdata(dma_axi_rdata),
	.dma_axi_rresp(dma_axi_rresp),
	.dma_axi_rlast(dma_axi_rlast),
 
`endif 
 
`ifdef RV_BUILD_AHB_LITE 
 //// AHB LITE BUS 
	.haddr(haddr),
	.hburst(hburst),
	.hmastlock(hmastlock),
	.hprot(hprot),
	.hsize(hsize),
	.htrans(htrans),
	.hwrite(hwrite),
 
	.hrdata(hrdata),
	.hready(hready),
	.hresp(hresp),
 
 // LSU AHB Master 
	.lsu_haddr(lsu_haddr),
	.lsu_hburst(lsu_hburst),
	.lsu_hmastlock(lsu_hmastlock),
	.lsu_hprot(lsu_hprot),
	.lsu_hsize(lsu_hsize),
	.lsu_htrans(lsu_htrans),
	.lsu_hwrite(lsu_hwrite),
	.lsu_hwdata(lsu_hwdata),
 
	.lsu_hrdata(lsu_hrdata),
	.lsu_hready(lsu_hready),
	.lsu_hresp(lsu_hresp),
 // Debug Syster Bus AHB 
	.sb_haddr(sb_haddr),
	.sb_hburst(sb_hburst),
	.sb_hmastlock(sb_hmastlock),
	.sb_hprot(sb_hprot),
	.sb_hsize(sb_hsize),
	.sb_htrans(sb_htrans),
	.sb_hwrite(sb_hwrite),
	.sb_hwdata(sb_hwdata),
 
	.sb_hrdata(sb_hrdata),
	.sb_hready(sb_hready),
	.sb_hresp(sb_hresp),
 
 // DMA Slave 
	.dma_haddr(dma_haddr),
	.dma_hburst(dma_hburst),
	.dma_hmastlock(dma_hmastlock),
	.dma_hprot(dma_hprot),
	.dma_hsize(dma_hsize),
	.dma_htrans(dma_htrans), 
	.dma_hwrite(dma_hwrite),
	.dma_hwdata(dma_hwdata),
	.dma_hsel(dma_hsel),
	.dma_hreadyin(dma_hreadyin),
 
	.dma_hrdata(dma_hrdata),
	.dma_hreadyout(dma_hreadyout), 
	.dma_hresp(dma_hresp),
 
`endif 
 
 
 // clk ratio signals 
	.lsu_bus_clk_en(lsu_bus_clk_en),// Clock ratio b/w cpu core clk & AHB master interface 
	.ifu_bus_clk_en(ifu_bus_clk_en),// Clock ratio b/w cpu core clk & AHB master interface 
	.dbg_bus_clk_en(dbg_bus_clk_en),// Clock ratio b/w cpu core clk & AHB master interface 
	.dma_bus_clk_en(dma_bus_clk_en),// Clock ratio b/w cpu core clk & AHB slave interface 
 
 
// input logic [] ext_int , 
	.timer_int(timer_int),
	.extintsrc_req(extintsrc_req),
 
	.dec_tlu_perfcnt0(dec_tlu_perfcnt0),// toggles when perf counter 0 has an event inc 
	.dec_tlu_perfcnt1(dec_tlu_perfcnt1),
	.dec_tlu_perfcnt2(dec_tlu_perfcnt2),
	.dec_tlu_perfcnt3(dec_tlu_perfcnt3),
 
	.jtag_tck(), // JTAG clk 
	.jtag_tms(), // JTAG TMS 
	.jtag_tdi(), // JTAG tdi 
	.jtag_trst_n(), // JTAG Reset 
	.jtag_tdo(), // JTAG TDO 
 
	.i_cpu_halt_req(), // Async halt req to CPU 
	.o_cpu_halt_ack(), // core response to halt 
	.o_cpu_halt_status(), // 1'b1 indicates core is halted 
	.o_debug_mode_status(), // Core to the PMU that core is in debug mode	.When core is in debug mode , the PMU should refrain from sendng a halt or run request 
	.i_cpu_run_req(), // Async restart req to CPU 
	.o_cpu_run_ack(), // Core response to run req 
	.scan_mode(), // To enable scan mode 
	.mbist_mode() // to enable mbist 
); 

endmodule