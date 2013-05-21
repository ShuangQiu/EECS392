* SPICE NETLIST
***************************************

.SUBCKT nmos_vtg_1 1 2 3 4
** N=5 EP=4 IP=0 FDC=2
M0 5 1 3 4 NMOS_VTG L=5e-08 W=1.63e-06 AD=2.282e-13 AS=1.834e-13 PD=3.54e-06 PS=3.49e-06 $X=0 $Y=0 $D=5
M1 4 2 5 4 NMOS_VTG L=5e-08 W=1.63e-06 AD=1.77425e-13 AS=2.282e-13 PD=3.485e-06 PS=3.54e-06 $X=380 $Y=0 $D=5
.ENDS
***************************************
.SUBCKT pmos_vtg_0 1 2 3 4
** N=4 EP=4 IP=0 FDC=2
M0 4 1 3 3 PMOS_VTG L=5e-08 W=1.44e-06 AD=2.016e-13 AS=1.512e-13 PD=3.16e-06 PS=3.11e-06 $X=0 $Y=0 $D=4
M1 3 2 4 3 PMOS_VTG L=5e-08 W=1.44e-06 AD=1.58175e-13 AS=2.016e-13 PD=3.105e-06 PS=3.16e-06 $X=380 $Y=0 $D=4
.ENDS
***************************************
.SUBCKT M1_POLY_1
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT NAND_0 1 2 3 4 5
** N=5 EP=5 IP=10 FDC=4
X0 4 5 1 2 nmos_vtg_1 $T=945 4395 0 0 $X=695 $Y=4285
X1 4 5 3 1 pmos_vtg_0 $T=945 8045 0 0 $X=695 $Y=7935
.ENDS
***************************************
.SUBCKT M1_N_3
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT M1_P_2
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT ICV_1
** N=1 EP=0 IP=2 FDC=0
.ENDS
***************************************
.SUBCKT INVERTER 1 2 3 4
** N=4 EP=4 IP=16 FDC=2
M0 3 4 1 1 NMOS_VTG L=5e-08 W=1.44e-06 AD=1.161e-13 AS=1.0845e-13 PD=3.36e-06 PS=3.19e-06 $X=2045 $Y=110 $D=5
M1 3 4 2 2 PMOS_VTG L=5e-08 W=1.96e-06 AD=1.6015e-13 AS=1.57e-13 PD=4.57e-06 PS=4.5e-06 $X=2040 $Y=3340 $D=4
.ENDS
***************************************
.SUBCKT MUX 1 2 3 4 5 6
** N=9 EP=6 IP=19 FDC=14
X0 4 1 3 7 9 NAND_0 $T=3445 -2060 0 0 $X=3990 $Y=2225
X1 9 1 3 5 2 NAND_0 $T=4660 -2060 0 0 $X=5205 $Y=2225
X2 7 1 3 6 8 NAND_0 $T=5875 -2060 0 0 $X=6420 $Y=2225
X3 1 3 8 2 INVERTER $T=6025 2225 0 0 $X=7635 $Y=2225
.ENDS
***************************************
.SUBCKT NAND 1 2 3 4 5
** N=5 EP=5 IP=10 FDC=4
X0 4 5 1 2 nmos_vtg_1 $T=945 4395 0 0 $X=695 $Y=4285
X1 4 5 3 1 pmos_vtg_0 $T=945 8045 0 0 $X=695 $Y=7935
.ENDS
***************************************
.SUBCKT XOR 1 2 3 4 5
** N=9 EP=5 IP=23 FDC=16
X0 2 4 6 1 INVERTER $T=2780 740 1 180 $X=295 $Y=740
X1 2 4 8 3 INVERTER $T=3335 740 0 0 $X=4945 $Y=740
X2 7 2 4 3 6 NAND $T=755 -3545 0 0 $X=1300 $Y=740
X3 5 2 4 7 9 NAND $T=1970 -3545 0 0 $X=2515 $Y=740
X4 9 2 4 1 8 NAND $T=3185 -3545 0 0 $X=3730 $Y=740
.ENDS
***************************************
.SUBCKT M2_M1_via
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT NOR 1 2 3 4 5
** N=6 EP=5 IP=4 FDC=4
M0 1 4 3 1 NMOS_VTG L=5e-08 W=7.2e-07 AD=1.008e-13 AS=5.85e-14 PD=1.72e-06 PS=1.76e-06 $X=3705 $Y=545 $D=5
M1 3 5 1 1 NMOS_VTG L=5e-08 W=7.2e-07 AD=5.31e-14 AS=1.008e-13 PD=1.64e-06 PS=1.72e-06 $X=4085 $Y=545 $D=5
M2 6 4 2 2 PMOS_VTG L=5e-08 W=1.56e-06 AD=2.184e-13 AS=1.515e-13 PD=3.4e-06 PS=3.32e-06 $X=3705 $Y=2345 $D=4
M3 3 5 6 2 PMOS_VTG L=5e-08 W=1.56e-06 AD=1.4625e-13 AS=2.184e-13 PD=3.32e-06 PS=3.4e-06 $X=4085 $Y=2345 $D=4
.ENDS
***************************************
.SUBCKT ICV_2 1 2 3 4 5 6 7 8
** N=8 EP=8 IP=10 FDC=8
X0 2 4 5 1 3 NAND $T=0 0 0 0 $X=545 $Y=4285
X1 7 4 5 6 8 NAND $T=1215 0 0 0 $X=1760 $Y=4285
.ENDS
***************************************
.SUBCKT M3_M2_via
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT DFF 1 2 3 4 5 6
** N=12 EP=6 IP=42 FDC=30
X0 1 3 11 12 INVERTER $T=1475 1060 0 0 $X=3085 $Y=1060
X1 12 1 3 10 8 NAND $T=3500 -3225 1 180 $X=1740 $Y=1060
X10 10 7 8 1 3 9 8 6 ICV_2 $T=-6095 -3225 0 0 $X=-5550 $Y=1060
X11 10 2 4 1 3 2 4 9 ICV_2 $T=-3665 -3225 0 0 $X=-3120 $Y=1060
X12 7 10 5 1 3 5 9 11 ICV_2 $T=-1235 -3225 0 0 $X=-690 $Y=1060
.ENDS
***************************************
.SUBCKT FA 1 2 3 4 5 6
** N=10 EP=6 IP=25 FDC=44
X0 7 3 5 1 2 NAND $T=9190 -2010 0 0 $X=9735 $Y=2275
X1 6 3 5 7 9 NAND $T=10405 -2010 0 0 $X=10950 $Y=2275
X2 9 3 5 4 8 NAND $T=11620 -2010 0 0 $X=12165 $Y=2275
X3 2 3 1 5 8 XOR $T=13080 1535 0 0 $X=13375 $Y=2275
X4 4 3 8 5 10 XOR $T=18760 1535 0 0 $X=19055 $Y=2275
.ENDS
***************************************
.SUBCKT ICV_3 1 2 3 4 5 6 7 8
** N=9 EP=8 IP=12 FDC=60
X0 5 7 1 3 6 2 DFF $T=0 0 0 0 $X=-5550 $Y=1060
X1 5 8 1 4 6 9 DFF $T=9640 0 0 0 $X=4090 $Y=1060
.ENDS
***************************************
.SUBCKT ICV_4
** N=2 EP=0 IP=2 FDC=0
.ENDS
***************************************
.SUBCKT ICV_5 1 2 3 4 5 6 7 8 9 10
** N=10 EP=10 IP=12 FDC=28
X0 3 9 2 1 4 5 MUX $T=0 0 0 0 $X=3990 $Y=2225
X1 3 10 2 6 7 8 MUX $T=4650 0 0 0 $X=8640 $Y=2225
.ENDS
***************************************
.SUBCKT MULT 1 2 3 4 5 6 7 8 9
** N=23 EP=9 IP=89 FDC=176
X0 4 7 6 11 3 4 MUX $T=6560 -1025 0 0 $X=10550 $Y=1200
X1 4 7 6 19 4 5 MUX $T=50840 -1025 0 0 $X=54830 $Y=1200
X2 12 4 6 7 8 NAND $T=14655 -3085 0 0 $X=15200 $Y=1200
X3 17 4 6 8 3 NAND $T=43770 -3085 0 0 $X=44315 $Y=1200
X17 20 6 4 11 10 10 1 2 12 2 ICV_5 $T=-2740 -1025 0 0 $X=1250 $Y=1200
X18 21 6 4 14 13 13 4 3 9 12 ICV_5 $T=12425 -1025 0 0 $X=16415 $Y=1200
X19 14 6 4 1 5 22 16 15 7 9 ICV_5 $T=21725 -1025 0 0 $X=25715 $Y=1200
X20 15 6 4 4 5 16 3 2 17 7 ICV_5 $T=31025 -1025 0 0 $X=35015 $Y=1200
X21 23 6 4 19 18 18 2 1 17 2 ICV_5 $T=41540 -1025 0 0 $X=45530 $Y=1200
.ENDS
***************************************
.SUBCKT CALC
** N=70 EP=0 IP=205 FDC=832
X1 23 22 25 24 INVERTER $T=111705 13665 0 0 $X=113315 $Y=13665
X2 27 64 21 1 28 29 MUX $T=3945 3620 1 180 $X=-4570 $Y=5845
X3 27 64 21 3 30 31 MUX $T=18235 3620 1 180 $X=9720 $Y=5845
X4 27 64 21 4 32 33 MUX $T=32525 3620 1 180 $X=24010 $Y=5845
X5 27 64 21 6 34 35 MUX $T=46815 3620 1 180 $X=38300 $Y=5845
X6 23 68 22 36 37 12 MUX $T=61025 11440 0 0 $X=65015 $Y=13665
X7 23 68 22 15 14 16 MUX $T=88525 11440 0 0 $X=92515 $Y=13665
X8 39 69 26 38 40 41 MUX $T=114545 3620 0 0 $X=118535 $Y=5845
X9 23 68 22 42 18 19 MUX $T=117160 11440 0 0 $X=121150 $Y=13665
X10 39 69 26 43 44 45 MUX $T=119195 3620 0 0 $X=123185 $Y=5845
X11 39 69 26 46 47 48 MUX $T=123845 3620 0 0 $X=127835 $Y=5845
X12 39 69 26 49 50 51 MUX $T=128495 3620 0 0 $X=132485 $Y=5845
X13 11 23 67 22 52 XOR $T=53395 12925 0 0 $X=53690 $Y=13665
X14 11 23 12 22 37 XOR $T=59065 12925 0 0 $X=59360 $Y=13665
X15 13 23 9 22 14 XOR $T=86565 12925 0 0 $X=86860 $Y=13665
X16 55 23 10 22 18 XOR $T=115200 12925 0 0 $X=115495 $Y=13665
X17 42 23 5 22 20 XOR $T=125520 12925 0 0 $X=125815 $Y=13665
X18 20 23 17 22 53 XOR $T=131185 12925 0 0 $X=131480 $Y=13665
X29 23 22 54 2 7 NOR $T=66195 13230 0 0 $X=69590 $Y=13665
X30 23 22 13 11 12 NOR $T=82215 13230 0 0 $X=85610 $Y=13665
X31 23 22 24 11 12 NOR $T=108670 13230 0 0 $X=112065 $Y=13665
X32 23 22 55 25 16 NOR $T=110850 13230 0 0 $X=114245 $Y=13665
X38 27 67 21 2 66 1 DFF $T=5635 4785 0 0 $X=85 $Y=5845
X39 27 16 21 56 66 3 DFF $T=19925 4785 0 0 $X=14375 $Y=5845
X40 27 65 21 57 66 4 DFF $T=34215 4785 0 0 $X=28665 $Y=5845
X41 27 70 21 59 66 58 DFF $T=106345 4785 0 0 $X=100795 $Y=5845
X42 36 16 23 54 22 8 FA $T=60975 11390 0 0 $X=70710 $Y=13665
X43 15 65 23 8 22 17 FA $T=87430 11390 0 0 $X=97165 $Y=13665
X44 21 6 60 7 27 66 5 11 ICV_3 $T=48505 4785 0 0 $X=42955 $Y=5845
X45 21 61 62 9 27 66 12 16 ICV_3 $T=67785 4785 0 0 $X=62235 $Y=5845
X46 21 63 10 5 27 66 19 68 ICV_3 $T=87065 4785 0 0 $X=81515 $Y=5845
X47 65 16 5 23 67 22 68 10 12 MULT $T=-5810 12465 0 0 $X=-4560 $Y=13665
.ENDS
***************************************
