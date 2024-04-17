#!/bin/bash
mkdir fake-spectra-redge
rm *.fak
for i in {1..100000}
do
	echo "@best-fit-withredge.xcm
	fakeit 1
	y
	
	fake-test-redge-$i.fak
	124.000, 1.000, 52610.200" | xspec > /dev/null
	mv fake-test-redge-$i.fak fake-spectra-redge/.
	mv fake-test-redge-${i}_bkg.fak fake-spectra-redge/.
done
