* SPICE NETLIST
***************************************

.SUBCKT M3_M2_via
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT PTAP_2
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT ICV_1
** N=2 EP=0 IP=2 FDC=0
.ENDS
***************************************
.SUBCKT NTAP_1
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT M2_M1_via
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT M1_POLY_4
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT M1_N_6
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT M1_P_5
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT ICV_2
** N=1 EP=0 IP=2 FDC=0
.ENDS
***************************************
.SUBCKT Inverter gnd! vdd! Out In
** N=4 EP=4 IP=18 FDC=2
M0 Out In gnd! gnd! NMOS_VTG L=5e-08 W=1.44e-06 AD=1.161e-13 AS=1.0845e-13 PD=3.36e-06 PS=3.19e-06 $X=2045 $Y=110 $D=5
M1 Out In vdd! vdd! PMOS_VTG L=5e-08 W=1.96e-06 AD=1.6015e-13 AS=1.57e-13 PD=4.57e-06 PS=4.5e-06 $X=2040 $Y=3340 $D=4
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
.SUBCKT ICV_3 1 2 3 4 5 6 7 8
** N=8 EP=8 IP=10 FDC=12
X0 3 4 5 1 2 XOR $T=0 -2625 0 0 $X=2080 $Y=-730
X1 6 7 8 1 2 XOR $T=0 0 0 0 $X=2080 $Y=1895
.ENDS
***************************************
.SUBCKT ICV_4 1 2 3 4 5 6 7 8
** N=8 EP=8 IP=10 FDC=12
X0 2 4 1 3 5 AND $T=0 0 0 0 $X=-1360 $Y=-4155
X1 2 4 6 7 8 AND $T=2230 0 0 0 $X=870 $Y=-4155
.ENDS
***************************************
.SUBCKT ICV_5 1 2 3 4 5 6 7 8 9 10 11 12 13 14
** N=14 EP=14 IP=16 FDC=24
X0 2 3 4 1 5 6 7 8 ICV_4 $T=0 -8710 1 0 $X=-1360 $Y=-11925
X1 9 3 10 1 11 12 13 14 ICV_4 $T=0 0 0 0 $X=-1360 $Y=-4155
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
.SUBCKT ICV_6 1 2 3 4 5 6 7 8
** N=8 EP=8 IP=10 FDC=12
X0 3 4 1 2 5 OR $T=0 -7770 0 0 $X=-1125 $Y=-10940
X1 3 4 6 7 8 OR $T=0 0 0 0 $X=-1125 $Y=-3170
.ENDS
***************************************
.SUBCKT ICV_7 1 2 3 4 5 6 7 8
** N=8 EP=8 IP=10 FDC=12
X0 3 4 5 1 2 XOR $T=0 0 0 0 $X=2080 $Y=1895
X1 6 7 8 1 2 XOR $T=2220 0 0 0 $X=4300 $Y=1895
.ENDS
***************************************
.SUBCKT KoggeStone gnd! vdd! Cin S7 S3 S6 S2 S5 S1 S4 S0 B7 A7 B6 A6 B5 A5 B4 A4 B3
+ A3 B2 A2 B1 A1 B0 A0 Cout
** N=98 EP=28 IP=552 FDC=474
X219 gnd! vdd! 72 57 73 AND $T=21510 -8690 1 0 $X=20150 $Y=-11905
X220 gnd! vdd! Cin 73 70 AND $T=21510 20 0 0 $X=20150 $Y=-4135
X221 gnd! vdd! 19 S7 67 23 S3 42 ICV_3 $T=21210 8130 1 270 $X=16815 $Y=3830
X222 gnd! vdd! 20 S6 64 24 S2 41 ICV_3 $T=21210 10350 1 270 $X=16815 $Y=6050
X223 gnd! vdd! 21 S5 66 25 S1 3 ICV_3 $T=21210 12570 1 270 $X=16815 $Y=8270
X224 gnd! vdd! 22 S4 37 26 S0 Cin ICV_3 $T=21210 14790 1 270 $X=16815 $Y=10490
X225 B7 gnd! A7 vdd! 15 B6 A6 14 ICV_4 $T=-21615 -12390 1 90 $X=-25770 $Y=-13750
X226 B5 gnd! A5 vdd! 13 B4 A4 12 ICV_4 $T=-21615 -7930 1 90 $X=-25770 $Y=-9290
X227 B3 gnd! A3 vdd! 4 B2 A2 5 ICV_4 $T=-21615 -3470 1 90 $X=-25770 $Y=-4830
X228 B1 gnd! A1 vdd! 6 B0 A0 7 ICV_4 $T=-21615 990 1 90 $X=-25770 $Y=-370
X229 4 gnd! 22 vdd! 27 12 21 28 ICV_4 $T=-14170 -8690 1 0 $X=-15530 $Y=-11905
X230 Cin gnd! 26 vdd! 8 7 25 9 ICV_4 $T=-14170 20 0 0 $X=-15530 $Y=-4135
X231 17 gnd! 48 vdd! 44 18 54 45 ICV_4 $T=3670 -8690 1 0 $X=2310 $Y=-11905
X232 3 gnd! 49 vdd! 39 16 55 40 ICV_4 $T=3670 20 0 0 $X=2310 $Y=-4135
X233 31 gnd! 56 vdd! 46 32 63 47 ICV_4 $T=8130 -8690 1 0 $X=6770 $Y=-11905
X234 55 gnd! 43 vdd! 57 Cin 57 36 ICV_4 $T=8130 20 0 0 $X=6770 $Y=-4135
X235 vdd! 6 gnd! 24 10 5 23 11 13 20 29 14 19 30 ICV_5 $T=-9710 -8690 1 0 $X=-11070 $Y=-11905
X236 vdd! 25 gnd! 26 43 24 25 49 22 23 48 21 22 54 ICV_5 $T=-5250 -8690 1 0 $X=-6610 $Y=-11905
X237 vdd! 23 gnd! 24 55 Cin 43 38 20 21 56 19 20 63 ICV_5 $T=-790 -8690 1 0 $X=-2150 $Y=-11905
X238 vdd! 3 gnd! 65 59 41 69 60 48 49 65 54 55 69 ICV_5 $T=12590 -8690 1 0 $X=11230 $Y=-11905
X239 vdd! 42 gnd! 71 61 35 72 62 56 48 71 63 54 72 ICV_5 $T=17050 -8690 1 0 $X=15690 $Y=-11905
X240 gnd! vdd! 8 7 3 OR $T=-21570 5535 0 90 $X=-25770 $Y=4410
X241 gnd! vdd! 27 12 31 OR $T=-13800 5535 0 90 $X=-18000 $Y=4410
X242 gnd! vdd! 36 35 37 OR $T=-6030 5535 0 90 $X=-10230 $Y=4410
X243 gnd! vdd! 40 18 35 OR $T=-6030 12105 0 90 $X=-10230 $Y=10980
X244 gnd! vdd! 44 31 50 OR $T=1740 5535 0 90 $X=-2460 $Y=4410
X245 gnd! vdd! 59 50 66 OR $T=9510 5535 0 90 $X=5310 $Y=4410
X246 gnd! vdd! 60 51 64 OR $T=9510 7725 0 90 $X=5310 $Y=6600
X247 gnd! vdd! 61 52 67 OR $T=9510 9915 0 90 $X=5310 $Y=8790
X248 gnd! vdd! 70 68 Cout OR $T=15125 8425 0 0 $X=14000 $Y=5255
X249 28 13 gnd! vdd! 32 9 6 16 ICV_6 $T=-21570 7725 0 90 $X=-25770 $Y=6600
X250 29 14 gnd! vdd! 33 10 5 17 ICV_6 $T=-21570 9915 0 90 $X=-25770 $Y=8790
X251 30 15 gnd! vdd! 34 11 4 18 ICV_6 $T=-21570 12105 0 90 $X=-25770 $Y=10980
X252 45 32 gnd! vdd! 51 38 16 41 ICV_6 $T=-6030 7725 0 90 $X=-10230 $Y=6600
X253 46 33 gnd! vdd! 52 39 17 42 ICV_6 $T=-6030 9915 0 90 $X=-10230 $Y=8790
X254 62 53 gnd! vdd! 68 47 34 53 ICV_6 $T=1740 12105 0 90 $X=-2460 $Y=10980
X255 gnd! vdd! B7 19 A7 B6 20 A6 ICV_7 $T=-13875 -15750 0 90 $X=-18270 $Y=-13670
X256 gnd! vdd! B5 21 A5 B4 22 A4 ICV_7 $T=-13875 -11310 0 90 $X=-18270 $Y=-9230
X257 gnd! vdd! B3 23 A3 B2 24 A2 ICV_7 $T=-13875 -6870 0 90 $X=-18270 $Y=-4790
X258 gnd! vdd! B1 25 A1 B0 26 A0 ICV_7 $T=-13875 -2430 0 90 $X=-18270 $Y=-350
.ENDS
***************************************
