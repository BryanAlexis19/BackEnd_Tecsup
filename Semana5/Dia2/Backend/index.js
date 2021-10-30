const express = require('express');
const {config} = require('./config/index');
const app = express();

app.listen(config.port, () => {
    console.log(`Servidor http://localhost:${config.port}`);
});

app.get('/', (req, res) => {
    res.json({mensaje: 'Bienvenido a mi API puntoventa'});
});