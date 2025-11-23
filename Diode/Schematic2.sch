*version 9.2 3863845947
u 33
@libraries
@analysis
@targets
@attributes
@translators
a 0 u 13 0 0 0 hln 100 PCBOARDS=PCB
a 0 u 13 0 0 0 hln 100 PSPICE=PSPICE
a 0 u 13 0 0 0 hln 100 XILINX=XILINX
@setup
unconnectedPins 0
connectViaLabel 0
connectViaLocalLabels 0
NoStim4ExtIFPortsWarnings 1
AutoGenStim4ExtIFPorts 1
@index
pageloc 1 0 2457 
@status
n 0 123:02:01:13:43:45;1677656625 e 
s 2832 123:02:01:13:43:48;1677656628 e 
*page 1 0 1520 970 iB
@ports
port 32 GND_EARTH 400 220 h
@parts
part 27 r 400 190 v
a 0 x 0:13 0 0 0 hln 100 PKGREF=R2
a 0 xp 9 0 15 0 hln 100 REFDES=R2
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 u 13 0 15 25 hln 100 VALUE=20k
part 28 vdc 270 150 h
a 0 x 0:13 0 0 0 hln 100 PKGREF=V1
a 1 xp 9 0 24 7 hcn 100 REFDES=V1
a 0 sp 0 0 22 37 hln 100 PART=vdc
a 1 u 13 0 -11 18 hcn 100 DC=6
part 29 D1N4002 300 100 h
a 0 sp 11 0 17 29 hln 100 PART=D1N4002
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DO-41
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 x 0:13 0 0 0 hln 100 PKGREF=D1
a 0 xp 9 0 17 2 hln 100 REFDES=D1
part 30 D1N4002 430 100 h
a 0 sp 11 0 17 29 hln 100 PART=D1N4002
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DO-41
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 x 0:13 0 0 0 hln 100 PKGREF=D2
a 0 xp 9 0 17 4 hln 100 REFDES=D2
part 31 r 510 170 v
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 x 0:13 0 0 0 hln 100 PKGREF=R3
a 0 xp 9 0 15 0 hln 100 REFDES=R3
a 0 u 13 0 15 25 hln 100 VALUE=10k
part 1 titleblk 1520 970 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=B
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 300 95 hrn 100 PAGENO=1
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
@conn
w 3
a 0 sr 0:3 0 285 98 hcn 100 LABEL=1
s 270 100 300 100 2
a 0 sr 3 0 285 98 hcn 100 LABEL=1
s 270 150 270 100 4
a 0 up 33 0 272 125 hlt 100 V=
w 7
a 0 sr 0:3 0 410 98 hcn 100 LABEL=2
s 400 100 430 100 6
a 0 sr 3 0 410 98 hcn 100 LABEL=2
s 400 100 400 150 8
a 0 up 33 0 402 125 hlt 100 V=
s 330 100 400 100 10
a 0 up 33 0 356 85 hct 100 V=
w 24
a 0 sr 0:3 0 485 98 hcn 100 LABEL=3
s 460 100 510 100 23
a 0 sr 3 0 485 98 hcn 100 LABEL=3
s 510 100 510 130 25
a 0 up 33 0 542 93 hlt 100 V=
w 13
a 0 sr 0:3 0 455 213 hcn 100 LABEL=0
s 400 220 510 220 20
a 0 sr 3 0 455 213 hcn 100 LABEL=0
s 270 220 400 220 14
a 0 up 33 0 455 219 hct 100 V=
s 270 190 270 220 16
s 400 190 400 220 18
s 510 220 510 170 21
@junction
j 400 100
+ w 7
+ w 7
j 400 220
+ w 13
+ w 13
j 400 150
+ p 27 2
+ w 7
j 400 190
+ p 27 1
+ w 13
j 270 150
+ p 28 +
+ w 3
j 270 190
+ p 28 -
+ w 13
j 300 100
+ p 29 1
+ w 3
j 330 100
+ p 29 2
+ w 7
j 430 100
+ p 30 1
+ w 7
j 460 100
+ p 30 2
+ w 24
j 510 170
+ p 31 1
+ w 13
j 510 130
+ p 31 2
+ w 24
j 400 220
+ s 32
+ w 13
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=B
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
