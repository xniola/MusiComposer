somma_punteggi(Risultato) :-
  lickfiglio(1,g3,L),
  prendiritmo(L,Ritmi),
  conta_battute(Ritmi,NumBattute),
  assegna_punteggio(NumBattute,Num),
  Risultato = [Num|C],
  somma_punteggi(C,2).

somma_punteggi(_,18). 
somma_punteggi(Risultato,N) :-
  findall(_, clause(lickfiglio(_,_,_),_), P), length(P,Len),
  N =< Len,
  N1 is N+1,
  lickfiglio(N,g3,L),
  prendiritmo(L,Ritmi),
  conta_battute(Ritmi, NumBattute),
  assegna_punteggio(NumBattute,Num),
  Risultato = [Num | C],
  somma_punteggi(C,N1).

fitness_function_figli(Risultato) :-
  lickfiglio(1,g3,L),
  prendiritmo(L,Ritmi),
  conta_battute(Ritmi, NumBattute),
  assegna_punteggio(NumBattute,Num),
  somma_punteggi(Somma),
  somma(Somma,Somma1),
  Probabilita is Num/Somma1,
  Risultato = [Probabilita | C],
  fitness_function_figli(C,2).
fitness_function_figli(_,19).
fitness_function_figli(Risultato,N) :-
  N1 is N+1,
  lickfiglio(N,g3,L),
  prendiritmo(L,Ritmi),
  conta_battute(Ritmi, NumBattute),
  assegna_punteggio(NumBattute,Num),
  somma_punteggi(Somma),
  somma(Somma,Somma1),
  Probabilita is Num/Somma1,
  Risultato = [Probabilita | C],
  fitness_function_figli(C,N1).

lickfiglio(1, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[-12,-10,-10,-8,-5,0,_48456]
,
[quarter,eighth,eighth,eighth,eighth,quarter|_48410]
,Lick),!.
lickfiglio(2, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[7,7,12,12,-3,-6,0]
,
[croma_terzina_iniziale,croma_terzina,croma_terzina_finale,half,eighth,eighth,whole|_48452]
,Lick),!.
lickfiglio(3, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[-12,-9,-7,-5,-2,0,3,5,3,10,12,15,-3,-5,0]
,
['16th','16th','16th','16th','16th','16th','16th','16th','16th','16th','16th','16th',eighth,eighth,whole|_33832]
,Lick),!.
lickfiglio(4, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[12,10,9,7,9,3,0,0,7]
,
[croma_terzina_iniziale,croma_terzina,croma_terzina_finale,eighth,eighth,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,quarter|_33886]
,Lick),!.
lickfiglio(5, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[0,-2,-5,-6,-7,-9,-2,-3,-7,-5,-7,-9,-12]
,
[croma_terzina_iniziale,croma_terzina,croma_terzina_finale,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,whole|_16780]
,Lick),!.
lickfiglio(6, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[3,0,-2,-1,-2,-5,-12,_16942]
,
[croma_terzina_iniziale,croma_terzina,croma_terzina_finale,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,half|_16822]
,Lick),!.
lickfiglio(7, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[0,2,9,-12]
,
[eighth,eighth,quarter,half|_58798]
,Lick),!.
lickfiglio(8, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[0,-2,-5,-6,-7,0,7,6,5,3,2,0]
,
[croma_terzina_iniziale,croma_terzina,croma_terzina_finale,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,croma_terzina_iniziale,croma_terzina,croma_terzina_finale|_58870]
,Lick),!.
lickfiglio(9, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[0,2,9,7,6,5,0]
,
[eighth,eighth,quarter,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,quarter|_37718]
,Lick),!.
lickfiglio(10, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[12,10,7,5,2,5,3,3,2,0]
,
[quarter,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,croma_terzina_iniziale,croma_terzina,croma_terzina_finale|_37778]
,Lick),!.
lickfiglio(11, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[0,12,6,5,2,-12]
,
[eighth,eighth,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,half|_24634]
,Lick),!.
lickfiglio(12, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[0,-2,-5,-6,-7,-9,11,2,5,8,7,5,3,3,4,-5,0]
,
[croma_terzina_iniziale,croma_terzina,croma_terzina_finale,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,eighth,eighth,eighth,eighth,eighth,eighth,eighth,eighth,eighth,eighth,quarter|_24736]
,Lick),!.
