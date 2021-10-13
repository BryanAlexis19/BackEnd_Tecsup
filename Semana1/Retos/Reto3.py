class producto:
    def __init__(self,nombre, descr):
        self.nombre = nombre
        self.descr = descr
    
    def PrintMessage(self):
        print(f"{self.nombre} {self.descr}")

print("""=========================================
==========INGRESO DE PRODUCTOS==========
=========================================""")


resp = "si"
while resp != "no":
    nom = input("Ingrese nombre del producto: ")
    descr = input("Ingrese descripcion: ")
    prodx = producto(nom,descr)
    prodx.PrintMessage()
    resp = input("Desea ingresar otro producto? [si] [no] : ")

