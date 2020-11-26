% note non alterate
scrivi_nota(Lista) :-
length(Lista, Len),
Len = 2,
nth0(0,Lista,Elem1),
nth0(1,Lista,Elem2),
string_concat('<note>
    <pitch>
      <step>', Elem1 , S1),
string_concat('</step>
      <octave>', Elem2, S2),
string_concat(S1,S2,S3),
string_concat(S3,'</octave>
    </pitch>
    <type>whole</type>
</note>',S4),
  write(S4).

% note alterate
% Lista --> ['NomeNota',Tonalita, Alterazione]
scrivi_nota(Lista) :- 
nth0(0,Lista,Elem1),
nth0(1,Lista,Elem2),
nth0(2,Lista,Elem3),
string_concat('<note>
    <pitch>
      <step>', Elem1 , S1),
string_concat('</step>
      <alter>',Elem3,S2),
string_concat('</alter>
      <octave>', Elem2, S3),

string_concat(S1,S2,S4),
string_concat(S4,S3,S5),
string_concat(S5,'</octave>
    </pitch>
    <type>whole</type>
</note>',S6),
  write(S6).





converti(Percorso) :-
    append(Percorso),
    write('<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!DOCTYPE score-partwise PUBLIC
    "-//Recordare//DTD MusicXML 3.1 Partwise//EN"
    "http://www.musicxml.org/dtds/partwise.dtd">
<score-partwise version="3.1">
  <part-list>
    <score-part id="P1">
      <part-name>MusiComposer</part-name>
    </score-part>
  </part-list>
  <part id="P1">
    <measure number="1">
      <attributes>
        <divisions>2</divisions>
        <key>
          <fifths>0</fifths>
        </key>
        <time>
          <beats>4</beats>
          <beat-type>4</beat-type>
        </time>
        <clef>
          <sign>G</sign>
          <line>2</line>
        </clef>
      </attributes>  
'), nl,
write(Note),
write('</measure>
  </part>
</score-partwise>'),
    told.





    