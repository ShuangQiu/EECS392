* SPICE NETLIST
***************************************

.SUBCKT M1_POLY_2
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT M1_N_5
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT M1_P_4
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT ICV_1
** N=1 EP=0 IP=2 FDC=0
.ENDS
***************************************
.SUBCKT PTAP_0
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT NTAP_1
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT Inverter gnd! vdd! Out In
** N=4 EP=4 IP=18 FDC=2
M0 Out In gnd! gnd! NMOS_VTG L=5e-08 W=1.44e-06 AD=1.161e-13 AS=1.0845e-13 PD=3.36e-06 PS=3.19e-06 $X=2045 $Y=110 $D=5
M1 Out In vdd! vdd! PMOS_VTG L=5e-08 W=1.96e-06 AD=1.6015e-13 AS=1.57e-13 PD=4.57e-06 PS=4.5e-06 $X=2040 $Y=3340 $D=4
.ENDS
***************************************
.SUBCKT OR gnd! vdd! A B Output
** N=7 EP=5 IP=8 FDC=6
M0 gnd! A 3 gnd! NMOS_VTG L=5e-08 W=7.2e-07 AD=1.008e-13 AS=5.85e-14 PD=1.72e-06 PS=1.76e-06 $X=-815 $Y=-1620 $D=5
M1 3 B gnd! gnd! NMOS_VTG L=5e-08 W=7.2e-07 AD=5.31e-14 AS=1.008e-13 PD=1.64e-06 PS=1.72e-06 $X=-435 $Y=-1620 $D=5
M2 7 A vdd! vdd! PMOS_VTG L=5e-08 W=1.56e-06 AD=2.184e-13 AS=1.515e-13 PD=3.4e-06 PS=3.32e-06 $X=-815 $Y=180 $D=4
M3 3 B 7 vdd! PMOS_VTG L=5e-08 W=1.56e-06 AD=1.4625e-13 AS=2.184e-13 PD=3.32e-06 PS=3.4e-06 $X=-435 $Y=180 $D=4
X8 gnd! vdd! Output 3 Inverter $T=-1475 -3170 0 0 $X=135 $Y=-3170
.ENDS
***************************************
.SUBCKT ICV_2 1 2 3 4 5 6 7 8
** N=8 EP=8 IP=10 FDC=12
X0 3 4 1 2 5 OR $T=0 0 0 0 $X=-1125 $Y=-3170
X1 3 4 6 7 8 OR $T=2190 0 0 0 $X=1065 $Y=-3170
.ENDS
***************************************
.SUBCKT ICV_3 1 2 3 4 5 6 7 8 9 10 11 12 13 14
** N=14 EP=14 IP=16 FDC=24
X0 1 2 3 4 5 6 7 8 ICV_2 $T=0 0 0 0 $X=-1125 $Y=-3170
X1 9 10 3 4 11 12 13 14 ICV_2 $T=0 7820 0 0 $X=-1125 $Y=4650
.ENDS
***************************************
.SUBCKT dcont_8
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT nmos_vtg_0 1 2 3 4
** N=4 EP=4 IP=2 FDC=1
M0 2 3 1 4 NMOS_VTG L=5e-08 W=2.8e-07 AD=2.94e-14 AS=2.94e-14 PD=7.7e-07 PS=7.7e-07 $X=0 $Y=0 $D=5
.ENDS
***************************************
.SUBCKT pmos_vtg_1 1 2 3 4
** N=4 EP=4 IP=2 FDC=1
M0 2 3 1 4 PMOS_VTG L=5e-08 W=3e-07 AD=3.15e-14 AS=3.15e-14 PD=8.1e-07 PS=8.1e-07 $X=0 $Y=0 $D=4
.ENDS
***************************************
.SUBCKT XOR B Output A 4 5
** N=6 EP=5 IP=28 FDC=6
X4 4 6 A 4 nmos_vtg_0 $T=2400 2225 0 0 $X=2080 $Y=2115
X5 6 Output B 4 nmos_vtg_0 $T=3140 2225 0 0 $X=2820 $Y=2115
X6 Output B 6 4 nmos_vtg_0 $T=3880 2225 0 0 $X=3560 $Y=2115
X7 5 6 A 5 pmos_vtg_1 $T=2400 3215 0 0 $X=2080 $Y=3105
X8 A Output B 5 pmos_vtg_1 $T=3140 3215 0 0 $X=2820 $Y=3105
X9 Output B A 5 pmos_vtg_1 $T=3880 3215 0 0 $X=3560 $Y=3105
.ENDS
***************************************
.SUBCKT FULL_ADDER_noCOUT gnd! vdd! B A Cin S
** N=7 EP=6 IP=10 FDC=12
X0 B 7 A gnd! vdd! XOR $T=2040 540 0 0 $X=4120 $Y=2435
X1 Cin S 7 gnd! vdd! XOR $T=10640 540 1 180 $X=6340 $Y=2435
.ENDS
***************************************
.SUBCKT AND gnd! vdd! B A Output
** N=7 EP=5 IP=6 FDC=6
M0 7 B gnd! gnd! NMOS_VTG L=5e-08 W=1.63e-06 AD=2.282e-13 AS=1.77425e-13 PD=3.54e-06 PS=3.485e-06 $X=-1025 $Y=-3500 $D=5
M1 2 A 7 gnd! NMOS_VTG L=5e-08 W=1.63e-06 AD=1.834e-13 AS=2.282e-13 PD=3.49e-06 PS=3.54e-06 $X=-645 $Y=-3500 $D=5
M2 2 B vdd! vdd! PMOS_VTG L=5e-08 W=1.44e-06 AD=2.016e-13 AS=1.58175e-13 PD=3.16e-06 PS=3.105e-06 $X=-1025 $Y=150 $D=4
M3 vdd! A 2 vdd! PMOS_VTG L=5e-08 W=1.44e-06 AD=1.512e-13 AS=2.016e-13 PD=3.11e-06 PS=3.16e-06 $X=-645 $Y=150 $D=4
X6 gnd! vdd! Output 2 Inverter $T=-1610 -4155 0 0 $X=0 $Y=-4155
.ENDS
***************************************
.SUBCKT ICV_4 1 2 3 4 5 6 7 8
** N=8 EP=8 IP=10 FDC=12
X0 1 2 3 4 5 AND $T=0 0 0 0 $X=-1360 $Y=-4155
X1 1 2 6 7 8 AND $T=2230 0 0 0 $X=870 $Y=-4155
.ENDS
***************************************
.SUBCKT ICV_5 1 2 3 4 5 6 7 8 9 10 11 12 13 14
** N=14 EP=14 IP=16 FDC=24
X0 1 2 3 4 5 6 7 8 ICV_4 $T=0 0 0 0 $X=-1360 $Y=-4155
X1 1 2 9 10 11 12 13 14 ICV_4 $T=0 7820 0 0 $X=-1360 $Y=3665
.ENDS
***************************************
.SUBCKT ICV_6 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
+ 21 22 23 24 25
** N=25 EP=25 IP=28 FDC=48
X0 1 2 3 5 7 9 11 12 4 6 8 10 6 13 ICV_5 $T=0 0 0 0 $X=-1360 $Y=-4155
X1 1 2 14 16 18 20 22 24 15 17 19 21 23 25 ICV_5 $T=4460 0 0 0 $X=3100 $Y=-4155
.ENDS
***************************************
.SUBCKT LOOKAHEAD B<0> A<0> B<1> A<1> B<2> B<6> A<2> A<6> B<3> A<3> B<4> B<7> A<4> A<7> B<5> A<5> gnd! vdd! S<0> Cout
+ S<1> S<2> S<3> S<4> S<5> S<6> S<7>
** N=98 EP=27 IP=311 FDC=516
X6 gnd! vdd! 11 84 60 OR $T=77350 7335 0 0 $X=76225 $Y=4165
X7 52 85 gnd! vdd! 86 50 86 Cout ICV_2 $T=77350 15155 0 0 $X=76225 $Y=11985
X8 A<1> B<1> gnd! vdd! 13 10 14 62 6 60 61 27 61 63 ICV_3 $T=42310 7335 0 0 $X=41185 $Y=4165
X9 A<2> B<2> gnd! vdd! 23 20 28 65 22 63 64 A<6> B<6> 24 ICV_3 $T=46690 7335 0 0 $X=45565 $Y=4165
X10 25 65 gnd! vdd! 66 A<3> B<3> 34 21 41 67 38 67 68 ICV_3 $T=51070 7335 0 0 $X=49945 $Y=4165
X11 32 40 gnd! vdd! 69 37 69 71 36 68 70 33 70 72 ICV_3 $T=55450 7335 0 0 $X=54325 $Y=4165
X12 35 71 gnd! vdd! 73 A<4> B<4> 47 29 72 74 26 74 75 ICV_3 $T=59830 7335 0 0 $X=58705 $Y=4165
X13 12 8 gnd! vdd! 76 2 76 77 A<7> B<7> 48 46 59 78 ICV_3 $T=64210 7335 0 0 $X=63085 $Y=4165
X14 51 77 gnd! vdd! 79 49 79 81 58 78 80 57 80 82 ICV_3 $T=68590 7335 0 0 $X=67465 $Y=4165
X15 A<5> B<5> gnd! vdd! 4 39 15 84 54 82 83 53 83 85 ICV_3 $T=72970 7335 0 0 $X=71845 $Y=4165
X16 gnd! 89 A<0> gnd! nmos_vtg_0 $T=23430 1605 0 0 $X=23110 $Y=1495
X17 89 S<0> B<0> gnd! nmos_vtg_0 $T=24170 1605 0 0 $X=23850 $Y=1495
X18 S<0> B<0> 89 gnd! nmos_vtg_0 $T=24910 1605 0 0 $X=24590 $Y=1495
X19 vdd! 89 A<0> vdd! pmos_vtg_1 $T=23430 2595 0 0 $X=23110 $Y=2485
X20 A<0> S<0> B<0> vdd! pmos_vtg_1 $T=24170 2595 0 0 $X=23850 $Y=2485
X21 S<0> B<0> A<0> vdd! pmos_vtg_1 $T=24910 2595 0 0 $X=24590 $Y=2485
X22 gnd! vdd! B<1> A<1> 5 S<1> FULL_ADDER_noCOUT $T=21210 -1160 0 0 $X=25330 $Y=1025
X23 gnd! vdd! B<2> A<2> 62 S<2> FULL_ADDER_noCOUT $T=25690 -1160 0 0 $X=29810 $Y=1025
X24 gnd! vdd! B<3> A<3> 66 S<3> FULL_ADDER_noCOUT $T=30170 -1160 0 0 $X=34290 $Y=1025
X25 gnd! vdd! B<4> A<4> 73 S<4> FULL_ADDER_noCOUT $T=34650 -1160 0 0 $X=38770 $Y=1025
X26 gnd! vdd! B<5> A<5> 81 S<5> FULL_ADDER_noCOUT $T=39130 -1160 0 0 $X=43250 $Y=1025
X27 gnd! vdd! B<6> A<6> 64 S<6> FULL_ADDER_noCOUT $T=43610 -1160 0 0 $X=47730 $Y=1025
X28 gnd! vdd! B<7> A<7> 75 S<7> FULL_ADDER_noCOUT $T=48090 -1160 0 0 $X=52210 $Y=1025
X29 gnd! vdd! 49 4 22 51 4 27 41 48 58 21 48 59 ICV_5 $T=38025 8320 0 0 $X=36665 $Y=4165
X30 gnd! vdd! B<0> 2 A<0> 4 5 6 B<1> 8 A<1> 10 11 5 12 13 4 14 15 B<2>
+ B<6> A<2> A<6> 20 21
+ ICV_6 $T=2345 8320 0 0 $X=985 $Y=4165
X31 gnd! vdd! 14 22 23 24 25 26 10 27 23 28 29 B<3> 6 A<3> 24 32 33 25
+ 11 34 24 35 36
+ ICV_6 $T=11265 8320 0 0 $X=9905 $Y=4165
X32 gnd! vdd! 28 15 34 24 37 38 20 39 34 40 41 B<4> B<7> A<4> A<7> 12 46 35
+ 26 47 48 49 50
+ ICV_6 $T=20185 8320 0 0 $X=18825 $Y=4165
X33 gnd! vdd! 37 29 47 48 51 52 40 33 47 2 53 32 36 47 48 8 54 B<5>
+ 38 A<5> 48 39 57
+ ICV_6 $T=29105 8320 0 0 $X=27745 $Y=4165
.ENDS
***************************************