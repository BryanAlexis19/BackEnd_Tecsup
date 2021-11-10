const express = require("express");

const router = express.Router();

const mysqlConnection = require("../lib/mysql");

const jwt = require('jsonwebtoken');

//Funcion para validad token
const validarToken = (req, res, next) => {
  //Coger valor de la cabezera y guardarlo en una variable
  const bearerHeader = req.headers["authorization"];
  console.log("bearerHeader", bearerHeader);
  //Si no existe la cabezera
  if (typeof bearerHeader !== "undefined") {
    //Separar el token del bearer
    const bearer = bearerHeader.split(" ");
    //Coger el token
    const bearerToken = bearer[1];
    //Verificar el token
    console.log(bearerToken);
    req.token = bearerToken;
    next();
  } else {
    //Si no existe el token
    res.sendStatus(403);
    err;
  }
};



//============================================

router.get("/empleado", (req, res) => {
  mysqlConnection.query("select * from tbl_empleado", (err, rows, fields) => {
    if (!err) {
      res.json(rows);
    } else {
      console.log(err);
    }
  });
});

router.get("/empleado/:usuario_id", (req, res) => {
  const { usuario_id } = req.params;
  mysqlConnection.query(
    "select * from tbl_empleado where usuario_id = ?",
    [usuario_id],
    (err, rows, fields) => {
      if (!err) {
        res.json(rows[0]);
      } else {
        console.log(err);
      }
    }
  );
});

router.get("/auth/empleado", validarToken, (req, res) => {
  jwt.verify(
    req.token,
    "django-insecure-7gyvq^q=4pg@tx7z-&1x0^pwoc+&uq!2v%#2&x5g4$g1(3yw5r",
    (err, authData) => {
      if (err) {
        res.json({
          mensaje: "acceso privado",
          err,
        });
      } else {
        const usuario_id = authData.user_id;
        console.log(authData.user_id);
        mysqlConnection.query(
          "select * from tbl_empleado where usuario_id = ?",
          [usuario_id],
          (err, rows, fields) => {
            if (!err) {
              //res.json(rows[0]);
               res.json({
                 ok: true,
                 content: rows[0],
              });
            } else {
              console.log(err);
            }
          }
        );
      }
    }
  );
});


module.exports = router;
