const express = require("express");
const app = express();

const { config } = require("../config/index");

const peliculasApi = require("../routes/peliculas");

app.use(express.json());

peliculasApi(app);

//levantar el microservicio

app.listen(config.port1, () => {
  console.log(
    `microservicio 1 peliculas: corriendo en  http://localhost:${config.port1}`
  );
});
