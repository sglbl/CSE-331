library verilog;
use verilog.vl_types.all;
entity cypher_detect is
    port(
        cypher          : in     vl_logic_vector(15 downto 0);
        read_input_from : in     vl_logic_vector(3 downto 0);
        read_input      : in     vl_logic;
        reset           : in     vl_logic;
        clk             : in     vl_logic;
        collected_signal: out    vl_logic;
        result          : out    vl_logic_vector(7 downto 0)
    );
end cypher_detect;
