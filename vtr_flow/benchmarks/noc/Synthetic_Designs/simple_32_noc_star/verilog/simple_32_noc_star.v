/*
    Top level modules to instantiate an AXI handshake between 32 routers.
    The first router generates data and pass it through all other routers (star connection),
    and each router can process data with the traffic processor module.
    For now, all of our routers traffic processor's module does the same calculation, 
    but in a more complicated design, we can add different logic to each router's traffic 
    processor module.
*/

module simple_32_noc_star (
    clk,
    reset,
	data_out
);

parameter noc_dw = 32; //NoC Data Width
parameter byte_dw = 8; 

/*****************INPUT/OUTPUT Definition********************/
input wire clk;
input wire reset;

output wire [noc_dw * 2 - 1:0] data_out;

/*******************Internal Variables**********************/
//traffic generator
wire [noc_dw - 1 : 0] tg_data;
wire tg_valid;

//First master and slave interface
wire [noc_dw -1 : 0] mi_1_data;
wire mi_1_valid;
wire mi_1_ready;

//Second to last routers
//slave interface data - middle routers
wire [noc_dw - 1: 0] si_data_in_2;
wire si_valid_in_2;
wire si_ready_2;

wire [noc_dw - 1: 0] si_data_out_2;
wire si_valid_out_2;

wire [noc_dw - 1: 0] si_data_in_3;
wire si_valid_in_3;
wire si_ready_3;

wire [noc_dw - 1: 0] si_data_out_3;
wire si_valid_out_3;

wire [noc_dw - 1: 0] si_data_in_4;
wire si_valid_in_4;
wire si_ready_4;

wire [noc_dw - 1: 0] si_data_out_4;
wire si_valid_out_4;

wire [noc_dw - 1: 0] si_data_in_5;
wire si_valid_in_5;
wire si_ready_5;

wire [noc_dw - 1: 0] si_data_out_5;
wire si_valid_out_5;

wire [noc_dw - 1: 0] si_data_in_6;
wire si_valid_in_6;
wire si_ready_6;

wire [noc_dw - 1: 0] si_data_out_6;
wire si_valid_out_6;

wire [noc_dw - 1: 0] si_data_in_7;
wire si_valid_in_7;
wire si_ready_7;

wire [noc_dw - 1: 0] si_data_out_7;
wire si_valid_out_7;

wire [noc_dw - 1: 0] si_data_in_8;
wire si_valid_in_8;
wire si_ready_8;

wire [noc_dw - 1: 0] si_data_out_8;
wire si_valid_out_8;

wire [noc_dw - 1: 0] si_data_in_9;
wire si_valid_in_9;
wire si_ready_9;

wire [noc_dw - 1: 0] si_data_out_9;
wire si_valid_out_9;

wire [noc_dw - 1: 0] si_data_in_10;
wire si_valid_in_10;
wire si_ready_10;

wire [noc_dw - 1: 0] si_data_out_10;
wire si_valid_out_10;

wire [noc_dw - 1: 0] si_data_in_11;
wire si_valid_in_11;
wire si_ready_11;

wire [noc_dw - 1: 0] si_data_out_11;
wire si_valid_out_11;

wire [noc_dw - 1: 0] si_data_in_12;
wire si_valid_in_12;
wire si_ready_12;

wire [noc_dw - 1: 0] si_data_out_12;
wire si_valid_out_12;

wire [noc_dw - 1: 0] si_data_in_13;
wire si_valid_in_13;
wire si_ready_13;

wire [noc_dw - 1: 0] si_data_out_13;
wire si_valid_out_13;

wire [noc_dw - 1: 0] si_data_in_14;
wire si_valid_in_14;
wire si_ready_14;

wire [noc_dw - 1: 0] si_data_out_14;
wire si_valid_out_14;

wire [noc_dw - 1: 0] si_data_in_15;
wire si_valid_in_15;
wire si_ready_15;

wire [noc_dw - 1: 0] si_data_out_15;
wire si_valid_out_15;

wire [noc_dw - 1: 0] si_data_in_16;
wire si_valid_in_16;
wire si_ready_16;

wire [noc_dw - 1: 0] si_data_out_16;
wire si_valid_out_16;

wire [noc_dw - 1: 0] si_data_in_17;
wire si_valid_in_17;
wire si_ready_17;

wire [noc_dw - 1: 0] si_data_out_17;
wire si_valid_out_17;

wire [noc_dw - 1: 0] si_data_in_18;
wire si_valid_in_18;
wire si_ready_18;

wire [noc_dw - 1: 0] si_data_out_18;
wire si_valid_out_18;

wire [noc_dw - 1: 0] si_data_in_19;
wire si_valid_in_19;
wire si_ready_19;

wire [noc_dw - 1: 0] si_data_out_19;
wire si_valid_out_19;

wire [noc_dw - 1: 0] si_data_in_20;
wire si_valid_in_20;
wire si_ready_20;

wire [noc_dw - 1: 0] si_data_out_20;
wire si_valid_out_20;

wire [noc_dw - 1: 0] si_data_in_21;
wire si_valid_in_21;
wire si_ready_21;

wire [noc_dw - 1: 0] si_data_out_21;
wire si_valid_out_21;

wire [noc_dw - 1: 0] si_data_in_22;
wire si_valid_in_22;
wire si_ready_22;

wire [noc_dw - 1: 0] si_data_out_22;
wire si_valid_out_22;

wire [noc_dw - 1: 0] si_data_in_23;
wire si_valid_in_23;
wire si_ready_23;

wire [noc_dw - 1: 0] si_data_out_23;
wire si_valid_out_23;

wire [noc_dw - 1: 0] si_data_in_24;
wire si_valid_in_24;
wire si_ready_24;

wire [noc_dw - 1: 0] si_data_out_24;
wire si_valid_out_24;

wire [noc_dw - 1: 0] si_data_in_25;
wire si_valid_in_25;
wire si_ready_25;

wire [noc_dw - 1: 0] si_data_out_25;
wire si_valid_out_25;

wire [noc_dw - 1: 0] si_data_in_26;
wire si_valid_in_26;
wire si_ready_26;

wire [noc_dw - 1: 0] si_data_out_26;
wire si_valid_out_26;

wire [noc_dw - 1: 0] si_data_in_27;
wire si_valid_in_27;
wire si_ready_27;

wire [noc_dw - 1: 0] si_data_out_27;
wire si_valid_out_27;

wire [noc_dw - 1: 0] si_data_in_28;
wire si_valid_in_28;
wire si_ready_28;

wire [noc_dw - 1: 0] si_data_out_28;
wire si_valid_out_28;

wire [noc_dw - 1: 0] si_data_in_29;
wire si_valid_in_29;
wire si_ready_29;

wire [noc_dw - 1: 0] si_data_out_29;
wire si_valid_out_29;

wire [noc_dw - 1: 0] si_data_in_30;
wire si_valid_in_30;
wire si_ready_30;

wire [noc_dw - 1: 0] si_data_out_30;
wire si_valid_out_30;

wire [noc_dw - 1: 0] si_data_in_31;
wire si_valid_in_31;
wire si_ready_31;

wire [noc_dw - 1: 0] si_data_out_31;
wire si_valid_out_31;

wire [noc_dw - 1: 0] si_data_in_32;
wire si_valid_in_32;
wire si_ready_32;

wire [noc_dw - 1: 0] si_data_out_32;
wire si_valid_out_32;

//traffic processor data - middle routers
wire [noc_dw - 1: 0] tp_data_out_2;
wire tp_valid_out_2;

wire [noc_dw - 1: 0] tp_data_out_3;
wire tp_valid_out_3;

wire [noc_dw - 1: 0] tp_data_out_4;
wire tp_valid_out_4;

wire [noc_dw - 1: 0] tp_data_out_5;
wire tp_valid_out_5;

wire [noc_dw - 1: 0] tp_data_out_6;
wire tp_valid_out_6;

wire [noc_dw - 1: 0] tp_data_out_7;
wire tp_valid_out_7;

wire [noc_dw - 1: 0] tp_data_out_8;
wire tp_valid_out_8;

wire [noc_dw - 1: 0] tp_data_out_9;
wire tp_valid_out_9;

wire [noc_dw - 1: 0] tp_data_out_10;
wire tp_valid_out_10;

wire [noc_dw - 1: 0] tp_data_out_11;
wire tp_valid_out_11;

wire [noc_dw - 1: 0] tp_data_out_12;
wire tp_valid_out_12;

wire [noc_dw - 1: 0] tp_data_out_13;
wire tp_valid_out_13;

wire [noc_dw - 1: 0] tp_data_out_14;
wire tp_valid_out_14;

wire [noc_dw - 1: 0] tp_data_out_15;
wire tp_valid_out_15;

wire [noc_dw - 1: 0] tp_data_out_16;
wire tp_valid_out_16;

wire [noc_dw - 1: 0] tp_data_out_17;
wire tp_valid_out_17;

wire [noc_dw - 1: 0] tp_data_out_18;
wire tp_valid_out_18;

wire [noc_dw - 1: 0] tp_data_out_19;
wire tp_valid_out_19;

wire [noc_dw - 1: 0] tp_data_out_20;
wire tp_valid_out_20;

wire [noc_dw - 1: 0] tp_data_out_21;
wire tp_valid_out_21;

wire [noc_dw - 1: 0] tp_data_out_22;
wire tp_valid_out_22;

wire [noc_dw - 1: 0] tp_data_out_23;
wire tp_valid_out_23;

wire [noc_dw - 1: 0] tp_data_out_24;
wire tp_valid_out_24;

wire [noc_dw - 1: 0] tp_data_out_25;
wire tp_valid_out_25;

wire [noc_dw - 1: 0] tp_data_out_26;
wire tp_valid_out_26;

wire [noc_dw - 1: 0] tp_data_out_27;
wire tp_valid_out_27;

wire [noc_dw - 1: 0] tp_data_out_28;
wire tp_valid_out_28;

wire [noc_dw - 1: 0] tp_data_out_29;
wire tp_valid_out_29;

wire [noc_dw - 1: 0] tp_data_out_30;
wire tp_valid_out_30;

wire [noc_dw - 1: 0] tp_data_out_31;
wire tp_valid_out_31;

wire [noc_dw - 1: 0] tp_data_out_32;
wire tp_valid_out_32;

/*******************module instantiation********************/

/*
    **********************FIRST NOC ADAPTER*****************
    1) Traffic generator passes data to master_interface
    2) master_interface passes data to First NoC adapter
    3) No need for a slave interface in the first NoC adapter
    4) No need for a traffic processor in the first NoC adapter
*/
traffic_generator tg(
    .clk(clk),
    .reset(reset),
    .tdata(tg_data),
    .tvalid(tg_valid)
);

master_interface mi_1 (
	.clk(clk),
	.reset(reset),
	.tvalid_in(tg_valid),
	.tdata_in(tg_data),
	.tready(mi_1_ready), 
	.tdata_out(mi_1_data),
	.tvalid_out(mi_1_valid),
	.tstrb(),
	.tkeep(),
	.tid(),
	.tdest(),
	.tuser(),
	.tlast()
);

noc_router_adapter_block noc_router_adapter_block_1(
	.clk(clk),
    .reset(reset),
    .master_tready(1'd0),
    .master_tdata(),
	.master_tvalid(),
    .master_tstrb(),
    .master_tkeep(),
    .master_tid(),
    .master_tdest(),
    .master_tuser(),
    .master_tlast(),
    .slave_tvalid(mi_1_valid),
    .slave_tready(mi_1_ready), 
    .slave_tdata(mi_1_data),
    .slave_tstrb(8'd0),
    .slave_tkeep(8'd0),
    .slave_tid(8'd0),
    .slave_tdest(8'd0),
    .slave_tuser(8'd0),
    .slave_tlast(1'd0),

);

/*
    *******************ALL OTHER NOC ADAPTERS***************
    1) Data comes through NoC 
    2) NoC adapter passes data to slave interface
    3) slave_interface passes data to traffic processor
*/
noc_router_adapter_block noc_router_adapter_block_2 (
             .clk(clk),
             .reset(reset),
             .master_tready(si_ready_2),
             .master_tdata(si_data_in_2),
             .master_tvalid(si_valid_in_2),
             .master_tstrb(),
             .master_tkeep(),
             .master_tid(),
             .master_tdest(),
             .master_tuser(),
             .master_tlast(),
             .slave_tvalid(1'd0),
             .slave_tready(), 
             .slave_tdata(32'd0),
             .slave_tstrb(8'd0),
             .slave_tkeep(8'd0),
             .slave_tid(8'd0),
             .slave_tdest(8'd0),
             .slave_tuser(8'd0),
             .slave_tlast(1'd0)
         );
slave_interface si_2(
             .clk(clk),
             .reset(reset),
             .tvalid_in(si_valid_in_2),
             .tdata_in(si_data_in_2),
             .tready(si_ready_2),
             .tdata_out(si_data_out_2),
             .tvalid_out(si_valid_out_2),
             .tstrb(8'd0),
             .tkeep(8'd0),
             .tid(8'd0),
             .tdest(8'd0),
             .tuser(8'd0),
             .tlast(1'd0)
         );
traffic_processor tp_2(
 	        .clk(clk),
	        .reset(reset),
	        .tdata_in(si_data_out_2),
	        .tvalid_in(si_valid_out_2),
	        .tdata_out(tp_data_out_2),
	        .tvalid_out(tp_valid_out_2)
        );
noc_router_adapter_block noc_router_adapter_block_3 (
             .clk(clk),
             .reset(reset),
             .master_tready(si_ready_3),
             .master_tdata(si_data_in_3),
             .master_tvalid(si_valid_in_3),
             .master_tstrb(),
             .master_tkeep(),
             .master_tid(),
             .master_tdest(),
             .master_tuser(),
             .master_tlast(),
             .slave_tvalid(1'd0),
             .slave_tready(), 
             .slave_tdata(32'd0),
             .slave_tstrb(8'd0),
             .slave_tkeep(8'd0),
             .slave_tid(8'd0),
             .slave_tdest(8'd0),
             .slave_tuser(8'd0),
             .slave_tlast(1'd0)
         );
slave_interface si_3(
             .clk(clk),
             .reset(reset),
             .tvalid_in(si_valid_in_3),
             .tdata_in(si_data_in_3),
             .tready(si_ready_3),
             .tdata_out(si_data_out_3),
             .tvalid_out(si_valid_out_3),
             .tstrb(8'd0),
             .tkeep(8'd0),
             .tid(8'd0),
             .tdest(8'd0),
             .tuser(8'd0),
             .tlast(1'd0)
         );
traffic_processor tp_3(
 	        .clk(clk),
	        .reset(reset),
	        .tdata_in(si_data_out_3),
	        .tvalid_in(si_valid_out_3),
	        .tdata_out(tp_data_out_3),
	        .tvalid_out(tp_valid_out_3)
        );
noc_router_adapter_block noc_router_adapter_block_4 (
             .clk(clk),
             .reset(reset),
             .master_tready(si_ready_4),
             .master_tdata(si_data_in_4),
             .master_tvalid(si_valid_in_4),
             .master_tstrb(),
             .master_tkeep(),
             .master_tid(),
             .master_tdest(),
             .master_tuser(),
             .master_tlast(),
             .slave_tvalid(1'd0),
             .slave_tready(), 
             .slave_tdata(32'd0),
             .slave_tstrb(8'd0),
             .slave_tkeep(8'd0),
             .slave_tid(8'd0),
             .slave_tdest(8'd0),
             .slave_tuser(8'd0),
             .slave_tlast(1'd0)
         );
slave_interface si_4(
             .clk(clk),
             .reset(reset),
             .tvalid_in(si_valid_in_4),
             .tdata_in(si_data_in_4),
             .tready(si_ready_4),
             .tdata_out(si_data_out_4),
             .tvalid_out(si_valid_out_4),
             .tstrb(8'd0),
             .tkeep(8'd0),
             .tid(8'd0),
             .tdest(8'd0),
             .tuser(8'd0),
             .tlast(1'd0)
         );
traffic_processor tp_4(
 	        .clk(clk),
	        .reset(reset),
	        .tdata_in(si_data_out_4),
	        .tvalid_in(si_valid_out_4),
	        .tdata_out(tp_data_out_4),
	        .tvalid_out(tp_valid_out_4)
        );
noc_router_adapter_block noc_router_adapter_block_5 (
             .clk(clk),
             .reset(reset),
             .master_tready(si_ready_5),
             .master_tdata(si_data_in_5),
             .master_tvalid(si_valid_in_5),
             .master_tstrb(),
             .master_tkeep(),
             .master_tid(),
             .master_tdest(),
             .master_tuser(),
             .master_tlast(),
             .slave_tvalid(1'd0),
             .slave_tready(), 
             .slave_tdata(32'd0),
             .slave_tstrb(8'd0),
             .slave_tkeep(8'd0),
             .slave_tid(8'd0),
             .slave_tdest(8'd0),
             .slave_tuser(8'd0),
             .slave_tlast(1'd0)
         );
slave_interface si_5(
             .clk(clk),
             .reset(reset),
             .tvalid_in(si_valid_in_5),
             .tdata_in(si_data_in_5),
             .tready(si_ready_5),
             .tdata_out(si_data_out_5),
             .tvalid_out(si_valid_out_5),
             .tstrb(8'd0),
             .tkeep(8'd0),
             .tid(8'd0),
             .tdest(8'd0),
             .tuser(8'd0),
             .tlast(1'd0)
         );
traffic_processor tp_5(
 	        .clk(clk),
	        .reset(reset),
	        .tdata_in(si_data_out_5),
	        .tvalid_in(si_valid_out_5),
	        .tdata_out(tp_data_out_5),
	        .tvalid_out(tp_valid_out_5)
        );
noc_router_adapter_block noc_router_adapter_block_6 (
             .clk(clk),
             .reset(reset),
             .master_tready(si_ready_6),
             .master_tdata(si_data_in_6),
             .master_tvalid(si_valid_in_6),
             .master_tstrb(),
             .master_tkeep(),
             .master_tid(),
             .master_tdest(),
             .master_tuser(),
             .master_tlast(),
             .slave_tvalid(1'd0),
             .slave_tready(), 
             .slave_tdata(32'd0),
             .slave_tstrb(8'd0),
             .slave_tkeep(8'd0),
             .slave_tid(8'd0),
             .slave_tdest(8'd0),
             .slave_tuser(8'd0),
             .slave_tlast(1'd0)
         );
slave_interface si_6(
             .clk(clk),
             .reset(reset),
             .tvalid_in(si_valid_in_6),
             .tdata_in(si_data_in_6),
             .tready(si_ready_6),
             .tdata_out(si_data_out_6),
             .tvalid_out(si_valid_out_6),
             .tstrb(8'd0),
             .tkeep(8'd0),
             .tid(8'd0),
             .tdest(8'd0),
             .tuser(8'd0),
             .tlast(1'd0)
         );
traffic_processor tp_6(
 	        .clk(clk),
	        .reset(reset),
	        .tdata_in(si_data_out_6),
	        .tvalid_in(si_valid_out_6),
	        .tdata_out(tp_data_out_6),
	        .tvalid_out(tp_valid_out_6)
        );
noc_router_adapter_block noc_router_adapter_block_7 (
             .clk(clk),
             .reset(reset),
             .master_tready(si_ready_7),
             .master_tdata(si_data_in_7),
             .master_tvalid(si_valid_in_7),
             .master_tstrb(),
             .master_tkeep(),
             .master_tid(),
             .master_tdest(),
             .master_tuser(),
             .master_tlast(),
             .slave_tvalid(1'd0),
             .slave_tready(), 
             .slave_tdata(32'd0),
             .slave_tstrb(8'd0),
             .slave_tkeep(8'd0),
             .slave_tid(8'd0),
             .slave_tdest(8'd0),
             .slave_tuser(8'd0),
             .slave_tlast(1'd0)
         );
slave_interface si_7(
             .clk(clk),
             .reset(reset),
             .tvalid_in(si_valid_in_7),
             .tdata_in(si_data_in_7),
             .tready(si_ready_7),
             .tdata_out(si_data_out_7),
             .tvalid_out(si_valid_out_7),
             .tstrb(8'd0),
             .tkeep(8'd0),
             .tid(8'd0),
             .tdest(8'd0),
             .tuser(8'd0),
             .tlast(1'd0)
         );
traffic_processor tp_7(
 	        .clk(clk),
	        .reset(reset),
	        .tdata_in(si_data_out_7),
	        .tvalid_in(si_valid_out_7),
	        .tdata_out(tp_data_out_7),
	        .tvalid_out(tp_valid_out_7)
        );
noc_router_adapter_block noc_router_adapter_block_8 (
             .clk(clk),
             .reset(reset),
             .master_tready(si_ready_8),
             .master_tdata(si_data_in_8),
             .master_tvalid(si_valid_in_8),
             .master_tstrb(),
             .master_tkeep(),
             .master_tid(),
             .master_tdest(),
             .master_tuser(),
             .master_tlast(),
             .slave_tvalid(1'd0),
             .slave_tready(), 
             .slave_tdata(32'd0),
             .slave_tstrb(8'd0),
             .slave_tkeep(8'd0),
             .slave_tid(8'd0),
             .slave_tdest(8'd0),
             .slave_tuser(8'd0),
             .slave_tlast(1'd0)
         );
slave_interface si_8(
             .clk(clk),
             .reset(reset),
             .tvalid_in(si_valid_in_8),
             .tdata_in(si_data_in_8),
             .tready(si_ready_8),
             .tdata_out(si_data_out_8),
             .tvalid_out(si_valid_out_8),
             .tstrb(8'd0),
             .tkeep(8'd0),
             .tid(8'd0),
             .tdest(8'd0),
             .tuser(8'd0),
             .tlast(1'd0)
         );
traffic_processor tp_8(
 	        .clk(clk),
	        .reset(reset),
	        .tdata_in(si_data_out_8),
	        .tvalid_in(si_valid_out_8),
	        .tdata_out(tp_data_out_8),
	        .tvalid_out(tp_valid_out_8)
        );
noc_router_adapter_block noc_router_adapter_block_9 (
             .clk(clk),
             .reset(reset),
             .master_tready(si_ready_9),
             .master_tdata(si_data_in_9),
             .master_tvalid(si_valid_in_9),
             .master_tstrb(),
             .master_tkeep(),
             .master_tid(),
             .master_tdest(),
             .master_tuser(),
             .master_tlast(),
             .slave_tvalid(1'd0),
             .slave_tready(), 
             .slave_tdata(32'd0),
             .slave_tstrb(8'd0),
             .slave_tkeep(8'd0),
             .slave_tid(8'd0),
             .slave_tdest(8'd0),
             .slave_tuser(8'd0),
             .slave_tlast(1'd0)
         );
slave_interface si_9(
             .clk(clk),
             .reset(reset),
             .tvalid_in(si_valid_in_9),
             .tdata_in(si_data_in_9),
             .tready(si_ready_9),
             .tdata_out(si_data_out_9),
             .tvalid_out(si_valid_out_9),
             .tstrb(8'd0),
             .tkeep(8'd0),
             .tid(8'd0),
             .tdest(8'd0),
             .tuser(8'd0),
             .tlast(1'd0)
         );
traffic_processor tp_9(
 	        .clk(clk),
	        .reset(reset),
	        .tdata_in(si_data_out_9),
	        .tvalid_in(si_valid_out_9),
	        .tdata_out(tp_data_out_9),
	        .tvalid_out(tp_valid_out_9)
        );
noc_router_adapter_block noc_router_adapter_block_10 (
             .clk(clk),
             .reset(reset),
             .master_tready(si_ready_10),
             .master_tdata(si_data_in_10),
             .master_tvalid(si_valid_in_10),
             .master_tstrb(),
             .master_tkeep(),
             .master_tid(),
             .master_tdest(),
             .master_tuser(),
             .master_tlast(),
             .slave_tvalid(1'd0),
             .slave_tready(), 
             .slave_tdata(32'd0),
             .slave_tstrb(8'd0),
             .slave_tkeep(8'd0),
             .slave_tid(8'd0),
             .slave_tdest(8'd0),
             .slave_tuser(8'd0),
             .slave_tlast(1'd0)
         );
slave_interface si_10(
             .clk(clk),
             .reset(reset),
             .tvalid_in(si_valid_in_10),
             .tdata_in(si_data_in_10),
             .tready(si_ready_10),
             .tdata_out(si_data_out_10),
             .tvalid_out(si_valid_out_10),
             .tstrb(8'd0),
             .tkeep(8'd0),
             .tid(8'd0),
             .tdest(8'd0),
             .tuser(8'd0),
             .tlast(1'd0)
         );
traffic_processor tp_10(
 	        .clk(clk),
	        .reset(reset),
	        .tdata_in(si_data_out_10),
	        .tvalid_in(si_valid_out_10),
	        .tdata_out(tp_data_out_10),
	        .tvalid_out(tp_valid_out_10)
        );
noc_router_adapter_block noc_router_adapter_block_11 (
             .clk(clk),
             .reset(reset),
             .master_tready(si_ready_11),
             .master_tdata(si_data_in_11),
             .master_tvalid(si_valid_in_11),
             .master_tstrb(),
             .master_tkeep(),
             .master_tid(),
             .master_tdest(),
             .master_tuser(),
             .master_tlast(),
             .slave_tvalid(1'd0),
             .slave_tready(), 
             .slave_tdata(32'd0),
             .slave_tstrb(8'd0),
             .slave_tkeep(8'd0),
             .slave_tid(8'd0),
             .slave_tdest(8'd0),
             .slave_tuser(8'd0),
             .slave_tlast(1'd0)
         );
slave_interface si_11(
             .clk(clk),
             .reset(reset),
             .tvalid_in(si_valid_in_11),
             .tdata_in(si_data_in_11),
             .tready(si_ready_11),
             .tdata_out(si_data_out_11),
             .tvalid_out(si_valid_out_11),
             .tstrb(8'd0),
             .tkeep(8'd0),
             .tid(8'd0),
             .tdest(8'd0),
             .tuser(8'd0),
             .tlast(1'd0)
         );
traffic_processor tp_11(
 	        .clk(clk),
	        .reset(reset),
	        .tdata_in(si_data_out_11),
	        .tvalid_in(si_valid_out_11),
	        .tdata_out(tp_data_out_11),
	        .tvalid_out(tp_valid_out_11)
        );
noc_router_adapter_block noc_router_adapter_block_12 (
             .clk(clk),
             .reset(reset),
             .master_tready(si_ready_12),
             .master_tdata(si_data_in_12),
             .master_tvalid(si_valid_in_12),
             .master_tstrb(),
             .master_tkeep(),
             .master_tid(),
             .master_tdest(),
             .master_tuser(),
             .master_tlast(),
             .slave_tvalid(1'd0),
             .slave_tready(), 
             .slave_tdata(32'd0),
             .slave_tstrb(8'd0),
             .slave_tkeep(8'd0),
             .slave_tid(8'd0),
             .slave_tdest(8'd0),
             .slave_tuser(8'd0),
             .slave_tlast(1'd0)
         );
slave_interface si_12(
             .clk(clk),
             .reset(reset),
             .tvalid_in(si_valid_in_12),
             .tdata_in(si_data_in_12),
             .tready(si_ready_12),
             .tdata_out(si_data_out_12),
             .tvalid_out(si_valid_out_12),
             .tstrb(8'd0),
             .tkeep(8'd0),
             .tid(8'd0),
             .tdest(8'd0),
             .tuser(8'd0),
             .tlast(1'd0)
         );
traffic_processor tp_12(
 	        .clk(clk),
	        .reset(reset),
	        .tdata_in(si_data_out_12),
	        .tvalid_in(si_valid_out_12),
	        .tdata_out(tp_data_out_12),
	        .tvalid_out(tp_valid_out_12)
        );
noc_router_adapter_block noc_router_adapter_block_13 (
             .clk(clk),
             .reset(reset),
             .master_tready(si_ready_13),
             .master_tdata(si_data_in_13),
             .master_tvalid(si_valid_in_13),
             .master_tstrb(),
             .master_tkeep(),
             .master_tid(),
             .master_tdest(),
             .master_tuser(),
             .master_tlast(),
             .slave_tvalid(1'd0),
             .slave_tready(), 
             .slave_tdata(32'd0),
             .slave_tstrb(8'd0),
             .slave_tkeep(8'd0),
             .slave_tid(8'd0),
             .slave_tdest(8'd0),
             .slave_tuser(8'd0),
             .slave_tlast(1'd0)
         );
slave_interface si_13(
             .clk(clk),
             .reset(reset),
             .tvalid_in(si_valid_in_13),
             .tdata_in(si_data_in_13),
             .tready(si_ready_13),
             .tdata_out(si_data_out_13),
             .tvalid_out(si_valid_out_13),
             .tstrb(8'd0),
             .tkeep(8'd0),
             .tid(8'd0),
             .tdest(8'd0),
             .tuser(8'd0),
             .tlast(1'd0)
         );
traffic_processor tp_13(
 	        .clk(clk),
	        .reset(reset),
	        .tdata_in(si_data_out_13),
	        .tvalid_in(si_valid_out_13),
	        .tdata_out(tp_data_out_13),
	        .tvalid_out(tp_valid_out_13)
        );
noc_router_adapter_block noc_router_adapter_block_14 (
             .clk(clk),
             .reset(reset),
             .master_tready(si_ready_14),
             .master_tdata(si_data_in_14),
             .master_tvalid(si_valid_in_14),
             .master_tstrb(),
             .master_tkeep(),
             .master_tid(),
             .master_tdest(),
             .master_tuser(),
             .master_tlast(),
             .slave_tvalid(1'd0),
             .slave_tready(), 
             .slave_tdata(32'd0),
             .slave_tstrb(8'd0),
             .slave_tkeep(8'd0),
             .slave_tid(8'd0),
             .slave_tdest(8'd0),
             .slave_tuser(8'd0),
             .slave_tlast(1'd0)
         );
slave_interface si_14(
             .clk(clk),
             .reset(reset),
             .tvalid_in(si_valid_in_14),
             .tdata_in(si_data_in_14),
             .tready(si_ready_14),
             .tdata_out(si_data_out_14),
             .tvalid_out(si_valid_out_14),
             .tstrb(8'd0),
             .tkeep(8'd0),
             .tid(8'd0),
             .tdest(8'd0),
             .tuser(8'd0),
             .tlast(1'd0)
         );
traffic_processor tp_14(
 	        .clk(clk),
	        .reset(reset),
	        .tdata_in(si_data_out_14),
	        .tvalid_in(si_valid_out_14),
	        .tdata_out(tp_data_out_14),
	        .tvalid_out(tp_valid_out_14)
        );
noc_router_adapter_block noc_router_adapter_block_15 (
             .clk(clk),
             .reset(reset),
             .master_tready(si_ready_15),
             .master_tdata(si_data_in_15),
             .master_tvalid(si_valid_in_15),
             .master_tstrb(),
             .master_tkeep(),
             .master_tid(),
             .master_tdest(),
             .master_tuser(),
             .master_tlast(),
             .slave_tvalid(1'd0),
             .slave_tready(), 
             .slave_tdata(32'd0),
             .slave_tstrb(8'd0),
             .slave_tkeep(8'd0),
             .slave_tid(8'd0),
             .slave_tdest(8'd0),
             .slave_tuser(8'd0),
             .slave_tlast(1'd0)
         );
slave_interface si_15(
             .clk(clk),
             .reset(reset),
             .tvalid_in(si_valid_in_15),
             .tdata_in(si_data_in_15),
             .tready(si_ready_15),
             .tdata_out(si_data_out_15),
             .tvalid_out(si_valid_out_15),
             .tstrb(8'd0),
             .tkeep(8'd0),
             .tid(8'd0),
             .tdest(8'd0),
             .tuser(8'd0),
             .tlast(1'd0)
         );
traffic_processor tp_15(
 	        .clk(clk),
	        .reset(reset),
	        .tdata_in(si_data_out_15),
	        .tvalid_in(si_valid_out_15),
	        .tdata_out(tp_data_out_15),
	        .tvalid_out(tp_valid_out_15)
        );
noc_router_adapter_block noc_router_adapter_block_16 (
             .clk(clk),
             .reset(reset),
             .master_tready(si_ready_16),
             .master_tdata(si_data_in_16),
             .master_tvalid(si_valid_in_16),
             .master_tstrb(),
             .master_tkeep(),
             .master_tid(),
             .master_tdest(),
             .master_tuser(),
             .master_tlast(),
             .slave_tvalid(1'd0),
             .slave_tready(), 
             .slave_tdata(32'd0),
             .slave_tstrb(8'd0),
             .slave_tkeep(8'd0),
             .slave_tid(8'd0),
             .slave_tdest(8'd0),
             .slave_tuser(8'd0),
             .slave_tlast(1'd0)
         );
slave_interface si_16(
             .clk(clk),
             .reset(reset),
             .tvalid_in(si_valid_in_16),
             .tdata_in(si_data_in_16),
             .tready(si_ready_16),
             .tdata_out(si_data_out_16),
             .tvalid_out(si_valid_out_16),
             .tstrb(8'd0),
             .tkeep(8'd0),
             .tid(8'd0),
             .tdest(8'd0),
             .tuser(8'd0),
             .tlast(1'd0)
         );
traffic_processor tp_16(
 	        .clk(clk),
	        .reset(reset),
	        .tdata_in(si_data_out_16),
	        .tvalid_in(si_valid_out_16),
	        .tdata_out(tp_data_out_16),
	        .tvalid_out(tp_valid_out_16)
        );
noc_router_adapter_block noc_router_adapter_block_17 (
             .clk(clk),
             .reset(reset),
             .master_tready(si_ready_17),
             .master_tdata(si_data_in_17),
             .master_tvalid(si_valid_in_17),
             .master_tstrb(),
             .master_tkeep(),
             .master_tid(),
             .master_tdest(),
             .master_tuser(),
             .master_tlast(),
             .slave_tvalid(1'd0),
             .slave_tready(), 
             .slave_tdata(32'd0),
             .slave_tstrb(8'd0),
             .slave_tkeep(8'd0),
             .slave_tid(8'd0),
             .slave_tdest(8'd0),
             .slave_tuser(8'd0),
             .slave_tlast(1'd0)
         );
slave_interface si_17(
             .clk(clk),
             .reset(reset),
             .tvalid_in(si_valid_in_17),
             .tdata_in(si_data_in_17),
             .tready(si_ready_17),
             .tdata_out(si_data_out_17),
             .tvalid_out(si_valid_out_17),
             .tstrb(8'd0),
             .tkeep(8'd0),
             .tid(8'd0),
             .tdest(8'd0),
             .tuser(8'd0),
             .tlast(1'd0)
         );
traffic_processor tp_17(
 	        .clk(clk),
	        .reset(reset),
	        .tdata_in(si_data_out_17),
	        .tvalid_in(si_valid_out_17),
	        .tdata_out(tp_data_out_17),
	        .tvalid_out(tp_valid_out_17)
        );
noc_router_adapter_block noc_router_adapter_block_18 (
             .clk(clk),
             .reset(reset),
             .master_tready(si_ready_18),
             .master_tdata(si_data_in_18),
             .master_tvalid(si_valid_in_18),
             .master_tstrb(),
             .master_tkeep(),
             .master_tid(),
             .master_tdest(),
             .master_tuser(),
             .master_tlast(),
             .slave_tvalid(1'd0),
             .slave_tready(), 
             .slave_tdata(32'd0),
             .slave_tstrb(8'd0),
             .slave_tkeep(8'd0),
             .slave_tid(8'd0),
             .slave_tdest(8'd0),
             .slave_tuser(8'd0),
             .slave_tlast(1'd0)
         );
slave_interface si_18(
             .clk(clk),
             .reset(reset),
             .tvalid_in(si_valid_in_18),
             .tdata_in(si_data_in_18),
             .tready(si_ready_18),
             .tdata_out(si_data_out_18),
             .tvalid_out(si_valid_out_18),
             .tstrb(8'd0),
             .tkeep(8'd0),
             .tid(8'd0),
             .tdest(8'd0),
             .tuser(8'd0),
             .tlast(1'd0)
         );
traffic_processor tp_18(
 	        .clk(clk),
	        .reset(reset),
	        .tdata_in(si_data_out_18),
	        .tvalid_in(si_valid_out_18),
	        .tdata_out(tp_data_out_18),
	        .tvalid_out(tp_valid_out_18)
        );
noc_router_adapter_block noc_router_adapter_block_19 (
             .clk(clk),
             .reset(reset),
             .master_tready(si_ready_19),
             .master_tdata(si_data_in_19),
             .master_tvalid(si_valid_in_19),
             .master_tstrb(),
             .master_tkeep(),
             .master_tid(),
             .master_tdest(),
             .master_tuser(),
             .master_tlast(),
             .slave_tvalid(1'd0),
             .slave_tready(), 
             .slave_tdata(32'd0),
             .slave_tstrb(8'd0),
             .slave_tkeep(8'd0),
             .slave_tid(8'd0),
             .slave_tdest(8'd0),
             .slave_tuser(8'd0),
             .slave_tlast(1'd0)
         );
slave_interface si_19(
             .clk(clk),
             .reset(reset),
             .tvalid_in(si_valid_in_19),
             .tdata_in(si_data_in_19),
             .tready(si_ready_19),
             .tdata_out(si_data_out_19),
             .tvalid_out(si_valid_out_19),
             .tstrb(8'd0),
             .tkeep(8'd0),
             .tid(8'd0),
             .tdest(8'd0),
             .tuser(8'd0),
             .tlast(1'd0)
         );
traffic_processor tp_19(
 	        .clk(clk),
	        .reset(reset),
	        .tdata_in(si_data_out_19),
	        .tvalid_in(si_valid_out_19),
	        .tdata_out(tp_data_out_19),
	        .tvalid_out(tp_valid_out_19)
        );
noc_router_adapter_block noc_router_adapter_block_20 (
             .clk(clk),
             .reset(reset),
             .master_tready(si_ready_20),
             .master_tdata(si_data_in_20),
             .master_tvalid(si_valid_in_20),
             .master_tstrb(),
             .master_tkeep(),
             .master_tid(),
             .master_tdest(),
             .master_tuser(),
             .master_tlast(),
             .slave_tvalid(1'd0),
             .slave_tready(), 
             .slave_tdata(32'd0),
             .slave_tstrb(8'd0),
             .slave_tkeep(8'd0),
             .slave_tid(8'd0),
             .slave_tdest(8'd0),
             .slave_tuser(8'd0),
             .slave_tlast(1'd0)
         );
slave_interface si_20(
             .clk(clk),
             .reset(reset),
             .tvalid_in(si_valid_in_20),
             .tdata_in(si_data_in_20),
             .tready(si_ready_20),
             .tdata_out(si_data_out_20),
             .tvalid_out(si_valid_out_20),
             .tstrb(8'd0),
             .tkeep(8'd0),
             .tid(8'd0),
             .tdest(8'd0),
             .tuser(8'd0),
             .tlast(1'd0)
         );
traffic_processor tp_20(
 	        .clk(clk),
	        .reset(reset),
	        .tdata_in(si_data_out_20),
	        .tvalid_in(si_valid_out_20),
	        .tdata_out(tp_data_out_20),
	        .tvalid_out(tp_valid_out_20)
        );
noc_router_adapter_block noc_router_adapter_block_21 (
             .clk(clk),
             .reset(reset),
             .master_tready(si_ready_21),
             .master_tdata(si_data_in_21),
             .master_tvalid(si_valid_in_21),
             .master_tstrb(),
             .master_tkeep(),
             .master_tid(),
             .master_tdest(),
             .master_tuser(),
             .master_tlast(),
             .slave_tvalid(1'd0),
             .slave_tready(), 
             .slave_tdata(32'd0),
             .slave_tstrb(8'd0),
             .slave_tkeep(8'd0),
             .slave_tid(8'd0),
             .slave_tdest(8'd0),
             .slave_tuser(8'd0),
             .slave_tlast(1'd0)
         );
slave_interface si_21(
             .clk(clk),
             .reset(reset),
             .tvalid_in(si_valid_in_21),
             .tdata_in(si_data_in_21),
             .tready(si_ready_21),
             .tdata_out(si_data_out_21),
             .tvalid_out(si_valid_out_21),
             .tstrb(8'd0),
             .tkeep(8'd0),
             .tid(8'd0),
             .tdest(8'd0),
             .tuser(8'd0),
             .tlast(1'd0)
         );
traffic_processor tp_21(
 	        .clk(clk),
	        .reset(reset),
	        .tdata_in(si_data_out_21),
	        .tvalid_in(si_valid_out_21),
	        .tdata_out(tp_data_out_21),
	        .tvalid_out(tp_valid_out_21)
        );
noc_router_adapter_block noc_router_adapter_block_22 (
             .clk(clk),
             .reset(reset),
             .master_tready(si_ready_22),
             .master_tdata(si_data_in_22),
             .master_tvalid(si_valid_in_22),
             .master_tstrb(),
             .master_tkeep(),
             .master_tid(),
             .master_tdest(),
             .master_tuser(),
             .master_tlast(),
             .slave_tvalid(1'd0),
             .slave_tready(), 
             .slave_tdata(32'd0),
             .slave_tstrb(8'd0),
             .slave_tkeep(8'd0),
             .slave_tid(8'd0),
             .slave_tdest(8'd0),
             .slave_tuser(8'd0),
             .slave_tlast(1'd0)
         );
slave_interface si_22(
             .clk(clk),
             .reset(reset),
             .tvalid_in(si_valid_in_22),
             .tdata_in(si_data_in_22),
             .tready(si_ready_22),
             .tdata_out(si_data_out_22),
             .tvalid_out(si_valid_out_22),
             .tstrb(8'd0),
             .tkeep(8'd0),
             .tid(8'd0),
             .tdest(8'd0),
             .tuser(8'd0),
             .tlast(1'd0)
         );
traffic_processor tp_22(
 	        .clk(clk),
	        .reset(reset),
	        .tdata_in(si_data_out_22),
	        .tvalid_in(si_valid_out_22),
	        .tdata_out(tp_data_out_22),
	        .tvalid_out(tp_valid_out_22)
        );
noc_router_adapter_block noc_router_adapter_block_23 (
             .clk(clk),
             .reset(reset),
             .master_tready(si_ready_23),
             .master_tdata(si_data_in_23),
             .master_tvalid(si_valid_in_23),
             .master_tstrb(),
             .master_tkeep(),
             .master_tid(),
             .master_tdest(),
             .master_tuser(),
             .master_tlast(),
             .slave_tvalid(1'd0),
             .slave_tready(), 
             .slave_tdata(32'd0),
             .slave_tstrb(8'd0),
             .slave_tkeep(8'd0),
             .slave_tid(8'd0),
             .slave_tdest(8'd0),
             .slave_tuser(8'd0),
             .slave_tlast(1'd0)
         );
slave_interface si_23(
             .clk(clk),
             .reset(reset),
             .tvalid_in(si_valid_in_23),
             .tdata_in(si_data_in_23),
             .tready(si_ready_23),
             .tdata_out(si_data_out_23),
             .tvalid_out(si_valid_out_23),
             .tstrb(8'd0),
             .tkeep(8'd0),
             .tid(8'd0),
             .tdest(8'd0),
             .tuser(8'd0),
             .tlast(1'd0)
         );
traffic_processor tp_23(
 	        .clk(clk),
	        .reset(reset),
	        .tdata_in(si_data_out_23),
	        .tvalid_in(si_valid_out_23),
	        .tdata_out(tp_data_out_23),
	        .tvalid_out(tp_valid_out_23)
        );
noc_router_adapter_block noc_router_adapter_block_24 (
             .clk(clk),
             .reset(reset),
             .master_tready(si_ready_24),
             .master_tdata(si_data_in_24),
             .master_tvalid(si_valid_in_24),
             .master_tstrb(),
             .master_tkeep(),
             .master_tid(),
             .master_tdest(),
             .master_tuser(),
             .master_tlast(),
             .slave_tvalid(1'd0),
             .slave_tready(), 
             .slave_tdata(32'd0),
             .slave_tstrb(8'd0),
             .slave_tkeep(8'd0),
             .slave_tid(8'd0),
             .slave_tdest(8'd0),
             .slave_tuser(8'd0),
             .slave_tlast(1'd0)
         );
slave_interface si_24(
             .clk(clk),
             .reset(reset),
             .tvalid_in(si_valid_in_24),
             .tdata_in(si_data_in_24),
             .tready(si_ready_24),
             .tdata_out(si_data_out_24),
             .tvalid_out(si_valid_out_24),
             .tstrb(8'd0),
             .tkeep(8'd0),
             .tid(8'd0),
             .tdest(8'd0),
             .tuser(8'd0),
             .tlast(1'd0)
         );
traffic_processor tp_24(
 	        .clk(clk),
	        .reset(reset),
	        .tdata_in(si_data_out_24),
	        .tvalid_in(si_valid_out_24),
	        .tdata_out(tp_data_out_24),
	        .tvalid_out(tp_valid_out_24)
        );
noc_router_adapter_block noc_router_adapter_block_25 (
             .clk(clk),
             .reset(reset),
             .master_tready(si_ready_25),
             .master_tdata(si_data_in_25),
             .master_tvalid(si_valid_in_25),
             .master_tstrb(),
             .master_tkeep(),
             .master_tid(),
             .master_tdest(),
             .master_tuser(),
             .master_tlast(),
             .slave_tvalid(1'd0),
             .slave_tready(), 
             .slave_tdata(32'd0),
             .slave_tstrb(8'd0),
             .slave_tkeep(8'd0),
             .slave_tid(8'd0),
             .slave_tdest(8'd0),
             .slave_tuser(8'd0),
             .slave_tlast(1'd0)
         );
slave_interface si_25(
             .clk(clk),
             .reset(reset),
             .tvalid_in(si_valid_in_25),
             .tdata_in(si_data_in_25),
             .tready(si_ready_25),
             .tdata_out(si_data_out_25),
             .tvalid_out(si_valid_out_25),
             .tstrb(8'd0),
             .tkeep(8'd0),
             .tid(8'd0),
             .tdest(8'd0),
             .tuser(8'd0),
             .tlast(1'd0)
         );
traffic_processor tp_25(
 	        .clk(clk),
	        .reset(reset),
	        .tdata_in(si_data_out_25),
	        .tvalid_in(si_valid_out_25),
	        .tdata_out(tp_data_out_25),
	        .tvalid_out(tp_valid_out_25)
        );
noc_router_adapter_block noc_router_adapter_block_26 (
             .clk(clk),
             .reset(reset),
             .master_tready(si_ready_26),
             .master_tdata(si_data_in_26),
             .master_tvalid(si_valid_in_26),
             .master_tstrb(),
             .master_tkeep(),
             .master_tid(),
             .master_tdest(),
             .master_tuser(),
             .master_tlast(),
             .slave_tvalid(1'd0),
             .slave_tready(), 
             .slave_tdata(32'd0),
             .slave_tstrb(8'd0),
             .slave_tkeep(8'd0),
             .slave_tid(8'd0),
             .slave_tdest(8'd0),
             .slave_tuser(8'd0),
             .slave_tlast(1'd0)
         );
slave_interface si_26(
             .clk(clk),
             .reset(reset),
             .tvalid_in(si_valid_in_26),
             .tdata_in(si_data_in_26),
             .tready(si_ready_26),
             .tdata_out(si_data_out_26),
             .tvalid_out(si_valid_out_26),
             .tstrb(8'd0),
             .tkeep(8'd0),
             .tid(8'd0),
             .tdest(8'd0),
             .tuser(8'd0),
             .tlast(1'd0)
         );
traffic_processor tp_26(
 	        .clk(clk),
	        .reset(reset),
	        .tdata_in(si_data_out_26),
	        .tvalid_in(si_valid_out_26),
	        .tdata_out(tp_data_out_26),
	        .tvalid_out(tp_valid_out_26)
        );
noc_router_adapter_block noc_router_adapter_block_27 (
             .clk(clk),
             .reset(reset),
             .master_tready(si_ready_27),
             .master_tdata(si_data_in_27),
             .master_tvalid(si_valid_in_27),
             .master_tstrb(),
             .master_tkeep(),
             .master_tid(),
             .master_tdest(),
             .master_tuser(),
             .master_tlast(),
             .slave_tvalid(1'd0),
             .slave_tready(), 
             .slave_tdata(32'd0),
             .slave_tstrb(8'd0),
             .slave_tkeep(8'd0),
             .slave_tid(8'd0),
             .slave_tdest(8'd0),
             .slave_tuser(8'd0),
             .slave_tlast(1'd0)
         );
slave_interface si_27(
             .clk(clk),
             .reset(reset),
             .tvalid_in(si_valid_in_27),
             .tdata_in(si_data_in_27),
             .tready(si_ready_27),
             .tdata_out(si_data_out_27),
             .tvalid_out(si_valid_out_27),
             .tstrb(8'd0),
             .tkeep(8'd0),
             .tid(8'd0),
             .tdest(8'd0),
             .tuser(8'd0),
             .tlast(1'd0)
         );
traffic_processor tp_27(
 	        .clk(clk),
	        .reset(reset),
	        .tdata_in(si_data_out_27),
	        .tvalid_in(si_valid_out_27),
	        .tdata_out(tp_data_out_27),
	        .tvalid_out(tp_valid_out_27)
        );
noc_router_adapter_block noc_router_adapter_block_28 (
             .clk(clk),
             .reset(reset),
             .master_tready(si_ready_28),
             .master_tdata(si_data_in_28),
             .master_tvalid(si_valid_in_28),
             .master_tstrb(),
             .master_tkeep(),
             .master_tid(),
             .master_tdest(),
             .master_tuser(),
             .master_tlast(),
             .slave_tvalid(1'd0),
             .slave_tready(), 
             .slave_tdata(32'd0),
             .slave_tstrb(8'd0),
             .slave_tkeep(8'd0),
             .slave_tid(8'd0),
             .slave_tdest(8'd0),
             .slave_tuser(8'd0),
             .slave_tlast(1'd0)
         );
slave_interface si_28(
             .clk(clk),
             .reset(reset),
             .tvalid_in(si_valid_in_28),
             .tdata_in(si_data_in_28),
             .tready(si_ready_28),
             .tdata_out(si_data_out_28),
             .tvalid_out(si_valid_out_28),
             .tstrb(8'd0),
             .tkeep(8'd0),
             .tid(8'd0),
             .tdest(8'd0),
             .tuser(8'd0),
             .tlast(1'd0)
         );
traffic_processor tp_28(
 	        .clk(clk),
	        .reset(reset),
	        .tdata_in(si_data_out_28),
	        .tvalid_in(si_valid_out_28),
	        .tdata_out(tp_data_out_28),
	        .tvalid_out(tp_valid_out_28)
        );
noc_router_adapter_block noc_router_adapter_block_29 (
             .clk(clk),
             .reset(reset),
             .master_tready(si_ready_29),
             .master_tdata(si_data_in_29),
             .master_tvalid(si_valid_in_29),
             .master_tstrb(),
             .master_tkeep(),
             .master_tid(),
             .master_tdest(),
             .master_tuser(),
             .master_tlast(),
             .slave_tvalid(1'd0),
             .slave_tready(), 
             .slave_tdata(32'd0),
             .slave_tstrb(8'd0),
             .slave_tkeep(8'd0),
             .slave_tid(8'd0),
             .slave_tdest(8'd0),
             .slave_tuser(8'd0),
             .slave_tlast(1'd0)
         );
slave_interface si_29(
             .clk(clk),
             .reset(reset),
             .tvalid_in(si_valid_in_29),
             .tdata_in(si_data_in_29),
             .tready(si_ready_29),
             .tdata_out(si_data_out_29),
             .tvalid_out(si_valid_out_29),
             .tstrb(8'd0),
             .tkeep(8'd0),
             .tid(8'd0),
             .tdest(8'd0),
             .tuser(8'd0),
             .tlast(1'd0)
         );
traffic_processor tp_29(
 	        .clk(clk),
	        .reset(reset),
	        .tdata_in(si_data_out_29),
	        .tvalid_in(si_valid_out_29),
	        .tdata_out(tp_data_out_29),
	        .tvalid_out(tp_valid_out_29)
        );
noc_router_adapter_block noc_router_adapter_block_30 (
             .clk(clk),
             .reset(reset),
             .master_tready(si_ready_30),
             .master_tdata(si_data_in_30),
             .master_tvalid(si_valid_in_30),
             .master_tstrb(),
             .master_tkeep(),
             .master_tid(),
             .master_tdest(),
             .master_tuser(),
             .master_tlast(),
             .slave_tvalid(1'd0),
             .slave_tready(), 
             .slave_tdata(32'd0),
             .slave_tstrb(8'd0),
             .slave_tkeep(8'd0),
             .slave_tid(8'd0),
             .slave_tdest(8'd0),
             .slave_tuser(8'd0),
             .slave_tlast(1'd0)
         );
slave_interface si_30(
             .clk(clk),
             .reset(reset),
             .tvalid_in(si_valid_in_30),
             .tdata_in(si_data_in_30),
             .tready(si_ready_30),
             .tdata_out(si_data_out_30),
             .tvalid_out(si_valid_out_30),
             .tstrb(8'd0),
             .tkeep(8'd0),
             .tid(8'd0),
             .tdest(8'd0),
             .tuser(8'd0),
             .tlast(1'd0)
         );
traffic_processor tp_30(
 	        .clk(clk),
	        .reset(reset),
	        .tdata_in(si_data_out_30),
	        .tvalid_in(si_valid_out_30),
	        .tdata_out(tp_data_out_30),
	        .tvalid_out(tp_valid_out_30)
        );
noc_router_adapter_block noc_router_adapter_block_31 (
             .clk(clk),
             .reset(reset),
             .master_tready(si_ready_31),
             .master_tdata(si_data_in_31),
             .master_tvalid(si_valid_in_31),
             .master_tstrb(),
             .master_tkeep(),
             .master_tid(),
             .master_tdest(),
             .master_tuser(),
             .master_tlast(),
             .slave_tvalid(1'd0),
             .slave_tready(), 
             .slave_tdata(32'd0),
             .slave_tstrb(8'd0),
             .slave_tkeep(8'd0),
             .slave_tid(8'd0),
             .slave_tdest(8'd0),
             .slave_tuser(8'd0),
             .slave_tlast(1'd0)
         );
slave_interface si_31(
             .clk(clk),
             .reset(reset),
             .tvalid_in(si_valid_in_31),
             .tdata_in(si_data_in_31),
             .tready(si_ready_31),
             .tdata_out(si_data_out_31),
             .tvalid_out(si_valid_out_31),
             .tstrb(8'd0),
             .tkeep(8'd0),
             .tid(8'd0),
             .tdest(8'd0),
             .tuser(8'd0),
             .tlast(1'd0)
         );
traffic_processor tp_31(
 	        .clk(clk),
	        .reset(reset),
	        .tdata_in(si_data_out_31),
	        .tvalid_in(si_valid_out_31),
	        .tdata_out(tp_data_out_31),
	        .tvalid_out(tp_valid_out_31)
        );
noc_router_adapter_block noc_router_adapter_block_32 (
             .clk(clk),
             .reset(reset),
             .master_tready(si_ready_32),
             .master_tdata(si_data_in_32),
             .master_tvalid(si_valid_in_32),
             .master_tstrb(),
             .master_tkeep(),
             .master_tid(),
             .master_tdest(),
             .master_tuser(),
             .master_tlast(),
             .slave_tvalid(1'd0),
             .slave_tready(), 
             .slave_tdata(32'd0),
             .slave_tstrb(8'd0),
             .slave_tkeep(8'd0),
             .slave_tid(8'd0),
             .slave_tdest(8'd0),
             .slave_tuser(8'd0),
             .slave_tlast(1'd0)
         );
slave_interface si_32(
             .clk(clk),
             .reset(reset),
             .tvalid_in(si_valid_in_32),
             .tdata_in(si_data_in_32),
             .tready(si_ready_32),
             .tdata_out(si_data_out_32),
             .tvalid_out(si_valid_out_32),
             .tstrb(8'd0),
             .tkeep(8'd0),
             .tid(8'd0),
             .tdest(8'd0),
             .tuser(8'd0),
             .tlast(1'd0)
         );
traffic_processor tp_32(
 	        .clk(clk),
	        .reset(reset),
	        .tdata_in(si_data_out_32),
	        .tvalid_in(si_valid_out_32),
	        .tdata_out(tp_data_out_32),
	        .tvalid_out(tp_valid_out_32)
        );


/*******************Output Logic***************************/
assign data_out = tp_data_out_32;




endmodule