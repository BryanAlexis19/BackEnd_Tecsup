const express = require("express");
const app = express();

const { config } = require("../config/index");

const usuariosApi = require("../routes/usuarios");

app.use(express.json());

usuariosApi(app);

//levantar el microservicio

app.listen(config.port2, () => {
  console.log(
    `microservicio 2 usuarios: corriendo en  http://localhost:${config.port2}`
  );
});
