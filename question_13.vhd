----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/13/2019 11:07:22 PM
-- Design Name: 
-- Module Name: question_2 - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity question_13 is
 Port (x1,x2,clk: in std_logic;
        y:  out std_logic_vector(2 downto 0);
        cs,rd:  out std_logic );
end question_13;

architecture Behavioral of question_13 is
type state_type is (ST0,ST1,ST2,ST3);
signal PS,NS : state_type;

begin

sync_proc: process(NS,CLK)
begin

if rising_edge(CLK) then
    PS <= NS;
end if;

end process;

    comb_proc: process(PS,x1,x2)
    begin
    cs <= '0'; 
    rd<='0';    -- pre-assign FSM outputs
    case PS is
    when ST0 => -- items regarding state ST0
     
    if (x1 = '0') then NS <= ST1;   cs<='0'; rd<='1';
    else NS <= ST2; cs<='1';    rd<='0';
    end if;
    when ST1 => -- items regarding state ST1
        -- Mealy output always 0
     NS <= ST2; cs<='1'; rd<='1';
    
    
    when ST2 => -- items regarding state ST2
      -- Mealy output handled in the if statement
    if (x2 = '1') then NS <= ST2; cs <= '0'; rd<='1';
    else NS <= ST0; cs <= '0'; rd<='0';
    end if;
    
    
   
    when others => -- the catch all condition
    cs <= '1'; rd<='1'; NS <= ST0;
    end case;
    end process comb_proc;
with PS select
Y <= "001" when ST0,
"010" when ST1,
"100" when ST2,
"000" when others;

end Behavioral;
