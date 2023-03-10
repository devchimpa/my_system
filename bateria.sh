#!/bin/bash
# Script para trazer status da bateria do notebook.
#
#Desenvolvido por DevChimpa Dia: 05/01/2023
#E-mail para contato: chimpadeveloper@gmail.com
#

BATERIA=$(cat /sys/class/power_supply/BAT0/uevent | grep POWER_SUPPLY_CAPACITY= | cut -c 23-25)
STATUS_BATERIA=$(cat /sys/class/power_supply/BAT0/uevent | grep POWER_SUPPLY_STATUS | tr = ' ' | cut -d' ' -f2)

clear

if [ $BATERIA -lt 20 ] && [ $STATUS_BATERIA = "Discharging" ]
then
        echo " Bateria em: $BATERIA% Status: Bateria Baixa"
        echo " POR FAVOR CONECTE A UMA FONTE DE ENERGIA "
        #Descomente este trecho para executar um som de alarme quando a bateria estiver baixa.
        #echo -e '\a'
        #sleep 0.5
        #echo -e '\a'

elif  [ $STATUS_BATERIA = "Full" ] && [ $BATERIA -eq 100 ]
then
        echo " Bateria em: $BATERIA% Status: Carregada."
elif [ $STATUS_BATERIA = "Discharging" ]
then
        echo " Bateria: em $BATERIA% Status: Descarregando."
else
        echo " $BATERIA% Status: Carregando."

fi
#echo "Bateria em: $BATERIA% STATUS: $STATUS_BATERIA"
