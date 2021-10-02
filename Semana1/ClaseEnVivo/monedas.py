#PROGRAMA PARA CONVERTIR TIPOS DE CAMBIO DE MONEDAS
#DEFINICION DE VARIABLES
dicTiposCambio = {
    'dolares': 4.134,
    'euros': 4.859,
    'peso mexicano': 0.220,
    'yen japones': 2.3
}

print("=======================================")
print("         CONVERTIDOR DE MONEDAS        ")
print("=======================================")
#DEFINICION DE VALORES DE ENTRADA(INPUT)
#monedaOrigen = "soles"
monedaDestino = input("Ingrese moneda de destino(dolares, euros) : ")
monedaOrigenMonto = float(input("Ingresa monto a convertir : "))
#PROCESO O LOGICA DE NEGOCIO
"""if monedaDestino == "dolares":
    tipoCambio = 4.134
else:
    tipoCambio = 1"""
tipoCambio = dicTiposCambio[monedaDestino]
#CALCULAMOS EL MONTO DESTINO
monedaDestinoMonto = monedaOrigenMonto / tipoCambio

#MOSTRAR DATOS DE SALIDA
strMontoResultado = "{:.2f}".format(monedaDestinoMonto)
print(f"el monto en {monedaDestino} es {strMontoResultado}")
