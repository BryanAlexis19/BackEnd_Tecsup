const { MongoClient, ObjectId } = require('mongodb');
const {config} = require('../config/index')

class MongoLib {
    constructor(){
        this.client = new MongoClient(config.mongoURI, { useNewUrlParser: true });
        this.dbName = config.mongoDbName;
    }

    connect(){
        if(!MongoLib.connection){
            MongoLib.connection = new Promise((resolve, reject) => {
                this.client.connect(err => {
                    if(err){
                        reject(err);
                    }else{
                        resolve(this.client.db(this.dbName));
                        console.log('Estas conectado a mongodb')
                    }
                });
            });
        }
        return MongoLib.connection;
    }

    getAll(collection){
        return this.connect().then(db=>{
            return db.collection(collection).find().toArray();
        })
    }

    create(collection, data){
        return this.connect().then(db=>{
            return db.collection(collection).insertOne(data);
        }).then(result => result.insertedId);
    }

    update(collection,id,data){
        return this.connect().then(db=>{
            return db.collection(collection).updateOne({_id: ObjectId(id)},{$set: data}, {upsert: false});
        }).then(result => result.insertedId || id);
    }

    delete(collection, id){
        return this.connect().then(db=>{
            return db.collection(collection).deleteOne({_id: ObjectId(id)});
        }).then(result => result.deletedId || id);
    } 
}

module.exports = MongoLib;
