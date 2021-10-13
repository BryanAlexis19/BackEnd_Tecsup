#Import statements
from datetime import date

print("""=========================================
============ORDEN DE PERSONAS============
=========================================""")

#INGRESO
n = int(input("Ingrese la cantidad de personas: "))
alumnos = []


for i in range(n):
    nombre = input("Ingrese nombre: ")
    nac = input("Ingrese fecha de nacimiento: ")
    alumno = {
        'nombre': nombre,
        'nacimiento': nac
    }
    alumnos.append(alumno)

#PROCESO

#SALIDA

print(alumnos)
alumnos.sort()
print(alumnos)
