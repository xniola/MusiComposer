['./writer.pl'].

% estensione armonica della chitarra acustica
% nome della nota, ['NomeNota',Tonalita, Alterazione]
nota(c3,['C',3]).  nota(c4, ['C',4]).  nota(c5, ['C',5]).  nota(c6, ['C',5]).
nota(cd3, ['C',3,1]). nota(cd4, ['C',4,1]). nota(cd5, ['C',5,1]).
nota(d3, ['D',3]).  nota(d4, ['D',4]).  nota(d5, ['D',5]).
nota(dd3, ['D',3,1]). nota(dd4, ['D',4,1]). nota(dd5, ['D',5,1]).
nota(e2, ['E',2]).   nota(e3, ['E',3]).  nota(e4, ['E',4]).  nota(e5, ['E',5]).
nota(f2, ['F',2]).   nota(f3, ['F',3]).  nota(f4, ['F',4]).  nota(f5, ['F',5]).
nota(fd2, ['F',2,1]).  nota(fd3, ['F',3,1]). nota(fd4, ['F',4,1]). nota(fd5, ['F',4,1]).
nota(g2, ['G',2]).   nota(g3, ['G',3]).  nota(g4, ['G',4]).  nota(g5, ['G',5]).
nota(gd2, ['G',2,1]). nota(gd3, ['G',3,1]). nota(gd4, ['G',4,1]). nota(gd5, ['G',5,1]).
nota(a2,['A',2]).   nota(a3, ['A',3]).  nota(a4, ['A',4]).  nota(a5, ['A',5]).
nota(ad2,['A',2,1]).  nota(ad3, ['A',3,1]). nota(ad4, ['A',4,1]). nota(ad5, ['A',5,1]).
nota(b2, ['B',2]).  nota(b3, ['B',3]).  nota(b4, ['B',4]).  nota(b5, ['B',5]).

% scala cromatica completa in forma di lista
estensione_armonica_chitarra([e2,f2,fd2,g2,gd2,a2,ad2,b2,
                     c3,cd3,d3,dd3,e3,f3,fd3,g3,gd3,a3,ad3,b3,
                     c4,cd4,d4,dd4,e4,f4,fd4,g4,gd4,a4,ad4,b4,
                     c5,cd5,d5,dd5,e5,f5,fd5,g5,gd5,a5,ad5,b5,c6]).

% cellule ritmiche principali
% nome della cellula ritmica e durata in battiti da 4 divisioni
% [intero, minima, semiminima, cromapunto,croma...] --> [whole, half, quarter, eighthdotted,eighth...]

cellula_ritmica(whole, 16).
cellula_ritmica(half, 8).
cellula_ritmica(quarter, 4).
cellula_ritmica(eighthdotted, 3).
cellula_ritmica(eighth, 2).
cellula_ritmica(croma_terzina, 1.3333333).
cellula_ritmica(croma_terzina_iniziale, 1.3333333). % da usare in terzina
cellula_ritmica(croma_terzina_finale, 1.3333333).
cellula_ritmica('16th', 1).
cellula_ritmica(pausacroma, 2).
cellula_ritmica(pausasemicroma, 1).
cellula_ritmica(pausasemiminima, 4).
cellula_ritmica(pausaminima, 8).



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
  Indice1 is Indice + 3,  nth0(Indice1, X, Nota1), nota(Nota1, InfoNota1),
  Indice2 is Indice + 5,  nth0(Indice2, X, Nota2), nota(Nota2, InfoNota2),
  Indice3 is Indice + 6,  nth0(Indice3, X, Nota3), nota(Nota3, InfoNota3),
  Indice4 is Indice + 7,  nth0(Indice4, X, Nota4), nota(Nota4, InfoNota4),
  Indice5 is Indice + 10, nth0(Indice5, X, Nota5), nota(Nota5, InfoNota5),
  Indice6 is Indice + 12, nth0(Indice6, X, Nota6), nota(Nota6, InfoNota6),
  Indice7 is Indice + 15, nth0(Indice7, X, Nota7), nota(Nota7, InfoNota7),
  Indice8 is Indice + 17, nth0(Indice8, X, Nota8), nota(Nota8, InfoNota8),
  Indice9 is Indice + 18, nth0(Indice9, X, Nota9), nota(Nota9, InfoNota9),
  Indice10 is Indice + 19,nth0(Indice10, X, Nota10), nota(Nota10, InfoNota10),
  Indice11 is Indice + 22,nth0(Indice11, X, Nota11), nota(Nota11, InfoNota11),
  Indice12 is Indice + 24,nth0(Indice12, X, Nota12), nota(Nota12, InfoNota12),
  Indice13 is Indice +27, nth0(Indice13, X, Nota13), nota(Nota13, InfoNota13),
  nota(Tonica,InfoTonica),
   !,
  Scala = [InfoTonica,InfoNota1, InfoNota2, InfoNota3, InfoNota4,
           InfoNota5, InfoNota6, InfoNota7, InfoNota8, InfoNota9,
           InfoNota10, InfoNota11, InfoNota12, InfoNota13].
  
% varie battute ritmiche in 4/4.
battuta(1,[eighth,eighth,eighthdotted,'16th',half]).
battuta(2,['16th','16th',eighth,quarter,eighthdotted,quarter]).
battuta(3,[eighth, eighth, croma_terzina_iniziale,croma_terzina,croma_terzina_finale, quarter, eighth,eighth]).
battuta(4,[eighth, eighth, eighth, eighth, quarter, quarter]).



% vari lick da 4/4 (note+tempo)
% lick(+Numero, +Tonica, -Lick)
lick(1, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  nota(Tonica, InfoTonica),
  Indice1 is Indice-2, nth0(Indice1, X, Nota1), nota(Nota1, InfoNota1),
  Indice2 is Indice-5, nth0(Indice2, X, Nota2), nota(Nota2, InfoNota2),
  Indice3 is Indice-6, nth0(Indice3, X, Nota3), nota(Nota3, InfoNota3),
  Indice4 is Indice-7, nth0(Indice4, X, Nota4), nota(Nota4, InfoNota4),
  Indice5 is Indice-9, nth0(Indice5, X, Nota5), nota(Nota5, InfoNota5),
  Indice6 is Indice-12, nth0(Indice6, X, Nota6), nota(Nota6, InfoNota6),
  Lick = [
    [InfoTonica , croma_terzina_iniziale],
    [InfoNota1, croma_terzina],
    [InfoNota2, croma_terzina_finale],
    [InfoNota3, croma_terzina_iniziale],
    [InfoNota4, croma_terzina],
    [InfoNota5, croma_terzina_finale],
    [InfoNota6, half]].


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

% compone una battuta intera (sia note che tempo) e la restituisce su "Pentagramma"
% componi_battuta(+ScalaDi, -Pentagramma)
componi_battuta(ScalaDi, Pentagramma) :-
    random(1,5,Res), % scelgo una battuta ritmica a caso
    battuta(Res, Durate), % costruisco la lista delle durate 
    length(Durate,NDurate),
    costruisci_scala_blues(ScalaDi, Scala), % costruisco la scala indicata
    genera(NDurate,Scala,Y), % genero N note della scala
    maplist(a_b_c, Y, Durate, Pentagramma). % mappo la durata con le note

% scrive sul path "Percorso" il seguente "Testo"
% scrivi_su(+Percorso, +Testo)
scrivi_su(Percorso, Testo) :-
    append(Percorso),
    write(Testo), nl,
    told.

% lanciatore
% compone una canzone con una specifica "Tonalita" di "N" battute musicali 
% componi(+Tonalita, +N)
componi(_,0).
componi(Tonalita, N) :-
    N1 is N-1,
    componi_battuta(Tonalita, Pentagramma),
    scrivi_su('spartito.txt',Pentagramma),
    componi(Tonalita, N1).