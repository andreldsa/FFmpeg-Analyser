dados = read.csv('Downloads/FFmpeg-Analyser-master/dataAll.csv')

summary(dados$cpu, na.rm = TRUE)
summary(dados$mem, na.rm = TRUE)
table(dados$pid)

mediasCPU <- aggregate(dados$cpu, list(dados$conf), mean, na.rm = TRUE)
boxplot(mediasCPU$Group.1, mediasCPU$x)
mediasMem <- aggregate(dados$mem, list(dados$conf), mean, na.rm = TRUE)

# tempo no print do .py:
tempo <- c(88, 109, 174, 248, 90, 109, 246, 4, 176)
# {'mpeg4 1200 640x480': 88, 'mpeg4 1200 1280x720': 109, 'ffv1 1200 640x480': 174, 'ffv1 512 1280x720': 248, 'mpeg4 512 640x480': 90, 'mpeg4 512 1280x720': 109, 'ffv1 1200 1280x720': 246, '-b:v -s -loglevel': 4, 'ffv1 512 640x480': 176}