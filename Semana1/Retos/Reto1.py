print("""=========================================
==========PROGRAMA DE BIENVENIDA=========
=========================================""")

nombre = input("Ingrese nombre: ")
edad = int(input("Ingrese edad: "))

if(edad < 18):
    hora = int(input("Ingrese hora actual: (00 - 24) "))
    if(hora > 18):
        print("Debe ir a domir")
    else:
        print("Hacer la tarea")
else:
    print("No esta obligado a hacer algo")