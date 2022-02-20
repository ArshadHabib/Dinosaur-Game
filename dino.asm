.model small
.stack 100h
.data
msgp db "PLAY$"
msgi db "INSTRUCTIONS$"
msge db "EXIT$"
msgerr db "File not opened$"
msgpn db "Enter Player Name: $"
msgpn2 db "Player Name: $"
msgs db "Score: $"
msgh db 10,"Congratulations! You have made the HIGH Score$"
msgg db 10,"GAME OVER$"
msghs db "HI   :$"
score1 db 0
score2 db 0
score3 db 0
score4 db 0
score5 db 0
countn db 0
colu db 12
nm db 50 dup('?')
totalscore dw 0
highscore dw 55
result dw 0
count db 0
printh db 1
printcr db 0
life dw 5
psc db 12
pec db 27
psr db 5
per db 9
isc db 12
iec db 27
isr db 11
ier db 15
exsc db 12
exec db 27
exsr db 17
exer db 20
psrr db 40
perr db 80
ascr db 96
aecr db 216
file db 'inst.txt',0
file21 db 'name12.txt',0
string db 500 dup(?)
handle dw 0
msgb db "Press P to go Back$"
msgpn3 db "Arshad$"
bsc db 12
bec db 27
bsr1 db 10
ber db 22
ind db 0
;dinoc dw 1

file2 db 'high.txt',0
string2 db 100 dup(?)
handle2 dw 0
string3 dw 0
handle3 dw 0
collision dw 0
pixelx dw 0 ;pixel to check collision
pixely dw 0
key db 0
movebel db 0
mcheck db 0

line db 0
xline word 0
yline word 130

cloud db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3 
db 3,3,3,3,3,3,3,3,3,3,3,14,3,3,3,3,3,14,3,3,3
db 3,3,3,3,3,3,3,14,3,3,3,3,7,7,7,3,14,3,3,3,3
db 3,3,3,3,3,3,3,3,14,13,11,7,14,14,14,7,3,3,3,3,3
db 3,3,3,3,3,3,3,3,3,3,7,14,14,14,14,14,7,3,3,3,3
db 3,3,3,3,3,3,3,3,7,7,7,14,14,14,14,14,14,7,3,3,3
db 3,3,3,3,3,3,3,7,15,15,15,7,14,14,14,14,14,7,3,3,3
db 3,3,3,3,3,3,7,15,15,15,15,15,7,14,14,14,14,7,3,3,3
db 3,3,3,7,7,7,15,15,15,15,15,15,15,7,7,14,7,3,3,3,3
db 3,3,7,15,15,15,15,15,15,15,15,15,15,15,15,7,3,14,3,3,3
db 3,7,15,15,15,15,15,15,15,15,15,15,15,15,15,15,7,3,14,3,3
db 7,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,7,3,3,3,3
db 7,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,7,3,3,3,3
db 3,7,15,15,15,15,15,15,15,15,15,15,15,15,15,15,7,3,3,3,3
db 3,3,7,15,15,15,15,15,15,15,15,15,15,15,15,7,3,3,3,3,3
db 3,3,3,7,7,7,7,7,7,7,7,7,7,7,7,3,3,3,3,3,3

xcloud word 320
ycloud word 40
x2cloud dw 0
xtempc dw 0
xxcloud word 320
yycloud dw 40
xx2cloud dw 0
xxtempc dw 0
temp dw 0

crowb db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3
db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3
db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3
db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3
db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3
db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3
db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3
db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3
db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3
db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3
db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3
db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3
db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3
db 3,3,3,3,3,8,8,8,3,8,8,8,8,8,3,3,3,3,3
db 3,3,3,3,3,3,3,3,8,8,8,8,8,3,8,3,3,3,3
db 3,3,3,3,3,8,8,8,8,8,8,17,3,8,8,3,3,3,3
db 3,3,3,3,8,1,8,8,8,8,8,3,8,8,8,8,3,3,3
db 3,3,3,8,8,8,8,8,8,3,3,8,8,8,8,8,3,3,3
db 3,3,8,3,3,3,3,3,3,3,3,3,8,8,8,8,8,3,3
db 3,3,3,3,3,3,3,3,3,3,3,8,8,8,8,8,8,3,3
db 3,3,3,3,3,3,3,3,3,3,8,8,8,8,8,8,8,3,3
db 3,3,3,3,3,3,3,3,3,3,8,8,3,3,3,8,8,3,3
db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3

crow db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3 ;23*19
db 3,8,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,8,3
db 3,8,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,8,3
db 3,8,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,8,3
db 3,8,8,3,3,3,3,3,3,3,3,3,3,3,3,3,8,8,3
db 3,8,8,8,3,3,3,3,3,3,3,3,3,3,3,8,8,8,3
db 3,8,8,8,8,8,3,3,3,3,3,3,3,8,8,8,8,8,3
db 3,8,8,8,8,8,8,3,3,3,3,3,8,8,8,8,8,8,3
db 3,8,8,8,8,8,8,8,3,3,3,8,8,8,8,8,8,8,3
db 3,8,8,8,8,8,8,8,3,3,3,8,8,8,8,8,8,8,3
db 3,3,8,8,8,8,8,8,8,3,8,8,8,8,8,8,8,3,3
db 3,3,3,8,8,8,8,8,8,3,8,8,8,8,8,8,3,3,3
db 3,3,3,3,8,8,8,8,8,3,8,8,8,8,8,3,3,3,3
db 3,3,3,3,3,8,8,8,3,8,8,8,8,8,3,3,3,3,3
db 3,3,3,3,3,3,3,3,8,8,8,8,8,3,8,3,3,3,3
db 3,3,3,3,3,8,8,8,8,8,8,17,3,8,8,3,3,3,3
db 3,3,3,3,8,1,8,8,8,8,8,3,8,8,8,8,3,3,3
db 3,3,3,8,8,8,8,8,8,3,3,8,8,8,8,8,3,3,3
db 3,3,8,3,3,3,3,3,3,3,3,3,8,8,8,8,8,3,3
db 3,3,3,3,3,3,3,3,3,3,3,8,8,8,8,8,8,3,3
db 3,3,3,3,3,3,3,3,3,3,8,8,8,8,8,8,8,3,3
db 3,3,3,3,3,3,3,3,3,3,8,8,3,3,3,8,8,3,3
db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3
 
xcrow word 320
ycrow word 85;;;;;80
x2crow dw 0
xtempcr dw 0

crowach db 5
crowbch db 0

heart db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3
db 3,3,3,4,4,4,3,3,3,4,4,4,3,3,3,3
db 3,3,4,4,4,4,4,3,4,4,4,4,4,3,3,3
db 3,4,4,4,4,4,4,4,4,4,4,4,4,4,3,3
db 3,4,4,4,4,4,4,4,4,4,4,4,4,4,3,3
db 3,4,4,4,4,4,4,4,4,4,4,4,4,4,3,3
db 3,3,4,4,4,4,4,4,4,4,4,4,4,3,3,3
db 3,3,3,4,4,4,4,4,4,4,4,4,3,3,3,3
db 3,3,3,3,4,4,4,4,4,4,4,3,3,3,3,3
db 3,3,3,3,3,4,4,4,4,4,3,3,3,3,3,3
db 3,3,3,3,3,3,4,4,4,3,3,3,3,3,3,3
db 3,3,3,3,3,3,3,4,3,3,3,3,3,3,3,3
db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3
db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3
xheart word 240
yheart word 10
Xheartincrement word ?

hurdle db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3
 db 3,3,3,3,3,3,6,6,3,3,3,3,3,3,3
 db 3,3,6,3,3,6,6,6,6,3,3,3,3,3,3
 db 3,6,6,6,3,6,6,6,6,3,3,3,3,3,3
 db 3,6,6,3,3,6,6,6,6,3,3,3,3,3,3
 db 3,6,6,6,3,6,6,6,6,3,3,3,3,3,3
 db 3,3,6,6,3,6,6,6,6,3,3,6,3,3,3
 db 3,6,6,6,3,6,6,6,6,3,6,6,6,3,3
 db 3,6,6,6,6,6,6,6,6,3,6,3,6,3,3
 db 3,3,6,6,6,6,6,6,6,3,6,6,6,3,3
 db 3,3,3,6,6,6,6,6,6,3,6,6,6,3,3
 db 3,3,3,3,6,6,6,6,6,6,6,6,6,3,3
 db 3,3,3,3,3,6,6,6,6,6,6,6,3,3,3
 db 3,3,3,3,3,6,6,6,6,6,6,3,3,3,3
 db 3,3,3,3,3,3,6,6,6,6,6,3,3,3,3,3
 db 3,3,3,3,3,3,6,6,6,6,3,3,3,3,3,3
 db 3,3,3,3,3,6,3,6,6,3,3,3,3,3,3
 db 3,3,3,3,3,6,6,6,6,3,3,3,3,3,3
 db 3,3,3,3,3,6,6,6,6,3,3,3,3,3,3
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3
xhurdle word 320
yhurdle word 110
x2hurdle dw 0
xtemph dw 0
drawc2 dw 0

dino db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0;;;;;;;;;;;;30*28
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,5,5,5,5,3,3,3,3,3,3,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,5,2,2,2,2,5,5,3,3,3,3,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,5,2,2,2,2,2,2,2,5,3,3,3,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,5,2,2,2,15,15,15,2,2,2,5,3,3,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,5,2,2,2,15,3,15,2,2,2,2,5,3,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,5,2,2,2,15,15,15,2,2,2,2,2,5,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,5,2,2,2,2,2,2,2,2,2,2,2,5,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,5,2,2,2,2,2,2,2,2,2,2,2,5,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,5,2,2,2,2,2,5,2,2,2,2,2,5,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,5,2,2,2,2,2,2,5,2,2,2,5,3,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,5,2,2,2,5,5,5,5,5,5,5,3,3,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,5,2,2,2,5,3,3,3,3,3,3,3,3,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,5,2,2,2,5,3,3,3,3,3,3,3,3,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,5,2,2,2,5,3,3,3,3,3,3,3,3,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,5,2,2,2,5,3,3,3,3,3,3,3,3,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,5,2,2,2,5,3,3,3,3,3,3,3,3,3,0
 db 3,3,3,3,3,3,3,3,5,5,5,5,5,5,2,2,2,2,5,3,3,3,3,3,3,3,3,0
 db 3,3,3,3,3,3,3,5,2,2,2,2,2,2,2,2,2,2,5,3,3,3,3,3,3,3,3,0
 db 3,3,3,3,3,3,5,2,2,2,2,2,2,2,2,2,2,2,2,5,3,3,3,3,3,3,3,0
 db 3,3,3,3,3,5,2,2,2,2,2,2,2,2,2,2,2,2,2,5,3,3,3,3,3,3,3,0
 db 3,5,5,5,5,2,2,2,2,2,2,2,2,2,2,2,2,2,2,5,3,3,3,3,3,3,3,0
 db 3,5,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,5,3,3,3,3,3,3,3,0
 db 3,3,5,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,5,5,3,3,3,3,3,3,3,0
 db 3,3,3,5,5,5,5,2,2,2,2,2,2,2,2,2,5,5,5,5,3,3,3,3,3,3,3,0
 db 3,3,3,3,3,3,5,2,2,5,5,5,5,5,2,2,5,3,3,3,3,3,3,3,3,3,3,0
 db 3,3,3,3,3,3,5,2,2,5,3,3,3,5,2,2,5,3,3,3,3,3,3,3,3,3,3,0
 db 3,3,3,3,3,3,5,2,2,2,5,3,3,5,2,2,2,5,3,3,3,3,3,3,3,3,3,0
 db 3,3,3,3,3,3,5,5,5,5,5,3,3,5,5,5,5,5,3,3,3,3,3,3,3,3,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0
 
dinom db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0;;;;;;;;;;;;30*28
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,5,5,5,5,3,3,3,3,3,3,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,5,2,2,2,2,5,5,3,3,3,3,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,5,2,2,2,2,2,2,2,5,3,3,3,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,5,2,2,2,15,15,15,2,2,2,5,3,3,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,5,2,2,2,15,3,15,2,2,2,2,5,3,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,5,2,2,2,15,15,15,2,2,2,2,2,5,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,5,2,2,2,2,2,2,2,2,2,2,2,5,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,5,2,2,2,2,2,2,2,2,2,2,2,5,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,5,2,2,2,2,2,5,2,2,2,2,2,5,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,5,2,2,2,2,2,2,5,2,2,2,5,3,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,5,2,2,2,5,5,5,5,5,5,5,3,3,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,5,2,2,2,5,3,3,3,3,3,3,3,3,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,5,2,2,2,5,3,3,3,3,3,3,3,3,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,5,2,2,2,5,3,3,3,3,3,3,3,3,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,5,2,2,2,5,3,3,3,3,3,3,3,3,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,5,2,2,2,5,3,3,3,3,3,3,3,3,3,0
 db 3,3,3,3,3,3,3,3,5,5,5,5,5,5,2,2,2,2,5,3,3,3,3,3,3,3,3,0
 db 3,3,3,3,3,3,3,5,2,2,2,2,2,2,2,2,2,2,5,3,3,3,3,3,3,3,3,0
 db 3,3,3,3,3,3,5,2,2,2,2,2,2,2,2,2,2,2,2,5,3,3,3,3,3,3,3,0
 db 3,3,3,3,3,5,2,2,2,2,2,2,2,2,2,2,2,2,2,5,3,3,3,3,3,3,3,0
 db 3,5,5,5,5,2,2,2,2,2,2,2,2,2,2,2,2,2,2,5,3,3,3,3,3,3,3,0
 db 3,5,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,5,3,3,3,3,3,3,3,0
 db 3,3,5,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,5,3,3,3,3,3,3,3,0
 db 3,3,3,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,5,5,3,3,3,3,3,3,3,0
 db 3,3,3,3,3,3,3,3,5,2,2,5,5,5,5,5,2,2,5,3,3,3,3,3,3,3,3,0
 db 3,3,3,3,3,3,3,3,5,2,2,5,3,3,3,5,2,2,5,3,3,3,3,3,3,3,3,0
 db 3,3,3,3,3,3,3,3,5,2,2,2,5,3,3,5,2,2,2,5,3,3,3,3,3,3,3,0
 db 3,3,3,3,3,3,3,3,5,5,5,5,5,3,3,5,5,5,5,5,3,3,3,3,3,3,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0
xdino word 10
ydino word 105
xtempd dw 0
y2dino dw 0
x2dino dw 0

dinob db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0;;;;;;;;;;;;30*28
db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,5,5,5,5,3,3,3,3,3,3,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,5,2,2,2,2,5,5,3,3,3,3,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,5,2,2,2,2,2,2,2,5,3,3,3,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,5,2,2,2,15,15,15,2,2,2,5,3,3,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,5,2,2,2,15,3,15,2,2,2,2,5,3,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,5,2,2,2,15,15,15,2,2,2,2,2,5,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,5,2,2,2,2,2,2,2,2,2,2,2,5,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,5,2,2,2,2,2,2,2,2,2,2,2,5,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,5,2,2,2,2,2,5,2,2,2,2,2,5,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,5,2,2,2,2,2,2,5,2,2,2,5,3,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,5,2,2,2,5,5,5,5,5,5,5,3,3,3,0
 db 3,3,3,3,3,3,3,3,5,5,5,5,5,5,2,2,2,2,5,3,3,3,3,3,3,3,3,0
 db 3,3,3,3,3,3,3,5,2,2,2,2,2,2,2,2,2,2,5,3,3,3,3,3,3,3,3,0
 db 3,3,3,3,3,3,5,2,2,2,2,2,2,2,2,2,2,2,2,5,3,3,3,3,3,3,3,0
 db 3,3,3,3,3,5,2,2,2,2,2,2,2,2,2,2,2,2,2,5,3,3,3,3,3,3,3,0
 db 3,5,5,5,5,2,2,2,2,2,2,2,2,2,2,2,2,2,2,5,3,3,3,3,3,3,3,0
 db 3,5,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,5,3,3,3,3,3,3,3,0
 db 3,3,5,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,5,5,3,3,3,3,3,3,3,0
 db 3,3,3,5,5,5,5,2,2,2,2,2,2,2,2,2,5,5,5,5,3,3,3,3,3,3,3,0
 db 3,3,3,3,3,3,5,2,2,5,5,5,5,5,2,2,5,3,3,3,3,3,3,3,3,3,3,0
 db 3,3,3,3,3,3,5,2,2,5,3,3,3,5,2,2,5,3,3,3,3,3,3,3,3,3,3,0
 db 3,3,3,3,3,3,5,2,2,2,5,3,3,5,2,2,2,5,3,3,3,3,3,3,3,3,3,0
 db 3,3,3,3,3,3,5,5,5,5,5,3,3,5,5,5,5,5,3,3,3,3,3,3,3,3,3,0
 db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0

;++++++++++++++++++++++++++++++++++++++++++ Universal Variables Sttart ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
dinorun db 10
dinonrun db 0
control db 0
fms dw 0
sms dw 0
movefr db 0
movedino db 0
movebk db 0

moved db 0
moveu db 0

check db 0
;++++++++++++++++++++++++++++++++++++++++++ Universal Variables End +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

.code
clear macro		;CLear Macro
;{
	mov al,13h
	mov ah,0                  
	int 10h
;}
	endm		;End CLear
main proc

mov ax,@data
mov ds,ax

abovel:

	mov ah,0
	mov al,13h
	int 10h
mov countn,0	
mov colu,12	
mov bsc,12
mov bec,27
mov bsr1,18
mov ber,22
mov psc,12
mov pec,27
mov psr,5
mov per,9
mov isc,12
mov iec,27
mov isr,11
mov ier,15
mov exsc,12
mov exec,27
mov exsr,17
mov exer,20
mov psrr,40
mov perr,80
mov ascr,96
mov aecr,216
mov mcheck,0
	call background
	call menu
	call mouse
	cmp mcheck,1
	jne bypasso
	mov ah,0
	mov al,13h
	int 10h
	lea dx,msgpn
	mov ah,09
	int 21h
	mov si,0
	
	labeli:
		mov ah,01
		int 21h
		cmp al,13
		je exitim
		mov nm[si],al
		inc si
		inc countn
		jmp labeli
		
	exitim:
	
	continue:
	call background
	
	mov ah,02
	mov bh,0
	mov dh,0
	mov dl,0
	int 10h
	
	lea dx,msgpn2
	mov ah,09
	int 21h

	mov ah,02
	mov bh,0
	mov dh,0
	mov dl,colu
	int 10h	
	
	;mov dl,48
	;mov ah,02
	;int 21h
	
	;mov si,0
	
	;labelim2:
		;mov ah,02
		;mov bh,0
		;mov dh,0
		;mov dh,colu
		;int 10h
		lea dx,msgpn3
		mov ah,09
		int 21h
	;	inc si
	;	inc colu
	;	dec countn
	;	cmp countn,0
	;jb labelim2
	;exitim2:
	mov ah,02
	mov bh,0
	mov dh,1
	mov dl,90
	int 10h
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;to print score message
	lea dx,msgs
	mov ah,09
	int 21h
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;end score message
	;;;;;;;;;;;;;;;;;;;;;;;to print high score message
	mov ah,02
	mov bh,0
	mov dh,2
	mov dl,90
	int 10h
	lea dx,msghs
	mov ah,09
	int 21h
	
	call viewhigh
	
	mov ah,02
	mov bh,0
	mov dh,2
	mov dl,96
	int 10h
	lea dx,string2
	mov ah,09
	int 21h
	
	;;;;;;;;;;;;;;;;;;;;;;;;to print high score message end
	call linee
labelo:
;;;;;;;;;;;;;;;;;;;;;;;to print score

;;;;;;;;;;;;;;;;;;;;;;;score1 START

	cmp score1,10
	jb printscore1
	mov score1,0
	inc score2
	printscore1:
	mov ah,02
	mov bh,0
	mov dh,1
	mov dl,100
	int 10h
	
	mov dl,score1
	add dl,48
	mov ah,02
	int 21h
;;;;;;;;;;;;;;;score1 END
	
;;;;;;;;;;;;;score2 START
	cmp score2,10
	jb printscore2
	mov score2,0
	inc score3
	printscore2:
	mov ah,02
	mov bh,0
	mov dh,1
	mov dl,99
	int 10h
	
	mov dl,score2
	add dl,48
	mov ah,02
	int 21h
;;;;;;;;;;;;;;score2 END	
	
;;;;;;;;;;;;;;score3 START
	cmp score3,10
	jb printscore3
	mov score3,0
	inc score4
	printscore3:
	mov ah,02
	mov bh,0
	mov dh,1
	mov dl,98
	int 10h
	
	mov dl,score3
	add dl,48
	mov ah,02
	int 21h
;;;;;;;;;;;;;;;;;score3 END	
	
;;;;;;;;;;;;;;;;;;score4 START	
	cmp score4,10
	jb printscore4
	mov score4,0
	inc score5
	printscore4:
	mov ah,02
	mov bh,0
	mov dh,1
	mov dl,97
	int 10h
	
	mov dl,score4
	add dl,48
	mov ah,02
	int 21h
;;;;;;;;;;;;;;;;;;score4 END	
	
;;;;;;;;;;;;;;;;;score5 START
	cmp score5,10
	jb printscore5
	mov score5,0
	printscore5:	
	mov ah,02
	mov bh,0
	mov dh,1
	mov dl,96
	int 10h	
	
	mov dl,score5
	add dl,48
	mov ah,02
	int 21h
;;;;;;;;;;;;;;;;;;;;;;score5 END	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;end print score
	;inc score
;mov xdino,10
mov line,0
mov xline,0
mov yline,130
;mov xcloud,299
mov ycloud,40
mov collision,0
mov x2cloud,0
;mov xtempc,0
;mov xcrow,170
mov ycrow,85
mov xheart,240
mov yheart,10
mov Xheartincrement,0
mov key,0
inc score1
;mov xhurdle,299
mov yhurdle,110
;mov x2hurdle,0
;mov xtemph,0
	;call background
	call dil
	;call linee
	cmp printcr,0
	je notprintcr
	cmp printcr,110
	jne notseth
	mov printh,110
	mov printcr,0
	notseth:
	inc printcr
	mov ax,xcrow
	mov x2crow,ax
	cmp crowach,0
	je drawcrowb
	call crowo
	jmp bypasscrowb
	drawcrowb:
	cmp crowbch,0
	je bypasscrowb
	call crowbd
	bypasscrowb:
	mov ax,x2crow
	mov xcrow,ax
	cmp xcrow,-19
	jne bypasscrow
	mov xcrow,301
	bypasscrow:
	sub xcrow,1
	notprintcr:
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;printing cloud 2 times
	mov ax,xcloud
	mov x2cloud,ax
	call cloudo
	mov ax,x2cloud
	mov xcloud,ax
	cmp drawc2,1
	mov ax,xcloud
	mov temp,ax
	jne bypass4
	mov ax,xxcloud
	mov xx2cloud,ax
	mov xcloud,ax
	call cloudo
	mov ax,xx2cloud
	mov xxcloud,ax
	sub xxcloud,1
	cmp xxcloud,-21
	jne bypass5
	mov xxcloud,299
	bypass5:
	mov ax,temp
	mov xcloud,ax
	bypass4:
	sub xcloud,1
	cmp xcloud,220
	jne bypass3
	mov drawc2,1
	bypass3:
	cmp xcloud,-21
	jne bypass1
	mov xcloud,299
	bypass1:
	;;;;;;;;;;;;;;;;;;;;;;;;;;;end pring cloud 2 times
		
	;;;;;;;;;;;;;;;;;;;;;;;;;;;printing hurdle
	cmp printh,0
	je notprinth
	cmp printh,110
	jne notsetcr
	mov printcr,110
	mov printh,0
	notsetcr:
	inc printh
	mov ax,xhurdle
	mov x2hurdle,ax
	call hurdleo
	mov ax,x2hurdle
	mov xhurdle,ax
	sub xhurdle,1
	cmp xhurdle,-15
	jne bypass2
	mov xhurdle,305
	bypass2:
	notprinth:
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;end printing hurdle	

	cmp ydino,101
	jae notprintline
	call linee
	notprintline:
	call checkkey
	cmp moveu,1
	je labelmovup
	cmp moved,1
	je labelmoved
	jmp notprintd
	labelmovup:
	call moveup
	jmp notprintd
	labelmoved:
	call movedown
	notprintd:
		cmp movefr,1
		jne notmovefr
		call moveforward
		call lineuptox
		notmovefr:
		cmp movebk,1
		jne notmovebk
		call moveback
		call lineuptox
		notmovebk:
		cmp movebel,0
		je exitdino
		;mov movebel,0
		;mov dino,0
		call dinood
		dec movebel
	exitdino:
	cmp key,9
	je exirpro
	;cmp dinoc,1
	;jne bypassdino
	cmp movebel,0
	jne bypassdd
	call dinoo
	bypassdd:
	;mov dinoc,0
	;bypassdino:
	cmp collision,1
	jne bypasslife
	dec life
	mov collision,0
	cmp life,-1
	je exirpro
	mov xdino,10
	mov ydino,105
	mov moveu,0
	mov moved,0
	mov movedino,0
	jmp continue
	bypasslife:
	mov fms,000fh
	mov sms,4240h
	;call delay
	jmp labelo
	jmp exitp
	
	bypasso:
	
	cmp mcheck,2
	je showi
	cmp mcheck,3
	je exitp
	jmp abovel
	showi:
		call showinst
	jmp abovel
	
exitp:

exirpro:

mov al,score1
mov ah,0
add totalscore,ax
mov al,score2
mov bl,10
mul bl
add totalscore,ax
mov al,score3
mov bl,100
mul bl
add totalscore,ax
mov al,score4
mov ah,0
mov bx,1000
mul bx
add totalscore,ax
mov al,score5
mov ah,0
mov bx,10000
mul bx
add totalscore,ax

call viewhigh

mov ax,highscore
cmp ax,totalscore
jae nothighs
call background
lea dx,msgh
mov ah,09
int 21h
;call writehigh

nothighs:
	call background
	mov ah,02
	mov bh,0
	mov dh,10
	mov dl,20
	int 10h
	
	lea dx,msgg
	mov ah,09
	int 21h

mov ah,4ch
int 21h
main endp

menu proc
	;draw play message
	labelStr:
		mov ah,02
		mov bh,0
		mov dh,psr
		mov dl,psc
		int 10h
		
		mov dl,'*'
		mov ah,02
		int 21h
		
		inc psc
		cmp psc,27
	jbe labelStr
	
	inc psr
	mov psc,12
	
	mov ah,02
	mov bh,0
	mov dh,psr
	mov dl,psc
	int 10h
	
	mov dl,'*'
	mov ah,02
	int 21h
	
	mov ah,02
	mov bh,0
	mov dh,psr
	mov dl,pec
	int 10h
	
	mov dl,'*'
	mov ah,02
	int 21h
	
	inc psr
	
	mov ah,02
	mov bh,0
	mov dh,psr
	mov dl,psc
	int 10h
	
	mov dl,'*'
	mov ah,02
	int 21h
	
	inc psc
	
	mov ah,02
	mov bh,0
	mov dh,psr
	mov dl,psc
	int 10h
		
	add psc,5
	
	mov ah,02
	mov bh,0
	mov dh,psr
	mov dl,psc
	int 10h
	
	
	lea dx,msgp
	mov ah,09
	int 21h
	
	mov ah,02
	mov bh,0
	mov dh,psr
	mov dl,pec
	int 10h
	
	mov dl,'*'
	mov ah,02
	int 21h
	
	inc psr
	mov psc,12
	mov ah,02
	mov bh,0
	mov dh,psr
	mov dl,psc
	int 10h
	
	mov dl,'*'
	mov ah,02
	int 21h
	
	mov ah,02
	mov bh,0
	mov dh,psr
	mov dl,pec
	int 10h
	
	mov dl,'*'
	mov ah,02
	int 21h
	
	inc psr
	mov psc,12
	labelStr2:
		mov ah,02
		mov bh,0
		mov dh,psr
		mov dl,psc
		int 10h
		
		mov dl,'*'
		mov ah,02
		int 21h
		
		inc psc
		cmp psc,27
	jbe labelStr2
	
	;draw Instructions message
	mov dl,10
	mov ah,02
	int 21h
	
	labelStri:
		mov ah,02
		mov bh,0
		mov dh,isr
		mov dl,isc
		int 10h
		
		mov dl,'*'
		mov ah,02
		int 21h
		
		inc isc
		cmp isc,27
	jbe labelStri
	
	inc isr
	mov isc,12
	
	mov ah,02
	mov bh,0
	mov dh,isr
	mov dl,isc
	int 10h
	
	mov dl,'*'
	mov ah,02
	int 21h
	
	mov ah,02
	mov bh,0
	mov dh,isr
	mov dl,iec
	int 10h
	
	mov dl,'*'
	mov ah,02
	int 21h
	
	inc isr
	
	mov ah,02
	mov bh,0
	mov dh,isr
	mov dl,isc
	int 10h
	
	mov dl,'*'
	mov ah,02
	int 21h
	
	inc isc
	
	mov ah,02
	mov bh,0
	mov dh,isr
	mov dl,isc
	int 10h
	
	add isc,1
	
	mov ah,02
	mov bh,0
	mov dh,isr
	mov dl,isc
	int 10h
	
	
	lea dx,msgi
	mov ah,09
	int 21h
	
	mov ah,02
	mov bh,0
	mov dh,isr
	mov dl,iec
	int 10h
	
	mov dl,'*'
	mov ah,02
	int 21h
	
	inc isr
	mov isc,12
	mov ah,02
	mov bh,0
	mov dh,isr
	mov dl,isc
	int 10h
	
	mov dl,'*'
	mov ah,02
	int 21h
	
	mov ah,02
	mov bh,0
	mov dh,isr
	mov dl,iec
	int 10h
	
	mov dl,'*'
	mov ah,02
	int 21h
	
	inc isr
	mov isc,12
	labelStri2:
		mov ah,02
		mov bh,0
		mov dh,isr
		mov dl,isc
		int 10h
		
		mov dl,'*'
		mov ah,02
		int 21h
		
		inc isc
		cmp isc,27
	jbe labelStri2
	
	;message exit
	
	mov dl,10
	mov ah,02
	int 21h
	
	labelStre:
		mov ah,02
		mov bh,0
		mov dh,exsr
		mov dl,exsc
		int 10h
		
		mov dl,'*'
		mov ah,02
		int 21h
		
		inc exsc
		cmp exsc,27
	jbe labelStre
	
	inc exsr
	mov exsc,12
	
	mov ah,02
	mov bh,0
	mov dh,exsr
	mov dl,exsc
	int 10h
	
	mov dl,'*'
	mov ah,02
	int 21h
	
	mov ah,02
	mov bh,0
	mov dh,exsr
	mov dl,exec
	int 10h
	
	mov dl,'*'
	mov ah,02
	int 21h
	
	inc exsr
	
	mov ah,02
	mov bh,0
	mov dh,exsr
	mov dl,exsc
	int 10h
	
	mov dl,'*'
	mov ah,02
	int 21h
	
	inc exsc
	
	mov ah,02
	mov bh,0
	mov dh,exsr
	mov dl,exsc
	int 10h
	
	add exsc,5
	
	mov ah,02
	mov bh,0
	mov dh,exsr
	mov dl,exsc
	int 10h
	
	lea dx,msge
	mov ah,09
	int 21h
	
	mov ah,02
	mov bh,0
	mov dh,exsr
	mov dl,exec
	int 10h
	
	mov dl,'*'
	mov ah,02
	int 21h
	
	inc exsr
	mov exsc,12
	mov ah,02
	mov bh,0
	mov dh,exsr
	mov dl,exsc
	int 10h
	
	mov dl,'*'
	mov ah,02
	int 21h
	
	mov ah,02
	mov bh,0
	mov dh,exsr
	mov dl,exec
	int 10h
	
	mov dl,'*'
	mov ah,02
	int 21h
	
	inc exsr
	mov exsc,12
	labelStre2:
		mov ah,02
		mov bh,0
		mov dh,exsr
		mov dl,exsc
		int 10h
		
		mov dl,'*'
		mov ah,02
		int 21h
		
		inc exsc
		cmp exsc,27
	jbe labelStre2
ret
menu endp

mouse proc

	mov ax,0
	int 33h
	
	mov ax,01
	int 33h

mousecheck:
	mov ax,03
	int 33h
	shr cx,1
	cmp bx,1
	jne exitmo
	
	cmp dx,40
	jb instruct
	cmp dx,80
	ja instruct
	cmp cx,96
	jb instruct
	cmp cx,216
	ja instruct	
	
	mov mcheck,1
	jmp exitmousech1
	
	instruct:
	
	cmp dx,88
	jb exitmsg
	cmp dx,128
	ja exitmsg
	cmp cx,96
	jb exitmsg
	cmp cx,216
	ja exitmsg
	
	mov mcheck,2
	jmp exitmousech1
	exitmsg:
	cmp dx,136
	jb exitmo
	cmp dx,176
	ja exitmo
	cmp cx,96
	jb exitmo
	cmp cx,216
	ja exitmo
	
	mov mcheck,3
	jmp exitmousech1
	exitmo:
	jmp mousecheck

	exitmousech1:

ret
mouse endp

;;;;;;;;;;;;;;;;;;;;;;;;;;show instruction START
showinst proc

	mov ah,0
	int 10h

	mov al,13h
	int 10h

	; open file
	mov ah,3dh
	mov al,0
	lea dx,file
	int 21h
	jc error1
	mov handle,ax

	; read from file
	mov ah,3fh
	mov bx,handle
	mov cx,500
	lea dx,string
	int 21h
	jc error1

	; display string

	lea dx,string
	mov ah,09h
	int 21h

	; close file
	mov ah,3eh
	mov bx,handle
	int 21h
	jmp exit1

	error1:
	lea dx,msgerr
	mov ah,09
	int 21h

	exit1:
	

		
		add bsc,1
		
		mov ah,02
		mov bh,0
		mov dh,bsr1
		mov dl,bsc
		int 10h
				
		lea dx,msgb
		mov ah,09
		int 21h
		exiil:
			mov ah, 01h
			int 16h
					mov ah, 0
		int 16h
		cmp al,112
		jne exiil
		mov mcheck,0
		jmp bym2
		

	mov ax,0
	int 33h
	
	mov ax,01
	int 33h
	mousecheck2:	
		mov ax,03
		int 33h
		shr cx,1
		cmp bx,1
		jne exitmo2
		
		cmp dx,144
		jb exitmo2
		cmp dx,176
		ja exitmo2
		cmp cx,96
		jb exitmo2
		cmp cx,216
		ja exitmo2
		
		mov mcheck,0
		jmp bym2
		
		exitmo2:
		jmp mousecheck2
	
	bym2:
	
	ret
	showinst endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;show instruction END

;Heart for life:
;===========
;++++++++++++++++++++++++++++++++++++++ Start Hearts +++++++++++++++++++++++++++++++++++++++++++++++++++++++
dil proc
;{	
	
	mov ax,xheart 
	mov Xheartincrement,ax
	cmp life,0
	je bypassheart
	mov cx,life
	LOOOOP:
	;{
		push cx
		mov si,offset heart
		mov cx,14
		L1:
		;{	
			mov bx,Xheartincrement
			mov xheart,bx
			push cx

			mov cx,15
			mov dx,yheart
			L2:
			;{
				push cx
				mov ah,0CH
				mov cx,xheart
				mov al,[si]
				int 10h
				inc xheart
				inc si
				pop cx
			;}
			Loop L2
			
		;	mov bx,temp
			mov ax,Xheartincrement
			mov xheart,ax
			add yheart,1
			inc si
			pop cx
				;mov cx,temp
		;}
		Loop L1
		sub yheart,14
		pop cx
		Add Xheartincrement,15
		loop LOOOOP
	;}
	bypassheart:
	ret
	dil endp
;++++++++++++++++++++++++++++++++++++++ End Hearts +++++++++++++++++++++++++++++++++++++++++++++++++++++++

;Hurdles:
;===========	
;++++++++++++++++++++++++++++++++++++++ Start Hurdle +++++++++++++++++++++++++++++++++++++++++++++++++++++++
hurdleo proc
;{	
		mov si,offset hurdle
	mov cx,19
		mov ax,xhurdle
mov xtemph,ax
	L1:
	;{	
		push cx

		mov cx,14
		mov dx,yhurdle
		L2:
		;{
			push cx
			mov ah,0CH
			mov cx,xhurdle
			mov al,[si]
			int 10h
			inc xhurdle
			inc si
			pop cx
		;}
		Loop L2
		
		mov ax,xtemph
		mov xhurdle,ax
		add yhurdle,1
		inc si
		pop cx
	;}
	Loop L1
	;sub yhurdle,28
	ret
	hurdleo endp
;++++++++++++++++++++++++++++++++++++++ End Hurdle +++++++++++++++++++++++++++++++++++++++++++++++++++++++
	
;Dino:
;===========
;++++++++++++++++++++++++++++++++++++++ Start Dinno +++++++++++++++++++++++++++++++++++++++++++++++++++++++
dinoo proc
;{	

	mov ax,ydino
	mov y2dino,ax
	mov ax,xdino
	mov x2dino,ax
	cmp dinorun,0
	je drawdinor
	mov check,1
	mov si,offset dino
	jmp bypassdinon
	drawdinor:
	mov check,0
	cmp dinonrun,0
	je bypassdinon
	mov si,offset dinom
	bypassdinon:
	mov cx,30
	L1:
	;{	
		push cx
		mov cx,27
		mov dx,ydino
		mov ax,xdino
		mov x2dino,ax
		L2:
		;{
			mov ind,0
			push cx
			mov ah,0CH
			mov cx,xdino
			mov al,[si]
			mov ind,al
			int 10h
			cmp ind,5
			jne bypasscoll
			mov ax,xdino
			mov pixelx,ax
			mov ax,ydino
			mov pixely,ax
			call checkcollision
			bypasscoll:
			inc xdino
			inc si
			pop cx
		;}
		Loop L2
		
		mov ax,x2dino
		mov xdino,ax
		add ydino,1
		inc si
		pop cx
	;}
	Loop L1
	sub ydino,30
	mov ax,y2dino
	mov ydino,ax
	mov ax,x2dino
	mov xdino,ax
	
	cmp check,1
	jne bypassl1
	dec dinorun
	cmp dinorun,0
	jne bypassdinor2
	mov dinonrun,10
	bypassdinor2:
	jmp exitpop
	bypassl1:
	dec dinonrun
	cmp dinonrun,0
	jne bypassdinonr
	mov dinorun,10
	bypassdinonr:
	
	exitpop:
	
	ret
;}
	dinoo endp
;++++++++++++++++++++++++++++++++++++++ End Dino +++++++++++++++++++++++++++++++++++++++++++++++++++++++

;Bottom Line:
;===========	
;++++++++++++++++++++++++++++++++++++++ Start Line +++++++++++++++++++++++++++++++++++++++++++++++++++++++
linee proc
;{	
	mov cx,320
	mov dx,yline
	LOOOOP:
	;{
		push cx
		mov ah,0CH
		mov cx,xline
		mov dx,yline
		mov al,0
		int 10h

		inc xline
		;sub yline,1
		pop cx
		loop LOOOOP
	;}
	ret
	linee endp
;++++++++++++++++++++++++++++++++++++++ End Line +++++++++++++++++++++++++++++++++++++++++++++++++++++++

;Crow:
;===========
;++++++++++++++++++++++++++++++++++++++ Start Crow +++++++++++++++++++++++++++++++++++++++++++++++++++++++	
crowo proc
;{	
		mov si,offset crow
	mov ax,xcrow
	mov xtempcr,ax
	mov cx,23
	L1:
	;{	
		push cx

		mov cx,18
		mov dx,ycrow
		L2:
		;{
			push cx
			mov ah,0CH
			mov cx,xcrow
			mov al,[si]
			int 10h
			inc xcrow
			inc si
			pop cx
		;}
		Loop L2
		
		mov ax,xtempcr
		mov xcrow,ax
		add ycrow,1
		inc si
		pop cx
			;mov cx,temp
	;}
	Loop L1
	sub ycrow,23
	dec crowach
	cmp crowach,0
	jne bypassinc2
	mov crowbch,5
	bypassinc2:
	ret
	crowo endp
;++++++++++++++++++++++++++++++++++++++ End Crow +++++++++++++++++++++++++++++++++++++++++++++++++++++++

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;to draw crow without wings START
crowbd proc
;{	
		mov si,offset crowb
	mov ax,xcrow
	mov xtempcr,ax
	mov cx,23
	L1:
	;{	
		push cx

		mov cx,18
		mov dx,ycrow
		L2:
		;{
			push cx
			mov ah,0CH
			mov cx,xcrow
			mov al,[si]
			int 10h
			inc xcrow
			inc si
			pop cx
		;}
		Loop L2
		
		mov ax,xtempcr
		mov xcrow,ax
		add ycrow,1
		inc si
		pop cx
			;mov cx,temp
	;}
	Loop L1
	sub ycrow,23
	dec crowbch
	cmp crowbch,0
	jne bypassinc
	mov crowach,5
	bypassinc:
	ret
	crowbd endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;to draw crow without wings END	
;Clouds:
;===========
;++++++++++++++++++++++++++++++++++++++ Start Clouds +++++++++++++++++++++++++++++++++++++++++++++++++++++++
cloudo proc
;{	
		mov si,offset cloud
	mov cx,16
	mov ax,xcloud
	mov xtempc,ax
	L1:
	;{	
		push cx

		mov cx,20
		mov dx,ycloud
		L2:
		;{
			push cx
			mov ah,0CH
			mov cx,xcloud
			mov al,[si]
			int 10h
			inc xcloud
			inc si
			pop cx
		;}
		Loop L2
		
	;	mov bx,temp
		mov ax,xtempc
		mov xcloud,ax
		add ycloud,1
		inc si
		pop cx
			;mov cx,temp
	;}
	Loop L1
	;sub ycloud,28
	ret
cloudo endp
;++++++++++++++++++++++++++++++++++++++ End Cloud +++++++++++++++++++++++++++++++++++++++++++++++++++++++
	
;++++++++++++++++++++++++++++++++++++++ Start Background +++++++++++++++++++++++++++++++++++++++++++++++++++++++
background proc	
	mov al,13h
	mov ah,0                  
	int 10h			
	mov ah,06h
	mov al,00h
	mov bh,3
	mov ch,0
	mov cl,0
	mov dh,24
	mov dl,80
	int 10h
ret
background endp
;++++++++++++++++++++++++++++++++++++++ End Background +++++++++++++++++++++++++++++++++++++++++++++++++++++++

;++++++++++++++++++++++++++++++++++++++ Delay Start +++++++++++++++++++++++++++++++++++++++++++++++++++++++
	delay proc
	mov cx,fms
	mov dx,sms
	mov ah,86h
	mov al,0
	int 15h
	ret
	delay endp
;++++++++++++++++++++++++++++++++++++++ Delay End +++++++++++++++++++++++++++++++++++++++++++++++++++++++

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;to move dino up
moveup proc
	
	dec movedino
	dec ydino
	call dinoo
	
	cmp ydino,65;;;;;;;;;;;;;;;;;;base of dino at pixel 65
	jne bypassu
	mov moved,1
	mov moveu,0
	jmp bypassu2
	bypassu:
	mov moveu,1
	mov moved,0
	bypassu2:
	
	ret
	
moveup endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;end dino move up

;;;;;;;;;;;;;;;;;;;;;;;;;;to move dino down
movedown proc

	dec movedino
	inc ydino
	call dinoo
	
	cmp ydino,105;;;;;;;;;;;;;;;maximum end of Dino at pixel 105
	jne bypassd
	mov moved,0
	mov movedino,0
	mov moveu,0
	jmp bypassd2
	bypassd:
	mov moveu,0
	bypassd2:
	
	ret
movedown endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;end dino move down

;;;;;;;;;;;;;;;;;;;;;;;;;;;;to move dino forward StART
moveforward proc

	inc xdino
	call dinoo
	mov movefr,0
	
ret
moveforward endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;to move dino forward END

;;;;;;;;;;;;;;;;;;;;;;;;;;;to move dino back START
moveback proc

	dec xdino
	call dinoo
	mov movebk,0

ret
moveback endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;to move dino back END

;;;;;;;;;;;;;;;;;;;;;;;;;;;to move dino below START

dinood proc
;{	

	mov ax,ydino
	mov y2dino,ax
	mov ax,xdino
	mov x2dino,ax
	mov si,offset dinob
	mov cx,30
	L1:
	;{	
		push cx
		mov cx,27
		mov dx,ydino
		mov ax,xdino
		mov x2dino,ax
		L2:
		;{
			mov ind,0
			push cx
			mov ah,0CH
			mov cx,xdino
			mov al,[si]
			mov ind,al
			int 10h
			cmp ind,5
			jne bypasscoll
			mov ax,xdino
			mov pixelx,ax
			mov ax,ydino
			mov pixely,ax
			call checkcollision
			bypasscoll:
			inc xdino
			inc si
			pop cx
		;}
		Loop L2
		
	;	mov bx,temp
		mov ax,x2dino
		mov xdino,ax
		add ydino,1
		inc si
		pop cx
			;mov cx,temp
	;}
	Loop L1
	sub ydino,30
	mov ax,y2dino
	mov ydino,ax
	mov ax,x2dino
	mov xdino,ax
	ret
;}
	dinood endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;to move dino below END

;;;;;;;;;;;;;;;;;;;;;;;;;;;;checking Keyboard Key START
checkkey proc uses ax bx 

	cmp movedino,0
	ja ret_fun
	cmp movebel,0
	jne ret_fun
	mov movebel,0
	mov ah, 01h
	int 16h 		;;checking if any key is pressed
	jz ret_fun					; if no key is pressed then exit function
	
		mov ah, 0
		int 16h		;taking key input
		cmp ah, 4Dh				; checking against right key scan code	
		je r_key				; if right key is pressed 
		cmp ah, 4Bh				; checking against left key scan code
		je l_key				; if left key is pressed
		cmp ah, 48h				; checking against up key scan code
		je u_key				; if up key is pressed
		;cmp al,32
		;je spacekey
		cmp ah,50h				;;checking if down key is pressed
		je d_key
		jmp ret_fun
	;spacekey:
		;mov key,9
		;jmp ret_fun
	d_key:
		mov movebel,40
		;mov dino,1
		jmp ret_fun
	r_key:
		cmp xdino,293
		je bypassmovefr
		mov movefr,1
		;mov dino,1
		bypassmovefr:
		jmp ret_fun
	l_key:
		cmp xdino,1
		je bypassmovebk
		mov movebk,1
		;mov dino,1
		bypassmovebk:
		jmp ret_fun
	u_key:
		mov moveu,1
		mov movedino,80
		jmp ret_fun
ret_fun:
call clearkey
ret
checkkey endp
;;;;;;;;;;;;;;;;;;;;;;;;;checking start key END

;;;;;;;;;;;;;;;;;;;;;;;;;;;clear Keyboard Buffer StART
clearkey proc 
push ds
push es
 mov ax,40h
 mov es,ax
 mov ds,ax
 mov di,1ah
 mov si,1ch
 movsw
pop es
pop ds
ret
clearkey endp
;;;;;;;;;;;;;;;;;;;;;;;;;;clear Keyboard Buffer END

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; collision check START
checkcollision proc uses ax bx cx dx

	cmp collision,1 ;;;;;;if collision is true then then the collision will not be checked
	je exitcollision
	mov collision,0;;;;;;; falsing the collision to check if collision happened or not
	
	;;;;;;;;;;;;;;;;;;;;;;code to read the pixel START
	mov cx,pixelx
	mov dx,pixely
	inc cx;;;;;;;;;;;;;;;;incrimenting x pixel to check the obstacle in FRONT of Dino
	mov ah,0dh
	int 10h
	;;;;;;;;;;;;;;;;;;;;;;code to read the pixel END
	cmp al,6;;;;;;;;;;;;;;comparing pixel colour to brown(hurdle colour)
	je truecollision;;;;;;;;;;collision happened if pixel color is brown
	cmp al,8;;;;;;;;;;;;;;comparing pixel colour to white(crow colour)
	je truecollision;;;;;;;collision happened if pixel color is brown
	jmp notcollision;;;;;;; collision NOT happened jump to next collision check
	truecollision:;;;;;;;;;;;;LABEL if collision happened
		cmp al,6
		jne bypasscl
		mov xhurdle,320
		mov yhurdle,110
		jmp bypasscr
		bypasscl:
		cmp al,8
		jne bypasscr
		mov xcrow,320
		mov ycrow,85
		bypasscr:
		mov collision,1;;;;;;;;;;;making collision TRUE
		jmp exitcollision;;;;;;;;exiting the procedure
	notcollision:;;;;;;;;;;;;;;;;if first collision do not happened then this will be run
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;code to read pixel START
		mov cx,pixelx
		mov dx,pixely
		inc dx;;;;;;;;;;;;;;;;;;;decrementing y pixel to check the obstacle on ABOVE of Dino
		mov ah,0dh
		int 10h	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;code to read pixel END
		cmp al,6
		je truecollision2
		cmp al,8
		je truecollision2
		jmp notcollision2
		truecollision2:
		cmp al,6
		jne bypasscl2
		mov xhurdle,320
		mov yhurdle,110
		jmp bypasscr2
		bypasscl2:
		cmp al,8
		jne bypasscr2
		mov xcrow,320
		mov ycrow,85
		bypasscr2:
			mov collision,1
			jmp exitcollision
		notcollision2:
		mov cx,pixelx
		mov dx,pixely
		dec dx
		mov ah,0dh
		int 10h	
		cmp al,6
		je truecollision3
		cmp al,8
		je truecollision3
		jmp notcollision3
		truecollision3:
		cmp al,6
		jne bypasscl3
		mov xhurdle,320
		mov yhurdle,110
		jmp bypasscr3
		bypasscl3:
		cmp al,8
		jne bypasscr3
		mov xcrow,320
		mov ycrow,85
		bypasscr3:
			mov collision,1
		jmp exitcollision
	notcollision3:
	exitcollision:
		ret
checkcollision endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;end check collision	

;;;;;;;;;;;;;;;;;;;;;;;;;push pop StART
	Output proc
	
	l1:
	mov ax,result
	mov dx,0
	mov bx,10
	div bx
	push dx
	inc count
	mov result,ax
	cmp ax,0
	jne l1

	l2:
	pop dx
	add dl,48
	mov ah,02
	int 21h
	dec count
	cmp count,0
	jne l2	
	
	ret
	Output endp
;;;;;;;;;;;;;;;;;;;;;;;;;;push pop END

;;;;;;;;;;;;;;;;;;;;;;;;;;;to draw line after moving dino horizontally START
lineuptox proc
	mov cx,xdino
	mov dx,yline
	LOOOOP:
	;{
		push cx
		mov ah,0CH
		mov cx,xline
		mov dx,yline
		mov al,0
		int 10h

		inc xline
		;sub yline,1
		pop cx
		loop LOOOOP
	mov cx,320
	sub cx,xdino
	sub cx,27
	mov dx,yline
	LOOOOP2:
	;{
		push cx
		mov ah,0CH
		mov cx,xdino
		add cx,27
		mov dx,yline
		mov al,0
		int 10h

		inc cx
		;sub yline,1
		pop cx
		loop LOOOOP2

ret
lineuptox endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;to draw line after moving dino horizontally END

;;;;;;;;;;;;;;;;;;;;;;;;;;;high score view file StART

viewhigh proc

mov ah,3dh
lea dx,file2
int 21h
jc errorvv1
mov handle2,ax

; read from file
mov ah,3fh
mov bx,handle2
mov cx,100
lea dx,string2
int 21h
jc errorvv1

; close file
mov ah,3eh
mov bx,handle2
int 21h
jmp exitvv1

errorvv1:
;mov dl,55
;mov ah,02
;int 21h

exitvv1:
		mov highscore,0
		mov si,4
		mov al,string2[si]
		mov ah,0
		sub ax,48
		add highscore,ax
		mov si,3
		mov al,string2[si]
		sub al,48
		mov bl,10
		mul bl
		add highscore,ax
		mov si,2
		mov al,string2[si]
		sub al,48
		mov bl,100
		mul bl
		add highscore,ax
		mov si,1
		mov al,string2[si]
		sub al,48
		mov ah,0
		mov bx,1000
		mul bx
		add highscore,ax
		mov si,0
		mov al,string2[si]
		sub al,48
		mov ah,0
		mov bx,10000
		mul bx
		add highscore,ax		
		
ret
viewhigh endp
writehigh proc

;mov si,0
;mov al,score5
;mov string3[si],al
;mov si,1
;mov al,score4
;mov string3[si],al
;mov si,2
;mov al,score3
;mov string3[si],al
;mov si,3
;mov al,score2
;mov string3[si],al
;mov si,4
;mov al,score1
;mov string3[si],al
;mov si,5
;mov al,'?'
;mov string3[si],al


;;;;;;;create file
mov ah,3ch
mov cx, 0
lea dx,file2
int 21h
jc errorw1
mov handle3,ax

;;;;;;;;;write data in file
mov ah,40h      
mov bx,handle3
mov cx,28
mov dx,totalscore

int 21h
jc errorw1

;;;;;;;;;file closing
mov ah,3eh 
mov bx,handle3
int 21h

errorw1:
mov ax,4c00h
int 21h

ret
writehigh endp
end