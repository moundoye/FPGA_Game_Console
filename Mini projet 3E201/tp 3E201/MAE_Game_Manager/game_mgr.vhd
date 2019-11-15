----------------------------------------------------------------------------------
-- Company: UPMC
-- STUDENTS: Mouhamadou Ndoye & Aminata Diop
-- MAE game_mgr : séléction jeux--
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity gameMGR is
   port(  clk25, Reset: in std_logic; -- Horloge Reset
	  Game_Rqt: in std_logic; -- Entrees MAE
          Game_Type:  out std_logic); --commandes de déplacement
end gameMGR;

architecture archigameMGR of gameMGR is

-- Type etat
type etat is (E0,E1,E2,E3);

-- Registre d'etat
signal pres,fut: etat;

begin

-- Gestion du MAE move
   process(clk25, Reset)
   begin        
	if Reset='0' then pres<=E0;
	elsif rising_edge(clk25) then pres <= fut;
	end if;

   end process;

-- Process Combinatoire Etats
   process(pres,Game_Rqt)
   begin
	case (pres) is
	  when E0 => fut<=E0;
		     if (Game_Rqt='1') then fut<=E1; end if;
	  when E1 => fut<=E1;
		     if (Game_Rqt='0') then fut<=E2; end if;   	
	  when E2 => fut<=E2;
		     if (Game_Rqt='1') then fut<=E3; end if;	  		
	  when E3 => fut<=E3;
		     if (Game_Rqt='0') then fut<=E0; end if;	
	  when others => NULL;	
	end case;
   end process;

-- Process Combinatoire Sorties
   process(pres)
   begin
	case (pres) is
	  when E0 => Game_Type<='0';    	
	  when E1 => Game_Type<='1';
	  when E2 => Game_Type<='1';    	
	  when E3 => Game_Type<='0';
	end case;
   end process;   						   

end archigameMGR;