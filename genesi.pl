% restituisce una lista di 'Note' analizzando la struttura dati passata
% prendinote(+Tonica, +StrutturaDati, -Note)
prendinote(_,[],_).
prendinote(Tonica, [T|C], Note) :-
  estensione_armonica_chitarra(Estensione),
  indiceDi(Estensione,Tonica,Indice),
  nth0(0, T, Elem1),
  nota(N, Elem1),
  indiceDi(Estensione,N,IndiceNota),
  Semitoni is IndiceNota - Indice,
  Note = [Semitoni|NC],
  prendinote(Tonica,C,NC).

% restituisce una lista di 'Ritmi' analizzando la struttura dati passata
% prendiritmo(+StrutturaDati, -Ritmi)
prendiritmo([],_).
prendiritmo([T|C], Ritmi) :-
  nth0(1, T, Ritmo),
  cellula_ritmica(Ritmo,Num),
  Ritmi = [Num|NC],
  prendiritmo(C,NC).

% fa la somma degli elementi di una lista
% utilizza un accumulatore per ottimizzare lo stack
% somma(+Lista, 0, -Res)
somma(Lista,Res) :-
    somma(Lista,0,Res).
somma([L],F,Res) :-
  Res is F+L,
  !.
somma([],F,F).
somma([H|T],F,Res) :-
    F2 is F+H,
    somma(T,F2,Res).

% conta quante battute da 4/4 sono comprese in una lista di ritmi
% conta_battute(+Lista, -Num)
conta_battute(Lista,Num) :-
  somma(Lista,0,Somma),
  NumFrazionario is Somma / 4,
  Num is round(NumFrazionario).

% elimina ultimo elemento della lista
% elimina_ultimo(+Lista, -Risultato)
elimina_ultimo([_], []).
elimina_ultimo([T, Prossimo|C], [T|NC]):-
  elimina_ultimo([Prossimo|C], NC),
  !.

% true o false se posso tagliare una lista nel punto in cui la somma
% dei numeri a sinistra sia pari a 'Num', se si ritorna il punto di cut in 'Res'
% cut(+Lista, +Num, -Res)
cut(Lista,Num,Res) :-
  somma(Lista,Somma),
  Check is Somma - Num,
  abs(Check) < 0.05,
  !,
  Res = Lista.
cut(Lista,Num,Res1) :-
  somma(Lista,Somma),
  Somma > Num,
  elimina_ultimo(Lista, Res),
  cut(Res,Num,Res1),
  !.

% trova un punto di cut ammissibile fra le due liste di ritmi.
% un punto di cut è ammissibile se entrambe le battute possono essere
% divise in modo che le parti separate abbiano la stessa durata ritmica
% find_cut_point(+L1, +L2, -Res1, -Res2, -MaxCut)
find_cut_point(L1,L2,Res1,Res2,MaxCut) :-
  % trovo indice massimo di cut
  somma(L1,Len1),
  somma(L2,Len2),
  MaxCut is min(Len1,Len2) - 1,
  MaxCut > 0,
  % provo a tagliare nel punto
  cut(L1,MaxCut,Res1),
  cut(L2,MaxCut,Res2).
find_cut_point(L1,L2,Res1,Res2,MaxCut) :-
  % trovo indice massimo di cut
  somma(L1,Len1),
  somma(L2,Len2),
  MaxCut is min(Len1,Len2) - 2,
  MaxCut > 0,
  % provo a tagliare nel punto
  cut(L1,MaxCut,Res1),
  cut(L2,MaxCut,Res2).
find_cut_point(L1,L2,Res1,Res2,MaxCut) :-
  % trovo indice massimo di cut
  somma(L1,Len1),
  somma(L2,Len2),
  MaxCut is min(Len1,Len2) - 3,
  MaxCut > 0,
  % provo a tagliare nel punto
  cut(L1,MaxCut,Res1),
  cut(L2,MaxCut,Res2).
find_cut_point(L1,L2,Res1,Res2,MaxCut) :-
  % trovo indice massimo di cut
  somma(L1,Len1),
  somma(L2,Len2),
  MaxCut is min(Len1,Len2) - 4,
  MaxCut > 0,
  % provo a tagliare nel punto
  cut(L1,MaxCut,Res1),
  cut(L2,MaxCut,Res2).
find_cut_point(L1,L2,Res1,Res2,MaxCut) :-
  % trovo indice massimo di cut
  somma(L1,Len1),
  somma(L2,Len2),
  MaxCut is min(Len1,Len2) - 5,
  MaxCut > 0,
  % provo a tagliare nel punto
  cut(L1,MaxCut,Res1),
  cut(L2,MaxCut,Res2).
find_cut_point(L1,L2,Res1,Res2,MaxCut) :-
  % trovo indice massimo di cut
  somma(L1,Len1),
  somma(L2,Len2),
  MaxCut is min(Len1,Len2) - 6,
  MaxCut > 0,
  % provo a tagliare nel punto
  cut(L1,MaxCut,Res1),
  cut(L2,MaxCut,Res2).
find_cut_point(L1,L2,Res1,Res2,MaxCut) :-
  % trovo indice massimo di cut
  somma(L1,Len1),
  somma(L2,Len2),
  MaxCut is min(Len1,Len2) - 7,
  MaxCut > 0,
  % provo a tagliare nel punto
  cut(L1,MaxCut,Res1),
  cut(L2,MaxCut,Res2).

% costruisce i ritmi a partire dagli indici in ListaRitmi
% costruisci_ritmi(+ListaRitmi, -Res)
costruisci_ritmi([], _).
costruisci_ritmi([T|C], Res) :-
    cellula_ritmica(Ritmo,T),
    Res = [Ritmo|NC],
    costruisci_ritmi(C, NC).

% il predicato formato da 'ListaNote' e 'ListaRitmi' viene registrato nel database dei fatti.
% costruisci_predicato(+ListaNote, +ListaRitmi)
costruisci_predicato(ListaNote, ListaRitmi) :-
  findall(_, clause(lickfiglio(_,_,_),_), P), length(P,Len),
  Len1 is Len + 1,
  concat('lickfiglio(',Len1,S1),
  concat(S1,', Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,',S2),
  scrivi_su('./figli.pl',S2),
  scrivi_su('./figli.pl', ListaNote),
  scrivi_su('./figli.pl', ','),
  scrivi_su('./figli.pl',ListaRitmi),
  scrivi_su('./figli.pl',',Lick),!.'),
  ['./figli.pl'].


% fase di selezione dell algoritmo genetico. seleziono due lick dal database (genitori)
% a seconda della funzione di fitness calcolata, estrazione probabilistica
% selezione(+ListaLick, +Probabilita, -LickScelto)
selezione([X|_], [P|_], Cumul, Rand, X) :-
    Rand < Cumul + P.
selezione([_|Xs], [P|Ps], Cumul, Rand, Y) :-
    Cumul1 is Cumul + P,
    Rand >= Cumul1,
    selezione(Xs, Ps, Cumul1, Rand, Y).
selezione([X], [P], Cumul, Rand, X) :-
    Rand < Cumul + P.
selezione(Xs, Ps, Y) :- random(R), selezione(Xs, Ps, 0, R, Y).

% sostituisce in un certo indice della lista un elemento, e restituisce la nuova lista
% rimpiazza(+Lista,+Indice,+Elemento,-Risultato).
rimpiazza([_|T], 0, X, [X|T]).
rimpiazza([H|T], I, X, [H|R]):- I > -1, NI is I-1, rimpiazza(T, NI, X, R), !.
rimpiazza(L, _, _, L).

min_in_list([Min],Min).                 % Weve found the minimum

min_in_list([H,K|T],M) :-
    H =< K,                             % H is less than or equal to K
    min_in_list([H|T],M).                % so use H

min_in_list([H,K|T],M) :-
    H > K,                               % H is greater than K
    min_in_list([K|T],M).   


max_in_list([Max],Max).                 % Weve found the minimum

max_in_list([H,K|T],M) :-
    H =< K,                             % H is less than or equal to K
    max_in_list([K|T],M).                % so use H

max_in_list([H,K|T],M) :-
    H > K,                               % H is greater than K
    max_in_list([H|T],M). 

% predicato che muta una lista di note, rimpiazzando una nota a caso 
% con una che appartiene alla scala di blues della relativa tonica
% mutazione(+Tonica, +NoteOriginali, -NoteMutate)
mutazione(Tonica, NoteOriginali, NoteMutate) :-

    length(NoteOriginali, Len),
    random(0,Len,IndiceRimpiazzo),
    IndiceNotaAdiacente1 is IndiceRimpiazzo - 1,
    IndiceNotaAdiacente2 is IndiceRimpiazzo + 1,
    nth0(IndiceNotaAdiacente1,NoteOriginali,NotaAdiacente1),
    nth0(IndiceNotaAdiacente2,NoteOriginali,NotaAdiacente2),
    write('NotaAdiacente1 -->'),writeln(NotaAdiacente1),
    write('NotaAdiacente2 -->'),writeln(NotaAdiacente2),

    min_in_list([NotaAdiacente1,NotaAdiacente2],NotaMinima),
    max_in_list([NotaAdiacente1,NotaAdiacente2],NotaMassima),
    % NotaMassima is max(NotaAdicente1,NotaAdiacente2,NotaMassima),
    write('TTTTTT'),write(NotaMinima), writeln(NotaMassima),
    NotaMassimaScelta is NotaMinima + 8,
    NotaMinimaScelta is NotaMassima - 7,
    random(NotaMinimaScelta,NotaMassimaScelta,Mutazione),
    write('Nota mutante--->'),writeln(Mutazione),
    rimpiazza(NoteOriginali,IndiceRimpiazzo,Mutazione, NoteMutate).


% algoritmo genetico (fitness function+selezione+crossover+mutazione)
% genetico(+Tonica)
genetico(Tonica) :- 

    % valutazione fitness function e selezione dei 2 genitori
    fitness_function(Probabilita),
    selezione([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20],Probabilita,Lick1Scelto),
    selezione([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20],Probabilita,Lick2Scelto),

    lick(Lick1Scelto,Tonica,Lick1),
    lick(Lick2Scelto,Tonica,Lick2),

    % ricavo le note dei lick 
    prendinote(Tonica,Lick1,Note1),
    prendinote(Tonica,Lick2,Note2),

    % ricavo i ritmi dei lick
    prendiritmo(Lick1,Ritmi1),
    prendiritmo(Lick2,Ritmi2),

    % fase di crossover dell algoritmo genetico
    find_cut_point(Ritmi1,Ritmi2,Res1,Res2,CutPoint),
    write('Cut point: '),CutPoint1 is round(CutPoint),writeln(CutPoint1),
    write('Ritmo genitore 1: '),writeln(Ritmi1),
    write('Ritmo genitore 2: '),writeln(Ritmi2),
    write('Ritmo cut genitore 1: '),writeln(Res1),
    write('Ritmo cut genitore 2: '),writeln(Res2),
    append(Res1,Rimanente1,Ritmi1),
    append(Res2,Rimanente2,Ritmi2),
    write('Ritmo rimanente genitore 1: '),writeln(Rimanente1),
    write('Ritmo rimanente genitore 2: '),writeln(Rimanente2),
    append(Res1,Rimanente2,RitmoFiglio1),
    append(Res2,Rimanente1,RitmoFiglio2),
    write('Ritmo figlio 1: '),writeln(RitmoFiglio1),
    write('Ritmo figlio 2: '),writeln(RitmoFiglio2),
    length(Ritmi1,LenRit1),
    length(Ritmi2,LenRti2),
    length(RitmoFiglio1,LenFig1),
    length(RitmoFiglio2,LenFig2),
    write('Lunghezza ritmica genitore 1: '),writeln(LenRit1),
    write('Lunghezza ritmica genitore 2: '),writeln(LenRti2),
    write('Lunghezza ritmica Figlio 1: '),writeln(LenFig1),
    write('Lunghezza ritmica Figlio 2: '),writeln(LenFig2),
    write('Note genitore 1: '),writeln(Note1),
    write('Note genitore 2: '),writeln(Note2),

    length(Res1, LenRes1),
    length(Res2, LenRes2),
    append(CutNote1, RemainNote1, Note1), 
    length(CutNote1,LenRes1),
    append(CutNote2, RemainNote2, Note2), 
    length(CutNote2,LenRes2),
    write('Note cut genitore 1: '),writeln(CutNote1),
    write('Note cut genitore 2: '),writeln(CutNote2),
    write('Note rimanenti genitore 1: '),writeln(RemainNote1),
    write('Note rimanenti genitore 2: '),writeln(RemainNote2),

    append(CutNote1,RemainNote2, NoteFiglio1),
    append(CutNote2,RemainNote1,NoteFiglio2),
    write('Note figlio 1: '),writeln(NoteFiglio1),
    write('Note figlio 2: '),writeln(NoteFiglio2),

    costruisci_ritmi(RitmoFiglio1,RitmoFinaleFiglio1),
    costruisci_ritmi(RitmoFiglio2,RitmoFinaleFiglio2),

    % fase di mutazione dell algoritmo genetico
    mutazione(Tonica, NoteFiglio1, NoteMutateFiglio1),
    writeln('Mutazione'),
    write(NoteFiglio1),write('-->'),writeln(NoteMutateFiglio1),

    mutazione(Tonica, NoteFiglio2, NoteMutateFiglio2),  
    write(NoteFiglio2),write('-->'), writeln(NoteMutateFiglio2),

    costruisci_predicato(NoteMutateFiglio1,RitmoFinaleFiglio1),
    costruisci_predicato(NoteMutateFiglio2,RitmoFinaleFiglio2),
    !.


costruisci_predicato_figli(ListaNote, ListaRitmi) :-
  findall(_, clause(licknipote(_,_,_),_), P), length(P,Len),
  Len1 is Len + 1,
  concat('licknipote(',Len1,S1),
  concat(S1,', Tonica, Lick) :-
  estensione_armonica_chitarra(X),
  indiceDi(X,Tonica,Indice),
  costruisci_lick(Indice,',S2),
  scrivi_su('./nipoti.pl',S2),
  scrivi_su('./nipoti.pl', ListaNote),
  scrivi_su('./nipoti.pl', ','),
  scrivi_su('./nipoti.pl',ListaRitmi),
  scrivi_su('./nipoti.pl',',Lick),!.'),
  ['./nipoti.pl'].

genetico_nipoti(Tonica) :- 

    % valutazione fitness function e selezione dei 2 genitori
    fitness_function_figli(Probabilita),
    selezione([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18],Probabilita,Lick1Scelto),
    selezione([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18],Probabilita,Lick2Scelto),

    lickfiglio(Lick1Scelto,Tonica,Lick1),
    lickfiglio(Lick2Scelto,Tonica,Lick2),

    % ricavo le note dei lick 
    prendinote(Tonica,Lick1,Note1),
    prendinote(Tonica,Lick2,Note2),

    % ricavo i ritmi dei lick
    prendiritmo(Lick1,Ritmi1),
    prendiritmo(Lick2,Ritmi2),

    % fase di crossover dell algoritmo genetico
    find_cut_point(Ritmi1,Ritmi2,Res1,Res2,_),
    append(Res1,Rimanente1,Ritmi1),
    append(Res2,Rimanente2,Ritmi2),
    append(Res1,Rimanente2,RitmoFiglio1),
    append(Res2,Rimanente1,RitmoFiglio2),
    append(CutNote1, RemainNote1, Note1), 
    append(CutNote2, RemainNote2, Note2), 
    append(CutNote1,RemainNote2, NoteFiglio1),
    append(CutNote2,RemainNote1,NoteFiglio2),

    costruisci_ritmi(RitmoFiglio1,RitmoFinaleFiglio1),
    costruisci_ritmi(RitmoFiglio2,RitmoFinaleFiglio2),

    % fase di mutazione dell algoritmo genetico
    mutazione(Tonica, NoteFiglio1, NoteMutateFiglio1),
    mutazione(Tonica, NoteFiglio2, NoteMutateFiglio2),  

    costruisci_predicato_figli(NoteMutateFiglio1,RitmoFinaleFiglio1),
    costruisci_predicato_figli(NoteMutateFiglio2,RitmoFinaleFiglio2),
    !.
    