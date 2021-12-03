#!/bin/bash

function Menu {

echo " --------------------------------------------"
echo "Base de Dades de Cotxes"
echo "--------------------------------------------"
echo "1- Llistats de cotxes."
echo "2- Cerca de cotxes."
echo "3- Comprovem si ets realment un Expert en cotxes."
echo "4- Altes, baixes i modificacions de la base de dades."
echo "0- Sortir." 
}

function enDesenvolupament {
echo "En desenvolupament"
read $des
clear
}


function opcionovalida {
echo "Opcio no valida"	
sleep 3
clear
}



function Menu1 {
echo " --------------------------------------------"
echo "1 - Llistat de Cotxes"
echo "--------------------------------------------"
echo "1 Mostrar llistats de cotxes (alfabèticament per nom)."
echo "2 Mostar llistat de cotxes ordenat per any d'inici de fabricació. (StartYear)"
echo "3 Mostrar llistat de cotxes ordenats per any de fi de fabricació en ordre descendent. (FinalYear)"
echo "4 Tornar"
}

function llistarcotxes_peranyfinal {
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
}










Menu
echo "Introdueix una opció"
read var
while [ $var -ne 0 ]
do
	case $var in
	1)
	enDesenvolupament;;
	2)
	enDesenvolupament;;
	3)
	enDesenvolupament;;
	4)
	enDesenvolupament;;
	*)
	opcionovalida
	esac
	Menu
	echo "Introdueix una opció"
	read var
done
		



