import csv

def mostrarInfo():
    csvarchivo = open("/home/bryan/Documentos/BackEnd_Tecsup/Semana1/TeoriaCanvas/Data.csv",'r', encoding='utf-8')
    entrada = csv.reader(csvarchivo) #Leer todos los registros
    for reg in entrada:
        print(reg)
    csvarchivo.close()
    del csvarchivo

mostrarInfo()

