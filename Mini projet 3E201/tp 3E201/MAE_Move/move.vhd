----------------------------------------------------------------------------------
-- Company: UPMC
-- STUDENTS: Mouhamadou Ndoye & Aminata Diop
-- MAE MOVE : génération des commandes Rot_Lef et Rot_Right--
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Move is
   port(  clk25, Reset: in std_logic; -- Horloge Reset
	  QA, QB: in std_logic; -- Entrees MAE
          Rot_Left, Rot_Right:  out std_logic); --commandes de déplacement
end Move;

architecture archiMove of Move is

-- Type etat
type etat is (U0,U1,U2,U3,U4,U5);

-- Registre d'etat
signal pres,fut: etat;

begin

-- Gestion du MAE move
   process(clk25, Reset)
   begin        
	if Reset='0' then pres<=U0;
	elsif rising_edge(clk25) then pres <= fut;
	end if;

   end process;

-- Process Combinatoire Etats
   process(pres,QA,QB)
   begin
	case (pres) is
	  when U0 => fut<=U0;
		     if (QA='1' and QB='1') then fut<=U1; end if;
  		     if (QA='1' and QB='0') then fut<=U2; end if; 	
	  when U1 => fut<=U3;   	
	  when U2 => fut<=U3;	  		
	  when U3 => fut<=U3;
		     if (QA='0' and QB='0') then fut<=U4; end if;
  		     if (QA='0' and QB='1') then fut<=U5; end if; 	
	  when U4 => fut<=U0;   	
	  when U5 => fut<=U0;
	  when others => NULL;	
	end case;
   end process;

-- Process Combinatoire Sorties
   process(pres)
   begin
	case (pres) is
	  when U0 => Rot_Left<='0'; Rot_Right<='0';    	
	  when U1 => Rot_Left<='0'; Rot_Right<='1';
	  when U2 => Rot_Left<='1'; Rot_Right<='0';    	
	  when U3 => Rot_Left<='0'; Rot_Right<='0';
	  when U4 => Rot_Left<='0'; Rot_Right<='1';    
	  when U5 => Rot_Left<='1'; Rot_Right<='0'; 
	end case;
   end process;   						   

end archiMove;