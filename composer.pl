% estensione armonica della chitarra acustica
% nome della nota, frequenza in Hz
nota(e2, 82.41).
nota(f2, 87.31).
nota(fd2, 92.50).
nota(g2, 98.00).
nota(gd2, 103.83).
nota(a2,110.00).
nota(ad2,116.54).
nota(b2, 123.47).

nota(c3, 130.81).
nota(cd3, 138.59).
nota(d3, 146.83).
nota(dd3, 155.56).
nota(e3, 164.81).
nota(f3, 174.61).
nota(fd3, 185.00).
nota(g3, 196.00).
nota(gd3, 207.65).
nota(a3, 220.00).
nota(ad3, 233.08).
nota(b3, 246.94).

nota(c4, 261.63).
nota(cd4, 277.18).
nota(d4, 293.66).
nota(dd4, 311.13).
nota(e4, 329.63).
nota(f4, 349.23).
nota(fd4, 369.99).
nota(g4, 392.00).
nota(gd4, 415.30).
nota(a4, 440.00).
nota(ad4, 466.16).
nota(b4, 493.88).

nota(c5, 523.25).
nota(cd5, 554.37).
nota(d5, 587.33).
nota(dd5, 622.25).
nota(e5, 659.25).
nota(f5, 698.46).
nota(fd5, 739.99).
nota(g5, 783.99).
nota(gd5, 830.61).
nota(a5, 880.00).
nota(ad5, 932.33).
nota(b5, 987.77).
nota(c6, 1046.50).

tonalita([1,2,3,4,5,6]).

% es. [g,1,96],[a,3,24],[fd,2,48], [24] <-- pausa.
elem_pentagramma(Nota, Tonalita, Durata). 

durata(semicroma, 6).
durata(pausa_semicroma, 6).

durata(croma, 12).
durata(pausa_croma, 12).

durata(minima, 24).
durata(semi_minima, 24)





