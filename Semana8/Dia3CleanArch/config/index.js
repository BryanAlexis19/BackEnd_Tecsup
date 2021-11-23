require('dotenv').config()

const config = {
    port1: process.env.PORT1,
    port2: process.env.PORT2,
    port3: process.env.PORT3,
    mongoURI: process.env.MONGOURI,
    mongoDbName: process.env.MONGODBNAME,
}

module.exports = { config}