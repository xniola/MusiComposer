scrivi_xml(Tonalita,N) :-
   scrivi_su('spartito.xml','<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
        <divisions>4</divisions>
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
'),
battuta_xml(Tonalita,N).

battuta_xml(_,0) :-
  scrivi_su('spartito.xml','</measure>
  </part>
</score-partwise>').

battuta_xml(Tonalita, N) :- 
  N1 is N-1,
  componi_battuta(Tonalita,Battuta),
  scrivi_battuta(Battuta),
  battuta_xml(Tonalita,N1).

% nota non alterata, tempo naturale
scrivi_battuta([]).
scrivi_battuta(Battuta) :-
  Battuta = [_|C],
  nth0(0, Battuta, Elemento),
  nth0(1, Elemento, Ritmo),
  not(Ritmo = croma_terzina_iniziale),
  not(Ritmo = croma_terzina_finale),
  not(Ritmo = croma_terzina),
  not(Ritmo = eighthdotted),
  nth0(0,Elemento,InfoNota),
  length(InfoNota,Len),
  Len = 2,
  nth0(0,InfoNota,Nota),
  nth0(1,InfoNota,Numero),
  concat('<note>
    <pitch>
      <step>', Nota, S1),
    concat('</step>
      <octave>',Numero,S2),
    concat(S1,S2,S3),
    concat('</octave>
    </pitch>
    <type>',Ritmo, S4),
    concat(S3,S4,S5),
    concat(S5,'</type>
</note>', S6),
  scrivi_su('spartito.xml',S6),
  scrivi_battuta(C).

% nota non alterata , tempo croma con punto
scrivi_battuta(Battuta) :-
  Battuta = [_|C],
  nth0(0, Battuta, Elemento),
  nth0(1, Elemento, Ritmo),
  Ritmo = eighthdotted,
  nth0(0,Elemento,InfoNota),
  length(InfoNota,Len),
  Len = 2,
  nth0(0,InfoNota,Nota),
  nth0(1,InfoNota,Numero),
  concat('<note>
    <pitch>
      <step>', Nota, S1),
    concat('</step>
      <octave>',Numero,S2),
    concat(S1,S2,S3),
    concat(S3,'</octave>
    </pitch>
    <type>eighth</type>
    <dot/>
    </note>', S4),
  scrivi_su('spartito.xml',S4),
  scrivi_battuta(C).

% nota non alterata, tempo terzina della croma iniziale
scrivi_battuta(Battuta) :-
  Battuta = [_|C],
  nth0(0, Battuta, Elemento),
  nth0(1, Elemento, Ritmo),
  Ritmo = croma_terzina_iniziale,
  nth0(0,Elemento,InfoNota),
  length(InfoNota,Len),
  Len = 2,
  nth0(0,InfoNota,Nota),
  nth0(1,InfoNota,Numero),
  concat('<note>
    <pitch>
      <step>', Nota, S1),
    concat('</step>
      <octave>',Numero,S2),
    concat(S1,S2,S3),
    concat(S3,'</octave>
    </pitch>
     <type>eighth</type>
        <time-modification>
          <actual-notes>3</actual-notes>
          <normal-notes>2</normal-notes>
        </time-modification>
        <notations>
          <tuplet number="1" placement="above" type="start"/>
        </notations>
    </note>', S4),
  scrivi_su('spartito.xml',S4),
  scrivi_battuta(C).

% nota non alterata, tempo croma terzina
scrivi_battuta(Battuta) :-
  Battuta = [_|C],
  nth0(0, Battuta, Elemento),
  nth0(1, Elemento, Ritmo),
  Ritmo = croma_terzina,
  nth0(0,Elemento,InfoNota),
  length(InfoNota,Len),
  Len = 2,
  nth0(0,InfoNota,Nota),
  nth0(1,InfoNota,Numero),
  concat('<note>
    <pitch>
      <step>', Nota, S1),
    concat('</step>
      <octave>',Numero,S2),
    concat(S1,S2,S3),
    concat(S3,'</octave>
    </pitch>
     <type>eighth</type>
        <time-modification>
          <actual-notes>3</actual-notes>
          <normal-notes>2</normal-notes>
        </time-modification>
    </note>', S4),
  scrivi_su('spartito.xml',S4),
  scrivi_battuta(C).

% nota non alterata, tempo croma terzina finale.
scrivi_battuta(Battuta) :-
  Battuta = [_|C],
  nth0(0, Battuta, Elemento),
  nth0(1, Elemento, Ritmo),
  Ritmo = croma_terzina_finale,
  nth0(0,Elemento,InfoNota),
  length(InfoNota,Len),
  Len = 2,
  nth0(0,InfoNota,Nota),
  nth0(1,InfoNota,Numero),
  concat('<note>
    <pitch>
      <step>', Nota, S1),
    concat('</step>
      <octave>',Numero,S2),
    concat(S1,S2,S3),
    concat(S3,'</octave>
    </pitch>
     <type>eighth</type>
        <time-modification>
          <actual-notes>3</actual-notes>
          <normal-notes>2</normal-notes>
        </time-modification>
        <notations>
          <tuplet number="1" type="stop"/>
        </notations>
    </note>', S4),
  scrivi_su('spartito.xml',S4),
  scrivi_battuta(C).


% nota alterata, tempo naturale
scrivi_battuta(Battuta) :-
  Battuta = [_|C],
  nth0(0, Battuta, Elemento),
  nth0(1, Elemento, Ritmo),
  not(Ritmo = croma_terzina_iniziale),
  not(Ritmo = croma_terzina_finale),
  not(Ritmo = croma_terzina),
  not(Ritmo = eighthdotted),
  nth0(0,Elemento,InfoNota),
  length(InfoNota,Len),
  Len = 3,
  nth0(0,InfoNota,Nota),
  nth0(1,InfoNota,Numero),
  nth0(2, InfoNota, Alterazione),
  concat('<note>
  <pitch>
    <step>', Nota, S1),
  concat('</step>
    <alter>',Alterazione,S2),
  concat('</alter>
    <octave>',Numero,S3),
  concat('</octave>
  </pitch>
  <type>',Ritmo, S4),
  concat(S1,S2,P1),
  concat(S3,S4,P2),
  concat(P1,P2,P3),
 concat(P3,'</type>
</note>',P4),
  scrivi_su('spartito.xml',P4),
  scrivi_battuta(C).


% nota alterata, tempo croma_terzina_iniziale



% pause

scrivi_battuta(Battuta) :-
  Battuta = [_|C],
  nth0(0, Battuta, Elemento),
  nth0(1, Elemento, Ritmo),
  Ritmo = pausa_eighth,
  nth0(0,Elemento,InfoNota),
  nth0(0,InfoNota,Nota),
  nth0(1,InfoNota,Numero),
  concat('<note>
    <pitch>
      <step>', Nota, S1),
    concat('</step>
      <octave>',Numero,S2),
    concat(S1,S2,S3),
    concat(S3,'</octave>
    </pitch>
     <type>eighth</type>
        <time-modification>
          <actual-notes>3</actual-notes>
          <normal-notes>2</normal-notes>
        </time-modification>
        <notations>
          <tuplet number="1" type="stop"/>
        </notations>
    </note>', S4),
  scrivi_su('spartito.xml',S4),
  scrivi_battuta(C).

cellula_ritmica(pausa_eighth, 2).
cellula_ritmica(pausa_eighthdotted, 3).
cellula_ritmica(pausa_16th, 1).
cellula_ritmica(pausa_quarter, 4).
cellula_ritmica(pausa_half, 8).