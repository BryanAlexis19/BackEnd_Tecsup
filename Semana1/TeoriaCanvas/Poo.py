class Cursos:
    def __init__(self, nombre, precio, durac):
        self.nombre = nombre
        self.precio = precio
        self.durac = durac
    
    def PrintValues(self):
        print(f"{self.nombre} {self.precio} {self.durac}")

    def PrintCosto(self):
        if(self.precio <= 100):
            print(f"El precio es economico")
        elif (self.precio > 100 and self.precio < 300 ):
            print(f"El precio es medianamente accesible")
        else:
            print(f"El precio es alto")


curso1 = Cursos("Python", 299, "1 mes")

curso1.PrintCosto()