library ieee; 
use IEEE.STD_LOGIC_1164.ALL; 

--Interface é uma entidade reponsável por controlar as entradas e saídas da ULA
--a partir do labsland

ENTITY interface IS 
    PORT ( 
        SW: in std_logic_vector(11 downto 0);
        LEDR: out std_logic_vector(3 downto 0);
        LEDG: out std_logic_vector(3 downto 0)
    ); 
END interface; 

ARCHITECTURE logica OF interface IS 
    COMPONENT ula
        PORT (            
            A, B : in std_logic_vector(3 downto 0);
            Cin: in std_logic;
            Operacao: in std_logic_vector(2 downto 0);
            Resultado: out std_logic_vector(3 downto 0);
            Cout: out std_logic;
            Zero: out std_logic;
            Overflow: out std_logic;
            Negativo: out std_logic
        );
    END COMPONENT;
        
    COMPONENT troca_de_sinal IS 
        PORT ( 
            A: in std_logic_vector(3 downto 0); 
            Z: out std_logic_vector(3 downto 0)
        ); 
    END COMPONENT;
    
    COMPONENT mux8_1_4bits IS 
        PORT ( 
            A0: in std_logic_vector(3 downto 0); 
            A1: in std_logic_vector(3 downto 0); 
            A2: in std_logic_vector(3 downto 0); 
            A3: in std_logic_vector(3 downto 0); 
            A4: in std_logic_vector(3 downto 0); 
            A5: in std_logic_vector(3 downto 0); 
            A6: in std_logic_vector(3 downto 0); 
            A7: in std_logic_vector(3 downto 0); 
            C: in std_logic_vector(2 downto 0);
            Z: out std_logic_vector(3 downto 0)
        ); 
    END COMPONENT;
    
    
    BEGIN
    --Realizando o calculo na ALU
    Calcular: ula PORT MAP(
                    A => SW(3 downto 0),
                    B => SW(7 downto 4),
                    Cin => SW(8),
                    Operacao => SW(11 downto 9), 
                    Resultado => LEDR(3 downto 0),
                    Cout => LEDG(0),
                    Zero => LEDG(1),
                    Overflow => LEDG(2),
                    Negativo => LEDG(3)
                );
            
END logica;