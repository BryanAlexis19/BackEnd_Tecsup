const MongoLib = require("../lib/mongo");

class PeliculasService {
  constructor() {
    this.collection = "peliculas";
    this.mongoDB = new MongoLib();
  }

  async getAll() {
    const data = await this.mongoDB.getAll(this.collection);
    return data || [];
  }

  /*     async getPelicula({ peliculaId }) {
        const pelicula = await this.mongoDB.get(this.collection, peliculaId)
        return pelicula || []
    } */

  async create({ pelicula }) {
    console.log(pelicula);
    const peliculaId = await this.mongoDB.create(this.collection, pelicula);
    return peliculaId || 0;
  }

  async update({ peliculaId, peliculaData } = {}) {
    const updatePeliculaId = await this.mongoDB.update(
      this.collection,
      peliculaId,
      peliculaData
    );
    return updatePeliculaId;
  }

  async delete({ peliculaId }) {
    const deletePeliculaId = await this.mongoDB.delete(
      this.collection,
      peliculaId
    );
    return deletePeliculaId;
  }
}

module.exports = PeliculasService;
