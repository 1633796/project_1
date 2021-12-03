#!/bin/bash
tail +3 cars.csv | sort -k10 -t';' -n -r > any_final
cotxes=`wc -l < any_final`
for i in $(seq 1 $cotxes)
do
	head -$i any_final | tail -1 > cotxe
	echo "
	Cotxe: `cut -d';' -f1 cotxe`
	MPG: `cut -d';' -f2 cotxe` Nº Cilindres: `cut -d';' -f3 cotxe` Cilindrada: `cut -d';' -f4 cotxe`
	Potència(CV):`cut -d';' -f5 cotxe` Pes:`cut -d';' -f6 cotxe` Aceleració (0 a 100): `cut -d';' -f7 cotxe`
	Any inici: `cut -d';' -f8 cotxe` Any final: `cut -d';' -f10 cotxe`
	Origen: `cut -d';' -f9 cotxe` Company: `cut -d';' -f11 cotxe`"
done

rm any_final
rm cotxe
