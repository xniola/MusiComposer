% estensione armonica della chitarra acustica
% nome della nota, frequenza in Hz
nota(c3, 130.81).  nota(c4, 261.63).  nota(c5, 523.25).  nota(c6, 1046.50).
nota(cd3, 138.59). nota(cd4, 277.18). nota(cd5, 554.37).
nota(d3, 146.83).  nota(d4, 293.66).  nota(d5, 587.33).
nota(dd3, 155.56). nota(dd4, 311.13). nota(dd5, 622.25).
nota(e2, 82.41).   nota(e3, 164.81).  nota(e4, 329.63).  nota(e5, 659.25).
nota(f2, 87.31).   nota(f3, 174.61).  nota(f4, 349.23).  nota(f5, 698.46).
nota(fd2, 92.50).  nota(fd3, 185.00). nota(fd4, 369.99). nota(fd5, 739.99).
nota(g2, 98.00).   nota(g3, 196.00).  nota(g4, 392.00).  nota(g5, 783.99).
nota(gd2, 103.83). nota(gd3, 207.65). nota(gd4, 415.30). nota(gd5, 830.61).
nota(a2,110.00).   nota(a3, 220.00).  nota(a4, 440.00).  nota(a5, 880.00).
nota(ad2,116.54).  nota(ad3, 233.08). nota(ad4, 466.16). nota(ad5, 932.33).
nota(b2, 123.47).  nota(b3, 246.94).  nota(b4, 493.88).  nota(b5, 987.77).

% scala cromatica completa in forma di lista
estensione_armonica([e2,f2,fd2,g2,gd2,a2,ad2,b2,
                     c3,cd3,d3,dd3,e3,f3,fd3,g3,gd3,a3,ad3,b3,
                     c4,cd4,d4,dd4,e4,f4,fd4,g4,gd4,a4,ad4,b4,
                     c5,cd5,d5,dd5,e5,f5,fd5,g5,gd5,a5,ad5,b5,c6]).

scala(la,[a2,b2,c3,d3,e3,f3,g3]).

% cellule ritmiche principali
% nome della cellula ritmica e durata in ms
cellula_ritmica(intero, 4000).
cellula_ritmica(minima, 2000).
cellula_ritmica(semiminima, 1000).
cellula_ritmica(cromapunto, 750).
cellula_ritmica(croma, 500).
cellula_ritmica(semicroma, 250).
cellula_ritmica(pausacroma, 500).
cellula_ritmica(pausasemicroma, 250).
cellula_ritmica(pausasemiminima, 1000).
cellula_ritmica(pausaminima, 2000).


% creo varie battute ritmiche in 4/4 (4000 ms).
battuta(1, Durate) :- append([croma,croma,cromapunto,semicroma,minima],[],Durate).
battuta(2, Durate) :- append([semicroma,semicroma,croma,semiminima,cromapunto,semicroma],[],Durate).

% viene utilizzato nel predicato ricorsivo "genera" per estrarre una nota da una scala musicale("Lista").
% sceglie un elemento random "Elem" da una "Lista" 
scegli_random([], []).
scegli_random(Lista, Elem) :-
        length(Lista, Len),
        random(0, Len, Index),
        nth0(Index, Lista, Elem).
    
% genera ricorsivamente una sequenza di note musicali
% crea una lista "Y" di lunghezza "C" che contiene solo elementi di "Lista" 
genera(0,_,[]).  
genera(C,Lista, Y) :-
  C > 0,        
  C1 is C-1,    
  scegli_random(Lista,Elem),
  Y = [Elem|T],   
  genera(C1,Lista, T).

% serve a maplist per mappare la lista delle note con la lista dei tempi
a_b_c(A,B,[A,B]).

% lanciatore
play(Scala) :-
    random(1,3,Res),
    battuta(Res, Durate), nl,
    length(Durate,NDurate),
    scala(Scala,X),
    genera(NDurate,X,Y),
    maplist(a_b_c, Y, Durate, Pentagramma),
    write(Pentagramma).
