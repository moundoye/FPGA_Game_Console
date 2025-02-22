----------------------------------------------------------------------------------
-- Company: UPMC
-- STUDENTS: Mouhamadou Ndoye & Aminata Diop
-- TESTBENCH : MAE Move--
-- Test du d�placement encodeur
-- Copier le code dans TB_move
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity TB_move is

end TB_move;

architecture archi of TB_move is
    
signal clk25,Reset, QA, QB: std_logic:='0';             -- Entrees du module a instancier
signal Rot_Left, Rot_Right: std_logic;             -- Sortie du module a instancier

begin

label0: entity work.move
        port map(clk25,Reset,QA, QB, Rot_Left, Rot_Right);

-- G�n�ration des Signaux d'Entr�e
clk25<=not clk25 after 5 ns;
Reset <='1' after 10 ns;
QA <='1' after 40 ns, '0' after 90 ns,
     '1' after 130 ns, '0' after 150 ns, '1' after 190 ns;		

QB <='1' after 30 ns, '0' after 60 ns,
     '1' after 110 ns, 	'0' after 170 ns, '1' after 210 ns;		

end archi;     

