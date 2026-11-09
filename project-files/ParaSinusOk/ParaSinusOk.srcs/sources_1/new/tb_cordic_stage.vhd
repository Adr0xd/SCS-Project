LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_cordic_stage IS
END tb_cordic_stage;

ARCHITECTURE sim OF tb_cordic_stage IS
    SIGNAL clk : STD_LOGIC := '0';
    SIGNAL rst, en, valid_in, valid_out : STD_LOGIC := '0';
    SIGNAL x_in, y_in, z_in : STD_LOGIC_VECTOR(45 DOWNTO 0) := (OTHERS => '0');
    SIGNAL x_out, y_out, z_out : STD_LOGIC_VECTOR(45 DOWNTO 0);
    SIGNAL side_in, side_out : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
BEGIN

    clk <= NOT clk AFTER 5 ns;

    dut : ENTITY work.cordic_stage
        GENERIC MAP(I => 1, ALPHA => 46x"3E8") -- angle = 1000
        PORT MAP(clk, rst, en, x_in, y_in, z_in, valid_in, side_in,
                 x_out, y_out, z_out, valid_out, side_out);

    PROCESS
    BEGIN
        rst <= '1';
        WAIT FOR 20 ns;
        rst <= '0';
        en <= '1';
        valid_in <= '1';

        -- z >= 0: x = 1.0, y = 0, z = 5000
        x_in <= 46x"100000000000";
        y_in <= 46x"0";
        z_in <= 46x"1388";
        WAIT FOR 20 ns;

        -- z < 0: x = 1.0, y = 1.0, z = -5000
        x_in <= 46x"100000000000";
        y_in <= 46x"100000000000";
        z_in <= 46x"3FFFFFFFEC78";
        WAIT FOR 20 ns;

        WAIT;
    END PROCESS;

END sim;