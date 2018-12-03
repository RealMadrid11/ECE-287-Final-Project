--------------------------------------------------------------------------------
--
--   FileName:         hw_image_generator.vhd
--   Dependencies:     none
--   Design Software:  Quartus II 64-bit Version 12.1 Build 177 SJ Full Version
--
--   HDL CODE IS PROVIDED "AS IS."  DIGI-KEY EXPRESSLY DISCLAIMS ANY
--   WARRANTY OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING BUT NOT
--   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
--   PARTICULAR PURPOSE, OR NON-INFRINGEMENT. IN NO EVENT SHALL DIGI-KEY
--   BE LIABLE FOR ANY INCIDENTAL, SPECIAL, INDIRECT OR CONSEQUENTIAL
--   DAMAGES, LOST PROFITS OR LOST DATA, HARM TO YOUR EQUIPMENT, COST OF
--   PROCUREMENT OF SUBSTITUTE GOODS, TECHNOLOGY OR SERVICES, ANY CLAIMS
--   BY THIRD PARTIES (INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF),
--   ANY CLAIMS FOR INDEMNITY OR CONTRIBUTION, OR OTHER SIMILAR COSTS.
--
--   Version History
--   Version 1.0 05/10/2013 Scott Larson
--     Initial Public Release
--    
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY hw_image_generator IS
	GENERIC(
		pixels_y :	INTEGER := 333;    --row that first color will persist until
		pixels_x	:	INTEGER := 333;
		pixels_w :  INTEGER := 666;
	   pixels_z :  INTEGER := 666;
		pixels_1 :  INTEGER := 999;
		pixels_2 :  INTEGER := 999;
		pixels_3 :  INTEGER := 666;
		pixels_4 :  INTEGER := 333;
		pixels_5 :  INTEGER := 999;
		pixels_6 :  INTEGER := 333;
		pixels_7 :  INTEGER := 333;
		pixels_8 :  INTEGER := 999);  
	PORT(
		disp_ena		:	IN		STD_LOGIC;	--display enable ('1' = display time, '0' = blanking time)
		row			:	IN		INTEGER;		--row pixel coordinate
		column		:	IN		INTEGER;		--column pixel coordinate
		sw0         :  IN    STD_LOGIC;
		sw1         :  IN    STD_LOGIC;
		sw2         :  IN    STD_LOGIC;
		sw3         :  IN    STD_LOGIC;
		sw4         :  IN    STD_LOGIC;
		sw5         :  IN    STD_LOGIC;
		sw6         :  IN    STD_LOGIC;
		sw7         :  IN    STD_LOGIC;
		sw8         :  IN    STD_LOGIC;
		sw9         :  IN    STD_LOGIC;
		sw10         :  IN    STD_LOGIC;
		sw11         :  IN    STD_LOGIC;
		sw12         :  IN    STD_LOGIC;
		sw13         :  IN    STD_LOGIC;
		sw14         :  IN    STD_LOGIC;
		sw15         :  IN    STD_LOGIC;
		sw16         :  IN    STD_LOGIC;
		sw17         :  IN    STD_LOGIC;
		red			:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');  --red magnitude output to DAC
		green			:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');  --green magnitude output to DAC
		blue			:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0')); --blue magnitude output to DAC
END hw_image_generator;

ARCHITECTURE behavior OF hw_image_generator IS
BEGIN
	PROCESS(disp_ena, row, column)
	BEGIN
    IF(disp_ena = '1')   THEN	
		IF( row < pixels_y AND column < pixels_x) THEN -- (1,1)
				red <= (OTHERS => '0');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '1');
			 if ( sw0 = '1' ) THEN 
				IF( row < pixels_y AND column < pixels_x) THEN
					red <= (OTHERS => '1');
					green	<= (OTHERS => '0');
					blue <= (OTHERS => '0');
				end if;
			 elsif ( sw17 = '1' ) THEN 
				IF( row < pixels_y AND column < pixels_x) THEN
					red <= (OTHERS => '0');
					green	<= (OTHERS => '1');
					blue <= (OTHERS => '0');
				end if;
			end if;	
				
			ELSIF( row < 1600 AND row > 1200 AND column < 800 AND column > 400) THEN -- (1,1)
				red <= (OTHERS => '0');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '1');
			  if ( (sw0 = '1' AND sw1 = '1' AND sw2 = '1') OR (sw0 = '1' AND sw4 = '1' AND sw8 = '1') OR (sw0 = '1' AND sw3 = '1' AND sw6 = '1') OR ( sw1 = '1' AND sw4 = '1' AND sw7 = '1') OR (sw2 = '1' AND sw5 = '1' AND sw8 = '1') OR (sw3 = '1' AND sw4 ='1' AND sw5 = '1') OR (sw6 ='1' AND sw7 ='1' AND sw8 = '1') OR (sw2 = '1' AND sw4 = '1' AND sw6 = '1')) THEN
			     if(row < 1600 AND row > 1200 AND column < 800 AND column > 400) Then 
				   red <= (OTHERS => '1');
					green <= (OTHERS => '0');
					blue <= (OTHERS => '0');
			     end if;
				elsif( ( sw17 = '1' AND sw16 = '1' AND sw15 = '1') OR ( sw14 = '1' AND sw13 = '1' AND sw12 = '1') OR (sw11 = '1' AND sw10 = '1' AND sw9 = '1') OR (sw17 = '1' AND sw14 = '1' AND sw11 = '1') OR (sw16 = '1' AND sw13 = '1' AND sw10 = '1') OR (sw15 = '1' AND sw12 = '1' AND sw9 = '1') OR (sw17 = '1' AND sw13 = '1' AND sw9 = '1') OR (sw15 = '1' AND sw13 = '1' AND sw11= '1')) Then
				if(row < 1600 AND row > 1200 AND column < 800 AND column > 400) Then 
				   red <= (OTHERS => '0');
					green <= (OTHERS => '1');
					blue <= (OTHERS => '0');
				end if;
			end if; 
			
			ElsIF(row < pixels_w AND column < pixels_z AND row > 333 AND column > 333) THEN -- (2,2)
				red <= (OTHERS => '0');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '1');
				if ( sw4 = '1' ) THEN 
				IF(row < pixels_w AND column < pixels_z AND row > 333 AND column > 333) THEN
					red <= (OTHERS => '1');
					green	<= (OTHERS => '0');
					blue <= (OTHERS => '0');
				end if;
			 elsif ( sw13 = '1' ) THEN 
				IF( row < pixels_w AND column < pixels_z AND row > 333 AND column > 333) THEN
					red <= (OTHERS => '0');
					green	<= (OTHERS => '1');
					blue <= (OTHERS => '0');
				end if;
			end if;	
			
			ElsIF(row < pixels_1 AND column < pixels_2 AND row > 666 AND column > 666) THEN-- (3,3)
				red <= (OTHERS => '0');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '1');
				if ( sw8 = '1' ) THEN 
				IF(row < pixels_1 AND column < pixels_2 AND row > 666 AND column > 666) THEN
					red <= (OTHERS => '1');
					green	<= (OTHERS => '0');
					blue <= (OTHERS => '0');
				end if;
			 elsif ( sw9 = '1' ) THEN 
				IF( row < pixels_1 AND column < pixels_2 AND row > 666 AND column > 666) THEN
					red <= (OTHERS => '0');
					green	<= (OTHERS => '1');
					blue <= (OTHERS => '0');
				end if;
			end if;	
				
			ElsIF(row < pixels_3 AND column < pixels_4 AND row > 333) THEN-- (2,1)
				red <= (OTHERS => '0');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '1');
				if ( sw3 = '1' ) THEN 
				IF(row < pixels_3 AND column < pixels_4 AND row > 333) THEN
					red <= (OTHERS => '1');
					green	<= (OTHERS => '0');
					blue <= (OTHERS => '0');
				end if;
			 elsif ( sw14 = '1' ) THEN 
				IF( row < pixels_3 AND column < pixels_4 AND row > 333) THEN
					red <= (OTHERS => '0');
					green	<= (OTHERS => '1');
					blue <= (OTHERS => '0');
				end if;
			end if;	
				
			ElsIF(row < pixels_5 AND column < pixels_6 AND row > 666) THEN-- (3,1)
				red <= (OTHERS => '0');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '1');
					if ( sw6 = '1' ) THEN 
				IF(row < pixels_5 AND column < pixels_6 AND row > 666) THEN
					red <= (OTHERS => '1');
					green	<= (OTHERS => '0');
					blue <= (OTHERS => '0');
				end if;
			 elsif ( sw11 = '1' ) THEN 
				IF( row < pixels_5 AND column < pixels_6 AND row > 666) THEN
					red <= (OTHERS => '0');
					green	<= (OTHERS => '1');
					blue <= (OTHERS => '0');
				end if;
			end if;
			ElsIF(row < pixels_7 AND column < pixels_8 AND column > 666) THEN-- (1,3)
				red <= (OTHERS => '0');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '1');
					if ( sw2 = '1' ) THEN 
				IF(row < pixels_7 AND column < pixels_8 AND column > 666) THEN
					red <= (OTHERS => '1');
					green	<= (OTHERS => '0');
					blue <= (OTHERS => '0');
				end if;
			 elsif ( sw15 = '1' ) THEN 
				IF( row < pixels_7 AND column < pixels_8 AND column > 666) THEN
					red <= (OTHERS => '0');
					green	<= (OTHERS => '1');
					blue <= (OTHERS => '0');
				end if;
			end if;
			ElsIF(row < 333 AND column < 666 AND column > 333) THEN-- (1,2)
				red <= (OTHERS => '0');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '1');
				if ( sw1 = '1' ) THEN 
				IF(row < 333 AND column < 666 AND column > 333) THEN
					red <= (OTHERS => '1');
					green	<= (OTHERS => '0');
					blue <= (OTHERS => '0');
				end if;
			 elsif ( sw16 = '1' ) THEN 
				IF( row < 333 AND column < 666 AND column > 333) THEN
					red <= (OTHERS => '0');
					green	<= (OTHERS => '1');
					blue <= (OTHERS => '0');
				end if;
			end if;
			ElsIF(row < 666 AND column < 999 AND column > 666 AND row > 333) THEN-- (2,3)
				red <= (OTHERS => '0');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '1');
				if ( sw5 = '1' ) THEN 
				IF(row < 666 AND column < 999 AND column > 666 AND row > 333) THEN
					red <= (OTHERS => '1');
					green	<= (OTHERS => '0');
					blue <= (OTHERS => '0');
				end if;
			 elsif ( sw12 = '1' ) THEN 
				IF( row < 666 AND column < 999 AND column > 666 AND row > 333) THEN
					red <= (OTHERS => '0');
					green	<= (OTHERS => '1');
					blue <= (OTHERS => '0');
				end if;
			end if;
			ElsIF(row < 999 AND column < 666 AND column > 333 AND row > 666) THEN-- (1,3)
				red <= (OTHERS => '0');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '1');
			 if ( sw7 = '1' ) THEN 
				IF(row < 999 AND column < 666 AND column > 333 AND row > 666) THEN
					red <= (OTHERS => '1');
					green	<= (OTHERS => '0');
					blue <= (OTHERS => '0');
				end if;
			 elsif ( sw10 = '1' ) THEN 
				IF( row < 999 AND column < 666 AND column > 333 AND row > 666) THEN
					red <= (OTHERS => '0');
					green	<= (OTHERS => '1');
					blue <= (OTHERS => '0');
				end if;
			end if;	
--			  IF ( (sw0 = '1' AND sw1 = '1' AND sw2 = '1') OR (sw0 = '1' AND sw4 = '1' AND sw8 = '1') OR (sw0 = '1' AND sw3 = '1' AND sw6 = '1') OR ( sw1 = '1' AND sw4 = '1' AND sw7 = '1') OR (sw2 = '1' AND sw5 = '1' AND sw8 = '1') OR (sw3 = '1' AND sw4 ='1' AND sw5 = '1') OR (sw6 ='1' AND sw7 ='1' AND sw8 = '1') OR (sw2 = '1' AND sw4 = '1' AND sw6 = '1')) THEN
--			     
--				  red <= (OTHERS => '0');
--					green <= (OTHERS => '1');
--					blue <= (OTHERS => '1');
--			 END IF;
			  ELSE                           --blanking time
					red <= (OTHERS => '0');
					green <= (OTHERS => '0');
					blue <= (OTHERS => '0');
				 END IF;
	
		END IF;
	
	END PROCESS;		
END behavior;