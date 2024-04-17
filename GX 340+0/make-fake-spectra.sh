#!/bin/bash
mkdir fake-spectra-no-redge
for i in {1..100000}
do
	rm *.fak > /dev/null 2>&1
	echo "@lax-fit-mayukh-efb-no-redge.xcm
	fakeit 1
	y
	
	fake-test-no-redge-$i.fak
	124.000, 1.000, 52610.200" | xspec > /dev/null
	mv fake-test-no-redge-$i.fak fake-spectra-no-redge/.
	mv fake-test-no-redge-${i}_bkg.fak fake-spectra-no-redge/.
done
