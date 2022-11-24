library IEEE;
use IEEE.std_logic_1164.all;

-- entity
entity tp2 is
  port (rset, clkPadrao: in std_logic
       -- HEX0, HEX1, HEX2, HEX3: out std_logic_vector (7 downto 0)
    );
end tp2;

-- architecture
architecture hardware of tp2 is
    component divisor_clock is
        port (clk50MHz : in std_logic;
                 reset : in std_logic;
                clk1Hz : out std_logic);
    end component;

  type state_type is (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T); -- A-01 B-10 C-11 ...
  signal PS, NS: state_type;
  signal clk: std_logic;

begin
  x1 : divisor_clock port map(clk50MHz =>clkPadrao, reset=>rset, clk1Hz=>clk);
  sync_proc : process (clk, rset)
  begin
    if (rset = '1') then
        PS <= A;
    elsif (RISING_EDGE(clk)) then
        PS <= NS;
    end if;
  end process sync_proc;

  comb_proc : process (clk)
  begin
    case PS is
      when A =>  
        NS <=B;


      when B =>
        NS <=C;

      when C =>
        NS <=C;
        
      when D =>
        NS <=E;
      
      when E =>
        NS <=F;
     
      when F =>
        NS <=G;
     
      when G =>
        NS <=H;

      when H =>
        NS <=I;

      when I =>
        NS <=J;
      
      when J =>
        NS <=K;
     
      when K =>
        NS <=L;
     
      when L =>
        NS <=M;

      when M =>
        NS <=N;

      when N =>
        NS <=O;

      when O =>
        NS <=P;

      when P =>
        NS <=Q;

      when Q =>
        NS <=R;

      when R =>
        NS <=S;

      when S =>
        NS <=A;

      when others =>
        NS <=A;
      
    end case;
  end process comb_proc;
end hardware;