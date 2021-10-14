#Importar las librerias de flask
from flask import Flask, jsonify, request
from flask_mysqldb import MySQL

#Crear la app
app = Flask(__name__)

#Crear la conexion con la base de datos

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'listado_reto6_back'

mysql = MySQL(app)

#Crear la ruta de bienvenida
@app.route('/')
def index():
    return jsonify ({
        "ok" : True,
        "content" : "",
        "Message" : "Bienvenido a la app de listados pendientes"
    })


#Crear metodo para listar listas
@app.route('/ListarTarea')
def selectTarea():
    cursor = mysql.connection.cursor()
    cursor.execute(f'select * from lista')
    data = cursor.fetchall()
    cursor.close()

    return jsonify({
        "ok" : True,
        "content" : data,
        "message" : "Lista de tareas y sus prioridades"
    })

#Crear metodo de insercion por post
@app.route('/RegistrarTarea', methods = ['POST'])
def insertTarea():
    #Definir los campos requridos
    tarea = request.json['tarea']
    prioridad = request.json['prioridad']
    
    cursor = mysql.connection.cursor()
    cursor.execute(f"insert into lista(tarea,prioridad) values('{tarea}','{prioridad}')")
    mysql.connection.commit()
    cursor.close()

    return jsonify({
        "ok" : True,
        "content" : "",
        "Message" : "Registro insertado exitosamente"
    })

#Crear metodo para actualizar campos
@app.route('/ActualizarTarea', methods = ['PUT'])
def updateTarea():
    codigo = request.json['codigo']
    tarea = request.json['tarea']
    prioridad = request.json['prioridad']

    cursor = mysql.connection.cursor()
    cursor.execute(f"update lista set tarea='{tarea}', prioridad='{prioridad}' where codigo='{codigo}'")
    mysql.connection.commit()
    cursor.close()

    return jsonify ({
        "ok" : True,
        "content" : "",
        "message" : f"El registro Nro {codigo} fue actualizado exitosamente"
    })

#Crear metodo para eliminar por Delete
@app.route('/EliminarTarea', methods = ['DELETE'])
def deleteTarea():
    codigo = request.json['codigo']

    cursor = mysql.connection.cursor()
    cursor.execute(f"delete from lista where codigo={codigo}")
    mysql.connection.commit()
    cursor.close()

    return jsonify({
        "ok" : True,
        "content" : "",
        "Message" : f"Registro Nro {codigo} fue eliminado con exito"
    })

    
#Correr la app
if __name__ == "__main__":
    app.run(debug=True, port=8000)
