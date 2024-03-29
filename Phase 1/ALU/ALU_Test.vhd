--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:06:54 03/21/2022
-- Design Name:   
-- Module Name:   C:/Users/Nick-PC/Documents/VHDL/HRY302-Phase01/ALU_Test.vhd
-- Project Name:  HRY302-Phase01
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ALU_Test IS
END ALU_Test;
 
ARCHITECTURE behavior OF ALU_Test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         Op : IN  std_logic_vector(3 downto 0);
         Output : OUT  std_logic_vector(31 downto 0);
         Zero : OUT  std_logic;
         Cout : OUT  std_logic;
         Ovf : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');
   signal Op : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Output : std_logic_vector(31 downto 0);
   signal Zero : std_logic;
   signal Cout : std_logic;
   signal Ovf : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          A => A, 
          B => B,
          Op => Op,
          Output => Output,
          Zero => Zero,
          Cout => Cout,
          Ovf => Ovf
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process; 
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
     	A<="10000000000000000000000000000001"; --Checking AND operation
		B<="10000000000010000000000000000001";
		Op<="0010";
      wait for 50 ns;
	  
	   A<="10000000000000000000000000000001";	--Checking OR operation
		B<="10000000000010000000000000000001";
		Op<="0011";
      wait for 50 ns;

	   A<="10000000000000000000000000000001"; --Checking NOT operation
		B<="10000000000010000000000000000001";
		Op<="0100";
      wait for 50 ns;
		
		A<="10000000000000000000000000000001";	--Checking NAND operation
		B<="10000000000010000000000000000001";
		Op<="0101";
		wait for 50 ns;
		
		A<="10000000000000000000000000000001";	--Checking NOR operation
		B<="10000000000010000000000000000001";
		Op<="0110";
		wait for 50 ns;
		
		A<="10000000000000000000000000000001";	--Checking RightNumericShift operation
		Op<="1000";
		wait for 50 ns;
		
		A<="10000000000000000000000000000001";	--Checking RightLogicShift operation
		Op<="1001";
		wait for 50 ns;
		
		A<="10000000000000000000000000000001";	--Checking LeftLogicShift operation
		Op<="1010";
		wait for 50 ns;
		
		A<="10000000000000000000000000000001";	--Checking RotateLeft operation
		Op<="1100";
		wait for 50 ns;
		
		A<="10000000000000000000000000000001";	--Checking RotateRight operation
		Op<="1101";
		wait for 50 ns;
		
		A<="10000000000000000000000000000000";	--Checking Zero Signal operation
		Op<="1010";
		wait for 50 ns;
		
		A<="00000000000000000000000000000100";	--Checking Simple Addition operation
		B<="00000000000000000000000000000100";
		Op<="0000";
		wait for 50 ns;
		
		A<="01000000000000000000000000000100";	--Checking OVERFLOW signal with Addition
		B<="01000000000000000000000000000100";
		Op<="0000";
		wait for 50 ns;
		
		A<="10000000000000000000000000000000";
		B<="10000000000000000000000000000000";
		Op<="0000";		
		wait for 50 ns;
		
		A<="00000000000000000000000000000100";	--Checking Subtraction operation
		B<="00000000000000000000000000000010";
		Op<="0001";
		wait for 50 ns;
		
		A<="00000000000000000000000000001000";
		B<="00000000000000000000000000010100";
		Op<="0001";
      wait for 50 ns;
		
		A<="01000000000000000000000000000100";	--Checking OVERFLOW signal with Subtraction
		B<="10111111111111111111111111111111";
		Op<="0001";
		wait for 50 ns;
		
		A<="10000000000000000000000000000000";
		B<="01111111111111111111111111111111";
		Op<="0001";
		wait for 50 ns;
		
		A<="00000000000000000000000000000010";	--Checking Subtraction operation
		B<="00000000000000000000000000000010";
		Op<="0001";
		wait for 50 ns;
		
		A<="00000000000000000000000000000001";	--Checking RightLogicShift operation
		Op<="1001";
		wait for 50 ns;
		
		--All working fine!
		
      --wait for <clock>_period*10;
      -- insert stimulus here 
      wait;
   end process;

END;
