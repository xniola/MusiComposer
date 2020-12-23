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
[12,13,7,5,-12]
,
[quarter,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,half|_14200]
,Lick),!.
lickfiglio(2, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[0,-2,-5,-9,-7,-9,7,5,3,0]
,
[croma_terzina_iniziale,croma_terzina,croma_terzina_finale,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,quarter|_14260]
,Lick),!.
lickfiglio(3, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[-10,-7,-4,0,-1,2,7]
,
[quarter,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,eighth,eighth,quarter|_16798]
,Lick),!.
lickfiglio(4, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[-12,-10,-7,-5,-2,0,3,5,7,10,12,15,5,8,7,5,2,3,4,12,0]
,
['16th','16th','16th','16th','16th','16th','16th','16th','16th','16th','16th','16th',eighth,eighth,eighth,eighth,eighth,eighth,eighth,eighth,quarter|_16996]
,Lick),!.
lickfiglio(5, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[-12,-10,-9,-8,-6,0]
,
[quarter,eighth,eighth,eighth,eighth,quarter|_58576]
,Lick),!.
lickfiglio(6, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[12,10,7,5,7,5,3,-3,-6,0]
,
[quarter,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,eighth,eighth,whole|_58636]
,Lick),!.
lickfiglio(7, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[0,12,9,5,6,11,2,5,8,7,5,2,3,4,-5,0]
,
[eighth,eighth,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,eighth,eighth,eighth,eighth,eighth,eighth,eighth,eighth,eighth,eighth,quarter|_46808]
,Lick),!.

