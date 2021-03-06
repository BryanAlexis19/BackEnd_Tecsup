require('dotenv').config();

const config = {
    port: process.env.PORT,
    dbUser: process.env.DBUSER,
    dbHost: process.env.DBHOST,
    dbPassword: process.env.DBPASSWORD,
    dbDatabase: process.env.DBDATABASE,
    dbPort: process.env.DBPORT,
}

module.exports = {config};