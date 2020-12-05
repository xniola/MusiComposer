['./composer.pl'].

% costruisce la lista degli indici relativi alla Tonica
% costruisci_indici(+IndiceTonica, +ListaIndici; -Res)
costruisci_indici(_,[],_).
costruisci_indici(IndiceTonica, ListaIndici, Res) :-
    Res = [IndiceTonica | NC],
    costruisci_indici(IndiceTonica, ListaIndici, NC, _).

costruisci_indici(_,[],_,_).
costruisci_indici(IndiceTonica, [T|C], Res, _) :-
    NewIndice is IndiceTonica - T,
    Res = [NewIndice|NC],
    costruisci_indici(IndiceTonica, C, NC, _).

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
  costruisci_lick(Indice,[2,5,6,7,9,12],
    [croma_terzina_iniziale,croma_terzina,
    croma_terzina_finale,croma_terzina_iniziale,
    croma_terzina,croma_terzina_finale,half],
    Lick).
