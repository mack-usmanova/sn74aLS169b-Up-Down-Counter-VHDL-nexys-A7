----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/23/2025 04:45:20 PM
-- Design Name: 
-- Module Name: bitcounter - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bitcounter is
  Port ( 
  LOAD, clk, UpD,ENP, ENT: in std_logic;
  A: in unsigned(3 downto 0);
  Q: out unsigned(3 downto 0);
  RCO: out std_logic
  );
end bitcounter;

architecture Behavioral of bitcounter is
signal sigQ: unsigned(3 downto 0):="0000";
begin
process 
begin
wait until clk'event and clk = '1';  
RCO <= '1';
    if LOAD = '0' then 
        sigQ <= A;
    elsif (enp = '0' and ent = '0') then  
        if upd = '1' then 
            if sigq = "1110" then 
                RCO <= '0';
                sigQ <= "1111";
            else
                RCO <= '1';
                sigQ <= sigQ + 1;
            end if;
        else 
            if sigQ = "0001" then 
                RCO <= '0';
                sigQ <= "0000";
            else
                RCO <= '1';
                sigQ <= sigQ - 1;
            end if;
        end if;
    else 
        wait until (enp = '0' and ent = '0');      
    end if;
end process;

process(sigQ)
begin
    Q <= sigq;
end process;                

end Behavioral;
