#!/bin/bash

cat > f_statistic.txt &
echo "da fake-test-redge-1.fak
ig **-4.0 22.0-**
mo bbody
1.19775
0.197806
addc 1 tbabs
1.42732
freeze 1
addc 2 redge
8.12576
1.11368
1.43223E-02
addc 3 nthComp
1.85246
1000.00
1.19775
1.00000
0.0
3.88775E-02
freeze 6 8 9
thaw 7
newpar 7 = p11
syst 0.015
query yes
fit
tclout stat
scan $xspec_tclout "%f" chistat_2
echo $chistat_2 > f_statistic.txt
tclout dof
scan $xspec_tclout "%f" dof_2
echo $dof_2 > f_statistic.txt
model clear
mo bbody
1.24150
0.195715
addc 1 tbabs
1.42732
addc 2 nthComp
1.45242
1000.00
1.24150
1.00000
0.0
1.47508E-02
thaw 4
freeze 1 3 5 6
newpar 4 = p8
query yes
syst 0.015
fit
tclout stat
scan $xspec_tclout "%f" chistat_1
echo $chistat_1 > f_statistic.txt
tclout dof
scan $xspec_tclout "%f" dof_1
echo $dof_1 > f_statistic.txt
model clear
ftest $chistat_2 $dof_2 $chistat_1 $dof_1" | xspec > /dev/null
