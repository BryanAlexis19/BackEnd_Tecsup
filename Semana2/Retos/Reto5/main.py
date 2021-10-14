# Importar las librerias necesarias
from flask import Flask, jsonify, request
from flask_mysqldb import MySQL

# Crear la app con flask
app = Flask(__name__)

# Crear la conexion con SQL
# Campos de Tabla productos: codigo, nombre, precio

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'phpmyadmin'
app.config['MYSQL_PASSWORD'] = '123456'
app.config['MYSQL_DB'] = 'productos_reto5_back'

mysql = MySQL(app)


# Crear las rutas de la app
# Ruta de bienvenida principal
@app.route('/')
def index():
    return jsonify({
        "ok": True,
        "Content": "",
        "message": "Bienvenido a mi API de prueba con GET Y POST"
    })

# Obtener los productos con GET
@app.route('/productos')
def productos():
    cursor = mysql.connection.cursor()
    cursor.execute('select * from productos')
    data = cursor.fetchall()

    return jsonify({
        "ok": True,
        "content": data,
        "message": "LISTA DE PRODUCTOS"
    })

# Registrar los productos con POST
@app.route('/producto', methods=['POST'])
def setProducto():
    nombre = request.json['nombre']
    precio = request.json['precio']

    cursor = mysql.connection.cursor()
    cursor.execute(
        f"insert into productos(nombre,precio) values('{nombre}','{precio}')")
    mysql.connection.commit()
    cursor.close()

    return jsonify({
        "ok": True,
        "content": "",
        "message": "Registro insertado exitosamente! "
    })


# Correr la app
if __name__ == '__main__':
    app.run(debug=True, port=8000)
