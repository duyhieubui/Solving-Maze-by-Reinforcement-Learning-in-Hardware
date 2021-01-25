module Agent(
  input        clock,
  input        reset,
  input  [2:0] io_COL,
  input  [5:0] io_new_state,
  output       io_iterate,
  output [2:0] io_x,
  output [2:0] io_y,
  output [5:0] io_state,
  output [9:0] io_episode,
  output       io_done_learning,
  input        io_load_new_state,
  output [3:0] io_step
);
  reg [2:0] COL; // @[Blocks.scala 19:18]
  reg [31:0] _RAND_0;
  reg [5:0] state; // @[Blocks.scala 20:20]
  reg [31:0] _RAND_1;
  reg [9:0] episode; // @[Blocks.scala 21:22]
  reg [31:0] _RAND_2;
  wire  start_again; // @[Blocks.scala 22:24]
  reg [3:0] step; // @[Blocks.scala 23:21]
  reg [31:0] _RAND_3;
  wire  t; // @[Blocks.scala 28:14]
  wire  iterate; // @[Blocks.scala 29:26]
  wire [9:0] _T_2; // @[Blocks.scala 34:21]
  wire [3:0] _T_5; // @[Blocks.scala 42:17]
  wire [5:0] _GEN_8; // @[Blocks.scala 55:14]
  wire [5:0] _T_9; // @[Blocks.scala 56:14]
  wire [5:0] _GEN_0; // @[Blocks.scala 55:7]
  assign start_again = state == 6'h18; // @[Blocks.scala 22:24]
  assign t = step == 4'hf; // @[Blocks.scala 28:14]
  assign iterate = start_again | t; // @[Blocks.scala 29:26]
  assign _T_2 = episode + 10'h1; // @[Blocks.scala 34:21]
  assign _T_5 = step + 4'h1; // @[Blocks.scala 42:17]
  assign _GEN_8 = {{3'd0}, COL}; // @[Blocks.scala 55:14]
  assign _T_9 = state / _GEN_8; // @[Blocks.scala 56:14]
  assign io_iterate = start_again | t; // @[Blocks.scala 30:13]
  assign _GEN_0 = state % _GEN_8; // @[Blocks.scala 55:7]
  assign io_x = _GEN_0[2:0]; // @[Blocks.scala 55:7]
  assign io_y = _T_9[2:0]; // @[Blocks.scala 56:7]
  assign io_state = state; // @[Blocks.scala 57:11]
  assign io_episode = episode; // @[Blocks.scala 58:13]
  assign io_done_learning = episode == 10'h12c; // @[Blocks.scala 41:24 Blocks.scala 50:21 Blocks.scala 52:21]
  assign io_step = step; // @[Blocks.scala 59:10]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  COL = _RAND_0[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  state = _RAND_1[5:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  episode = _RAND_2[9:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  step = _RAND_3[3:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      COL <= 3'h0;
    end else begin
      COL <= io_COL;
    end
    if (reset) begin
      state <= 6'h0;
    end else if (iterate) begin
      state <= 6'h0;
    end else if (io_load_new_state) begin
      state <= io_new_state;
    end
    if (reset) begin
      episode <= 10'h0;
    end else if (iterate) begin
      episode <= _T_2;
    end
    if (reset) begin
      step <= 4'h0;
    end else if (iterate) begin
      if (t) begin
        step <= 4'h0;
      end
    end else if (io_load_new_state) begin
      if (t) begin
        step <= 4'h0;
      end else begin
        step <= _T_5;
      end
    end
  end
endmodule
module Action_FMS(
  input   clock,
  input   reset,
  input   io_reset_Action_fms,
  input   io_exploit,
  input   io_validAction,
  output  io_move_to_confirming_Reward,
  output  io_keep_action
);
  reg [2:0] action_FMS; // @[Action and ActionFMS.scala 14:27]
  reg [31:0] _RAND_0;
  wire  _T; // @[Conditional.scala 37:30]
  wire  _T_1; // @[Conditional.scala 37:30]
  wire  _T_2; // @[Conditional.scala 37:30]
  wire  _T_3; // @[Conditional.scala 37:30]
  wire  _T_4; // @[Conditional.scala 37:30]
  wire  _GEN_3; // @[Conditional.scala 39:67]
  wire  _GEN_6; // @[Conditional.scala 39:67]
  wire  _GEN_8; // @[Conditional.scala 39:67]
  wire  _GEN_10; // @[Conditional.scala 39:67]
  wire  _GEN_11; // @[Conditional.scala 40:58]
  wire  _GEN_13; // @[Conditional.scala 40:58]
  assign _T = 3'h0 == action_FMS; // @[Conditional.scala 37:30]
  assign _T_1 = 3'h1 == action_FMS; // @[Conditional.scala 37:30]
  assign _T_2 = 3'h2 == action_FMS; // @[Conditional.scala 37:30]
  assign _T_3 = 3'h3 == action_FMS; // @[Conditional.scala 37:30]
  assign _T_4 = 3'h4 == action_FMS; // @[Conditional.scala 37:30]
  assign _GEN_3 = _T_4 & io_validAction; // @[Conditional.scala 39:67]
  assign _GEN_6 = _T_3 ? 1'h0 : _GEN_3; // @[Conditional.scala 39:67]
  assign _GEN_8 = _T_2 ? 1'h0 : _GEN_6; // @[Conditional.scala 39:67]
  assign _GEN_10 = _T_1 ? 1'h0 : _GEN_8; // @[Conditional.scala 39:67]
  assign _GEN_11 = _T ? 1'h0 : 1'h1; // @[Conditional.scala 40:58]
  assign _GEN_13 = _T ? 1'h0 : _GEN_10; // @[Conditional.scala 40:58]
  assign io_move_to_confirming_Reward = io_reset_Action_fms ? 1'h0 : _GEN_13; // @[Action and ActionFMS.scala 15:32 Action and ActionFMS.scala 41:40]
  assign io_keep_action = io_reset_Action_fms | _GEN_11; // @[Action and ActionFMS.scala 17:17 Action and ActionFMS.scala 23:23]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  action_FMS = _RAND_0[2:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      action_FMS <= 3'h0;
    end else if (io_reset_Action_fms) begin
      action_FMS <= 3'h0;
    end else if (_T) begin
      if (io_exploit) begin
        action_FMS <= 3'h1;
      end else begin
        action_FMS <= 3'h2;
      end
    end else if (_T_1) begin
      action_FMS <= 3'h3;
    end else if (_T_2) begin
      action_FMS <= 3'h3;
    end else if (_T_3) begin
      action_FMS <= 3'h4;
    end else if (_T_4) begin
      if (io_validAction) begin
        action_FMS <= 3'h4;
      end else begin
        action_FMS <= 3'h0;
      end
    end
  end
endmodule
module Action(
  input        clock,
  input        reset,
  input  [2:0] io_x,
  input  [2:0] io_y,
  input  [9:0] io_rand2,
  output [5:0] io_new_state,
  output [1:0] io_act,
  input  [1:0] io_action_at_Qmax,
  input        io_exploit,
  output       io_validAction,
  input        io_keep_action
);
  reg [1:0] act; // @[Action and ActionFMS.scala 64:20]
  reg [31:0] _RAND_0;
  reg [2:0] x_new; // @[Action and ActionFMS.scala 65:22]
  reg [31:0] _RAND_1;
  reg [2:0] y_new; // @[Action and ActionFMS.scala 66:22]
  reg [31:0] _RAND_2;
  reg [5:0] new_state; // @[Action and ActionFMS.scala 67:24]
  reg [31:0] _RAND_3;
  reg [1:0] action_at_Qmax; // @[Action and ActionFMS.scala 68:29]
  reg [31:0] _RAND_4;
  wire  _T; // @[Action and ActionFMS.scala 71:22]
  wire  _T_1; // @[Action and ActionFMS.scala 75:21]
  wire  _T_2; // @[Action and ActionFMS.scala 77:25]
  wire  _T_3; // @[Action and ActionFMS.scala 77:50]
  wire  _T_5; // @[Action and ActionFMS.scala 77:37]
  wire  _T_6; // @[Action and ActionFMS.scala 79:25]
  wire  _T_7; // @[Action and ActionFMS.scala 79:50]
  wire  _T_9; // @[Action and ActionFMS.scala 79:37]
  wire  _T_10; // @[Action and ActionFMS.scala 86:12]
  wire [2:0] _T_12; // @[Action and ActionFMS.scala 87:19]
  wire  _T_13; // @[Action and ActionFMS.scala 89:18]
  wire [2:0] _T_15; // @[Action and ActionFMS.scala 90:19]
  wire  _T_16; // @[Action and ActionFMS.scala 92:18]
  wire [2:0] _T_18; // @[Action and ActionFMS.scala 93:19]
  wire [2:0] _T_20; // @[Action and ActionFMS.scala 96:19]
  wire  _T_21; // @[Action and ActionFMS.scala 99:14]
  wire  _T_22; // @[Action and ActionFMS.scala 99:31]
  wire  _T_23; // @[Action and ActionFMS.scala 99:22]
  wire  _T_24; // @[Action and ActionFMS.scala 99:48]
  wire  _T_25; // @[Action and ActionFMS.scala 99:39]
  wire  _T_26; // @[Action and ActionFMS.scala 99:65]
  wire  _T_27; // @[Action and ActionFMS.scala 99:56]
  wire [5:0] _T_28; // @[Action and ActionFMS.scala 102:25]
  wire [5:0] _GEN_13; // @[Action and ActionFMS.scala 102:21]
  wire [5:0] _T_30; // @[Action and ActionFMS.scala 102:21]
  assign _T = io_keep_action == 1'h0; // @[Action and ActionFMS.scala 71:22]
  assign _T_1 = io_rand2 <= 10'hfa; // @[Action and ActionFMS.scala 75:21]
  assign _T_2 = 10'hfa < io_rand2; // @[Action and ActionFMS.scala 77:25]
  assign _T_3 = io_rand2 <= 10'h1f4; // @[Action and ActionFMS.scala 77:50]
  assign _T_5 = _T_2 & _T_3; // @[Action and ActionFMS.scala 77:37]
  assign _T_6 = 10'h1f4 < io_rand2; // @[Action and ActionFMS.scala 79:25]
  assign _T_7 = io_rand2 <= 10'h2ee; // @[Action and ActionFMS.scala 79:50]
  assign _T_9 = _T_6 & _T_7; // @[Action and ActionFMS.scala 79:37]
  assign _T_10 = act == 2'h0; // @[Action and ActionFMS.scala 86:12]
  assign _T_12 = io_y + 3'h1; // @[Action and ActionFMS.scala 87:19]
  assign _T_13 = act == 2'h1; // @[Action and ActionFMS.scala 89:18]
  assign _T_15 = io_x - 3'h1; // @[Action and ActionFMS.scala 90:19]
  assign _T_16 = act == 2'h2; // @[Action and ActionFMS.scala 92:18]
  assign _T_18 = io_y - 3'h1; // @[Action and ActionFMS.scala 93:19]
  assign _T_20 = io_x + 3'h1; // @[Action and ActionFMS.scala 96:19]
  assign _T_21 = x_new == 3'h7; // @[Action and ActionFMS.scala 99:14]
  assign _T_22 = x_new == 3'h5; // @[Action and ActionFMS.scala 99:31]
  assign _T_23 = _T_21 | _T_22; // @[Action and ActionFMS.scala 99:22]
  assign _T_24 = y_new == 3'h7; // @[Action and ActionFMS.scala 99:48]
  assign _T_25 = _T_23 | _T_24; // @[Action and ActionFMS.scala 99:39]
  assign _T_26 = y_new == 3'h5; // @[Action and ActionFMS.scala 99:65]
  assign _T_27 = _T_25 | _T_26; // @[Action and ActionFMS.scala 99:56]
  assign _T_28 = 3'h5 * y_new; // @[Action and ActionFMS.scala 102:25]
  assign _GEN_13 = {{3'd0}, x_new}; // @[Action and ActionFMS.scala 102:21]
  assign _T_30 = _GEN_13 + _T_28; // @[Action and ActionFMS.scala 102:21]
  assign io_new_state = new_state; // @[Action and ActionFMS.scala 106:15]
  assign io_act = act; // @[Action and ActionFMS.scala 105:9]
  assign io_validAction = _T_27 ? 1'h0 : 1'h1; // @[Action and ActionFMS.scala 100:19 Action and ActionFMS.scala 103:19]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  act = _RAND_0[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  x_new = _RAND_1[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  y_new = _RAND_2[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  new_state = _RAND_3[5:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  action_at_Qmax = _RAND_4[1:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      act <= 2'h0;
    end else if (_T) begin
      if (io_exploit) begin
        act <= action_at_Qmax;
      end else if (_T_1) begin
        act <= 2'h0;
      end else if (_T_5) begin
        act <= 2'h1;
      end else if (_T_9) begin
        act <= 2'h2;
      end else begin
        act <= 2'h3;
      end
    end
    if (reset) begin
      x_new <= 3'h0;
    end else if (_T_10) begin
      x_new <= io_x;
    end else if (_T_13) begin
      x_new <= _T_15;
    end else if (_T_16) begin
      x_new <= io_x;
    end else begin
      x_new <= _T_20;
    end
    if (reset) begin
      y_new <= 3'h0;
    end else if (_T_10) begin
      y_new <= _T_12;
    end else if (_T_13) begin
      y_new <= io_y;
    end else if (_T_16) begin
      y_new <= _T_18;
    end else begin
      y_new <= io_y;
    end
    if (reset) begin
      new_state <= 6'h0;
    end else if (!(_T_27)) begin
      new_state <= _T_30;
    end
    if (reset) begin
      action_at_Qmax <= 2'h0;
    end else begin
      action_at_Qmax <= io_action_at_Qmax;
    end
  end
endmodule
module takingAction(
  input        clock,
  input        reset,
  input  [2:0] io_x,
  input  [2:0] io_y,
  input  [9:0] io_rand2,
  input  [9:0] io_episode,
  output [5:0] io_new_state,
  input  [1:0] io_action_at_Qmax,
  output [1:0] io_act,
  input        io_reset_Action_fms,
  output       io_move_to_confirming_Reward
);
  wire  action_fms_clock; // @[taking_Action.scala 19:24]
  wire  action_fms_reset; // @[taking_Action.scala 19:24]
  wire  action_fms_io_reset_Action_fms; // @[taking_Action.scala 19:24]
  wire  action_fms_io_exploit; // @[taking_Action.scala 19:24]
  wire  action_fms_io_validAction; // @[taking_Action.scala 19:24]
  wire  action_fms_io_move_to_confirming_Reward; // @[taking_Action.scala 19:24]
  wire  action_fms_io_keep_action; // @[taking_Action.scala 19:24]
  wire  action_clock; // @[taking_Action.scala 20:20]
  wire  action_reset; // @[taking_Action.scala 20:20]
  wire [2:0] action_io_x; // @[taking_Action.scala 20:20]
  wire [2:0] action_io_y; // @[taking_Action.scala 20:20]
  wire [9:0] action_io_rand2; // @[taking_Action.scala 20:20]
  wire [5:0] action_io_new_state; // @[taking_Action.scala 20:20]
  wire [1:0] action_io_act; // @[taking_Action.scala 20:20]
  wire [1:0] action_io_action_at_Qmax; // @[taking_Action.scala 20:20]
  wire  action_io_exploit; // @[taking_Action.scala 20:20]
  wire  action_io_validAction; // @[taking_Action.scala 20:20]
  wire  action_io_keep_action; // @[taking_Action.scala 20:20]
  Action_FMS action_fms ( // @[taking_Action.scala 19:24]
    .clock(action_fms_clock),
    .reset(action_fms_reset),
    .io_reset_Action_fms(action_fms_io_reset_Action_fms),
    .io_exploit(action_fms_io_exploit),
    .io_validAction(action_fms_io_validAction),
    .io_move_to_confirming_Reward(action_fms_io_move_to_confirming_Reward),
    .io_keep_action(action_fms_io_keep_action)
  );
  Action action ( // @[taking_Action.scala 20:20]
    .clock(action_clock),
    .reset(action_reset),
    .io_x(action_io_x),
    .io_y(action_io_y),
    .io_rand2(action_io_rand2),
    .io_new_state(action_io_new_state),
    .io_act(action_io_act),
    .io_action_at_Qmax(action_io_action_at_Qmax),
    .io_exploit(action_io_exploit),
    .io_validAction(action_io_validAction),
    .io_keep_action(action_io_keep_action)
  );
  assign io_new_state = action_io_new_state; // @[taking_Action.scala 44:15]
  assign io_act = action_io_act; // @[taking_Action.scala 43:9]
  assign io_move_to_confirming_Reward = action_fms_io_move_to_confirming_Reward; // @[taking_Action.scala 45:31]
  assign action_fms_clock = clock;
  assign action_fms_reset = reset;
  assign action_fms_io_reset_Action_fms = io_reset_Action_fms; // @[taking_Action.scala 29:33]
  assign action_fms_io_exploit = io_episode < 10'h5a; // @[taking_Action.scala 30:24]
  assign action_fms_io_validAction = action_io_validAction; // @[taking_Action.scala 31:28]
  assign action_clock = clock;
  assign action_reset = reset;
  assign action_io_x = io_x; // @[taking_Action.scala 39:14]
  assign action_io_y = io_y; // @[taking_Action.scala 40:14]
  assign action_io_rand2 = io_rand2; // @[taking_Action.scala 37:18]
  assign action_io_action_at_Qmax = io_action_at_Qmax; // @[taking_Action.scala 41:27]
  assign action_io_exploit = io_episode < 10'h5a; // @[taking_Action.scala 35:20]
  assign action_io_keep_action = action_fms_io_keep_action; // @[taking_Action.scala 32:28]
endmodule
module Q_function(
  input         clock,
  input         reset,
  input  [15:0] io_Q_s_a,
  input  [15:0] io_Q_prime_max,
  output [15:0] io_Q_updated,
  input         io_cal,
  input  [8:0]  io_reward,
  output        io_wrEna
);
  reg [15:0] Q_s_a; // @[Q_function.scala 16:20]
  reg [31:0] _RAND_0;
  reg [8:0] reward; // @[Q_function.scala 17:21]
  reg [31:0] _RAND_1;
  wire [17:0] _T; // @[Q_function.scala 23:33]
  wire [17:0] _GEN_2; // @[Q_function.scala 23:26]
  wire [17:0] _T_2; // @[Q_function.scala 23:26]
  wire [17:0] _T_3; // @[Q_function.scala 23:26]
  wire [18:0] _T_4; // @[Q_function.scala 23:40]
  wire [19:0] _T_5; // @[Q_function.scala 23:61]
  wire [20:0] _T_6; // @[Q_function.scala 23:65]
  wire [20:0] _GEN_3; // @[Q_function.scala 23:45]
  wire [20:0] _T_8; // @[Q_function.scala 23:45]
  wire [20:0] _T_9; // @[Q_function.scala 23:45]
  wire [20:0] _GEN_0; // @[Q_function.scala 22:15]
  wire [15:0] _GEN_4; // @[Q_function.scala 23:18 Q_function.scala 26:17]
  assign _T = $signed(reward) * $signed(9'sh80); // @[Q_function.scala 23:33]
  assign _GEN_2 = {{2{Q_s_a[15]}},Q_s_a}; // @[Q_function.scala 23:26]
  assign _T_2 = $signed(_GEN_2) + $signed(_T); // @[Q_function.scala 23:26]
  assign _T_3 = $signed(_T_2); // @[Q_function.scala 23:26]
  assign _T_4 = $signed(_T_3) / $signed(18'sh2); // @[Q_function.scala 23:40]
  assign _T_5 = $signed(io_Q_prime_max) * $signed(16'sh4); // @[Q_function.scala 23:61]
  assign _T_6 = $signed(_T_5) / $signed(20'sha); // @[Q_function.scala 23:65]
  assign _GEN_3 = {{2{_T_4[18]}},_T_4}; // @[Q_function.scala 23:45]
  assign _T_8 = $signed(_GEN_3) + $signed(_T_6); // @[Q_function.scala 23:45]
  assign _T_9 = $signed(_T_8); // @[Q_function.scala 23:45]
  assign _GEN_0 = io_cal ? $signed(_T_9) : $signed(21'sh0); // @[Q_function.scala 22:15]
  assign _GEN_4 = _GEN_0[15:0]; // @[Q_function.scala 23:18 Q_function.scala 26:17]
  assign io_Q_updated = $signed(_GEN_4); // @[Q_function.scala 23:18 Q_function.scala 26:17]
  assign io_wrEna = io_cal; // @[Q_function.scala 24:13 Q_function.scala 27:13]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  Q_s_a = _RAND_0[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  reward = _RAND_1[8:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      Q_s_a <= 16'sh0;
    end else begin
      Q_s_a <= io_Q_s_a;
    end
    if (reset) begin
      reward <= 9'sh0;
    end else begin
      reward <= io_reward;
    end
  end
endmodule
module Max4(
  input  [15:0] io_ins0,
  input  [15:0] io_ins1,
  input  [15:0] io_ins2,
  input  [15:0] io_ins3,
  output [15:0] io_Q_max
);
  wire  _T; // @[Q_table.scala 81:46]
  wire [15:0] _T_1; // @[Q_table.scala 81:43]
  wire  _T_2; // @[Q_table.scala 81:46]
  wire [15:0] _T_3; // @[Q_table.scala 81:43]
  wire  _T_4; // @[Q_table.scala 81:46]
  assign _T = $signed(io_ins0) > $signed(io_ins1); // @[Q_table.scala 81:46]
  assign _T_1 = _T ? $signed(io_ins0) : $signed(io_ins1); // @[Q_table.scala 81:43]
  assign _T_2 = $signed(_T_1) > $signed(io_ins2); // @[Q_table.scala 81:46]
  assign _T_3 = _T_2 ? $signed(_T_1) : $signed(io_ins2); // @[Q_table.scala 81:43]
  assign _T_4 = $signed(_T_3) > $signed(io_ins3); // @[Q_table.scala 81:46]
  assign io_Q_max = _T_4 ? $signed(_T_3) : $signed(io_ins3); // @[Q_table.scala 87:11]
endmodule
module Action_at_Qmax(
  input  [15:0] io_ins0,
  input  [15:0] io_ins1,
  input  [15:0] io_ins2,
  output [1:0]  io_action_at_Qmax,
  input  [20:0] io_Q_max_at_state_s
);
  wire [20:0] _GEN_0; // @[Q_table.scala 103:42]
  wire  _T; // @[Q_table.scala 103:42]
  wire [20:0] _GEN_1; // @[Q_table.scala 103:42]
  wire  _T_1; // @[Q_table.scala 103:42]
  wire [20:0] _GEN_2; // @[Q_table.scala 103:42]
  wire  _T_2; // @[Q_table.scala 103:42]
  wire [1:0] _T_4; // @[Q_table.scala 103:36]
  wire [1:0] _T_5; // @[Q_table.scala 103:36]
  assign _GEN_0 = {{5{io_ins0[15]}},io_ins0}; // @[Q_table.scala 103:42]
  assign _T = $signed(_GEN_0) == $signed(io_Q_max_at_state_s); // @[Q_table.scala 103:42]
  assign _GEN_1 = {{5{io_ins1[15]}},io_ins1}; // @[Q_table.scala 103:42]
  assign _T_1 = $signed(_GEN_1) == $signed(io_Q_max_at_state_s); // @[Q_table.scala 103:42]
  assign _GEN_2 = {{5{io_ins2[15]}},io_ins2}; // @[Q_table.scala 103:42]
  assign _T_2 = $signed(_GEN_2) == $signed(io_Q_max_at_state_s); // @[Q_table.scala 103:42]
  assign _T_4 = _T_2 ? 2'h2 : 2'h3; // @[Q_table.scala 103:36]
  assign _T_5 = _T_1 ? 2'h1 : _T_4; // @[Q_table.scala 103:36]
  assign io_action_at_Qmax = _T ? 2'h0 : _T_5; // @[Q_table.scala 103:20]
endmodule
module Qtable(
  input         clock,
  input         reset,
  input  [5:0]  io_state,
  input  [5:0]  io_new_state,
  input  [1:0]  io_act,
  input         io_wrEna,
  input  [15:0] io_Q_updated,
  output [15:0] io_Q_s_a,
  output [15:0] io_Q_prime_max,
  output [1:0]  io_action_at_Qmax,
  input         io_get_Q_prime_max,
  input         io_write_data_into_a_txtfile,
  input  [1:0]  io_act_read,
  input  [5:0]  io_state_read
);
  wire [15:0] max4_io_ins0; // @[Q_table.scala 19:18]
  wire [15:0] max4_io_ins1; // @[Q_table.scala 19:18]
  wire [15:0] max4_io_ins2; // @[Q_table.scala 19:18]
  wire [15:0] max4_io_ins3; // @[Q_table.scala 19:18]
  wire [15:0] max4_io_Q_max; // @[Q_table.scala 19:18]
  wire [15:0] index_of_Q_max_io_ins0; // @[Q_table.scala 20:28]
  wire [15:0] index_of_Q_max_io_ins1; // @[Q_table.scala 20:28]
  wire [15:0] index_of_Q_max_io_ins2; // @[Q_table.scala 20:28]
  wire [1:0] index_of_Q_max_io_action_at_Qmax; // @[Q_table.scala 20:28]
  wire [20:0] index_of_Q_max_io_Q_max_at_state_s; // @[Q_table.scala 20:28]
  reg [15:0] Q_s_a0 [0:24]; // @[Q_table.scala 22:25]
  reg [31:0] _RAND_0;
  wire [15:0] Q_s_a0__T_4_data; // @[Q_table.scala 22:25]
  wire [4:0] Q_s_a0__T_4_addr; // @[Q_table.scala 22:25]
  reg [31:0] _RAND_1;
  wire [15:0] Q_s_a0__T_21_data; // @[Q_table.scala 22:25]
  wire [4:0] Q_s_a0__T_21_addr; // @[Q_table.scala 22:25]
  reg [31:0] _RAND_2;
  wire [15:0] Q_s_a0__T_29_data; // @[Q_table.scala 22:25]
  wire [4:0] Q_s_a0__T_29_addr; // @[Q_table.scala 22:25]
  reg [31:0] _RAND_3;
  wire [15:0] Q_s_a0__T_31_data; // @[Q_table.scala 22:25]
  wire [4:0] Q_s_a0__T_31_addr; // @[Q_table.scala 22:25]
  reg [31:0] _RAND_4;
  wire [15:0] Q_s_a0__T_33_data; // @[Q_table.scala 22:25]
  wire [4:0] Q_s_a0__T_33_addr; // @[Q_table.scala 22:25]
  reg [31:0] _RAND_5;
  wire [15:0] Q_s_a0__T_35_data; // @[Q_table.scala 22:25]
  wire [4:0] Q_s_a0__T_35_addr; // @[Q_table.scala 22:25]
  reg [31:0] _RAND_6;
  wire [15:0] Q_s_a0__T_2_data; // @[Q_table.scala 22:25]
  wire [4:0] Q_s_a0__T_2_addr; // @[Q_table.scala 22:25]
  wire  Q_s_a0__T_2_mask; // @[Q_table.scala 22:25]
  wire  Q_s_a0__T_2_en; // @[Q_table.scala 22:25]
  reg  Q_s_a0__T_4_en_pipe_0;
  reg [31:0] _RAND_7;
  reg [4:0] Q_s_a0__T_4_addr_pipe_0;
  reg [31:0] _RAND_8;
  reg  Q_s_a0__T_21_en_pipe_0;
  reg [31:0] _RAND_9;
  reg [4:0] Q_s_a0__T_21_addr_pipe_0;
  reg [31:0] _RAND_10;
  reg  Q_s_a0__T_29_en_pipe_0;
  reg [31:0] _RAND_11;
  reg [4:0] Q_s_a0__T_29_addr_pipe_0;
  reg [31:0] _RAND_12;
  reg  Q_s_a0__T_31_en_pipe_0;
  reg [31:0] _RAND_13;
  reg [4:0] Q_s_a0__T_31_addr_pipe_0;
  reg [31:0] _RAND_14;
  reg  Q_s_a0__T_33_en_pipe_0;
  reg [31:0] _RAND_15;
  reg [4:0] Q_s_a0__T_33_addr_pipe_0;
  reg [31:0] _RAND_16;
  reg  Q_s_a0__T_35_en_pipe_0;
  reg [31:0] _RAND_17;
  reg [4:0] Q_s_a0__T_35_addr_pipe_0;
  reg [31:0] _RAND_18;
  reg [15:0] Q_s_a1 [0:24]; // @[Q_table.scala 23:25]
  reg [31:0] _RAND_19;
  wire [15:0] Q_s_a1__T_9_data; // @[Q_table.scala 23:25]
  wire [4:0] Q_s_a1__T_9_addr; // @[Q_table.scala 23:25]
  reg [31:0] _RAND_20;
  wire [15:0] Q_s_a1__T_14_data; // @[Q_table.scala 23:25]
  wire [4:0] Q_s_a1__T_14_addr; // @[Q_table.scala 23:25]
  reg [31:0] _RAND_21;
  wire [15:0] Q_s_a1__T_23_data; // @[Q_table.scala 23:25]
  wire [4:0] Q_s_a1__T_23_addr; // @[Q_table.scala 23:25]
  reg [31:0] _RAND_22;
  wire [15:0] Q_s_a1__T_25_data; // @[Q_table.scala 23:25]
  wire [4:0] Q_s_a1__T_25_addr; // @[Q_table.scala 23:25]
  reg [31:0] _RAND_23;
  wire [15:0] Q_s_a1__T_7_data; // @[Q_table.scala 23:25]
  wire [4:0] Q_s_a1__T_7_addr; // @[Q_table.scala 23:25]
  wire  Q_s_a1__T_7_mask; // @[Q_table.scala 23:25]
  wire  Q_s_a1__T_7_en; // @[Q_table.scala 23:25]
  reg  Q_s_a1__T_9_en_pipe_0;
  reg [31:0] _RAND_24;
  reg [4:0] Q_s_a1__T_9_addr_pipe_0;
  reg [31:0] _RAND_25;
  reg  Q_s_a1__T_14_en_pipe_0;
  reg [31:0] _RAND_26;
  reg [4:0] Q_s_a1__T_14_addr_pipe_0;
  reg [31:0] _RAND_27;
  reg  Q_s_a1__T_23_en_pipe_0;
  reg [31:0] _RAND_28;
  reg [4:0] Q_s_a1__T_23_addr_pipe_0;
  reg [31:0] _RAND_29;
  reg  Q_s_a1__T_25_en_pipe_0;
  reg [31:0] _RAND_30;
  reg [4:0] Q_s_a1__T_25_addr_pipe_0;
  reg [31:0] _RAND_31;
  reg [15:0] Q_s_a3 [0:24]; // @[Q_table.scala 25:25]
  reg [31:0] _RAND_32;
  wire [15:0] Q_s_a3__T_19_data; // @[Q_table.scala 25:25]
  wire [4:0] Q_s_a3__T_19_addr; // @[Q_table.scala 25:25]
  reg [31:0] _RAND_33;
  wire [15:0] Q_s_a3__T_27_data; // @[Q_table.scala 25:25]
  wire [4:0] Q_s_a3__T_27_addr; // @[Q_table.scala 25:25]
  reg [31:0] _RAND_34;
  wire [15:0] Q_s_a3__T_17_data; // @[Q_table.scala 25:25]
  wire [4:0] Q_s_a3__T_17_addr; // @[Q_table.scala 25:25]
  wire  Q_s_a3__T_17_mask; // @[Q_table.scala 25:25]
  wire  Q_s_a3__T_17_en; // @[Q_table.scala 25:25]
  reg  Q_s_a3__T_19_en_pipe_0;
  reg [31:0] _RAND_35;
  reg [4:0] Q_s_a3__T_19_addr_pipe_0;
  reg [31:0] _RAND_36;
  reg  Q_s_a3__T_27_en_pipe_0;
  reg [31:0] _RAND_37;
  reg [4:0] Q_s_a3__T_27_addr_pipe_0;
  reg [31:0] _RAND_38;
  reg [5:0] state_addr; // @[Q_table.scala 26:25]
  reg [31:0] _RAND_39;
  wire [1:0] act; // @[Q_table.scala 29:14]
  wire [5:0] stateRead; // @[Q_table.scala 30:20]
  wire  _T; // @[Q_table.scala 31:11]
  wire  _GEN_5; // @[Q_table.scala 32:20]
  wire [15:0] _GEN_8; // @[Q_table.scala 32:20]
  wire  _T_5; // @[Q_table.scala 37:17]
  wire [15:0] _GEN_11; // @[Q_table.scala 38:20]
  wire  _T_10; // @[Q_table.scala 43:17]
  wire [15:0] _GEN_14; // @[Q_table.scala 44:20]
  wire  _T_15; // @[Q_table.scala 49:17]
  wire [15:0] _GEN_17; // @[Q_table.scala 50:19]
  wire  _GEN_20; // @[Q_table.scala 49:24]
  wire  _GEN_23; // @[Q_table.scala 49:24]
  wire [15:0] _GEN_26; // @[Q_table.scala 49:24]
  wire  _GEN_32; // @[Q_table.scala 43:24]
  wire [15:0] _GEN_35; // @[Q_table.scala 43:24]
  wire  _GEN_38; // @[Q_table.scala 43:24]
  wire  _GEN_41; // @[Q_table.scala 43:24]
  wire  _GEN_46; // @[Q_table.scala 37:24]
  wire  _GEN_49; // @[Q_table.scala 37:24]
  wire [15:0] _GEN_52; // @[Q_table.scala 37:24]
  wire  _GEN_58; // @[Q_table.scala 37:24]
  wire  _GEN_63; // @[Q_table.scala 37:24]
  wire  _GEN_66; // @[Q_table.scala 37:24]
  wire [5:0] new_state_or_state; // @[Q_table.scala 58:29]
  Max4 max4 ( // @[Q_table.scala 19:18]
    .io_ins0(max4_io_ins0),
    .io_ins1(max4_io_ins1),
    .io_ins2(max4_io_ins2),
    .io_ins3(max4_io_ins3),
    .io_Q_max(max4_io_Q_max)
  );
  Action_at_Qmax index_of_Q_max ( // @[Q_table.scala 20:28]
    .io_ins0(index_of_Q_max_io_ins0),
    .io_ins1(index_of_Q_max_io_ins1),
    .io_ins2(index_of_Q_max_io_ins2),
    .io_action_at_Qmax(index_of_Q_max_io_action_at_Qmax),
    .io_Q_max_at_state_s(index_of_Q_max_io_Q_max_at_state_s)
  );
  assign Q_s_a0__T_4_addr = Q_s_a0__T_4_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign Q_s_a0__T_4_data = Q_s_a0[Q_s_a0__T_4_addr]; // @[Q_table.scala 22:25]
  `else
  assign Q_s_a0__T_4_data = Q_s_a0__T_4_addr >= 5'h19 ? _RAND_1[15:0] : Q_s_a0[Q_s_a0__T_4_addr]; // @[Q_table.scala 22:25]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign Q_s_a0__T_21_addr = Q_s_a0__T_21_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign Q_s_a0__T_21_data = Q_s_a0[Q_s_a0__T_21_addr]; // @[Q_table.scala 22:25]
  `else
  assign Q_s_a0__T_21_data = Q_s_a0__T_21_addr >= 5'h19 ? _RAND_2[15:0] : Q_s_a0[Q_s_a0__T_21_addr]; // @[Q_table.scala 22:25]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign Q_s_a0__T_29_addr = Q_s_a0__T_29_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign Q_s_a0__T_29_data = Q_s_a0[Q_s_a0__T_29_addr]; // @[Q_table.scala 22:25]
  `else
  assign Q_s_a0__T_29_data = Q_s_a0__T_29_addr >= 5'h19 ? _RAND_3[15:0] : Q_s_a0[Q_s_a0__T_29_addr]; // @[Q_table.scala 22:25]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign Q_s_a0__T_31_addr = Q_s_a0__T_31_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign Q_s_a0__T_31_data = Q_s_a0[Q_s_a0__T_31_addr]; // @[Q_table.scala 22:25]
  `else
  assign Q_s_a0__T_31_data = Q_s_a0__T_31_addr >= 5'h19 ? _RAND_4[15:0] : Q_s_a0[Q_s_a0__T_31_addr]; // @[Q_table.scala 22:25]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign Q_s_a0__T_33_addr = Q_s_a0__T_33_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign Q_s_a0__T_33_data = Q_s_a0[Q_s_a0__T_33_addr]; // @[Q_table.scala 22:25]
  `else
  assign Q_s_a0__T_33_data = Q_s_a0__T_33_addr >= 5'h19 ? _RAND_5[15:0] : Q_s_a0[Q_s_a0__T_33_addr]; // @[Q_table.scala 22:25]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign Q_s_a0__T_35_addr = Q_s_a0__T_35_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign Q_s_a0__T_35_data = Q_s_a0[Q_s_a0__T_35_addr]; // @[Q_table.scala 22:25]
  `else
  assign Q_s_a0__T_35_data = Q_s_a0__T_35_addr >= 5'h19 ? _RAND_6[15:0] : Q_s_a0[Q_s_a0__T_35_addr]; // @[Q_table.scala 22:25]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign Q_s_a0__T_2_data = io_Q_updated;
  assign Q_s_a0__T_2_addr = state_addr[4:0];
  assign Q_s_a0__T_2_mask = 1'h1;
  assign Q_s_a0__T_2_en = _T & io_wrEna;
  assign Q_s_a1__T_9_addr = Q_s_a1__T_9_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign Q_s_a1__T_9_data = Q_s_a1[Q_s_a1__T_9_addr]; // @[Q_table.scala 23:25]
  `else
  assign Q_s_a1__T_9_data = Q_s_a1__T_9_addr >= 5'h19 ? _RAND_20[15:0] : Q_s_a1[Q_s_a1__T_9_addr]; // @[Q_table.scala 23:25]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign Q_s_a1__T_14_addr = Q_s_a1__T_14_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign Q_s_a1__T_14_data = Q_s_a1[Q_s_a1__T_14_addr]; // @[Q_table.scala 23:25]
  `else
  assign Q_s_a1__T_14_data = Q_s_a1__T_14_addr >= 5'h19 ? _RAND_21[15:0] : Q_s_a1[Q_s_a1__T_14_addr]; // @[Q_table.scala 23:25]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign Q_s_a1__T_23_addr = Q_s_a1__T_23_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign Q_s_a1__T_23_data = Q_s_a1[Q_s_a1__T_23_addr]; // @[Q_table.scala 23:25]
  `else
  assign Q_s_a1__T_23_data = Q_s_a1__T_23_addr >= 5'h19 ? _RAND_22[15:0] : Q_s_a1[Q_s_a1__T_23_addr]; // @[Q_table.scala 23:25]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign Q_s_a1__T_25_addr = Q_s_a1__T_25_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign Q_s_a1__T_25_data = Q_s_a1[Q_s_a1__T_25_addr]; // @[Q_table.scala 23:25]
  `else
  assign Q_s_a1__T_25_data = Q_s_a1__T_25_addr >= 5'h19 ? _RAND_23[15:0] : Q_s_a1[Q_s_a1__T_25_addr]; // @[Q_table.scala 23:25]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign Q_s_a1__T_7_data = io_Q_updated;
  assign Q_s_a1__T_7_addr = state_addr[4:0];
  assign Q_s_a1__T_7_mask = 1'h1;
  assign Q_s_a1__T_7_en = _T ? 1'h0 : _GEN_46;
  assign Q_s_a3__T_19_addr = Q_s_a3__T_19_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign Q_s_a3__T_19_data = Q_s_a3[Q_s_a3__T_19_addr]; // @[Q_table.scala 25:25]
  `else
  assign Q_s_a3__T_19_data = Q_s_a3__T_19_addr >= 5'h19 ? _RAND_33[15:0] : Q_s_a3[Q_s_a3__T_19_addr]; // @[Q_table.scala 25:25]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign Q_s_a3__T_27_addr = Q_s_a3__T_27_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign Q_s_a3__T_27_data = Q_s_a3[Q_s_a3__T_27_addr]; // @[Q_table.scala 25:25]
  `else
  assign Q_s_a3__T_27_data = Q_s_a3__T_27_addr >= 5'h19 ? _RAND_34[15:0] : Q_s_a3[Q_s_a3__T_27_addr]; // @[Q_table.scala 25:25]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign Q_s_a3__T_17_data = io_Q_updated;
  assign Q_s_a3__T_17_addr = state_addr[4:0];
  assign Q_s_a3__T_17_mask = 1'h1;
  assign Q_s_a3__T_17_en = _T ? 1'h0 : _GEN_63;
  assign act = io_write_data_into_a_txtfile ? io_act_read : io_act; // @[Q_table.scala 29:14]
  assign stateRead = io_write_data_into_a_txtfile ? io_state_read : io_state; // @[Q_table.scala 30:20]
  assign _T = act == 2'h0; // @[Q_table.scala 31:11]
  assign _GEN_5 = io_wrEna ? 1'h0 : 1'h1; // @[Q_table.scala 32:20]
  assign _GEN_8 = io_wrEna ? $signed(16'sh0) : $signed(Q_s_a0__T_4_data); // @[Q_table.scala 32:20]
  assign _T_5 = act == 2'h1; // @[Q_table.scala 37:17]
  assign _GEN_11 = io_wrEna ? $signed(16'sh0) : $signed(Q_s_a1__T_9_data); // @[Q_table.scala 38:20]
  assign _T_10 = act == 2'h2; // @[Q_table.scala 43:17]
  assign _GEN_14 = io_wrEna ? $signed(16'sh0) : $signed(Q_s_a1__T_14_data); // @[Q_table.scala 44:20]
  assign _T_15 = act == 2'h3; // @[Q_table.scala 49:17]
  assign _GEN_17 = io_wrEna ? $signed(16'sh0) : $signed(Q_s_a3__T_19_data); // @[Q_table.scala 50:19]
  assign _GEN_20 = _T_15 & io_wrEna; // @[Q_table.scala 49:24]
  assign _GEN_23 = _T_15 & _GEN_5; // @[Q_table.scala 49:24]
  assign _GEN_26 = _T_15 ? $signed(_GEN_17) : $signed(16'sh0); // @[Q_table.scala 49:24]
  assign _GEN_32 = _T_10 & _GEN_5; // @[Q_table.scala 43:24]
  assign _GEN_35 = _T_10 ? $signed(_GEN_14) : $signed(_GEN_26); // @[Q_table.scala 43:24]
  assign _GEN_38 = _T_10 ? 1'h0 : _GEN_20; // @[Q_table.scala 43:24]
  assign _GEN_41 = _T_10 ? 1'h0 : _GEN_23; // @[Q_table.scala 43:24]
  assign _GEN_46 = _T_5 & io_wrEna; // @[Q_table.scala 37:24]
  assign _GEN_49 = _T_5 & _GEN_5; // @[Q_table.scala 37:24]
  assign _GEN_52 = _T_5 ? $signed(_GEN_11) : $signed(_GEN_35); // @[Q_table.scala 37:24]
  assign _GEN_58 = _T_5 ? 1'h0 : _GEN_32; // @[Q_table.scala 37:24]
  assign _GEN_63 = _T_5 ? 1'h0 : _GEN_38; // @[Q_table.scala 37:24]
  assign _GEN_66 = _T_5 ? 1'h0 : _GEN_41; // @[Q_table.scala 37:24]
  assign new_state_or_state = io_get_Q_prime_max ? io_new_state : io_state; // @[Q_table.scala 58:29]
  assign io_Q_s_a = _T ? $signed(_GEN_8) : $signed(_GEN_52); // @[Q_table.scala 28:11 Q_table.scala 35:15 Q_table.scala 41:15 Q_table.scala 47:15 Q_table.scala 53:15]
  assign io_Q_prime_max = max4_io_Q_max; // @[Q_table.scala 63:17]
  assign io_action_at_Qmax = index_of_Q_max_io_action_at_Qmax; // @[Q_table.scala 70:20]
  assign max4_io_ins0 = Q_s_a0__T_21_data; // @[Q_table.scala 59:15]
  assign max4_io_ins1 = Q_s_a1__T_23_data; // @[Q_table.scala 60:15]
  assign max4_io_ins2 = Q_s_a1__T_25_data; // @[Q_table.scala 61:15]
  assign max4_io_ins3 = Q_s_a3__T_27_data; // @[Q_table.scala 62:15]
  assign index_of_Q_max_io_ins0 = Q_s_a0__T_29_data; // @[Q_table.scala 65:25]
  assign index_of_Q_max_io_ins1 = Q_s_a0__T_31_data; // @[Q_table.scala 66:25]
  assign index_of_Q_max_io_ins2 = Q_s_a0__T_33_data; // @[Q_table.scala 67:25]
  assign index_of_Q_max_io_Q_max_at_state_s = {{5{max4_io_Q_max[15]}},max4_io_Q_max}; // @[Q_table.scala 69:37]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  _RAND_0 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 25; initvar = initvar+1)
    Q_s_a0[initvar] = _RAND_0[15:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_1 = {1{`RANDOM}};
  _RAND_2 = {1{`RANDOM}};
  _RAND_3 = {1{`RANDOM}};
  _RAND_4 = {1{`RANDOM}};
  _RAND_5 = {1{`RANDOM}};
  _RAND_6 = {1{`RANDOM}};
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  Q_s_a0__T_4_en_pipe_0 = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  Q_s_a0__T_4_addr_pipe_0 = _RAND_8[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  Q_s_a0__T_21_en_pipe_0 = _RAND_9[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  Q_s_a0__T_21_addr_pipe_0 = _RAND_10[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  Q_s_a0__T_29_en_pipe_0 = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  Q_s_a0__T_29_addr_pipe_0 = _RAND_12[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  Q_s_a0__T_31_en_pipe_0 = _RAND_13[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  Q_s_a0__T_31_addr_pipe_0 = _RAND_14[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  Q_s_a0__T_33_en_pipe_0 = _RAND_15[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  Q_s_a0__T_33_addr_pipe_0 = _RAND_16[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  Q_s_a0__T_35_en_pipe_0 = _RAND_17[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  Q_s_a0__T_35_addr_pipe_0 = _RAND_18[4:0];
  `endif // RANDOMIZE_REG_INIT
  _RAND_19 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 25; initvar = initvar+1)
    Q_s_a1[initvar] = _RAND_19[15:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_20 = {1{`RANDOM}};
  _RAND_21 = {1{`RANDOM}};
  _RAND_22 = {1{`RANDOM}};
  _RAND_23 = {1{`RANDOM}};
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{`RANDOM}};
  Q_s_a1__T_9_en_pipe_0 = _RAND_24[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{`RANDOM}};
  Q_s_a1__T_9_addr_pipe_0 = _RAND_25[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {1{`RANDOM}};
  Q_s_a1__T_14_en_pipe_0 = _RAND_26[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {1{`RANDOM}};
  Q_s_a1__T_14_addr_pipe_0 = _RAND_27[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_28 = {1{`RANDOM}};
  Q_s_a1__T_23_en_pipe_0 = _RAND_28[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_29 = {1{`RANDOM}};
  Q_s_a1__T_23_addr_pipe_0 = _RAND_29[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_30 = {1{`RANDOM}};
  Q_s_a1__T_25_en_pipe_0 = _RAND_30[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_31 = {1{`RANDOM}};
  Q_s_a1__T_25_addr_pipe_0 = _RAND_31[4:0];
  `endif // RANDOMIZE_REG_INIT
  _RAND_32 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 25; initvar = initvar+1)
    Q_s_a3[initvar] = _RAND_32[15:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_33 = {1{`RANDOM}};
  _RAND_34 = {1{`RANDOM}};
  `ifdef RANDOMIZE_REG_INIT
  _RAND_35 = {1{`RANDOM}};
  Q_s_a3__T_19_en_pipe_0 = _RAND_35[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_36 = {1{`RANDOM}};
  Q_s_a3__T_19_addr_pipe_0 = _RAND_36[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_37 = {1{`RANDOM}};
  Q_s_a3__T_27_en_pipe_0 = _RAND_37[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_38 = {1{`RANDOM}};
  Q_s_a3__T_27_addr_pipe_0 = _RAND_38[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_39 = {1{`RANDOM}};
  state_addr = _RAND_39[5:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(Q_s_a0__T_2_en & Q_s_a0__T_2_mask) begin
      Q_s_a0[Q_s_a0__T_2_addr] <= Q_s_a0__T_2_data; // @[Q_table.scala 22:25]
    end
    Q_s_a0__T_4_en_pipe_0 <= _T & _GEN_5;
    if (_T & _GEN_5) begin
      Q_s_a0__T_4_addr_pipe_0 <= stateRead[4:0];
    end
    Q_s_a0__T_21_en_pipe_0 <= 1'h1;
    Q_s_a0__T_21_addr_pipe_0 <= new_state_or_state[4:0];
    Q_s_a0__T_29_en_pipe_0 <= 1'h1;
    Q_s_a0__T_29_addr_pipe_0 <= new_state_or_state[4:0];
    Q_s_a0__T_31_en_pipe_0 <= 1'h1;
    Q_s_a0__T_31_addr_pipe_0 <= new_state_or_state[4:0];
    Q_s_a0__T_33_en_pipe_0 <= 1'h1;
    Q_s_a0__T_33_addr_pipe_0 <= new_state_or_state[4:0];
    Q_s_a0__T_35_en_pipe_0 <= 1'h1;
    Q_s_a0__T_35_addr_pipe_0 <= new_state_or_state[4:0];
    if(Q_s_a1__T_7_en & Q_s_a1__T_7_mask) begin
      Q_s_a1[Q_s_a1__T_7_addr] <= Q_s_a1__T_7_data; // @[Q_table.scala 23:25]
    end
    if (_T) begin
      Q_s_a1__T_9_en_pipe_0 <= 1'h0;
    end else begin
      Q_s_a1__T_9_en_pipe_0 <= _GEN_49;
    end
    if (_T ? 1'h0 : _GEN_49) begin
      Q_s_a1__T_9_addr_pipe_0 <= stateRead[4:0];
    end
    if (_T) begin
      Q_s_a1__T_14_en_pipe_0 <= 1'h0;
    end else if (_T_5) begin
      Q_s_a1__T_14_en_pipe_0 <= 1'h0;
    end else begin
      Q_s_a1__T_14_en_pipe_0 <= _GEN_32;
    end
    if (_T ? 1'h0 : _GEN_58) begin
      Q_s_a1__T_14_addr_pipe_0 <= stateRead[4:0];
    end
    Q_s_a1__T_23_en_pipe_0 <= 1'h1;
    Q_s_a1__T_23_addr_pipe_0 <= new_state_or_state[4:0];
    Q_s_a1__T_25_en_pipe_0 <= 1'h1;
    Q_s_a1__T_25_addr_pipe_0 <= new_state_or_state[4:0];
    if(Q_s_a3__T_17_en & Q_s_a3__T_17_mask) begin
      Q_s_a3[Q_s_a3__T_17_addr] <= Q_s_a3__T_17_data; // @[Q_table.scala 25:25]
    end
    if (_T) begin
      Q_s_a3__T_19_en_pipe_0 <= 1'h0;
    end else if (_T_5) begin
      Q_s_a3__T_19_en_pipe_0 <= 1'h0;
    end else if (_T_10) begin
      Q_s_a3__T_19_en_pipe_0 <= 1'h0;
    end else begin
      Q_s_a3__T_19_en_pipe_0 <= _GEN_23;
    end
    if (_T ? 1'h0 : _GEN_66) begin
      Q_s_a3__T_19_addr_pipe_0 <= stateRead[4:0];
    end
    Q_s_a3__T_27_en_pipe_0 <= 1'h1;
    Q_s_a3__T_27_addr_pipe_0 <= new_state_or_state[4:0];
    if (reset) begin
      state_addr <= 6'h0;
    end else begin
      state_addr <= io_state;
    end
  end
endmodule
module ConfirmReward(
  input  [5:0] io_new_state,
  input  [3:0] io_step,
  output [8:0] io_reward
);
  wire  _T; // @[Blocks.scala 82:20]
  wire  _T_1; // @[Blocks.scala 83:21]
  wire  _T_2; // @[Blocks.scala 85:26]
  wire  _T_3; // @[Blocks.scala 85:48]
  wire  _T_4; // @[Blocks.scala 85:33]
  wire  _T_5; // @[Blocks.scala 85:69]
  wire  _T_6; // @[Blocks.scala 85:55]
  wire  _T_7; // @[Blocks.scala 85:91]
  wire  _T_8; // @[Blocks.scala 85:76]
  wire  _T_9; // @[Blocks.scala 85:114]
  wire  _T_10; // @[Blocks.scala 85:99]
  wire  _T_11; // @[Blocks.scala 85:137]
  wire  _T_12; // @[Blocks.scala 85:122]
  wire  _T_13; // @[Blocks.scala 85:160]
  wire  _T_14; // @[Blocks.scala 85:145]
  wire  _T_15; // @[Blocks.scala 85:183]
  wire  _T_16; // @[Blocks.scala 85:168]
  wire [8:0] _GEN_0; // @[Blocks.scala 85:192]
  wire [8:0] _GEN_1; // @[Blocks.scala 83:29]
  assign _T = io_new_state == 6'h18; // @[Blocks.scala 82:20]
  assign _T_1 = io_step == 4'he; // @[Blocks.scala 83:21]
  assign _T_2 = io_new_state == 6'h4; // @[Blocks.scala 85:26]
  assign _T_3 = io_new_state == 6'h6; // @[Blocks.scala 85:48]
  assign _T_4 = _T_2 | _T_3; // @[Blocks.scala 85:33]
  assign _T_5 = io_new_state == 6'h7; // @[Blocks.scala 85:69]
  assign _T_6 = _T_4 | _T_5; // @[Blocks.scala 85:55]
  assign _T_7 = io_new_state == 6'hd; // @[Blocks.scala 85:91]
  assign _T_8 = _T_6 | _T_7; // @[Blocks.scala 85:76]
  assign _T_9 = io_new_state == 6'h10; // @[Blocks.scala 85:114]
  assign _T_10 = _T_8 | _T_9; // @[Blocks.scala 85:99]
  assign _T_11 = io_new_state == 6'h12; // @[Blocks.scala 85:137]
  assign _T_12 = _T_10 | _T_11; // @[Blocks.scala 85:122]
  assign _T_13 = io_new_state == 6'h13; // @[Blocks.scala 85:160]
  assign _T_14 = _T_12 | _T_13; // @[Blocks.scala 85:145]
  assign _T_15 = io_new_state == 6'h15; // @[Blocks.scala 85:183]
  assign _T_16 = _T_14 | _T_15; // @[Blocks.scala 85:168]
  assign _GEN_0 = _T_16 ? $signed(-9'shc8) : $signed(9'sh0); // @[Blocks.scala 85:192]
  assign _GEN_1 = _T_1 ? $signed(-9'sh32) : $signed(_GEN_0); // @[Blocks.scala 83:29]
  assign io_reward = _T ? $signed(9'sh64) : $signed(_GEN_1); // @[Blocks.scala 82:38 Blocks.scala 84:14 Blocks.scala 85:203 Blocks.scala 87:14]
endmodule
module resetFMS(
  input   clock,
  input   reset,
  input   io_transition,
  output  io_reset
);
  reg  active_reset_fms; // @[AgentsBrain.scala 9:31]
  reg [31:0] _RAND_0;
  wire  _GEN_0; // @[AgentsBrain.scala 11:22]
  wire  _T; // @[Conditional.scala 37:30]
  wire  _GEN_1; // @[Conditional.scala 40:58]
  assign _GEN_0 = io_transition ? 1'h0 : active_reset_fms; // @[AgentsBrain.scala 11:22]
  assign _T = 1'h0 == active_reset_fms; // @[Conditional.scala 37:30]
  assign _GEN_1 = _T | _GEN_0; // @[Conditional.scala 40:58]
  assign io_reset = 1'h0 == active_reset_fms; // @[AgentsBrain.scala 10:11 AgentsBrain.scala 17:15]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  active_reset_fms = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      active_reset_fms <= 1'h0;
    end else begin
      active_reset_fms <= _GEN_1;
    end
  end
endmodule
module MasterFMS(
  input   clock,
  input   reset,
  input   io_iterate,
  input   io_done_learning,
  input   io_move_to_confirming_Reward,
  output  io_Path_found,
  output  io_cal,
  output  io_load_new_state,
  output  io_reset_Action_fms,
  output  io_get_Q_prime_max
);
  wire  reset_fms_clock; // @[AgentsBrain.scala 44:23]
  wire  reset_fms_reset; // @[AgentsBrain.scala 44:23]
  wire  reset_fms_io_transition; // @[AgentsBrain.scala 44:23]
  wire  reset_fms_io_reset; // @[AgentsBrain.scala 44:23]
  reg [2:0] master_fms; // @[AgentsBrain.scala 42:25]
  reg [31:0] _RAND_0;
  wire  _T; // @[Conditional.scala 37:30]
  wire  _GEN_1; // @[AgentsBrain.scala 54:35]
  wire  _GEN_3; // @[AgentsBrain.scala 52:23]
  wire  _T_1; // @[Conditional.scala 37:30]
  wire  _T_2; // @[Conditional.scala 37:30]
  wire  _T_3; // @[Conditional.scala 37:30]
  wire  _T_4; // @[Conditional.scala 37:30]
  wire  _GEN_8; // @[Conditional.scala 39:67]
  wire  _GEN_11; // @[Conditional.scala 39:67]
  wire  _GEN_12; // @[Conditional.scala 39:67]
  wire  _GEN_13; // @[Conditional.scala 39:67]
  wire  _GEN_15; // @[Conditional.scala 39:67]
  wire  _GEN_16; // @[Conditional.scala 39:67]
  wire  _GEN_17; // @[Conditional.scala 39:67]
  resetFMS reset_fms ( // @[AgentsBrain.scala 44:23]
    .clock(reset_fms_clock),
    .reset(reset_fms_reset),
    .io_transition(reset_fms_io_transition),
    .io_reset(reset_fms_io_reset)
  );
  assign _T = 3'h0 == master_fms; // @[Conditional.scala 37:30]
  assign _GEN_1 = io_done_learning ? 1'h0 : 1'h1; // @[AgentsBrain.scala 54:35]
  assign _GEN_3 = io_iterate ? 1'h0 : _GEN_1; // @[AgentsBrain.scala 52:23]
  assign _T_1 = 3'h1 == master_fms; // @[Conditional.scala 37:30]
  assign _T_2 = 3'h2 == master_fms; // @[Conditional.scala 37:30]
  assign _T_3 = 3'h3 == master_fms; // @[Conditional.scala 37:30]
  assign _T_4 = 3'h4 == master_fms; // @[Conditional.scala 37:30]
  assign _GEN_8 = _T_3 ? 1'h0 : _T_4; // @[Conditional.scala 39:67]
  assign _GEN_11 = _T_2 ? 1'h0 : _T_3; // @[Conditional.scala 39:67]
  assign _GEN_12 = _T_2 ? 1'h0 : _GEN_8; // @[Conditional.scala 39:67]
  assign _GEN_13 = _T_1 & reset_fms_io_reset; // @[Conditional.scala 39:67]
  assign _GEN_15 = _T_1 ? 1'h0 : _T_2; // @[Conditional.scala 39:67]
  assign _GEN_16 = _T_1 ? 1'h0 : _GEN_11; // @[Conditional.scala 39:67]
  assign _GEN_17 = _T_1 ? 1'h0 : _GEN_12; // @[Conditional.scala 39:67]
  assign io_Path_found = _T ? 1'h0 : _GEN_17; // @[AgentsBrain.scala 35:17 AgentsBrain.scala 78:20]
  assign io_cal = _T ? 1'h0 : _GEN_16; // @[AgentsBrain.scala 36:9 AgentsBrain.scala 73:13]
  assign io_load_new_state = _T ? 1'h0 : _GEN_16; // @[AgentsBrain.scala 38:20 AgentsBrain.scala 75:24]
  assign io_reset_Action_fms = _T ? 1'h0 : _GEN_13; // @[AgentsBrain.scala 47:22 AgentsBrain.scala 48:22 AgentsBrain.scala 62:26]
  assign io_get_Q_prime_max = _T ? 1'h0 : _GEN_15; // @[AgentsBrain.scala 37:21 AgentsBrain.scala 70:25]
  assign reset_fms_clock = clock;
  assign reset_fms_reset = reset;
  assign reset_fms_io_transition = _T & _GEN_3; // @[AgentsBrain.scala 46:26]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  master_fms = _RAND_0[2:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      master_fms <= 3'h0;
    end else if (_T) begin
      if (io_iterate) begin
        master_fms <= 3'h0;
      end else if (io_done_learning) begin
        master_fms <= 3'h4;
      end else begin
        master_fms <= 3'h1;
      end
    end else if (_T_1) begin
      if (io_move_to_confirming_Reward) begin
        master_fms <= 3'h2;
      end
    end else if (_T_2) begin
      master_fms <= 3'h3;
    end else if (_T_3) begin
      master_fms <= 3'h0;
    end
  end
endmodule
module sloving_maze_by_RL(
  input         clock,
  input         reset,
  input  [9:0]  io_rand1,
  input  [9:0]  io_rand2,
  output        io_Path_found,
  input  [2:0]  io_COL,
  input  [2:0]  io_ROW,
  input  [5:0]  io_state_read,
  input  [1:0]  io_act_read,
  output [20:0] io_Q_value,
  input         io_write_data_into_a_txtfile
);
  wire  agent_clock; // @[sloving_maze_by_RL.scala 15:19]
  wire  agent_reset; // @[sloving_maze_by_RL.scala 15:19]
  wire [2:0] agent_io_COL; // @[sloving_maze_by_RL.scala 15:19]
  wire [5:0] agent_io_new_state; // @[sloving_maze_by_RL.scala 15:19]
  wire  agent_io_iterate; // @[sloving_maze_by_RL.scala 15:19]
  wire [2:0] agent_io_x; // @[sloving_maze_by_RL.scala 15:19]
  wire [2:0] agent_io_y; // @[sloving_maze_by_RL.scala 15:19]
  wire [5:0] agent_io_state; // @[sloving_maze_by_RL.scala 15:19]
  wire [9:0] agent_io_episode; // @[sloving_maze_by_RL.scala 15:19]
  wire  agent_io_done_learning; // @[sloving_maze_by_RL.scala 15:19]
  wire  agent_io_load_new_state; // @[sloving_maze_by_RL.scala 15:19]
  wire [3:0] agent_io_step; // @[sloving_maze_by_RL.scala 15:19]
  wire  taking_action_clock; // @[sloving_maze_by_RL.scala 16:27]
  wire  taking_action_reset; // @[sloving_maze_by_RL.scala 16:27]
  wire [2:0] taking_action_io_x; // @[sloving_maze_by_RL.scala 16:27]
  wire [2:0] taking_action_io_y; // @[sloving_maze_by_RL.scala 16:27]
  wire [9:0] taking_action_io_rand2; // @[sloving_maze_by_RL.scala 16:27]
  wire [9:0] taking_action_io_episode; // @[sloving_maze_by_RL.scala 16:27]
  wire [5:0] taking_action_io_new_state; // @[sloving_maze_by_RL.scala 16:27]
  wire [1:0] taking_action_io_action_at_Qmax; // @[sloving_maze_by_RL.scala 16:27]
  wire [1:0] taking_action_io_act; // @[sloving_maze_by_RL.scala 16:27]
  wire  taking_action_io_reset_Action_fms; // @[sloving_maze_by_RL.scala 16:27]
  wire  taking_action_io_move_to_confirming_Reward; // @[sloving_maze_by_RL.scala 16:27]
  wire  Q_func_clock; // @[sloving_maze_by_RL.scala 17:20]
  wire  Q_func_reset; // @[sloving_maze_by_RL.scala 17:20]
  wire [15:0] Q_func_io_Q_s_a; // @[sloving_maze_by_RL.scala 17:20]
  wire [15:0] Q_func_io_Q_prime_max; // @[sloving_maze_by_RL.scala 17:20]
  wire [15:0] Q_func_io_Q_updated; // @[sloving_maze_by_RL.scala 17:20]
  wire  Q_func_io_cal; // @[sloving_maze_by_RL.scala 17:20]
  wire [8:0] Q_func_io_reward; // @[sloving_maze_by_RL.scala 17:20]
  wire  Q_func_io_wrEna; // @[sloving_maze_by_RL.scala 17:20]
  wire  Q_table_clock; // @[sloving_maze_by_RL.scala 18:21]
  wire  Q_table_reset; // @[sloving_maze_by_RL.scala 18:21]
  wire [5:0] Q_table_io_state; // @[sloving_maze_by_RL.scala 18:21]
  wire [5:0] Q_table_io_new_state; // @[sloving_maze_by_RL.scala 18:21]
  wire [1:0] Q_table_io_act; // @[sloving_maze_by_RL.scala 18:21]
  wire  Q_table_io_wrEna; // @[sloving_maze_by_RL.scala 18:21]
  wire [15:0] Q_table_io_Q_updated; // @[sloving_maze_by_RL.scala 18:21]
  wire [15:0] Q_table_io_Q_s_a; // @[sloving_maze_by_RL.scala 18:21]
  wire [15:0] Q_table_io_Q_prime_max; // @[sloving_maze_by_RL.scala 18:21]
  wire [1:0] Q_table_io_action_at_Qmax; // @[sloving_maze_by_RL.scala 18:21]
  wire  Q_table_io_get_Q_prime_max; // @[sloving_maze_by_RL.scala 18:21]
  wire  Q_table_io_write_data_into_a_txtfile; // @[sloving_maze_by_RL.scala 18:21]
  wire [1:0] Q_table_io_act_read; // @[sloving_maze_by_RL.scala 18:21]
  wire [5:0] Q_table_io_state_read; // @[sloving_maze_by_RL.scala 18:21]
  wire [5:0] Reward_io_new_state; // @[sloving_maze_by_RL.scala 19:20]
  wire [3:0] Reward_io_step; // @[sloving_maze_by_RL.scala 19:20]
  wire [8:0] Reward_io_reward; // @[sloving_maze_by_RL.scala 19:20]
  wire  masterFMS_clock; // @[sloving_maze_by_RL.scala 20:23]
  wire  masterFMS_reset; // @[sloving_maze_by_RL.scala 20:23]
  wire  masterFMS_io_iterate; // @[sloving_maze_by_RL.scala 20:23]
  wire  masterFMS_io_done_learning; // @[sloving_maze_by_RL.scala 20:23]
  wire  masterFMS_io_move_to_confirming_Reward; // @[sloving_maze_by_RL.scala 20:23]
  wire  masterFMS_io_Path_found; // @[sloving_maze_by_RL.scala 20:23]
  wire  masterFMS_io_cal; // @[sloving_maze_by_RL.scala 20:23]
  wire  masterFMS_io_load_new_state; // @[sloving_maze_by_RL.scala 20:23]
  wire  masterFMS_io_reset_Action_fms; // @[sloving_maze_by_RL.scala 20:23]
  wire  masterFMS_io_get_Q_prime_max; // @[sloving_maze_by_RL.scala 20:23]
  Agent agent ( // @[sloving_maze_by_RL.scala 15:19]
    .clock(agent_clock),
    .reset(agent_reset),
    .io_COL(agent_io_COL),
    .io_new_state(agent_io_new_state),
    .io_iterate(agent_io_iterate),
    .io_x(agent_io_x),
    .io_y(agent_io_y),
    .io_state(agent_io_state),
    .io_episode(agent_io_episode),
    .io_done_learning(agent_io_done_learning),
    .io_load_new_state(agent_io_load_new_state),
    .io_step(agent_io_step)
  );
  takingAction taking_action ( // @[sloving_maze_by_RL.scala 16:27]
    .clock(taking_action_clock),
    .reset(taking_action_reset),
    .io_x(taking_action_io_x),
    .io_y(taking_action_io_y),
    .io_rand2(taking_action_io_rand2),
    .io_episode(taking_action_io_episode),
    .io_new_state(taking_action_io_new_state),
    .io_action_at_Qmax(taking_action_io_action_at_Qmax),
    .io_act(taking_action_io_act),
    .io_reset_Action_fms(taking_action_io_reset_Action_fms),
    .io_move_to_confirming_Reward(taking_action_io_move_to_confirming_Reward)
  );
  Q_function Q_func ( // @[sloving_maze_by_RL.scala 17:20]
    .clock(Q_func_clock),
    .reset(Q_func_reset),
    .io_Q_s_a(Q_func_io_Q_s_a),
    .io_Q_prime_max(Q_func_io_Q_prime_max),
    .io_Q_updated(Q_func_io_Q_updated),
    .io_cal(Q_func_io_cal),
    .io_reward(Q_func_io_reward),
    .io_wrEna(Q_func_io_wrEna)
  );
  Qtable Q_table ( // @[sloving_maze_by_RL.scala 18:21]
    .clock(Q_table_clock),
    .reset(Q_table_reset),
    .io_state(Q_table_io_state),
    .io_new_state(Q_table_io_new_state),
    .io_act(Q_table_io_act),
    .io_wrEna(Q_table_io_wrEna),
    .io_Q_updated(Q_table_io_Q_updated),
    .io_Q_s_a(Q_table_io_Q_s_a),
    .io_Q_prime_max(Q_table_io_Q_prime_max),
    .io_action_at_Qmax(Q_table_io_action_at_Qmax),
    .io_get_Q_prime_max(Q_table_io_get_Q_prime_max),
    .io_write_data_into_a_txtfile(Q_table_io_write_data_into_a_txtfile),
    .io_act_read(Q_table_io_act_read),
    .io_state_read(Q_table_io_state_read)
  );
  ConfirmReward Reward ( // @[sloving_maze_by_RL.scala 19:20]
    .io_new_state(Reward_io_new_state),
    .io_step(Reward_io_step),
    .io_reward(Reward_io_reward)
  );
  MasterFMS masterFMS ( // @[sloving_maze_by_RL.scala 20:23]
    .clock(masterFMS_clock),
    .reset(masterFMS_reset),
    .io_iterate(masterFMS_io_iterate),
    .io_done_learning(masterFMS_io_done_learning),
    .io_move_to_confirming_Reward(masterFMS_io_move_to_confirming_Reward),
    .io_Path_found(masterFMS_io_Path_found),
    .io_cal(masterFMS_io_cal),
    .io_load_new_state(masterFMS_io_load_new_state),
    .io_reset_Action_fms(masterFMS_io_reset_Action_fms),
    .io_get_Q_prime_max(masterFMS_io_get_Q_prime_max)
  );
  assign io_Path_found = masterFMS_io_Path_found; // @[sloving_maze_by_RL.scala 58:16]
  assign io_Q_value = {{5{Q_table_io_Q_s_a[15]}},Q_table_io_Q_s_a}; // @[sloving_maze_by_RL.scala 21:13]
  assign agent_clock = clock;
  assign agent_reset = reset;
  assign agent_io_COL = io_COL; // @[sloving_maze_by_RL.scala 28:15]
  assign agent_io_new_state = taking_action_io_new_state; // @[sloving_maze_by_RL.scala 35:29]
  assign agent_io_load_new_state = masterFMS_io_load_new_state; // @[sloving_maze_by_RL.scala 57:26]
  assign taking_action_clock = clock;
  assign taking_action_reset = reset;
  assign taking_action_io_x = agent_io_x; // @[sloving_maze_by_RL.scala 31:13]
  assign taking_action_io_y = agent_io_y; // @[sloving_maze_by_RL.scala 32:13]
  assign taking_action_io_rand2 = io_rand2; // @[sloving_maze_by_RL.scala 30:11]
  assign taking_action_io_episode = agent_io_episode; // @[sloving_maze_by_RL.scala 33:19]
  assign taking_action_io_action_at_Qmax = Q_table_io_action_at_Qmax; // @[sloving_maze_by_RL.scala 38:34]
  assign taking_action_io_reset_Action_fms = masterFMS_io_reset_Action_fms; // @[sloving_maze_by_RL.scala 52:32]
  assign Q_func_clock = clock;
  assign Q_func_reset = reset;
  assign Q_func_io_Q_s_a = Q_table_io_Q_s_a; // @[sloving_maze_by_RL.scala 45:18]
  assign Q_func_io_Q_prime_max = Q_table_io_Q_prime_max; // @[sloving_maze_by_RL.scala 44:24]
  assign Q_func_io_cal = masterFMS_io_cal; // @[sloving_maze_by_RL.scala 47:16]
  assign Q_func_io_reward = Reward_io_reward; // @[sloving_maze_by_RL.scala 46:19]
  assign Q_table_clock = clock;
  assign Q_table_reset = reset;
  assign Q_table_io_state = agent_io_state; // @[sloving_maze_by_RL.scala 43:19]
  assign Q_table_io_new_state = taking_action_io_new_state; // @[sloving_maze_by_RL.scala 36:29]
  assign Q_table_io_act = taking_action_io_act; // @[sloving_maze_by_RL.scala 37:23]
  assign Q_table_io_wrEna = Q_func_io_wrEna; // @[sloving_maze_by_RL.scala 48:18]
  assign Q_table_io_Q_updated = Q_func_io_Q_updated; // @[sloving_maze_by_RL.scala 49:22]
  assign Q_table_io_get_Q_prime_max = masterFMS_io_get_Q_prime_max; // @[sloving_maze_by_RL.scala 56:31]
  assign Q_table_io_write_data_into_a_txtfile = io_write_data_into_a_txtfile; // @[sloving_maze_by_RL.scala 24:39]
  assign Q_table_io_act_read = io_act_read; // @[sloving_maze_by_RL.scala 23:22]
  assign Q_table_io_state_read = io_state_read; // @[sloving_maze_by_RL.scala 22:24]
  assign Reward_io_new_state = taking_action_io_new_state; // @[sloving_maze_by_RL.scala 40:22]
  assign Reward_io_step = agent_io_step; // @[sloving_maze_by_RL.scala 41:17]
  assign masterFMS_clock = clock;
  assign masterFMS_reset = reset;
  assign masterFMS_io_iterate = agent_io_iterate; // @[sloving_maze_by_RL.scala 54:23]
  assign masterFMS_io_done_learning = agent_io_done_learning; // @[sloving_maze_by_RL.scala 53:29]
  assign masterFMS_io_move_to_confirming_Reward = taking_action_io_move_to_confirming_Reward; // @[sloving_maze_by_RL.scala 55:41]
endmodule
