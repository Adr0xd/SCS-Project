LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- CORDIC core with z = 30 degrees.
-- The core starts from x0 = 1/K and y0 = 0 internally (INV_K in cordic_core).
ENTITY tb_cordic_core_30 IS
END tb_cordic_core_30;

ARCHITECTURE sim OF tb_cordic_core_30 IS
    SIGNAL clk : STD_LOGIC := '0';
    SIGNAL rst, en, valid_in, valid_out : STD_LOGIC := '0';
    SIGNAL z_in : STD_LOGIC_VECTOR(45 DOWNTO 0) := (OTHERS => '0');
    SIGNAL x_out, y_out, z_out : STD_LOGIC_VECTOR(45 DOWNTO 0);
    SIGNAL side_in, side_out : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
BEGIN

    clk <= NOT clk AFTER 5 ns;

    dut : ENTITY work.cordic_core
        PORT MAP(clk, rst, en, z_in, valid_in, side_in,
                 x_out, y_out, z_out, valid_out, side_out);

    PROCESS
    BEGIN
        rst <= '1';
        WAIT FOR 20 ns;
        rst <= '0';
        en <= '1';

        -- 30 deg = 1/3 quarter turn = 2^44 / 3
        z_in <= 46x"055555555555";
        valid_in <= '1';
        WAIT FOR 10 ns;
        valid_in <= '0';

        WAIT;
    END PROCESS;

END sim;