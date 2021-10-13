class clsAlumno:

    def __init__(self,nom,ema):
        self.nombre = nom
        self.email = ema

    def mostrar(self):
        print(self.nombre + " - " + self.email)

opcion = ''

alumnos = []

print("""=========================================
===========REGISTRO DE ALUMNOS===========
=========================================""")

while(opcion != 'salir'):
    opcion = input("OPCIONES (registrar, mostrar, salir) : ")
    if (opcion != 'salir'):
        if(opcion == "registrar"):
            nombre = input ("Nombre del alumno : ")
            email = input("Email del alumno: ")
            alumno = clsAlumno(nombre,email)
            alumnos.append(alumno)

        elif(opcion == "mostrar"):
            for a in alumnos:
                a.mostrar()
        else:
            print("LA OPCION NO ES VALIDA")