atomico([croma_terzina_iniziale,croma_terzina,croma_terzina_finale]).
atomico([X,Y]) :- 
  Z is X - Y,
  between(-1,1,Z).

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

prendiritmo([],_).
prendiritmo([T|C], Ritmi) :-
  nth0(1, T, Ritmo),
  cellula_ritmica(Ritmo,Num),
  Ritmi = [Num|NC],
  prendiritmo(C,NC).

genetico(Tonica) :- 
    % prendo due lick a caso
    random(1,21,Ran1),
    random(1,21,Ran2),
    lick(Ran1,Tonica,Lick1),
    lick(Ran2,Tonica,Lick2),

    % ricavo le note dei lick 
    prendinote(Tonica,Lick1,Note1),
    prendinote(Tonica,Lick2,Note2),
    prendiritmo(Lick1,Ritmi1),
    prendiritmo(Lick2,Ritmi2),
    writeln(Note1),
    writeln(Note2),
    writeln(Ritmi1),
    writeln(Ritmi2).