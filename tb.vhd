  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;

  ENTITY testbench IS
  END testbench;

  ARCHITECTURE fi OF testbench IS 

          COMPONENT FIFO
          PORT(In_Data: IN std_logic_vector(7 DOWNTO 0);
               Out_Data: OUT std_logic_vector(7 DOWNTO 0);
               RST, EN, CLK: IN std_logic);
          END COMPONENT;

          CONSTANT period : TIME := 50 ns;
			    signal CLK : STD_LOGIC := '0';
			    signal RST,EN: STD_LOGIC;
			    signal In_Data,Out_Data :STD_LOGIC_VECTOR (7 DOWNTO 0);
          

  BEGIN

    run : FIFO port map (In_Data,Out_Data,RST, EN, CLK);


    CLK <= NOT clk AFTER period/2;
    
    RST <= '1',
    '0' AFTER 55 ns,
    '1' AFTER 390 ns,
    '0' AFTER 394 ns;
    
    EN  <= '0',
    '1' AFTER 60 ns,
    '0' AFTER 390 ns,
    '1' AFTER 395 ns,
    '0' AFTER 600 ns;
    
    In_Data <= X"30",
    X"21" AFTER 50 ns,
    X"A3" AFTER 140 ns,
    X"91" AFTER 248 ns,
    X"11" AFTER 253 ns,
    X"B0" AFTER 301 ns,
    X"FF" AFTER 360 ns;
 

  END;


