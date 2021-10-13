from flask import Flask, jsonify, request
from flask_mysqldb import MySQL

app = Flask(__name__)

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'alexis'
app.config['MYSQL_PASSWORD'] = '66176617'
app.config['MYSQL_DB'] = 'semana2'

mysql = MySQL(app)

@app.route('/')
def index():
    return  jsonify({
        "ok" : True,
        "content" : "",
        "message": "Bienvenido a mi api rest flask"    
        })

@app.route('/departamentos')
def departamentos():
    listaDepartamentos = ['Arequipa','Lima','Chiclayo','Piura','Cuzco', 'Tacna']

    return jsonify({
        "ok" : True,
        "content" : listaDepartamentos,
        "message": "LISTA DE DEPARTAMENTOS" 
    })

@app.route('/alumnos')
def getAlumnos():
    cursor = mysql.connection.cursor()
    cursor.execute('select * from alumnos')
    data = cursor.fetchall()

    return jsonify({
        "ok" : True,
        "content" : data,
        "message": "LISTA DE ALUMNOS" 
    })

@app.route('/alumno', methods = ['POST'])
def setAlumno():
    nombre = request.json['nombre']
    email = request.json['email']

    cursor = mysql.connection.cursor()
    cursor.execute("insert into alumnos(nombre,email) values('"+nombre + "','"+ email + "')")
    mysql.connection.commit()
    cursor.close()

    return jsonify({
        "ok" : True,
        "content" : "",
        "message" : "Registro insertado correctamente"
    })



if __name__ == '__main__':
    app.run(debug=True, port=5000)