----------------------------------------------------------------------------------
-- Company: UPMC
-- STUDENTS: Mouhamadou Ndoye & Aminata Diop
-- TESTBENCH : MAE Game_MGR--
-- Test du s�l�ctionneur de jeu
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity TB_gameMGR is

end TB_gameMGR;

architecture archi of TB_gameMGR is
    
signal clk25,Reset, Game_Rqt: std_logic:='0';             -- Entrees du module a instancier
signal Game_Type: std_logic;             -- Sortie du module a instancier

begin

label0: entity work.gamemgr
        port map(clk25,Reset,Game_Rqt, Game_Type);

-- G�n�ration des Signaux d'Entr�e
clk25<=not clk25 after 5 ns;
Reset <='1' after 10 ns;
Game_Rqt <='1' after 30 ns, '0' after 40 ns,
     '1' after 80 ns, '0' after 110 ns, '1' after 130 ns;			

end archi;     
