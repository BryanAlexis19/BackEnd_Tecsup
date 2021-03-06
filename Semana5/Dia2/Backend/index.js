const express = require('express');
const { config } = require('./config/index');
const app = express();

app.get('/', (req, res) => {
    res.json({mensaje: 'Bienvenido a mi API puntoventa'});
});

app.use(require('./routes/categoria'));

app.listen(config.port,function() {
    console.log(`Servidor http://localhost:${config.port}`);
});
