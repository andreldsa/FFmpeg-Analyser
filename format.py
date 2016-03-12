# calcula o numero de ocorrencias para cada conf
def getCounter(mapa):
	counter = {}
	for key in mapa.keys():
		counter[key] = len(mapa[key])
	return counter

def toCSV(mapa):
	counter = getCounter(mapa)
	print counter
	keys = mapa.keys()
	print "conf,pid,cpu,mem,time"
	for key in keys:
		for value in mapa[key]:
			value = value.split(" ")
			print "".join(key.split(" ")) + "," + value[0] + "," + value[1] + "," + value[2]

with open('output') as file:
	mapa = {}

	tmp = -1
	for line in file:
		data = line.split(" ")

		# desconsidera o cabecalho
		if len(data) == 3: continue

		# pid
		if len(data) == 1:
			tmp = data[0][:-2]	
		# dados
		else:

			key = data[8] + " " + data[10] + " " + data[12] # a chave sera a configuracao
		
			if key not in mapa:
				mapa[key] = []
			mapa[key].append(tmp + " " + data[1] + " " + data[3])
	toCSV(mapa)

