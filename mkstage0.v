//
// Generated by Bluespec Compiler, version 2021.07-3-g8227dc97 (build 8227dc97)
//
// On Fri Sep  3 12:09:29 PDT 2021
//
//
// Ports:
// Name                         I/O  size props
// RDY_ma_update_eEpoch           O     1 const
// RDY_ma_update_wEpoch           O     1 const
// RDY_ma_flush                   O     1
// RDY_ma_train_bpu               O     1
// RDY_ma_mispredict              O     1
// RDY_ma_bpu_enable              O     1 const
// to_icache_get                  O    35
// RDY_to_icache_get              O     1
// tx_to_stage1_enq_ena           O     1
// tx_to_stage1_enq_data          O    45
// resetpc                        I    32
// CLK                            I     1 clock
// RST_N                          I     1 reset
// ma_flush_fl                    I    33
// ma_train_bpu_td                I    78
// ma_mispredict_g                I     9
// ma_bpu_enable_e                I     1
// tx_to_stage1_notFull_b         I     1
// tx_to_stage1_enq_rdy_b         I     1
// EN_ma_update_eEpoch            I     1
// EN_ma_update_wEpoch            I     1
// EN_ma_flush                    I     1
// EN_ma_train_bpu                I     1
// EN_ma_mispredict               I     1
// EN_ma_bpu_enable               I     1
// EN_to_icache_get               I     1
//
// Combinational paths from inputs to outputs:
//   (ma_bpu_enable_e, EN_ma_bpu_enable) -> RDY_ma_train_bpu
//   (ma_bpu_enable_e,
//    tx_to_stage1_notFull_b,
//    tx_to_stage1_enq_rdy_b,
//    EN_ma_train_bpu,
//    EN_ma_bpu_enable) -> RDY_to_icache_get
//   (ma_bpu_enable_e,
//    tx_to_stage1_notFull_b,
//    tx_to_stage1_enq_rdy_b,
//    EN_ma_train_bpu,
//    EN_ma_bpu_enable) -> tx_to_stage1_enq_ena
//   (ma_bpu_enable_e,
//    tx_to_stage1_notFull_b,
//    tx_to_stage1_enq_rdy_b,
//    EN_ma_train_bpu,
//    EN_ma_bpu_enable) -> tx_to_stage1_enq_data
//   (ma_bpu_enable_e,
//    tx_to_stage1_notFull_b,
//    tx_to_stage1_enq_rdy_b,
//    EN_ma_train_bpu,
//    EN_ma_bpu_enable) -> to_icache_get
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
  `define BSV_ASSIGNMENT_DELAY
`endif

`ifdef BSV_POSITIVE_RESET
  `define BSV_RESET_VALUE 1'b1
  `define BSV_RESET_EDGE posedge
`else
  `define BSV_RESET_VALUE 1'b0
  `define BSV_RESET_EDGE negedge
`endif

module mkstage0(resetpc,
		CLK,
		RST_N,

		EN_ma_update_eEpoch,
		RDY_ma_update_eEpoch,

		EN_ma_update_wEpoch,
		RDY_ma_update_wEpoch,

		ma_flush_fl,
		EN_ma_flush,
		RDY_ma_flush,

		ma_train_bpu_td,
		EN_ma_train_bpu,
		RDY_ma_train_bpu,

		ma_mispredict_g,
		EN_ma_mispredict,
		RDY_ma_mispredict,

		ma_bpu_enable_e,
		EN_ma_bpu_enable,
		RDY_ma_bpu_enable,

		EN_to_icache_get,
		to_icache_get,
		RDY_to_icache_get,

		tx_to_stage1_notFull_b,

		tx_to_stage1_enq_rdy_b,

		tx_to_stage1_enq_ena,

		tx_to_stage1_enq_data);
  parameter [31 : 0] hartid = 32'b0;
  input  [31 : 0] resetpc;
  input  CLK;
  input  RST_N;

  // action method ma_update_eEpoch
  input  EN_ma_update_eEpoch;
  output RDY_ma_update_eEpoch;

  // action method ma_update_wEpoch
  input  EN_ma_update_wEpoch;
  output RDY_ma_update_wEpoch;

  // action method ma_flush
  input  [32 : 0] ma_flush_fl;
  input  EN_ma_flush;
  output RDY_ma_flush;

  // action method ma_train_bpu
  input  [77 : 0] ma_train_bpu_td;
  input  EN_ma_train_bpu;
  output RDY_ma_train_bpu;

  // action method ma_mispredict
  input  [8 : 0] ma_mispredict_g;
  input  EN_ma_mispredict;
  output RDY_ma_mispredict;

  // action method ma_bpu_enable
  input  ma_bpu_enable_e;
  input  EN_ma_bpu_enable;
  output RDY_ma_bpu_enable;

  // actionvalue method to_icache_get
  input  EN_to_icache_get;
  output [34 : 0] to_icache_get;
  output RDY_to_icache_get;

  // action method tx_to_stage1_notFull
  input  tx_to_stage1_notFull_b;

  // action method tx_to_stage1_enq_rdy
  input  tx_to_stage1_enq_rdy_b;

  // value method tx_to_stage1_enq_ena
  output tx_to_stage1_enq_ena;

  // value method tx_to_stage1_enq_data
  output [44 : 0] tx_to_stage1_enq_data;

  // signals for module outputs
  wire [44 : 0] tx_to_stage1_enq_data;
  wire [34 : 0] to_icache_get;
  wire RDY_ma_bpu_enable,
       RDY_ma_flush,
       RDY_ma_mispredict,
       RDY_ma_train_bpu,
       RDY_ma_update_eEpoch,
       RDY_ma_update_wEpoch,
       RDY_to_icache_get,
       tx_to_stage1_enq_ena;

  // inlined wires
  wire [35 : 0] ff_to_cache_rv_port0__write_1,
		ff_to_cache_rv_port1__read,
		ff_to_cache_rv_port1__write_1,
		ff_to_cache_rv_port2__read;
  wire [32 : 0] rg_delayed_redirect_port0__write_1,
		rg_delayed_redirect_port1__read,
		rg_delayed_redirect_port1__write_1,
		rg_delayed_redirect_port2__read;
  wire [31 : 0] rg_pc_port1__read, rg_pc_port1__write_1, rg_pc_port2__read;
  wire rg_delayed_redirect_EN_port0__write,
       rg_fence_EN_port0__write,
       rg_fence_port1__read,
       rg_fence_port2__read,
       rg_pc_EN_port0__write,
       rg_pc_EN_port1__write,
       tx_tostage1_w_ena_whas;

  // register ff_to_cache_rv
  reg [35 : 0] ff_to_cache_rv;
  wire [35 : 0] ff_to_cache_rv_D_IN;
  wire ff_to_cache_rv_EN;

  // register rg_delayed_redirect
  reg [32 : 0] rg_delayed_redirect;
  wire [32 : 0] rg_delayed_redirect_D_IN;
  wire rg_delayed_redirect_EN;

  // register rg_eEpoch
  reg rg_eEpoch;
  wire rg_eEpoch_D_IN, rg_eEpoch_EN;

  // register rg_fence
  reg rg_fence;
  wire rg_fence_D_IN, rg_fence_EN;

  // register rg_initialize
  reg rg_initialize;
  wire rg_initialize_D_IN, rg_initialize_EN;

  // register rg_pc
  reg [31 : 0] rg_pc;
  wire [31 : 0] rg_pc_D_IN;
  wire rg_pc_EN;

  // register rg_wEpoch
  reg rg_wEpoch;
  wire rg_wEpoch_D_IN, rg_wEpoch_EN;

  // ports of submodule bpu
  wire [77 : 0] bpu_ma_train_bpu_td;
  wire [44 : 0] bpu_mav_prediction_response;
  wire [33 : 0] bpu_mav_prediction_response_r;
  wire [8 : 0] bpu_ma_mispredict_g;
  wire bpu_EN_ma_bpu_enable,
       bpu_EN_ma_mispredict,
       bpu_EN_ma_train_bpu,
       bpu_EN_mav_prediction_response,
       bpu_RDY_ma_mispredict,
       bpu_RDY_ma_train_bpu,
       bpu_RDY_mav_prediction_response,
       bpu_ma_bpu_enable_e;

  // rule scheduling signals
  wire CAN_FIRE_RL_rl_gen_next_pc,
       CAN_FIRE_RL_rl_initialize,
       CAN_FIRE_ma_bpu_enable,
       CAN_FIRE_ma_flush,
       CAN_FIRE_ma_mispredict,
       CAN_FIRE_ma_train_bpu,
       CAN_FIRE_ma_update_eEpoch,
       CAN_FIRE_ma_update_wEpoch,
       CAN_FIRE_to_icache_get,
       CAN_FIRE_tx_to_stage1_enq_rdy,
       CAN_FIRE_tx_to_stage1_notFull,
       WILL_FIRE_RL_rl_gen_next_pc,
       WILL_FIRE_RL_rl_initialize,
       WILL_FIRE_ma_bpu_enable,
       WILL_FIRE_ma_flush,
       WILL_FIRE_ma_mispredict,
       WILL_FIRE_ma_train_bpu,
       WILL_FIRE_ma_update_eEpoch,
       WILL_FIRE_ma_update_wEpoch,
       WILL_FIRE_to_icache_get,
       WILL_FIRE_tx_to_stage1_enq_rdy,
       WILL_FIRE_tx_to_stage1_notFull;

  // declarations used by system tasks
  // synopsys translate_off
  reg TASK_testplusargs___d13;
  reg TASK_testplusargs___d14;
  reg TASK_testplusargs___d15;
  reg [63 : 0] v__h1299;
  reg TASK_testplusargs___d43;
  reg TASK_testplusargs___d44;
  reg TASK_testplusargs___d45;
  reg [63 : 0] v__h1809;
  reg TASK_testplusargs___d59;
  reg TASK_testplusargs___d60;
  reg TASK_testplusargs___d61;
  reg [63 : 0] v__h2013;
  reg TASK_testplusargs___d73;
  reg TASK_testplusargs___d74;
  reg TASK_testplusargs___d75;
  reg [63 : 0] v__h2267;
  reg TASK_testplusargs___d86;
  reg TASK_testplusargs___d87;
  reg TASK_testplusargs___d88;
  reg [63 : 0] v__h2651;
  reg TASK_testplusargs___d95;
  reg TASK_testplusargs___d96;
  reg TASK_testplusargs___d97;
  reg [63 : 0] v__h2828;
  reg TASK_testplusargs_3_OR_TASK_testplusargs_4_AND_ETC___d50;
  reg TASK_testplusargs_3_OR_TASK_testplusargs_4_AND_ETC___d52;
  reg TASK_testplusargs_3_OR_TASK_testplusargs_4_AND_ETC___d53;
  reg TASK_testplusargs_3_OR_TASK_testplusargs_4_AND_ETC___d55;
  reg TASK_testplusargs_3_OR_TASK_testplusargs_4_AND_ETC___d57;
  reg TASK_testplusargs_3_OR_TASK_testplusargs_4_AND_ETC___d58;
  reg NOT_rg_fence_port0__read__3_7_AND_TASK_testplu_ETC___d91;
  reg TASK_testplusargs_5_OR_TASK_testplusargs_6_AND_ETC___d103;
  reg TASK_testplusargs_5_OR_TASK_testplusargs_6_AND_ETC___d105;
  // synopsys translate_on

  // remaining internal signals
  wire [31 : 0] nextpc__h1231,
		nextpc__h1946,
		x_address__h2532,
		y_avValue__h1706;
  wire [1 : 0] curr_epoch__h1152;

  // action method ma_update_eEpoch
  assign RDY_ma_update_eEpoch = 1'd1 ;
  assign CAN_FIRE_ma_update_eEpoch = 1'd1 ;
  assign WILL_FIRE_ma_update_eEpoch = EN_ma_update_eEpoch ;

  // action method ma_update_wEpoch
  assign RDY_ma_update_wEpoch = 1'd1 ;
  assign CAN_FIRE_ma_update_wEpoch = 1'd1 ;
  assign WILL_FIRE_ma_update_wEpoch = EN_ma_update_wEpoch ;

  // action method ma_flush
  assign RDY_ma_flush = !rg_initialize ;
  assign CAN_FIRE_ma_flush = !rg_initialize ;
  assign WILL_FIRE_ma_flush = EN_ma_flush ;

  // action method ma_train_bpu
  assign RDY_ma_train_bpu = bpu_RDY_ma_train_bpu ;
  assign CAN_FIRE_ma_train_bpu = bpu_RDY_ma_train_bpu ;
  assign WILL_FIRE_ma_train_bpu = EN_ma_train_bpu ;

  // action method ma_mispredict
  assign RDY_ma_mispredict = bpu_RDY_ma_mispredict ;
  assign CAN_FIRE_ma_mispredict = bpu_RDY_ma_mispredict ;
  assign WILL_FIRE_ma_mispredict = EN_ma_mispredict ;

  // action method ma_bpu_enable
  assign RDY_ma_bpu_enable = 1'd1 ;
  assign CAN_FIRE_ma_bpu_enable = 1'd1 ;
  assign WILL_FIRE_ma_bpu_enable = EN_ma_bpu_enable ;

  // actionvalue method to_icache_get
  assign to_icache_get = ff_to_cache_rv_port1__read[34:0] ;
  assign RDY_to_icache_get = ff_to_cache_rv_port1__read[35] ;
  assign CAN_FIRE_to_icache_get = ff_to_cache_rv_port1__read[35] ;
  assign WILL_FIRE_to_icache_get = EN_to_icache_get ;

  // action method tx_to_stage1_notFull
  assign CAN_FIRE_tx_to_stage1_notFull = 1'd1 ;
  assign WILL_FIRE_tx_to_stage1_notFull = 1'd1 ;

  // action method tx_to_stage1_enq_rdy
  assign CAN_FIRE_tx_to_stage1_enq_rdy = 1'd1 ;
  assign WILL_FIRE_tx_to_stage1_enq_rdy = 1'd1 ;

  // value method tx_to_stage1_enq_ena
  assign tx_to_stage1_enq_ena = tx_tostage1_w_ena_whas ;

  // value method tx_to_stage1_enq_data
  assign tx_to_stage1_enq_data =
	     { x_address__h2532,
	       rg_pc[1],
	       bpu_mav_prediction_response[12:1] } ;

  // submodule bpu
  mkbpu #(.hartid(hartid)) bpu(.CLK(CLK),
			       .RST_N(RST_N),
			       .ma_bpu_enable_e(bpu_ma_bpu_enable_e),
			       .ma_mispredict_g(bpu_ma_mispredict_g),
			       .ma_train_bpu_td(bpu_ma_train_bpu_td),
			       .mav_prediction_response_r(bpu_mav_prediction_response_r),
			       .EN_mav_prediction_response(bpu_EN_mav_prediction_response),
			       .EN_ma_train_bpu(bpu_EN_ma_train_bpu),
			       .EN_ma_mispredict(bpu_EN_ma_mispredict),
			       .EN_ma_bpu_enable(bpu_EN_ma_bpu_enable),
			       .mav_prediction_response(bpu_mav_prediction_response),
			       .RDY_mav_prediction_response(bpu_RDY_mav_prediction_response),
			       .RDY_ma_train_bpu(bpu_RDY_ma_train_bpu),
			       .RDY_ma_mispredict(bpu_RDY_ma_mispredict),
			       .RDY_ma_bpu_enable());

  // rule RL_rl_initialize
  assign CAN_FIRE_RL_rl_initialize = rg_initialize ;
  assign WILL_FIRE_RL_rl_initialize = rg_initialize ;

  // rule RL_rl_gen_next_pc
  assign CAN_FIRE_RL_rl_gen_next_pc =
	     bpu_RDY_mav_prediction_response && !ff_to_cache_rv[35] &&
	     tx_to_stage1_enq_rdy_b &&
	     tx_to_stage1_notFull_b &&
	     !rg_initialize ;
  assign WILL_FIRE_RL_rl_gen_next_pc =
	     CAN_FIRE_RL_rl_gen_next_pc && !EN_ma_train_bpu ;

  // inlined wires
  assign tx_tostage1_w_ena_whas = WILL_FIRE_RL_rl_gen_next_pc && !rg_fence ;
  assign ff_to_cache_rv_port0__write_1 =
	     { 1'd1, x_address__h2532, curr_epoch__h1152, rg_fence } ;
  assign ff_to_cache_rv_port1__read =
	     WILL_FIRE_RL_rl_gen_next_pc ?
	       ff_to_cache_rv_port0__write_1 :
	       ff_to_cache_rv ;
  assign ff_to_cache_rv_port1__write_1 =
	     { 1'd0,
	       35'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx /* unspecified value */  } ;
  assign ff_to_cache_rv_port2__read =
	     EN_to_icache_get ?
	       ff_to_cache_rv_port1__write_1 :
	       ff_to_cache_rv_port1__read ;
  assign rg_pc_EN_port0__write = WILL_FIRE_RL_rl_gen_next_pc && !rg_fence ;
  assign rg_pc_port1__read = rg_pc_EN_port0__write ? nextpc__h1946 : rg_pc ;
  assign rg_pc_EN_port1__write = rg_initialize || EN_ma_flush ;
  assign rg_pc_port1__write_1 = rg_initialize ? resetpc : ma_flush_fl[32:1] ;
  assign rg_pc_port2__read =
	     rg_pc_EN_port1__write ?
	       rg_pc_port1__write_1 :
	       rg_pc_port1__read ;
  assign rg_fence_EN_port0__write = WILL_FIRE_RL_rl_gen_next_pc && rg_fence ;
  assign rg_fence_port1__read = !rg_fence_EN_port0__write && rg_fence ;
  assign rg_fence_port2__read =
	     EN_ma_flush ? ma_flush_fl[0] : rg_fence_port1__read ;
  assign rg_delayed_redirect_EN_port0__write =
	     WILL_FIRE_RL_rl_gen_next_pc &&
	     (rg_delayed_redirect[32] ||
	      bpu_mav_prediction_response[9] &&
	      !bpu_mav_prediction_response[0] &&
	      bpu_mav_prediction_response[12:11] > 2'd1 &&
	      !rg_fence) ;
  assign rg_delayed_redirect_port0__write_1 =
	     { !rg_delayed_redirect[32],
	       bpu_mav_prediction_response[44:13] } ;
  assign rg_delayed_redirect_port1__read =
	     rg_delayed_redirect_EN_port0__write ?
	       rg_delayed_redirect_port0__write_1 :
	       rg_delayed_redirect ;
  assign rg_delayed_redirect_port1__write_1 =
	     { 1'd0,
	       32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx /* unspecified value */  } ;
  assign rg_delayed_redirect_port2__read =
	     EN_ma_flush ?
	       rg_delayed_redirect_port1__write_1 :
	       rg_delayed_redirect_port1__read ;

  // register ff_to_cache_rv
  assign ff_to_cache_rv_D_IN = ff_to_cache_rv_port2__read ;
  assign ff_to_cache_rv_EN = 1'b1 ;

  // register rg_delayed_redirect
  assign rg_delayed_redirect_D_IN = rg_delayed_redirect_port2__read ;
  assign rg_delayed_redirect_EN = 1'b1 ;

  // register rg_eEpoch
  assign rg_eEpoch_D_IN = ~rg_eEpoch ;
  assign rg_eEpoch_EN = EN_ma_update_eEpoch ;

  // register rg_fence
  assign rg_fence_D_IN = rg_fence_port2__read ;
  assign rg_fence_EN = 1'b1 ;

  // register rg_initialize
  assign rg_initialize_D_IN = 1'd0 ;
  assign rg_initialize_EN = rg_initialize ;

  // register rg_pc
  assign rg_pc_D_IN = rg_pc_port2__read ;
  assign rg_pc_EN = 1'b1 ;

  // register rg_wEpoch
  assign rg_wEpoch_D_IN = ~rg_wEpoch ;
  assign rg_wEpoch_EN = EN_ma_update_wEpoch ;

  // submodule bpu
  assign bpu_ma_bpu_enable_e = ma_bpu_enable_e ;
  assign bpu_ma_mispredict_g = ma_mispredict_g ;
  assign bpu_ma_train_bpu_td = ma_train_bpu_td ;
  assign bpu_mav_prediction_response_r = { rg_pc, rg_fence, rg_pc[1] } ;
  assign bpu_EN_mav_prediction_response = WILL_FIRE_RL_rl_gen_next_pc ;
  assign bpu_EN_ma_train_bpu = EN_ma_train_bpu ;
  assign bpu_EN_ma_mispredict = EN_ma_mispredict ;
  assign bpu_EN_ma_bpu_enable = EN_ma_bpu_enable ;

  // remaining internal signals
  assign curr_epoch__h1152 = { rg_eEpoch, rg_wEpoch } ;
  assign nextpc__h1231 = x_address__h2532 + 32'd4 ;
  assign nextpc__h1946 =
	     rg_delayed_redirect[32] ?
	       rg_delayed_redirect[31:0] :
	       y_avValue__h1706 ;
  assign x_address__h2532 = { rg_pc[31:2], 2'd0 } ;
  assign y_avValue__h1706 =
	     (bpu_mav_prediction_response[12] &&
	      bpu_mav_prediction_response[10] &&
	      (!bpu_mav_prediction_response[9] ||
	       bpu_mav_prediction_response[0])) ?
	       bpu_mav_prediction_response[44:13] :
	       nextpc__h1231 ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        ff_to_cache_rv <= `BSV_ASSIGNMENT_DELAY
	    { 1'd0,
	      35'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx /* unspecified value */  };
	rg_delayed_redirect <= `BSV_ASSIGNMENT_DELAY
	    { 1'd0,
	      32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx /* unspecified value */  };
	rg_eEpoch <= `BSV_ASSIGNMENT_DELAY 1'd0;
	rg_fence <= `BSV_ASSIGNMENT_DELAY 1'd0;
	rg_initialize <= `BSV_ASSIGNMENT_DELAY 1'd1;
	rg_pc <= `BSV_ASSIGNMENT_DELAY 32'h00001000;
	rg_wEpoch <= `BSV_ASSIGNMENT_DELAY 1'd0;
      end
    else
      begin
        if (ff_to_cache_rv_EN)
	  ff_to_cache_rv <= `BSV_ASSIGNMENT_DELAY ff_to_cache_rv_D_IN;
	if (rg_delayed_redirect_EN)
	  rg_delayed_redirect <= `BSV_ASSIGNMENT_DELAY
	      rg_delayed_redirect_D_IN;
	if (rg_eEpoch_EN) rg_eEpoch <= `BSV_ASSIGNMENT_DELAY rg_eEpoch_D_IN;
	if (rg_fence_EN) rg_fence <= `BSV_ASSIGNMENT_DELAY rg_fence_D_IN;
	if (rg_initialize_EN)
	  rg_initialize <= `BSV_ASSIGNMENT_DELAY rg_initialize_D_IN;
	if (rg_pc_EN) rg_pc <= `BSV_ASSIGNMENT_DELAY rg_pc_D_IN;
	if (rg_wEpoch_EN) rg_wEpoch <= `BSV_ASSIGNMENT_DELAY rg_wEpoch_D_IN;
      end
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    ff_to_cache_rv = 36'hAAAAAAAAA;
    rg_delayed_redirect = 33'h0AAAAAAAA;
    rg_eEpoch = 1'h0;
    rg_fence = 1'h0;
    rg_initialize = 1'h0;
    rg_pc = 32'hAAAAAAAA;
    rg_wEpoch = 1'h0;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on

  // handling of system tasks

  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc)
	begin
	  TASK_testplusargs___d13 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc)
	begin
	  TASK_testplusargs___d14 = $test$plusargs("mstage0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc)
	begin
	  TASK_testplusargs___d15 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc)
	begin
	  v__h1299 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  (TASK_testplusargs___d13 ||
	   TASK_testplusargs___d14 && TASK_testplusargs___d15))
	$write("[%10d", v__h1299, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  (TASK_testplusargs___d13 ||
	   TASK_testplusargs___d14 && TASK_testplusargs___d15))
	$write("STAGE0: nextpc: %h rg_fence:%b", nextpc__h1231, rg_fence);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  (TASK_testplusargs___d13 ||
	   TASK_testplusargs___d14 && TASK_testplusargs___d15))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc)
	begin
	  TASK_testplusargs___d43 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc)
	begin
	  TASK_testplusargs___d44 = $test$plusargs("mstage0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc)
	begin
	  TASK_testplusargs___d45 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_3_OR_TASK_testplusargs_4_AND_ETC___d50 =
	(TASK_testplusargs___d43 ||
	 TASK_testplusargs___d44 && TASK_testplusargs___d45) &&
	bpu_mav_prediction_response[10];
    TASK_testplusargs_3_OR_TASK_testplusargs_4_AND_ETC___d52 =
	(TASK_testplusargs___d43 ||
	 TASK_testplusargs___d44 && TASK_testplusargs___d45) &&
	!bpu_mav_prediction_response[10];
    TASK_testplusargs_3_OR_TASK_testplusargs_4_AND_ETC___d53 =
	(TASK_testplusargs___d43 ||
	 TASK_testplusargs___d44 && TASK_testplusargs___d45) &&
	bpu_mav_prediction_response[9];
    TASK_testplusargs_3_OR_TASK_testplusargs_4_AND_ETC___d55 =
	(TASK_testplusargs___d43 ||
	 TASK_testplusargs___d44 && TASK_testplusargs___d45) &&
	!bpu_mav_prediction_response[9];
    TASK_testplusargs_3_OR_TASK_testplusargs_4_AND_ETC___d57 =
	(TASK_testplusargs___d43 ||
	 TASK_testplusargs___d44 && TASK_testplusargs___d45) &&
	bpu_mav_prediction_response[0];
    TASK_testplusargs_3_OR_TASK_testplusargs_4_AND_ETC___d58 =
	(TASK_testplusargs___d43 ||
	 TASK_testplusargs___d44 && TASK_testplusargs___d45) &&
	!bpu_mav_prediction_response[0];
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc)
	begin
	  v__h1809 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  (TASK_testplusargs___d43 ||
	   TASK_testplusargs___d44 && TASK_testplusargs___d45))
	$write("[%10d", v__h1809, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  (TASK_testplusargs___d43 ||
	   TASK_testplusargs___d44 && TASK_testplusargs___d45))
	$write("[%2d]STAGE0: BPU response:", hartid);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  (TASK_testplusargs___d43 ||
	   TASK_testplusargs___d44 && TASK_testplusargs___d45))
	$write("PredictionResponse { ", "nextpc: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  (TASK_testplusargs___d43 ||
	   TASK_testplusargs___d44 && TASK_testplusargs___d45))
	$write("'h%h", bpu_mav_prediction_response[44:13]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  (TASK_testplusargs___d43 ||
	   TASK_testplusargs___d44 && TASK_testplusargs___d45))
	$write(", ", "btbresponse: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  (TASK_testplusargs___d43 ||
	   TASK_testplusargs___d44 && TASK_testplusargs___d45))
	$write("BTBResponse { ", "prediction: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  (TASK_testplusargs___d43 ||
	   TASK_testplusargs___d44 && TASK_testplusargs___d45))
	$write("'h%h", bpu_mav_prediction_response[12:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  (TASK_testplusargs___d43 ||
	   TASK_testplusargs___d44 && TASK_testplusargs___d45))
	$write(", ", "btbhit: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  TASK_testplusargs_3_OR_TASK_testplusargs_4_AND_ETC___d50)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  TASK_testplusargs_3_OR_TASK_testplusargs_4_AND_ETC___d52)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  (TASK_testplusargs___d43 ||
	   TASK_testplusargs___d44 && TASK_testplusargs___d45))
	$write(", ", "hi: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  TASK_testplusargs_3_OR_TASK_testplusargs_4_AND_ETC___d53)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  TASK_testplusargs_3_OR_TASK_testplusargs_4_AND_ETC___d55)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  (TASK_testplusargs___d43 ||
	   TASK_testplusargs___d44 && TASK_testplusargs___d45))
	$write(", ", "history: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  (TASK_testplusargs___d43 ||
	   TASK_testplusargs___d44 && TASK_testplusargs___d45))
	$write("'h%h", bpu_mav_prediction_response[8:1], " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  (TASK_testplusargs___d43 ||
	   TASK_testplusargs___d44 && TASK_testplusargs___d45))
	$write(", ", "instr16: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  TASK_testplusargs_3_OR_TASK_testplusargs_4_AND_ETC___d57)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  TASK_testplusargs_3_OR_TASK_testplusargs_4_AND_ETC___d58)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  (TASK_testplusargs___d43 ||
	   TASK_testplusargs___d44 && TASK_testplusargs___d45))
	$write(" }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  (TASK_testplusargs___d43 ||
	   TASK_testplusargs___d44 && TASK_testplusargs___d45))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc)
	begin
	  TASK_testplusargs___d59 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc)
	begin
	  TASK_testplusargs___d60 = $test$plusargs("mstage0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc)
	begin
	  TASK_testplusargs___d61 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc)
	begin
	  v__h2013 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  (TASK_testplusargs___d59 ||
	   TASK_testplusargs___d60 && TASK_testplusargs___d61))
	$write("[%10d", v__h2013, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  (TASK_testplusargs___d59 ||
	   TASK_testplusargs___d60 && TASK_testplusargs___d61))
	$write("STAGE0: nextpc1: %h ", nextpc__h1946);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  (TASK_testplusargs___d59 ||
	   TASK_testplusargs___d60 && TASK_testplusargs___d61))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc)
	begin
	  TASK_testplusargs___d73 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc)
	begin
	  TASK_testplusargs___d74 = $test$plusargs("mstage0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc)
	begin
	  TASK_testplusargs___d75 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc)
	begin
	  v__h2267 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  (TASK_testplusargs___d73 ||
	   TASK_testplusargs___d74 && TASK_testplusargs___d75))
	$write("[%10d", v__h2267, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  (TASK_testplusargs___d73 ||
	   TASK_testplusargs___d74 && TASK_testplusargs___d75))
	$write("[%2d]STAGE0: Sending PC:%h to I$. ",
	       hartid,
	       x_address__h2532);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  (TASK_testplusargs___d73 ||
	   TASK_testplusargs___d74 && TASK_testplusargs___d75))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc && !rg_fence)
	begin
	  TASK_testplusargs___d86 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc && !rg_fence)
	begin
	  TASK_testplusargs___d87 = $test$plusargs("mstage0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc && !rg_fence)
	begin
	  TASK_testplusargs___d88 = $test$plusargs("l0");
	  #0;
	end
    NOT_rg_fence_port0__read__3_7_AND_TASK_testplu_ETC___d91 =
	!rg_fence &&
	(TASK_testplusargs___d86 ||
	 TASK_testplusargs___d87 && TASK_testplusargs___d88);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc && !rg_fence)
	begin
	  v__h2651 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  NOT_rg_fence_port0__read__3_7_AND_TASK_testplu_ETC___d91)
	$write("[%10d", v__h2651, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  NOT_rg_fence_port0__read__3_7_AND_TASK_testplu_ETC___d91)
	$write("[%2d]STAGE0: Sending PC:%h to Stage1", hartid, rg_pc);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  NOT_rg_fence_port0__read__3_7_AND_TASK_testplu_ETC___d91)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_flush)
	begin
	  TASK_testplusargs___d95 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_flush)
	begin
	  TASK_testplusargs___d96 = $test$plusargs("mstage0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_flush)
	begin
	  TASK_testplusargs___d97 = $test$plusargs("l1");
	  #0;
	end
    TASK_testplusargs_5_OR_TASK_testplusargs_6_AND_ETC___d103 =
	(TASK_testplusargs___d95 ||
	 TASK_testplusargs___d96 && TASK_testplusargs___d97) &&
	ma_flush_fl[0];
    TASK_testplusargs_5_OR_TASK_testplusargs_6_AND_ETC___d105 =
	(TASK_testplusargs___d95 ||
	 TASK_testplusargs___d96 && TASK_testplusargs___d97) &&
	!ma_flush_fl[0];
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_flush)
	begin
	  v__h2828 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_flush &&
	  (TASK_testplusargs___d95 ||
	   TASK_testplusargs___d96 && TASK_testplusargs___d97))
	$write("[%10d", v__h2828, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_flush &&
	  (TASK_testplusargs___d95 ||
	   TASK_testplusargs___d96 && TASK_testplusargs___d97))
	$write("[%2d]STAGE0: Recieved Flush:", hartid);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_flush &&
	  (TASK_testplusargs___d95 ||
	   TASK_testplusargs___d96 && TASK_testplusargs___d97))
	$write("Stage0Flush { ", "pc: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_flush &&
	  (TASK_testplusargs___d95 ||
	   TASK_testplusargs___d96 && TASK_testplusargs___d97))
	$write("'h%h", ma_flush_fl[32:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_flush &&
	  (TASK_testplusargs___d95 ||
	   TASK_testplusargs___d96 && TASK_testplusargs___d97))
	$write(", ", "fence: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_flush &&
	  TASK_testplusargs_5_OR_TASK_testplusargs_6_AND_ETC___d103)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_flush &&
	  TASK_testplusargs_5_OR_TASK_testplusargs_6_AND_ETC___d105)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_flush &&
	  (TASK_testplusargs___d95 ||
	   TASK_testplusargs___d96 && TASK_testplusargs___d97))
	$write(" }");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_flush &&
	  (TASK_testplusargs___d95 ||
	   TASK_testplusargs___d96 && TASK_testplusargs___d97))
	$write("\n");
  end
  // synopsys translate_on
endmodule  // mkstage0
