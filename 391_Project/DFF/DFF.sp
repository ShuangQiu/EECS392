* SPICE NETLIST
***************************************

.SUBCKT M1_N_2
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT M1_P_1
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT ICV_1
** N=1 EP=0 IP=2 FDC=0
.ENDS
***************************************
.SUBCKT M1_POLY_0
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT M2_M1_via
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT NAND 1 2 3 4 5
** N=6 EP=5 IP=2 FDC=4
M0 6 4 1 2 NMOS_VTG L=5e-08 W=1.63e-06 AD=2.282e-13 AS=1.834e-13 PD=3.54e-06 PS=3.49e-06 $X=945 $Y=4395 $D=5
M1 2 5 6 2 NMOS_VTG L=5e-08 W=1.63e-06 AD=1.77425e-13 AS=2.282e-13 PD=3.485e-06 PS=3.54e-06 $X=1325 $Y=4395 $D=5
M2 1 4 3 3 PMOS_VTG L=5e-08 W=1.44e-06 AD=2.016e-13 AS=1.512e-13 PD=3.16e-06 PS=3.11e-06 $X=945 $Y=8045 $D=4
M3 3 5 1 3 PMOS_VTG L=5e-08 W=1.44e-06 AD=1.58175e-13 AS=2.016e-13 PD=3.105e-06 PS=3.16e-06 $X=1325 $Y=8045 $D=4
.ENDS
***************************************
.SUBCKT ICV_2 1 2 3 4 5 6 7 8
** N=8 EP=8 IP=10 FDC=8
X0 1 5 2 3 4 NAND $T=0 0 0 0 $X=545 $Y=4285
X1 6 5 2 7 8 NAND $T=1215 0 0 0 $X=1760 $Y=4285
.ENDS
***************************************
.SUBCKT DFF
** N=12 EP=0 IP=53 FDC=30
M0 7 10 2 2 NMOS_VTG L=5e-08 W=1.44e-06 AD=1.161e-13 AS=1.0845e-13 PD=3.36e-06 PS=3.19e-06 $X=3520 $Y=1170 $D=5
M1 7 10 9 9 PMOS_VTG L=5e-08 W=1.96e-06 AD=1.6015e-13 AS=1.57e-13 PD=4.57e-06 PS=4.5e-06 $X=3515 $Y=4400 $D=4
X26 10 2 9 6 3 NAND $T=3500 -3225 1 180 $X=1740 $Y=1060
X27 1 9 6 3 2 3 4 12 ICV_2 $T=-6095 -3225 0 0 $X=-5550 $Y=1060
X28 5 9 6 8 2 8 5 4 ICV_2 $T=-3665 -3225 0 0 $X=-3120 $Y=1060
X29 6 9 1 11 2 4 11 7 ICV_2 $T=-1235 -3225 0 0 $X=-690 $Y=1060
.ENDS
***************************************
