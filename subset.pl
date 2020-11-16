scala([do,re,mi,fa,sol,la,si]).

scegli_random([], []).
scegli_random(Lista, Elem) :-
        length(Lista, Len),
        random(0, Len, Index),
        nth0(Index, Lista, Elem).

genera(_,[],[]).
genera(Num,Lista,Res) :-
    Num > 0,
    scegli_random(Lista, Elem),
    append(Res,[Elem],Res1),
    Num1 is Num - 1,
    genera(Num1,Lista,Res1).
    