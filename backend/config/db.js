// Connecting the posgresql database in this code


const { Pool } = require("pg");

const pool = new Pool({
    user: process.env.DB_USER || "postgres",
    host: process.env.DB_HOST || "localhost",
    database: process.env.DB_DATABASE || "fedavest",
    password: process.env.DB_PASSWORD || "admin123",
    port: process.env.DB_PORT || 5432,
});

module.exports = pool;

