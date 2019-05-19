@echo off
echo.
echo   _                    _           ___  ___   _    
echo  ^|_) ._ _  o  _ _^|_   ^|_)    /\     ^|    ^|   / \   
echo  ^|   ^| (_) ^| (/_ ^|_   ^|_) o /--\ o _^|_ o ^| o \_/ o 
echo           _^|                                       
:choixnumero
echo.
echo Conversion des fichiers du type lecon-XX.md
set /P id="Numéro de leçon à convertir : "
:conversion
echo.
pandoc -t revealjs -s --css="theme.css" -o lecons/lecon-%id%.html lecon-%id%.md --slide-level=2 -V revealjs-url=https://revealjs.com
echo Conversion de la leçon %id% terminée
echo.
:question
set /P ok="Le résultat est-il satisfaisant ? [O/n]"
echo.
if %ok%==n (goto conversion)
if %ok%==N (goto conversion)
if %ok%==o (goto deplacement)
if %ok%==O (goto deplacement)
goto question
:deplacement
move "lecon-"%id%".md" "converti/lecon-"%id%".md"
echo Transfert du fichier lecon-%id%.md terminé