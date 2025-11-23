*version 9.2 3462275709
u 36
V? 3
R? 5
D? 3
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
pageloc 1 0 2572 
@status
n 0 123:01:22:22:56:07;1677084967 e 
s 0 123:01:22:22:56:12;1677084972 e 
*page 1 0 1520 970 iB
@ports
port 32 GND_EARTH 390 210 h
@parts
part 5 R 390 190 v
a 0 sp 0 0 0 10 hlb 100 PART=R
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=R2
a 0 ap 9 0 15 0 hln 100 REFDES=R2
part 2 VDC 300 170 h
a 0 sp 0 0 22 37 hln 100 PART=VDC
a 0 a 0:13 0 0 0 hln 100 PKGREF=V1
a 1 ap 9 0 24 7 hcn 100 REFDES=V1
a 1 u 13 0 -11 18 hcn 100 DC=6V
part 4 R 300 110 h
a 0 sp 0 0 0 10 hlb 100 PART=R
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=R1
a 0 ap 9 0 15 0 hln 100 REFDES=R1
part 3 VDC 300 110 h
a 0 sp 0 0 22 37 hln 100 PART=VDC
a 0 a 0:13 0 0 0 hln 100 PKGREF=V2
a 1 ap 9 0 24 7 hcn 100 REFDES=V2
a 1 u 13 0 -11 18 hcn 100 DC=10V
part 8 D1N4002 360 110 h
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DO-41
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=D1
a 0 ap 9 0 15 0 hln 100 REFDES=D1
a 0 sp 11 0 -11 25 hln 100 PART=D1N4002
part 6 R 390 110 h
a 0 sp 0 0 0 10 hlb 100 PART=R
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=R3
a 0 ap 9 0 15 0 hln 100 REFDES=R3
part 9 D1N4002 450 110 h
a 0 sp 11 0 15 25 hln 100 PART=D1N4002
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DO-41
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=D2
a 0 ap 9 0 15 0 hln 100 REFDES=D2
part 1 titleblk 1520 970 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=B
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 300 95 hrn 100 PAGENO=1
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
@conn
w 11
a 0 up 0:33 0 0 0 hln 100 V=
s 300 150 300 170 10
a 0 up 33 0 302 160 hlt 100 V=
w 14
a 0 up 0:33 0 0 0 hln 100 V=
s 360 110 340 110 16
a 0 up 33 0 350 109 hct 100 V=
w 20
a 0 up 0:33 0 0 0 hln 100 V=
s 450 110 430 110 22
a 0 up 33 0 440 109 hct 100 V=
w 25
a 0 up 0:33 0 0 0 hln 100 V=
s 300 210 390 210 24
s 390 210 480 210 28
s 480 210 480 110 30
a 0 up 33 0 482 160 hlt 100 V=
s 390 210 390 190 26
w 35
a 0 up 0:33 0 0 0 hln 100 V=
s 390 150 390 110 33
a 0 up 33 0 392 130 hlt 100 V=
@junction
j 300 150
+ p 3 -
+ w 11
j 300 170
+ p 2 +
+ w 11
j 300 110
+ p 4 1
+ p 3 +
j 360 110
+ p 8 1
+ w 14
j 340 110
+ p 4 2
+ w 14
j 390 110
+ p 6 1
+ p 8 2
j 450 110
+ p 9 1
+ w 20
j 430 110
+ p 6 2
+ w 20
j 300 210
+ p 2 -
+ w 25
j 480 110
+ p 9 2
+ w 25
j 390 210
+ s 32
+ w 25
j 390 190
+ p 5 1
+ w 25
j 390 150
+ p 5 2
+ w 35
j 390 110
+ p 6 1
+ w 35
j 390 110
+ p 8 2
+ w 35
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=B
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
