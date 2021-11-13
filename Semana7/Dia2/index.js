const express = require('express');
const app = express();

app.use(express.json());

app.get('/', (req, res) => {
    res.send('Hello word')
})

const port = 5000;
app.listen(port, () => console.log(`http://localhost:${port}`));

//sequelize

const Sequelize = require('sequelize');

const sequelize = new Sequelize({
    dialect: 'sqlite',
    storage: './database.sqlite'
})

sequelize.authenticate()
    .then(() => {
        console.log("conexion establecida");
    })
    .catch(err => {
        console.log("error al conectarse");
    })

const Alumnos = sequelize.define(
    'alumnos',
    {
        nombre: Sequelize.STRING,
        email: Sequelize.STRING
    }
);


app.get('/alumnos', (req, res) => {
    Alumnos.findAll()
        .then(
            alumnos => res.json(alumnos)
        )
})

app.get('/alumnos/:id', (req, res) => {
    Alumnos.find({ where: { id: req.params.id } })
        .then(
            alumnos => res.json(alumnos)
        )
})

app.post('/alumnos', (req, res) => {
    Alumnos.create(
        {
            nombre: req.body.nombre,
            email: req.body.email
        }
    ).then(function (alumnos) {
        res.json(alumnos);
    })
})

app.put('/alumnos/:id', (req, res) => {
    Alumnos.findByPk(req.params.id)
        .then(function (alumnos) {
            alumnos.update(
                {
                    nombre = req.body.nombre,
                    email = req.body.email,
                })
                .then(function (alumnos) {
                    res.json(alumnos);
                })
        })
})

app.delete('/alumnos/:id', (req, res) => {
    Alumnos.findByPk(req.params.id)
        .then(function(alumnos){
            alumnos.destroy();
        }).then(function(alumnos){
            res.sendStatus(200);
        })
})

