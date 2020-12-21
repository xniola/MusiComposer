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
[3,0,-5,3,0,22,3,0,-5,0,4]
,
[croma_terzina_iniziale,croma_terzina,croma_terzina_finale,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,eighth,eighth|_9868]
,Lick),!.
lickfiglio(2, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[7,0,7,0,4,7,5,0,-5]
,
[eighth,eighth,eighth,eighth,eighth,eighth,croma_terzina_iniziale,croma_terzina,croma_terzina_finale|_9922]
,Lick),!.
lickfiglio(3, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[0,12,9,15,2,-12]
,
[eighth,eighth,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,half|_14044]
,Lick),!.
lickfiglio(4, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[0,-2,-5,-6,-7,17,11,2,5,8,7,5,2,3,4,-5,0]
,
[croma_terzina_iniziale,croma_terzina,croma_terzina_finale,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,eighth,eighth,eighth,eighth,eighth,eighth,eighth,eighth,eighth,eighth,quarter|_14146]
,Lick),!.
lickfiglio(5, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[0,0,9,7,6,15,0]
,
[eighth,eighth,quarter,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,quarter|_10240]
,Lick),!.
lickfiglio(6, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[19,12,7,3,0,-5,-5,3,2,0]
,
[croma_terzina_iniziale,croma_terzina,croma_terzina_finale,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,quarter,croma_terzina_iniziale,croma_terzina,croma_terzina_finale|_10300]
,Lick),!.
lickfiglio(7, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[6,7,12,10,7,6,5,3,0,3,10,0]
,
[croma_terzina_iniziale,croma_terzina,croma_terzina_finale,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,croma_terzina_iniziale,croma_terzina,croma_terzina_finale|_9616]
,Lick),!.
lickfiglio(8, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[0,0,9,5,6,5,0]
,
[eighth,eighth,quarter,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,quarter|_9658]
,Lick),!.
lickfiglio(9, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[-12,-9,-7,-5,-2,0,27,5,7,10,12,15,3,2,0]
,
['16th','16th','16th','16th','16th','16th','16th','16th','16th','16th','16th','16th',croma_terzina_iniziale,croma_terzina,croma_terzina_finale|_12082]
,Lick),!.
lickfiglio(10, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[0,0,9,7,6,17,7]
,
[eighth,eighth,quarter,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,quarter|_12124]
,Lick),!.
lickfiglio(11, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[3,0,-2,0,-2,-5,-2,-5,22,0]
,
[croma_terzina_iniziale,croma_terzina,croma_terzina_finale,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,quarter|_9580]
,Lick),!.
lickfiglio(12, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[7,7,19,12,-5,-7,-9,-12]
,
[croma_terzina_iniziale,croma_terzina,croma_terzina_finale,half,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,whole|_9628]
,Lick),!.
lickfiglio(13, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[-10,-8,-7,-3,22,4,0]
,
[eighth,eighth,eighth,eighth,eighth,eighth,quarter|_25722]
,Lick),!.
lickfiglio(14, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[6,7,12,10,7,6,5,3,0,2,0,-1,2,5,7,8,10,15,7,5,4,0,-5,-15,0,0,-7]
,
[croma_terzina_iniziale,croma_terzina,croma_terzina_finale,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,eighth,eighth,eighth,eighth,eighth,eighth,eighth,'16th','16th',eighth,eighth,quarter,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,eighth,eighth,quarter|_25896]
,Lick),!.
lickfiglio(15, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[0,-2,-5,-6,-7,27,5,3,0,0]
,
[croma_terzina_iniziale,croma_terzina,croma_terzina_finale,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,quarter|_16840]
,Lick),!.
lickfiglio(16, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[6,7,12,10,17,6,-12]
,
[croma_terzina_iniziale,croma_terzina,croma_terzina_finale,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,half|_16882]
,Lick),!.
lickfiglio(17, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[0,24,-5,-6,-7,-9,0]
,
[croma_terzina_iniziale,croma_terzina,croma_terzina_finale,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,half|_8446]
,Lick),!.
lickfiglio(18, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[12,12,7,6,5,3,-12]
,
[croma_terzina_iniziale,croma_terzina,croma_terzina_finale,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,half|_8488]
,Lick),!.
