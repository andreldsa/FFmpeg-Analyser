#!/bin/bash

# Script para medição do projeto de ADSD - UFCG
# TODO cabecalho

# para especificar: -c:v mpeg4
codecs=(
	mpeg4
	ffv1
)

# para especificar: -b:v 64k
bitrates=(
	512
	1200
)

# para especificar: -s 640x480
resolucoes=(
	640x480
	1280x720
)

# Gerando as combinacoes dos parametros de configuracao

rm -rf usage.txt
./monitor.sh > usage.txt &
# echo Id do monitor $(pgrep monitor.sh)

for codec in "${codecs[@]}"
do
	for bitrate in "${bitrates[@]}"
	do
		for resolucao in "${resolucoes[@]}"
		do	
			# echo Configuracao $codec $bitrate $resolucao:
			timestamp=$(date +%s)
			ffmpeg -i input.mkv -c:v $codec -b:v $bitrate -s $resolucao -loglevel 'quiet' output.avi
			now=$(date +%s)
			result="$(($now-$timestamp))"
			echo $codec $bitrate $resolucao "${result}"
			rm output.avi
		done
	done
done

kill -9 $(pgrep monitor.sh)
# echo Monitor encerrado? $(pgrep monitor.sh)
exit 0;
