use_module(library(stream/console)).

read_line(S, X) :- 
   read_line_to_codes(S, L), 
   read_line2(L, X).

read_line2(end_of_file, _) :- !, fail.
read_line2(L, X) :-
   atom_codes(X, L).

test :-
   open('spartito.txt', read, Stream),
   test(Stream),
   close(Stream).

test(Stream) :-
   read_line(Stream, _), !,
   test(Stream).
test(_).