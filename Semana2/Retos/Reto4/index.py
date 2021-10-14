#Importar flask
from logging import debug
from flask import Flask
from flask.json import jsonify

#crear la app en flask
app = Flask(__name__)

#Crear la ruta principal
@app.route('/')
def index():
    departamentos = ['Lima', 'Piura', 'Ica', 'Cajamarca', 'Loreto']

    return jsonify({
        "ok" : True,
        "content" : departamentos,
        "message" : "Lista de departamentos"
    })

#Correr la aplicacion
app.run(debug=True, port= 8000)

