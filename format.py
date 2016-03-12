def toCSV(mapa):

	keys = mapa.keys()
	print "conf,pid,cpu,mem"
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

