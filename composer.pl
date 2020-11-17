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
estensione_armonica_chitarra([e2,f2,fd2,g2,gd2,a2,ad2,b2,
                     c3,cd3,d3,dd3,e3,f3,fd3,g3,gd3,a3,ad3,b3,
                     c4,cd4,d4,dd4,e4,f4,fd4,g4,gd4,a4,ad4,b4,
                     c5,cd5,d5,dd5,e5,f5,fd5,g5,gd5,a5,ad5,b5,c6]).

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

% Fornisce indice di "Elem" nella lista
% indiceDi(+Lista,+Elem,-Indice)
indiceDi([Elem|_], Elem, 0).
indiceDi([_|C], Element, Indice):-
  indiceDi(C, Element, Indice1),
  !,
  Indice is Indice1+1.

% costruisce una "Scala" blues a partire dalla tonica fornita
% costruisci_scala_blues(+Tonica, -Scala)  
costruisci_scala_blues(Tonica, Scala) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  Indice < 18, % posso partire al massimo da a3
  Indice1 is Indice + 3,  nth0(Indice1, X, Nota1),
  Indice2 is Indice + 5,  nth0(Indice2, X, Nota2),
  Indice3 is Indice + 6,  nth0(Indice3, X, Nota3),
  Indice4 is Indice + 7,  nth0(Indice4, X, Nota4),
  Indice5 is Indice + 10, nth0(Indice5, X, Nota5),
  Indice6 is Indice + 12, nth0(Indice6, X, Nota6),
  Indice7 is Indice + 15, nth0(Indice7, X, Nota7),
  Indice8 is Indice + 17, nth0(Indice8, X, Nota8),
  Indice9 is Indice + 18, nth0(Indice9, X, Nota9),
  Indice10 is Indice + 19,nth0(Indice10, X, Nota10),
  Indice11 is Indice + 22,nth0(Indice11, X, Nota11),
  Indice12 is Indice + 24,nth0(Indice12, X, Nota12),
  Indice13 is Indice +27, nth0(Indice13, X, Nota13),
  !,
  Scala = [Tonica,Nota1, Nota2, Nota3, Nota4, Nota5, Nota6, Nota7, Nota8, Nota9, Nota10, Nota11, Nota12, Nota13].
  

% creo varie battute ritmiche in 4/4 (4000 ms).
% battuta(+numero, -Durate)
battuta(1, Durate) :- append([croma,croma,cromapunto,semicroma,minima],[],Durate).
battuta(2, Durate) :- append([semicroma,semicroma,croma,semiminima,cromapunto,semicroma],[],Durate).

% viene utilizzato nel predicato ricorsivo "genera" per estrarre una nota da una scala musicale("Lista").
% sceglie un elemento random "Elem" da una "Lista" 
% scegli_random(+Lista, -Elem)
scegli_random([], []).
scegli_random(Lista, Elem) :-
        length(Lista, Len),
        random(0, Len, Index),
        nth0(Index, Lista, Elem).
    
% genera ricorsivamente una sequenza di note musicali
% crea una lista "Y" di lunghezza "C" che contiene solo elementi di "Lista" 
% genera(+C, +Lista, -Y)
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
suona(ScalaDi) :-
    random(1,3,Res), % scelgo una battuta ritmica a caso
    battuta(Res, Durate), % costruisco la lista delle durate 
    length(Durate,NDurate),
    costruisci_scala_blues(ScalaDi, Scala), % costruisco la scala indicata
    genera(NDurate,Scala,Y), % genero N note della scala
    maplist(a_b_c, Y, Durate, Pentagramma), % mappo la durata con le note
    write(Pentagramma).