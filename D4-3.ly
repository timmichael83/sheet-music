


\version "2.18.2"



mBreak = { \break }

#(set-global-staff-size 25)

\paper {
top-system-spacing.basic-distance = #10
score-system-spacing.basic-distance = #20
system-system-spacing.basic-distance = #20
last-bottom-spacing.basic-distance = #10


}
global = {

\time 4/4
\set Staff.printKeyCancellation = ##f
% \omit Staff.TimeSignature
% \mergeDifferentlyHeadedOn
% \override NoteColumn.ignore-collision = ##t


% Turn off collision avoidance
% \override TextScript.outside-staff-priority = ##f
% \set Staff.explicitKeySignatureVisibility = #all-invisible
% \override Staff.KeySignature.break-visibility = #all-invisible

\textLengthOn



% \override TextScript.padding = #5

\override VerticalAxisGroup.staff-affinity = #DOWN
\set Staff.explicitKeySignatureVisibility = #begin-of-line-visible 
}




sopMusic = \relative c'' {

\key f \major

a2 g2 g2 a2

\key a \major

e'2 e2 e2 e2

\bar "||"

\key d \major

d2 d2 cis2 d2

\bar "||"

\break

\key ees \major

g,2 f2 f2 ees2

\bar "|."


} 

altoMusic = \relative c'' {

\partial 2 f,2 

\key f \major

f2 e2 |

f2

\bar "||"

\key a \major

a2 a2 gis2 a2

\bar "||"

\key d \major

fis2 e2 e2 fis2 

\bar "||"


\break

\key ees \major

ees2 ees2 d2 bes2

} 

tenorMusic = \relative {

\key f \major

c'2 c2 c2 c2 

\break

\key a \major

cis2 b2 b2 cis2

\bar "||"

\break

\key d \major

a2 a2 a2 a2 

\bar "||"


\break

\key ees \major

bes bes bes g2 

\bar "|."


} 

bassMusic = \relative  {

\override TextScript.padding = #2.5


\key f \major

f2_"T" c2_"D4 -" c2_"3" f2_"T"

\break

\key a \major 

a,2_"T" e'2_"D4 -"  e2_"3" a,2_"T"

\bar "||"

\break

\key d \major 

d2_"T" a2_"D4 - "  a2_"3" d2_"T" 

\bar "||"


\break



 \key ees \major 

 ees2_"T" bes2_"D4 -" bes2_"3" ees2_"T"

 % ees2 bes2  bes2 e2


}




\score {

<<

\new StaffGroup <<

\set StaffGroup.systemStartDelimiter = #'SystemStartBrace

\new ChoirStaff 

\override ChoirStaff.SystemStartBrace.collapse-height = #4


\new Staff = "women" <<
\new Voice = "sopranos" {
% \set Staff.midiInstrument = #"choir aahs"
\set Staff.midiInstrument = #"orchestral harp"


\voiceOne
<< \global \sopMusic >>
} 
\new Voice = "altos" {
\set Staff.midiInstrument = #"voice oohs" 

\voiceTwo
<< \global \altoMusic >>
} 

>>

\new Staff = "men" <<
\clef bass
\new Voice = "tenors" {
\set Staff.midiInstrument = #"pad 4 (choir)" 
\voiceOne
<< \global \tenorMusic >>
} 
\new Voice = "basses"  { 
\set Staff.midiInstrument = #"voice oohs"
\voiceTwo << \global \bassMusic >>
} 

>>


>>


>>
\layout {  
	\context {	
	\Score
      \override SpacingSpanner #'shortest-duration-space = #3.5

					}
	}
\midi { }
}

