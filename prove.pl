nota(do).
nota(re).
nota(mi).
nota(fa).
nota(sol).
scala([do,re,mi,fa,sol]).


battuta(1, Durate) :- 
    append([50,150,200],[],Durate),
    write("scelgo la battuta uno").
battuta(2, Durate) :-
    append([50,150,100,50,50,100],[],Durate),
    write("scelgo la battuta due").

play() :-
    random(1,3,Res),
    battuta(Res, Durate), nl,
    write(Durate).
