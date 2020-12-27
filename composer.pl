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
% [intero, minima, semiminima,croma...] --> [whole, half, quarter,eighth...]
cellula_ritmica(whole, 4).
cellula_ritmica(half, 2).
cellula_ritmica(quarter, 1).
cellula_ritmica(eighthdotted, 0.75).
cellula_ritmica(eighth, 0.5).
cellula_ritmica(croma_terzina_iniziale, 0.330). % da usare in terzina
cellula_ritmica(croma_terzina, 0.331).
cellula_ritmica(croma_terzina_finale, 0.332).
cellula_ritmica("'16th'", 0.25).
cellula_ritmica('16th',0.25). % due modi per scrivere la semicroma

% pause: [ [_,_,_], pausa ]
cellula_ritmica(pausa_16th, 0.25).
cellula_ritmica(pausa_eighth, 0.5).
cellula_ritmica(pausa_quarter, 1).
cellula_ritmica(pausa_half, 2).
cellula_ritmica(pausa_whole, 4).
cellula_ritmica(pausa_eighthdotted, 0.75).
pausa(pausa_16th).
pausa(pausa_eighth).
pausa(pausa_quarter).
pausa(pausa_half).
pausa(pausa_whole).
pausa(pausa_eighthdotted).

% Fornisce indice di "Elem" nella lista
% indiceDi(+Lista,+Elem,-Indice)
indiceDi([Elem|_], Elem, 0).
indiceDi([_|C], Element, Indice):-
  indiceDi(C, Element, Indice1),
  !,
  Indice is Indice1+1.

% costruisce la lista degli indici relativi alla Tonica
% costruisci_indici_scalablues(+IndiceTonica, +ListaIndici; -Res)
costruisci_indici_scalablues(_,[],_).
costruisci_indici_scalablues(IndiceTonica, ListaIndici, Res) :-
    IndiceTonica < 18,
    Res = [IndiceTonica | NC],
    costruisci_indici_scalablues(IndiceTonica, ListaIndici, NC, _).

costruisci_indici_scalablues(_,[],_,_).
costruisci_indici_scalablues(IndiceTonica, [T|C], Res, _) :-
    NewIndice is IndiceTonica + T,
    Res = [NewIndice|NC],
    costruisci_indici_scalablues(IndiceTonica, C, NC, _).

% costruisce le note a partire dagli indici costruiti prima
% costruisci_note_scalablues(+ListaIndici, -Res)
costruisci_note_scalablues([], _).
costruisci_note_scalablues([T|C], Res) :-
    estensione_armonica_chitarra(EstensioneArmonica),
    nth0(T, EstensioneArmonica, Nota1),
    Res = [Nota1|NC],
    costruisci_note_scalablues(C, NC).

% costruisce il lick a partire dalle note costruite prima
% costruisci_note2_scalablues(+ListaNote, -Res)
costruisci_note2_scalablues([],_).
costruisci_note2_scalablues([T|C], Res) :-
    nota(T, InfoNota),
    Res = [InfoNota|NC],
    costruisci_note2_scalablues(C, NC).

% costruisce una "Scala" blues a partire dalla tonica fornita
% costruisci_scala_blues(+Tonica, -Scala)  
costruisci_scala_blues(Tonica, Scala) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,IndiceTonica),
  costruisci_indici_scalablues(IndiceTonica, [3,5,6,7,10,12,15,17,18,19,22,24,27], Res),
  costruisci_note_scalablues(Res, Res1),
  costruisci_note2_scalablues(Res1,Scala).
  
% varie battute ritmiche in 4/4.
battuta(1,[eighth,eighth,eighthdotted,'16th',half]).
battuta(2,['16th','16th',eighth,quarter,eighthdotted,quarter]).
battuta(3,[eighth, eighth, croma_terzina_iniziale,croma_terzina,croma_terzina_finale, quarter, eighth,eighth]).
battuta(4,[eighth, eighth, eighth, eighth, quarter, quarter]).
battuta(5,[quarter,pausa_quarter,quarter,pausa_quarter]).


% viene utilizzato nel predicato ricorsivo "genera" per estrarre una nota da una scala musicale "Lista".
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
    random(1,6,Res), % scelgo una battuta ritmica a caso
    battuta(Res, Durate), % costruisco la lista delle durate 
    length(Durate,NDurate),
    costruisci_scala_blues(ScalaDi, Scala), % costruisco la scala indicata
    genera(NDurate,Scala,Y), % genero N note della scala
    maplist(a_b_c, Y, Durate, Pentagramma). % mappo la durata con le note

leggi_tonalita(Tonalita,Risultato) :-
  Tonalita = 'Do',
  Risultato = c4.
leggi_tonalita(Tonalita,Risultato) :-
  Tonalita = 'Re',
  Risultato = d4.
leggi_tonalita(Tonalita,Risultato) :-
  Tonalita = 'Mi',
  Risultato = e4.
leggi_tonalita(Tonalita,Risultato) :-
  Tonalita = 'Fa',
  Risultato = f4.
leggi_tonalita(Tonalita,Risultato) :-
  Tonalita = 'Sol',
  Risultato = g4.
leggi_tonalita(Tonalita,Risultato) :-
  Tonalita = 'La',
  Risultato = a4.
leggi_tonalita(Tonalita,Risultato) :-
  Tonalita = 'Si',
  Risultato = b3.
leggi_tonalita(_,Risultato) :-
  Risultato = e4.


% lanciatore 
componi :-
    write('Ciao! Scegli una tonalita (Do,Re,Mi,Fa,Sol,La,Si): '),
    read(Tonalita),
    leggi_tonalita(Tonalita, Risultato),
    write('Ora scegli quante battute suonare (1,2,...,4): '),
    read(N),
    scrivi_xml('spartito.xml',Risultato, N),
    write('Il tuo assolo è stato composto su spartito.xml !!').

componi(Tonalita, N) :-
  scrivi_xml('spartito.xml',Tonalita,N).
