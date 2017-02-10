library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity user_logic is
  generic( seg_width : integer	:= 16	);
  port (
    s_axi_aclk : in std_logic;
    s_axi_aresetn : in std_logic;
    s_axi_wvalid : in std_logic;
    s_axi_wdata : in std_logic_vector(seg_width-1 downto 0);
    seg : out std_logic_vector(seg_width-1 downto 0)
  );
end user_logic;
architecture Behavioral of user_logic is
  component seg_disp is
    port(
      c : in std_logic;
      wdata : in std_logic_vector(7 downto 0);
      seg : out std_logic_vector(7 downto 0)
    ); 
  end component;
  signal c1,c2 : std_logic_vector(19 downto 0); 
begin
  process(s_axi_aclk)
  begin
    if rising_edge(s_axi_aclk) then
      c1 <= c1 + 1;
      c2 <= c2 + 1;        
    end if;
  end process;
    
  seg_disp_inst : seg_disp port map (
    c => c1(17),
    wdata => s_axi_wdata(7 downto 0),
    seg => seg(7 downto 0)
  );
    
  if_gen : if seg_width=16 generate
    seg_disp_inst : seg_disp port map (
      c => c2(17),
      wdata => s_axi_wdata(15 downto 8),
      seg => seg(15 downto 8)
    );
  end generate;
end Behavioral;
