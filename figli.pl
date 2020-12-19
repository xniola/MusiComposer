lickfiglio(1, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[-12,-10,-9,-8,-5,-3,-5,-12|_20160]
,
[quarter,eighth,eighth,eighth,eighth,eighth,eighth,whole|_21792]
,Lick),!.
lickfiglio(2, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[3,0,-2,0,-2,-5,-2,-5,-7,-5,-7,-9,0|_14472]
,
[croma_terzina_iniziale,croma_terzina,croma_terzina_finale,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,whole|_21870]
,Lick),!.
lickfiglio(3, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[7,0,7,0,4,7,-5,-7,-9,-12|_10176]
,
[eighth,eighth,eighth,eighth,eighth,eighth,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,whole|_12642]
,Lick),!.
lickfiglio(4, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[3,0,-2,0,-2,-5,-2,-5,-7,0,4|_4488]
,
[croma_terzina_iniziale,croma_terzina,croma_terzina_finale,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,eighth,eighth|_12708]
,Lick),!.
lickfiglio(5, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[-10,-7,-3,0,-1,2,5,8,7,5,2,3,4,12,0|_13404]
,
[quarter,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,eighth,eighth,eighth,eighth,eighth,eighth,eighth,eighth,eighth,eighth,quarter|_15858]
,Lick),!.
lickfiglio(6, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[0,12,9,5,2,11,2,5,8,7,5,2,3,4,-5,0|_5592]
,
[eighth,eighth,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,eighth,eighth,eighth,eighth,eighth,eighth,eighth,eighth,eighth,eighth,quarter|_15954]
,Lick),!.
