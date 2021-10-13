class Persona:
    def __init__(self, nombre, sexo, fnacim):
        self.nombre = nombre
        self.sexo = sexo
        self.fnacim = fnacim
    
    def saludar(self):
        print(f"Hola! Mi nombre es {self.nombre}, mucho gusto de estar aqui...")


class Profesor(Persona):
    def __init_(self, cantAulas, especialidad):
        self.cantAulas = cantAulas
        self.especialidad = especialidad
    
class Alumno(Persona):
    def __init__(self, grado, carrera):
        self.grado = grado
        self.carrera = carrera


        