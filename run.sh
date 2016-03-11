
#!/bin/bash

# Script para medição do projeto de ADSD - UFCG
# TODO cabecalho

echo Iniciando testes...

./teste.sh > tempo.txt

echo Testes realizados com sucesso em apenas $(cat tempo.txt | awk '{ sum += $4 } END { print sum/60 " minutos" }')!

exit 0;
