#Importar las librerias necesarias
from flask import Flask, render_template, request, redirect, url_for

#Importar la clase productos
from productos import Productos

#crear la app en flask
app = Flask(__name__)

#Crear una lista con los productos
lista_productos = [
    Productos('Ordenador', 'Ordenador de escritorio', 2800),
    Productos('Microfono', 'Tonor Microphone', 200),
    Productos('Parlante','Bocinas Logitech', 165)
]

#Crear app route con la raiz de la web
#ejecutar render template
@app.route('/')
def index():
    return render_template('lista_productos.html', productosx = lista_productos)

#Correr la app
app.run(debug= True)


