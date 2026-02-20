// Connecting the posgresql database in this code


const { Pool } = require("pg");

const pool = new Pool({
    user: "postgres",
    host: "localhost",
    database: "fedavest",
    password: "admin123",
    port: 5432,
});

module.exports = pool;

