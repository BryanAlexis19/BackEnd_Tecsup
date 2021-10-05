from typing import overload


class vehiculo:
    def __init__(self, marca, color):
        self.m = marca
        self.n = color

    def mensaje(self):
        if self.m == "Toyota":
            self.msj = "Marca es recomendable"
        else:
            self.msj = "Marca a evaluar"

        return self.msj

class Auto(vehiculo):
    def __init__(self, precio):
        self.pre = precio
    
    def mensaje(self):
        print(f"{self.m} {self.n} {self.pre}")

objeto1 = Auto(8000)
objeto1.m = "Toyota"
objeto1.n = "Rojo"
objeto1.mensaje()

