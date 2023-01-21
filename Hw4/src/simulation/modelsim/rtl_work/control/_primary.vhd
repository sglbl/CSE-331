library verilog;
use verilog.vl_types.all;
entity control is
    port(
        wr_result       : out    vl_logic;
        wr_cmatch       : out    vl_logic;
        sl_cmatch       : out    vl_logic;
        sl_input        : out    vl_logic;
        read_input      : in     vl_logic;
        matched         : in     vl_logic;
        stop            : in     vl_logic;
        clk             : in     vl_logic;
        reset           : in     vl_logic
    );
end control;
