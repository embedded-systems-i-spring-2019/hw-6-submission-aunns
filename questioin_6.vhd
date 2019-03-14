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

entity question_6 is
 Port (x,clk: in std_logic;
        y:  out std_logic_vector(1 downto 0);
        z1,z2:  out std_logic );
end question_6;

architecture Behavioral of question_6 is
type state_type is (ST0,ST1,ST2,ST3);
signal PS,NS : state_type;

begin

sync_proc: process(NS,CLK)
begin

if rising_edge(CLK) then
    PS <= NS;
end if;

end process;

    comb_proc: process(PS,x)
    begin
    z1 <= '0'; 
    z2<='0';    -- pre-assign FSM outputs
    case PS is
    when ST0 => -- items regarding state ST0
     z1<= '1'; -- Mealy output always 0
    if (x = '1') then NS <= ST0;   z2<='0';
    else NS <= ST2; z2<='0';
    end if;
    when ST1 => -- items regarding state ST1
     z1<='0';   -- Mealy output always 0
    if (x = '1') then NS <= ST1; z2<='0';
    else NS <= ST3; z2<='0';
    end if;
    when ST2 => -- items regarding state ST2
    z1<='1';    -- Mealy output handled in the if statement
    if (x = '1') then NS <= ST0; Z2 <= '0';
    else NS <= ST1; Z2 <= '0';
    end if;
    
    when ST3 => -- items regarding state ST2
    z1<='0';    -- Mealy output handled in the if statement
    if (x = '1') then NS <= ST1; Z2 <= '0';
    else NS <= ST0; Z2 <= '1';
    end if;
    when others => -- the catch all condition
    Z1 <= '1';z2<='1'; NS <= ST0;
    end case;
    end process comb_proc;
with PS select
Y <= "00" when ST0,
"01" when ST1,
"10" when ST2,
"11" when ST3,
"00" when others;

end Behavioral;
