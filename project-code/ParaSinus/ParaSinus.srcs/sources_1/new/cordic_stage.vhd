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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std .all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cordic_stage is
  Generic(I: natural := 1;
          ALPHA: signed(45 downto 0)
          );
  Port (clk: in std_logic;
        en: in std_logic;
        x_i: in signed(45 downto 0);
        y_i: in signed(45 downto 0);
        z_i: in signed(45 downto 0);
        valid: in std_logic;
        
        -- 7 = sign_r;
        -- 6 = sign_x;
        -- 5:4 = kmod4;
        -- 3:1 = input_cls
        -- 0: stall  
        side_info: in std_logic_vector(7 downto 0);
       
        x_i_plus_one: out signed(45 downto 0);
        y_i_plus_one: out signed(45 downto 0);
        z_i_plus_one: out signed(45 downto 0);
        
        valid_out: out std_logic;
        side_info_out: out std_logic_vector(7 downto 0)
        
   );
end cordic_stage;

architecture Behavioral of cordic_stage is

begin

    process(clk)
    begin
        if rising_edge(clk) then
            if en = 
        end if;
    
    end process;


end Behavioral;
