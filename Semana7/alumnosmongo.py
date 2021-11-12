from pymongo import MongoClient

cliente = MongoClient('mongodb://127.0.0.1:27017')

#Accessing the database

db = cliente['test']

colAlumnos = db['alumnos']

#alumnoId = colAlumnos.insert_one({'nombre':'Juan Mecanico','email': 'juanmec@gmail.com','dni': '99991354','edad':20})
#print(alumnoId)
for a in colAlumnos.find():
    print(f'{a["nombre"]} - {a["email"]} -  {a["dni"]}')
