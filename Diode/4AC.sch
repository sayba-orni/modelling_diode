*version 9.2 201170528
u 37
V? 2
@libraries
@analysis
.TRAN 1 0 0 0
+0 1u
+1 1
+3 1u
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
pageloc 1 0 3036 
@status
n 0 123:02:01:09:48:52;1677642532 e 
s 2832 123:02:01:15:14:42;1677662082 e 
*page 1 0 1520 970 iB
@ports
port 35 egnd 410 280 h
@parts
part 30 r 530 230 v
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 x 0:13 0 0 0 hln 100 PKGREF=R3
a 0 xp 9 0 15 0 hln 100 REFDES=R3
a 0 u 13 0 15 25 hln 100 VALUE=10k
part 31 D1N4002 480 160 u
a 0 sp 11 0 17 29 hln 100 PART=D1N4002
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DO-41
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 x 0:13 0 0 0 hln 100 PKGREF=D2
a 0 xp 9 0 17 4 hln 100 REFDES=D2
part 32 r 410 220 v
a 0 x 0:13 0 0 0 hln 100 PKGREF=R2
a 0 xp 9 0 15 0 hln 100 REFDES=R2
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 u 13 0 15 25 hln 100 VALUE=20k
part 33 D1N4002 320 160 h
a 0 sp 11 0 17 29 hln 100 PART=D1N4002
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DO-41
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 x 0:13 0 0 0 hln 100 PKGREF=D1
a 0 xp 9 0 17 2 hln 100 REFDES=D1
part 34 D1N4002 410 230 d
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DO-41
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 sp 11 0 5 49 hln 100 PART=D1N4002
a 0 x 0:13 0 0 0 hln 100 PKGREF=D3
a 0 xp 9 0 17 4 hln 100 REFDES=D3
part 36 VSIN 290 210 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=V1
a 1 ap 9 0 20 10 hcn 100 REFDES=V1
a 1 u 0 0 0 0 hcn 100 VOFF=0
a 1 u 0 0 0 0 hcn 100 VAMPL=6
a 1 u 0 0 0 0 hcn 100 FREQ=5
part 1 titleblk 1520 970 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=B
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 300 95 hrn 100 PAGENO=1
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
@conn
w 3
a 0 sr 0:3 0 505 158 hcn 100 LABEL=3
s 480 160 530 160 2
a 0 sr 3 0 505 158 hcn 100 LABEL=3
a 0 up 33 0 485 195 hct 100 V=
s 530 160 530 190 4
a 0 up 33 0 562 153 hlt 100 V=
w 18
a 0 sr 0:3 0 425 158 hcn 100 LABEL=2
s 410 160 450 160 17
a 0 sr 3 0 425 158 hcn 100 LABEL=2
a 0 up 0:33 0 435 117 hct 100 V=
s 410 160 410 180 19
a 0 up 0:33 0 380 170 hlt 100 V=
s 350 160 410 160 21
a 0 up 33 0 379 127 hct 100 V=
a 0 sr 3 0 380 158 hcn 100 LABEL=2
w 24
a 0 sr 3 0 412 225 hln 100 LABEL=4
s 410 230 410 220 23
a 0 sr 3 0 412 225 hln 100 LABEL=4
a 0 up 33 0 424 214 hlt 100 V=
w 26
a 0 sr 0:3 0 305 158 hcn 100 LABEL=1
s 290 160 320 160 25
a 0 sr 3 0 305 158 hcn 100 LABEL=1
a 0 up 33 0 311 183 hct 100 V=
s 290 210 290 160 27
a 0 sr 3 0 292 179 hln 100 LABEL=1
a 0 up 0:33 0 292 185 hlt 100 V=
w 7
a 0 sr 0:3 0 475 273 hcn 100 LABEL=0
s 410 280 530 280 16
a 0 sr 3 0 475 273 hcn 100 LABEL=0
s 530 280 530 230 8
s 290 250 290 280 10
s 290 280 410 280 12
a 0 up 33 0 475 279 hct 100 V=
s 410 260 410 280 14
@junction
j 410 280
+ w 7
+ w 7
j 410 160
+ w 18
+ w 18
j 530 190
+ p 30 2
+ w 3
j 530 230
+ p 30 1
+ w 7
j 480 160
+ p 31 1
+ w 3
j 450 160
+ p 31 2
+ w 18
j 410 180
+ p 32 2
+ w 18
j 410 220
+ p 32 1
+ w 24
j 350 160
+ p 33 2
+ w 18
j 320 160
+ p 33 1
+ w 26
j 410 260
+ p 34 2
+ w 7
j 410 230
+ p 34 1
+ w 24
j 410 280
+ s 35
+ w 7
j 290 210
+ p 36 +
+ w 26
j 290 250
+ p 36 -
+ w 7
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=B
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
