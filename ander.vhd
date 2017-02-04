library ieee;
use ieee.std_logic_1164.all;

entity ander is    
  port(
    sw,btn : in std_logic_vector(3 downto 0);
    led : out std_logic_vector(3 downto 0)
  );
end ander;

architecture structural of ander is
begin
  led <= sw and btn;
end structural;
