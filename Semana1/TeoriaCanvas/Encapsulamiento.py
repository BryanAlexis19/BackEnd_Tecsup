class MiClase:
    __atributo_ejemplo = "Hola soy un atributo privado de ejemplo"
    print(__atributo_ejemplo)

    def getAtibutoEjemplo(self):
        return self.__atributo_ejemplo
    
    def __metodoPrivado(self):
        print("Hola soy un metodo privado")

    def getMetodoPrivado(self):
        return self.__metodoPrivado()

ejemplo =  MiClase()
ejemplo.getAtibutoEjemplo()
ejemplo.getMetodoPrivado()

