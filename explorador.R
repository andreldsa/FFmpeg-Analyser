dados = read.csv('Downloads/FFmpeg-Analyser-master/data.csv')

summary(dados$cpu, na.rm = TRUE)
summary(dados$mem, na.rm = TRUE)
table(dados$pid)