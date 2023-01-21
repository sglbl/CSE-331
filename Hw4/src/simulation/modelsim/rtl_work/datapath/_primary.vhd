library verilog;
use verilog.vl_types.all;
entity datapath is
    port(
        wr_result       : in     vl_logic;
        wr_cmatch       : in     vl_logic;
        sl_cmatch       : in     vl_logic;
        sl_input        : in     vl_logic;
        cypher          : in     vl_logic_vector(15 downto 0);
        read_input_from : in     vl_logic_vector(3 downto 0);
        read_input      : in     vl_logic;
        clk             : in     vl_logic;
        matched         : out    vl_logic;
        collected_signal: out    vl_logic;
        stop            : out    vl_logic;
        result          : out    vl_logic_vector(7 downto 0)
    );
end datapath;
