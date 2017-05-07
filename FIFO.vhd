LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_signed.all;


ENTITY FIFO IS
PORT ( In_Data: IN std_logic_vector(7 DOWNTO 0);
       Out_Data: OUT std_logic_vector(7 DOWNTO 0);
       RST, EN, CLK: IN std_logic);
END FIFO;

architecture fo of FIFO is
  type block_type is array (0 to 3) of STD_LOGIC_VECTOR(7 downto 0);
  signal MyBlock : block_type;
  signal temp : std_logic_vector(7 DOWNTO 0);
begin
  Out_Data   <= temp;
  MyBlock(0) <= X"00" when (RST ='1') else
                In_Data when (EN ='1' and CLK ='1' and CLK'event)else
                MyBlock(0);
                
  MyBlock(1) <= X"00" when (RST ='1') else
                MyBlock(0)when (EN ='1' and CLK ='1' and CLK'event)else
                MyBlock(1);
                
  MyBlock(2) <= X"00" when (RST ='1') else
                MyBlock(1)when (EN ='1' and CLK ='1' and CLK'event)else
                Myblock(2);
  
  MyBlock(3) <= X"00" when (RST ='1') else 
                MyBlock(2)when (EN ='1' and CLK ='1' and CLK'event)else            
                MyBlock(3);
  
  temp       <= MyBlock(3)when (EN ='1' and CLK ='1' and CLK'event)else
                temp;
    
end fo;
