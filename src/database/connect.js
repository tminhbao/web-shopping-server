const mysql = require('mysql');
const conn = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'admin',
  database: 'laptop_webshop',
  charset: 'utf8_general_ci',
  port: '3306'
});

conn.connect(function (err) {
  if (err)
    throw err;
})