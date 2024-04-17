#!/bin/bash
mkdir fake-spectra-no-redge
rm *.fak
for i in {1..100000}
do
	echo "@best-fit-withoutredge.xcm
	fakeit 1
	y
	
	fake-test-no-redge-$i.fak
	124.000, 1.000, 52610.200" | xspec > /dev/null
	mv fake-test-no-redge-$i.fak fake-spectra-no-redge/.
	mv fake-test-no-redge-${i}_bkg.fak fake-spectra-no-redge/.
done
