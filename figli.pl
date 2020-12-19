lickfiglio(9, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[12,10,9,7,9,0|_45408]
,
[croma_terzina_iniziale,croma_terzina,croma_terzina_finale,eighth,eighth,half|_47568]
,Lick),!.
lickfiglio(2, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[12,10,7,6,5,3,3,2,0,-3,-5,0|_41916]
,
[croma_terzina_iniziale,croma_terzina,croma_terzina_finale,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,eighth,eighth,whole|_47640]
,Lick),!.
