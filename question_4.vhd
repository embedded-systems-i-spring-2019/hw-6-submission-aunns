----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/13/2019 11:07:22 PM
-- Design Name: 
-- Module Name: question_4 - Behavioral
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

entity question_4 is
 Port (x1,x2,clk,init: in std_logic;
        y:  out std_logic_vector(1 downto 0);
        z:  out std_logic );
end question_4;

architecture Behavioral of question_4 is
type state_type is (ST0,ST1,ST2);
signal PS,NS : state_type;

begin

sync_proc: process(CLK,NS,init)
begin
if (init = '1') then
PS <= ST0;
elsif (rising_edge(CLK)) then
PS <= NS;
end if;
end process sync_proc;


    comb_proc: process(PS,x1,x2)
    begin
    z <= '0'; -- pre-assign FSM outputs
    case PS is
    when ST0 => -- items regarding state ST0
     z<= '0'; -- Mealy output always 0
    if (x1 = '1') then NS <= ST1; z<='1';
    else NS <= ST2; z<='0';
    end if;
    when ST1 => -- items regarding state ST1
     -- Mealy output always 0
    if (x2 = '1') then NS <= ST0; z<='0';
    else NS <= ST2; z<='0';
    end if;
    when ST2 => -- items regarding state ST2
    -- Mealy output handled in the if statement
    if (x1 = '0') then NS <= ST0; Z <= '1';
    else NS <= ST1; Z <= '1';
    end if;
    when others => -- the catch all condition
    Z <= '1'; NS <= ST0;
    end case;
    end process comb_proc;
with PS select
Y <= "00" when ST0,
"10" when ST1,
"11" when ST2,
"00" when others;

end Behavioral;
