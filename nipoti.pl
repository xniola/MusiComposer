licknipote(1, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[-12,18,-7,-5,-2,0,27,5,7,10,12,15,3,2,0]
,
[croma_terzina_iniziale,croma_terzina,croma_terzina_finale,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,croma_terzina_iniziale,croma_terzina,croma_terzina_finale|_143664]
,Lick),!.
licknipote(2, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[3,0,-2,0,-2,-5,-2,-5,17,0]
,
['16th','16th','16th','16th','16th','16th','16th','16th','16th','16th','16th','16th',quarter|_143814]
,Lick),!.
licknipote(3, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[6,10,12,10,17,6,-12]
,
[eighth,eighth,quarter,half|_123252]
,Lick),!.
licknipote(4, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[0,24,9,7,6,15,0]
,
[croma_terzina_iniziale,croma_terzina,croma_terzina_finale,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,quarter|_123312]
,Lick),!.
licknipote(5, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[3,0,-5,3,0,22,6,0,-5,0,4]
,
[eighth,eighth,quarter,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,eighth,eighth|_105222]
,Lick),!.
licknipote(6, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,
[19,0,9,5,6,5,0]
,
[croma_terzina_iniziale,croma_terzina,croma_terzina_finale,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,quarter|_105282]
,Lick),!.
