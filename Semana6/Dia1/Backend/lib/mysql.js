const mysql = require('mysql');
const {config} = require('../config/index');

const mysqlConnection = mysql.createConnection({
    host: config.dbHost,
    user: config.dbUser,
    password: config.dbPassword,
    database: config.dbDatabase,
    port: config.dbPort
});

mysqlConnection.connect((err) => {
    if (err) {
        console.error(err);
        return;
    }
    console.log('Conexion exitosa a la bd');
});

module.exports = mysqlConnection;