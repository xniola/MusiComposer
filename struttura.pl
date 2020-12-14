atomico([croma_terzina_iniziale,croma_terzina,croma_terzina_finale]).
atomico([X,Y]) :- 
  Z is X - Y,
  between(-1,1,Z).

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
% prendiritmo(+StrutturaDati, -Note)
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

% fa la somma dei primi n numeri della lista
% somma_nth(+Lista,+Numeri,-Somma)
somma_nth([],_,0).
somma_nth(_,0,0).
somma_nth([T|C],Num,Somma) :-
  Num1 is Num-1,
  somma_nth(C,Num1,NC),
  !,
  Somma is T + NC.

% conta le battute di una lista di ritmi
% conta_battute(+Lista, -Num)
conta_battute(Lista,Num) :-
  somma(Lista,0,Somma),
  Num is Somma / 4.

% elimina ultimo elemento della lista
% elimina_ultimo(+Lista, -Risultato)
elimina_ultimo([_], []).
elimina_ultimo([T, Prossimo|C], [T|NC]):-
  elimina_ultimo([Prossimo|C], NC),
  !.

% true o false se posso tagliare una lista nel punto in cui la somma
% dei numeri a sinistra sia pari a 'Num', se si ritorna il punto di cut in 'Res'
posso_tagliare(Lista,Num,Res) :-
  somma(Lista,Somma),
  Check is Somma - Num,
  abs(Check) < 0.05,
  !,
  Res = Lista.
posso_tagliare(Lista,Num,Res1) :-
  somma(Lista,Somma),
  Somma > Num,
  elimina_ultimo(Lista, Res),
  posso_tagliare(Res,Num,Res1),
  !.

genetico(Tonica) :- 
    % prendo due lick a caso
    random(1,21,Ran1),
    random(1,21,Ran2),
    lick(Ran1,Tonica,Lick1),
    lick(Ran2,Tonica,Lick2),

    % ricavo le note dei lick 
    prendinote(Tonica,Lick1,Note1),
    prendinote(Tonica,Lick2,Note2),

    % ricavo i ritmi dei lick
    prendiritmo(Lick1,Ritmi1),
    prendiritmo(Lick2,Ritmi2),

    %posso_tagliare(Ritmi1,3,Res1).
    writeln(Ritmi2),
    posso_tagliare(Ritmi2,3,Res2),
    writeln(Res2).


    