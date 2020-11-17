regione(a).
regione(b).
regione(c).
regione(d).
regione(e).
regione(f).

confina(a,b).
confina(a,c).
confina(a,d).
confina(a,e).
confina(a,f).
confina(b,c).
confina(b,d).
confina(b,e).
confina(b,f).
confina(c,d).
confina(d,e).
confina(e,f).


confina(X,Y) :- 
    X \= Y,
    confina(Y,X), !.




colore(red).
colore(yellow).
colore(blue).
colore(white).

colorato(Y, X) :- 
    regione(Y),
    colore(X).

colori_diversi(X,Y) :-
    colorato(X, C),
    colorato(Y, Z),
    Z \= C.

colori_uguali(X,Y) :-
    colorato(X, C),
    colorato(Y, C),
    C = C.

conflitto(A,B) :-
    regione(A),
    regione(B),
    confina(A,B), 
    colori_uguali(A,B).

colora(a,b,c,d,e,f) :-
    colorato(a, C1),
    colorato(b, C2),
    colorato(c, C3),
    colorato(d, C4),
    colorato(e, C5),
    colorato(f, C6),
    \+ conflitto(_,_),
    write(C1), nl,
    write(C2), nl, 
    write(C3), nl,
    write(C4), nl, 
    write(C5), nl,
    write(C6).
