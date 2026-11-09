LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_classification_reduction_unit IS
END tb_classification_reduction_unit;

ARCHITECTURE sim OF tb_classification_reduction_unit IS
    SIGNAL clk : STD_LOGIC := '0';
    SIGNAL rst, en, valid_in, valid_out : STD_LOGIC := '0';
    SIGNAL x_in, x_out : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
    SIGNAL side_out : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL z_out : STD_LOGIC_VECTOR(45 DOWNTO 0);
    SIGNAL rsmall_out : STD_LOGIC_VECTOR(47 DOWNTO 0);
BEGIN

    clk <= NOT clk AFTER 5 ns;

    dut : ENTITY work.classification_reduction_unit
        PORT MAP(clk, rst, en, x_in, valid_in,
                 side_out, x_out, z_out, rsmall_out, valid_out);

    PROCESS
    BEGIN
        rst <= '1';
        WAIT FOR 20 ns;
        rst <= '0';
        en <= '1';
        valid_in <= '1';

        x_in <= x"3F800000"; -- 1.0
        WAIT FOR 10 ns;
        x_in <= x"447A0000"; -- 1000.0
        WAIT FOR 10 ns;
        x_in <= x"43B18000"; -- 355.0 (very small r -> small flag)
        WAIT FOR 10 ns;
        x_in <= x"7149F2CA"; -- about 1e30
        WAIT FOR 10 ns;
        x_in <= x"00000000"; -- zero
        WAIT FOR 10 ns;
        x_in <= x"35800000"; -- 2^-20, tiny
        WAIT FOR 10 ns;
        x_in <= x"7FC00000"; -- NaN
        WAIT FOR 10 ns;

        valid_in <= '0';
        WAIT;
    END PROCESS;

END sim;
