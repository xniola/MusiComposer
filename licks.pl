['./composer.pl'].

% costruisce la lista degli indici relativi alla Tonica
% costruisci_indici(+IndiceTonica, +ListaIndici; -Res)
costruisci_indici(_,[],_).
costruisci_indici(IndiceTonica, [T|C], Res) :-
    NewIndice is IndiceTonica + T,
    Res = [NewIndice|NC],
    costruisci_indici(IndiceTonica, C, NC).

% costruisce le note a partire dagli indici costruiti prima
% costruisci_note(+ListaIndici, -Res)
costruisci_note([], _).
costruisci_note([T|C], Res) :-
    estensione_armonica_chitarra(EstensioneArmonica),
    nth0(T, EstensioneArmonica, Nota1),
    Res = [Nota1|NC],
    costruisci_note(C, NC).

% costruisce il lick a partire dalle note costruite prima
% costruisci_lick(+ListaNote, -Res)
costruisci_note2([],_).
costruisci_note2([T|C], Res) :-
    nota(T, InfoNota),
    Res = [InfoNota|NC],
    costruisci_note2(C, NC).

% costruisce il lick finale a partire dalle note ricavate
% costruisci_lick(+IndiceTonica, +ListaIndici, ListaRitmi, -Lick)
costruisci_lick(_,_,[],_).
costruisci_lick(IndiceTonica, [T|C], [T2|C2], Lick) :-
    costruisci_indici(IndiceTonica, [T|C], R1),
    costruisci_note(R1, R2),
    costruisci_note2(R2,R3),
    costruisci_lick(R3, [T2|C2], Lick).

% costruisci_lick(+ListaFinale, +ListaRitmi, -Lick)
costruisci_lick([],[],_).
costruisci_lick([T1|C1], [T2|C2], Lick) :-
    Lick = [[T1,T2] | NC],
    costruisci_lick(C1, C2, NC).


% vari lick da 4/4 (note+tempo)
% lick(+Numero, +Tonica, -Lick)

lick(1, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,[0,-2,-5,-6,-7,-9,-12],
    [croma_terzina_iniziale,croma_terzina,
    croma_terzina_finale,croma_terzina_iniziale,
    croma_terzina,croma_terzina_finale,half],
    Lick).

lick(2, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,[3,4,7,12,10,7,5,7,3,4,0],
    ['16th','16th','16th','16th','16th','16th','16th','16th',
    '16th','16th',quarter,pausa_eighth],
    Lick).

lick(3, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,[7,7,12,12],
    [croma_terzina_iniziale,croma_terzina,croma_terzina_finale,half,pausa_quarter],
    Lick).

lick(4, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,[12,10,7,6,5,3,0],
    [croma_terzina_iniziale,croma_terzina,croma_terzina_finale,
    croma_terzina_iniziale,croma_terzina,croma_terzina_finale,half],
    Lick).

lick(5, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,[-12,-10,-9,-8,-5,-3,-5,0],
    [quarter,eighth,eighth,eighth,eighth,eighth,eighth,whole],
    Lick).

lick(6, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,[12,10,9,7,9,3,2,0,-3,-5,0],
    [croma_terzina_iniziale,croma_terzina,croma_terzina_finale,
    eighth,eighth,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,
    eighth,eighth,whole],
    Lick).

lick(7, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,[7,6,5,0,3,4,0],
    [quarter,quarter,eighth,eighth,eighth,eighth,whole],
    Lick).

lick(8, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,[7,0,7,0,4,7,0,4],
    [eighth,eighth,eighth,eighth,eighth,eighth,eighth,eighth],
    Lick).

lick(9, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,[0,4,0,2,5,0,3,6,0,4,7],
    [eighth,eighth,eighth,eighth,eighth,eighth,
    eighth,eighth,eighth,eighth,half,pausa_quarter],
    Lick).

lick(10, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,[-10,-7,-3,0,-1,2,5,8,7,5,2,3,4,12],
    [pausa_eighth,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,
    eighth,eighth,eighth,eighth,eighth,eighth,eighth,eighth,eighth,eighth,
    pausa_quarter],
    Lick).

lick(11, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,[12,9,5,2,11,2,5,8,7,5,2,3,-5],
    [pausa_eighth,eighth,croma_terzina_iniziale,croma_terzina,croma_terzina_finale,
    eighth,eighth,eighth,eighth,eighth,eighth,eighth,eighth,eighth,eighth,
    pausa_quarter],
    Lick).

lick(12, Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,[-10,-8,-7,-3,0,4,2,0,-1,2,5,7,8,10,8,7,5,4,0,-5,-7-8,0],
    [eighth,eighth,eighth,eighth,eighth,eighth,eighth,eighth,eighth,eighth,
    eighth,eighth,eighth,'16th','16th',eighth,eighth,quarter,
    croma_terzina_iniziale,croma_terzina,croma_terzina_finale,eighth,eighth,
    pausa_quarter],
    Lick).