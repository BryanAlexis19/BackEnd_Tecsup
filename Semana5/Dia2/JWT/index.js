const express = require("express");
const app = express();

const jwt = require("jsonwebtoken");

app.get("/", (req, res) => {
  res.json({
    message: "Hello World",
  });
});

//Metodo para generar tokens
app.post("/login", (req, res) => {
  const user = {
    id: 1,
    usuario: "admin",
    email: "librale19@gmail.com",
  };

  jwt.sign({ user }, "secretkey", { expiresIn: "30s" }, (err, token) => {
    res.json({
      token,
    });
  });
});



//Funcion para validad token
const validarToken = (req, res, next) => {
  //Coger valor de la cabezera y guardarlo en una variable
  const bearerHeader = req.headers["authorization"];

  //Si no existe la cabezera
  if (typeof bearerHeader !== "undefined") {
    //Separar el token del bearer
    const bearer = bearerHeader.split(" ");
    //Coger el token
    const bearerToken = bearer[1];
    //Verificar el token
    req.token = bearerToken;
    next();
  } else {
    //Si no existe el token
    res.sendStatus(403);
    err
  }
};

//Metodo para acceder a la ruta
app.post("/acceso", validarToken, (req, res) => {
    //Coger el token
    jwt.verify(req.token, "secretkey", (err, authData) => {
      //Si no hay error
      if (!err) {
        res.json({
          message: "Acceso permitido",
          authData,
        });
      } else {
        //Si hay error
        res.json({
          message: "Acceso denegado",
          err
        });        
      }
    });
  });

app.listen(4500, () => {
  console.log("Server running on port http://localhost:4500");
});
