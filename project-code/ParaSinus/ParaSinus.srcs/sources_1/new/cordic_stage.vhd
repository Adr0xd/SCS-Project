----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/07/2026 10:30:18 AM
-- Design Name: 
-- Module Name: cordic_stage - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY cordic_stage IS
    GENERIC (
        I : NATURAL := 1;
        ALPHA : signed(45 DOWNTO 0)
    );
    PORT (
        clk : IN STD_LOGIC;
        rst : IN STD_LOGIC;
        en : IN STD_LOGIC;
        x_i : IN signed(45 DOWNTO 0);
        y_i : IN signed(45 DOWNTO 0);
        z_i : IN signed(45 DOWNTO 0);
        valid_in : IN STD_LOGIC;

        -- 7 = sign_r;
        -- 6 = sign_x;
        -- 5:4 = kmod4;
        -- 3:1 = input_cls
        -- 0: stall  
        side_info_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);

        x_i_plus_one : OUT signed(45 DOWNTO 0);
        y_i_plus_one : OUT signed(45 DOWNTO 0);
        z_i_plus_one : OUT signed(45 DOWNTO 0);

        valid_out : OUT STD_LOGIC;
        side_info_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)

    );
END cordic_stage;

ARCHITECTURE Behavioral OF cordic_stage IS

BEGIN

    PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            IF rst = '1' THEN
                valid_out <= '0';
            ELSIF en = '1' THEN
                IF z_i(45) = '0' THEN
                    x_i_plus_one <= x_i - shift_right(y_i, I);
                    y_i_plus_one <= y_i + shift_right(x_i, I);
                    z_i_plus_one <= z_i - ALPHA;
                ELSE
                    x_i_plus_one <= x_i + shift_right(y_i, I);
                    y_i_plus_one <= y_i - shift_right(x_i, I);
                    z_i_plus_one <= z_i + ALPHA;
                END IF;
                valid_out <= valid_in;
                side_info_out <= side_info_in;
            END IF;
        END IF;
    END PROCESS;
END Behavioral;