const express = require('express');
const { config } = require('./config/index');
const cors = require('cors');
const app = express();

app.get('/', (req, res) => {
    res.json({mensaje: 'Bienvenido a mi API puntoventa'});
});

app.use(cors());
app.use(express.json());
app.use(require('./routes/categoria'));
app.use(require('./routes/empleado'));
app.use(require('./routes/mesa'));
app.use(require('./routes/pedido'));


app.listen(config.port,function() {
    console.log(`Servidor http://localhost:${config.port}`);
});
