const express = require("express");

const router = express.Router();

const mysqlConnection = require("../lib/mysql");

router.get("/categoria", (req, res) => {
  mysqlConnection.query("CALL getAllCategorias()", (err, rows, fields) => {
    if (!err) {
      res.json({
        ok: true,
        content: rows[0],
      });
    } else {
      console.log(err);
    }
  });
});

router.get("/categoria/:id", (req, res) => {
  const { id } = req.params;
  mysqlConnection.query(
    "CALL getCategoriaById(?)",
    [id],
    (err, rows, fields) => {
      if (!err) {
        res.json(rows[0]);
      } else {
        console.log(err);
      }
    }
  );
});

router.get("/categoria/:id/platos", (req, res) => {
  const { id } = req.params;
  mysqlConnection.query(
    "CALL getCategoriaById(?)",
    [id],
    (err, rowsCategoria) => {
      let rCategoria = {};
      let rPlatos = [];
      if (!err) {
        rCategoria = rowsCategoria[0];
        mysqlConnection.query(
          "CALL obtenerPlatosPorCategoriaId(?)",
          [id],
          (err, rowsPlatos, fields) => {
            if (!err) {
              rPlatos = rowsPlatos[0];
            } else {
              console.log(err);
            }
            return res.json({
              ok: true,
              content: {
                ...rCategoria[0],
                Platos: rPlatos,
              },
            });
          }
        );
      } else {
        console.log(err);
      }
    }
  );
});
module.exports = router;
