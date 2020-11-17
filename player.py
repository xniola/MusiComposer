"""
import winsound
Frequenza in Hz e Durata in millisecondi
winsound.Beep(494,500)
winsound.Beep(494,500)
"""
croma = 500
semicroma = 250
semiminima = 1000
cromapunto = 750
minima = 2000
g5 = 783.99
a3 = 220.00
e5 = 659.25
a4 = 440.00

file = open('spartito.txt', 'r')
spartito = file.read()
file.close()
exec('x = '+spartito)
for i in x:
    winsound.Beep(i[0],i[1])
    
