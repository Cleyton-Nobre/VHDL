library IEEE;
use IEEE.std_logic_1164.all;

-- entity
entity tp2 is
  port (rset, clkPadrao: in std_logic;
        HEX0, HEX1, HEX2, HEX3: out std_logic_vector (7 downto 0)
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
        HEX0 <= "11001111";
        HEX1 <= "01111110";
        HEX2 <= "01111110";
        HEX3 <= "01111110";
    elsif (RISING_EDGE(clk)) then
        PS <= NS;
    case PS is
      when A =>  
        NS <=B;
        HEX0 <= "11111001";
        HEX1 <= "01111110";
        HEX2 <= "01111110";
        HEX3 <= "01111110";
      when B =>
        NS <=C;
        HEX0 <= "11101101";
      when C =>
        NS <=D;
        HEX0 <= "10110000";
      when D =>
        NS <=E;
        HEX0 <= "01111110";
      when E =>
        NS <=F;
        HEX0 <= "00000000";
        HEX1 <= "00000000";
        HEX2 <= "00000000";
        HEX3 <= "00000000";
      when F =>
        NS <=G;
        HEX0 <= "11011001";
        HEX1 <= "01111110";
        HEX2 <= "11110010";
        HEX3 <= "01101111";
      when G =>
        NS <=H;
        HEX0 <= "11111001";
        HEX1 <= "01011010";
        HEX2 <= "10010010";
        HEX3 <= "01101001";
      when H =>
        NS <=I;
        HEX0 <= "11101101";
        HEX1 <= "01010101";
        HEX2 <= "10101010";
        HEX3 <= "00111001";
      when I =>
        NS <=J;
        HEX0 <= "01110001";
        HEX1 <= "11111011";
        HEX2 <= "11101110";
        HEX3 <= "00101001";
      when J =>
        NS <=K;
        HEX0 <= "01111001";
        HEX1 <= "11011001";
        HEX2 <= "10101100";
        HEX3 <= "00001001";
      when K =>
        NS <=L;
        HEX0 <= "01001110";
        HEX1 <= "10011001";
        HEX2 <= "10101000";
        HEX3 <= "11001001";
      when L =>
        NS <=M;
        HEX0 <= "01001001";
        HEX1 <= "10110100";
        HEX2 <= "00111010";
        HEX3 <= "11101010";
      when M =>
        NS <=N;
        HEX0 <= "11101011";
        HEX1 <= "10111001";
        HEX2 <= "00111001";
        HEX3 <= "10110001";
      when N =>
        NS <=O;
        HEX0 <= "11100011";
        HEX1 <= "10101011";
        HEX2 <= "00101000";
        HEX3 <= "11010111";
      when O =>
        NS <=P;
        HEX0 <= "10001000";
        HEX1 <= "10100100";
        HEX2 <= "00111110";
        HEX3 <= "11010011";
      when P =>
        NS <=Q;
        HEX0 <= "11111111";
        HEX1 <= "10110000";
        HEX2 <= "01111110";
        HEX3 <= "10101111";

      when Q =>
        NS <=R;
        HEX0 <= "11111111";
        HEX1 <= "10010101";
        HEX2 <= "01101011";
        HEX3 <= "10101001";

      when R =>
        NS <=S;
        HEX0 <= "11111111";
        HEX1 <= "11111111";
        HEX2 <= "01001100";
        HEX3 <= "00101100";

      when S =>
        NS <=A;
        HEX0 <= "11111111";
        HEX1 <= "11111111";
        HEX2 <= "11111111";
        HEX3 <= "00100101";
      when others =>
        NS <=A;
        HEX0 <= "11111111";
        HEX1 <= "11111111";
        HEX2 <= "11111111";
        HEX3 <= "11111111";
    end case;
  end if;
  end process sync_proc;
end hardware;