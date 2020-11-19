"""
import winsound
Frequenza in Hz e Durata in millisecondi
winsound.Beep
494=500)
winsound.Beep
494=500)
"""
croma = 450
semicroma = 225
semiminima = 900
cromapunto = 675
minima = 1800
croma_terzina = 300

c3 = 130.81  
c4 = 261.63
c5 = 523.25
c6 = 1046.50
cd3 = 138.59
cd4 = 277.18
cd5 = 554.37
d3= 146.83
d4= 293.66
d5= 587.33
dd3= 155.56 
dd4= 311.13 
dd5= 622.25
e2= 82.41   
e3= 164.81  
e4= 329.63  
e5= 659.25
f2= 87.31   
f3= 174.61  
f4= 349.23  
f5= 698.46
fd2= 92.50  
fd3= 185.00 
fd4= 369.99 
fd5= 739.99
g2= 98.00   
g3= 196.00  
g4= 392.00  
g5= 783.99
gd2= 103.83 
gd3= 207.65 
gd4= 415.30 
gd5= 830.61
a2=110.00   
a3= 220.00  
a4= 440.00  
a5= 880.00
ad2=116.54  
ad3= 233.08 
ad4= 466.16 
ad5= 932.33
b2= 123.47  
b3= 246.94  
b4= 493.88  
b5= 987.77

""" su windows

file = open('spartito.txt', 'r')
spartito = file.read()
file.close()
exec('x = '+spartito)
for i in x:
    winsound.Beep(i[0],i[1])
"""

""" linux
duration = 500
frequency = 440.0

import os
file = open('spartito.txt', 'r')
spartito = file.read()

file.close()
print("Ecco "+ spartito)
exec('x = '+spartito)
for i in x:
    os.system('play -n synth %s sin %s' % (i[0]/500, i[1]))
"""