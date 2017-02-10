library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity seg_disp is
    port(
        c : in std_logic;
        wdata : in std_logic_vector(7 downto 0);
        seg : out std_logic_vector(7 downto 0)
    ); 
end seg_disp;
architecture Behavioral of seg_disp is
begin
    process(c,wdata)
    begin
        seg(7) <= c;
        if c='0' then
            case wdata(3 downto 0) is
                when x"0" => seg(6 downto 0) <= "0111111";
                when x"1" => seg(6 downto 0) <= "0000110";
                when x"2" => seg(6 downto 0) <= "1011011";
                when x"3" => seg(6 downto 0) <= "1001111";
                when x"4" => seg(6 downto 0) <= "1100110";
                when x"5" => seg(6 downto 0) <= "1101101";
                when x"6" => seg(6 downto 0) <= "1111101";
                when x"7" => seg(6 downto 0) <= "0100111";                
                when x"8" => seg(6 downto 0) <= "1111111";
                when x"9" => seg(6 downto 0) <= "1101111";
                when x"a" => seg(6 downto 0) <= "1110111";
                when x"b" => seg(6 downto 0) <= "1111100";
                when x"c" => seg(6 downto 0) <= "0111001";
                when x"d" => seg(6 downto 0) <= "1011110";
                when x"e" => seg(6 downto 0) <= "1111001";
                when x"f" => seg(6 downto 0) <= "1110001";
                when others => seg(6 downto 0) <= "0111111";
            end case;
        else
            case wdata(7 downto 4) is
                when x"0" => seg(6 downto 0) <= "0111111";
                when x"1" => seg(6 downto 0) <= "0000110";
                when x"2" => seg(6 downto 0) <= "1011011";
                when x"3" => seg(6 downto 0) <= "1001111";
                when x"4" => seg(6 downto 0) <= "1100110";
                when x"5" => seg(6 downto 0) <= "1101101";
                when x"6" => seg(6 downto 0) <= "1111101";
                when x"7" => seg(6 downto 0) <= "0100111";                
                when x"8" => seg(6 downto 0) <= "1111111";
                when x"9" => seg(6 downto 0) <= "1101111";
                when x"a" => seg(6 downto 0) <= "1110111";
                when x"b" => seg(6 downto 0) <= "1111100";
                when x"c" => seg(6 downto 0) <= "0111001";
                when x"d" => seg(6 downto 0) <= "1011110";
                when x"e" => seg(6 downto 0) <= "1111001";
                when x"f" => seg(6 downto 0) <= "1110001";
                when others => seg(6 downto 0) <= "0111111";
            end case;
        end if;                 
    end process;
end Behavioral;
