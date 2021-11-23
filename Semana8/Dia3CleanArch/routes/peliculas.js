const express = require("express");
const PeliculasService = require("../services/peliculas");

function peliculasApi(app) {
  const router = express.Router();
  app.use("/api", router);

  const ps = new PeliculasService();

  router.get("/", async function (req, res, next) {
    try {
      const peliculas = await ps.getAll();
      res.status(200).json({
        status: true,
        content: peliculas,
      });
    } catch (err) {
      next(err);
    }
  });

  router.post("/", async function (req, res, next) {
    const { body: pelicula } = req;
    console.log("datos de pelicula routes", pelicula);
    try {
      const peliculaInsertId = await ps.create({ pelicula });
      res.status(201).json({
        status: true,
        content: peliculaInsertId,
      });
    } catch (err) {
      next(err);
    }
  });

  router.put("/:peliculaId", async function (req, res, next) {
    const { body: peliculaData } = req;
    const { peliculaId } = req.params;

    console.log("id de pelicula route: ", peliculaId);
    console.log("datos de pelicula routes", peliculaData);

    try {
      const peliculaUpdateId = await ps.update({peliculaId, peliculaData});
      res.status(201).json({
        status: true,
        content: peliculaUpdateId,
      });
    } catch (err) {
      next(err);
    }
  });

  router.delete("/:peliculaId", async function (req, res, next) {
    const { peliculaId } = req.params;

    console.log("id de pelicula route: ", peliculaId);

    try {
      const peliculaDeleteId = await ps.delete({peliculaId});
      res.status(200).json({
        status: true,
        content: peliculaDeleteId,
      });
    } catch (err) {
      next(err);
    }
  });
  
}

module.exports = peliculasApi;
