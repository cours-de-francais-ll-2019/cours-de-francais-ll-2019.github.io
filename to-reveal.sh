#!/bin/bash

clear
echo
echo "  _                    _           ___  ___   _    "
echo " |_) ._ _  o  _ _|_   |_)    /\     |    |   / \   "
echo " |   | (_) | (/_ |_   |_) o /--\ o _|_ o | o \_/ o "
echo "          _|                                       "

echo
echo Conversion des fichiers du type lecon-XX.md
read -p "Numéro de leçon à convertir : " id

while true
do
	pandoc -t revealjs -s --css="theme.css" -o lecons/lecon-$id.html lecon-$id.md --slide-level=2 -V revealjs-url=https://revealjs.com
	echo La conversion de la leçon $id terminée.
	echo

	read -p "Le résultat est-il satisfaisant ? [O/n]" ok

	case $ok in
	O|o)
		mv "lecon-$id.md" "converti/lecon-$id.md"
		echo Transfert du fichier lecon-$id.md terminé
		break
	;;
	q)
		echo "Fin du traitement"
		exit
		;;
	*)
		echo "Nouvelle tentative de conversion"
		;;
	esac
done
