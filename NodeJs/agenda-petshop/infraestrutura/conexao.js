const mysql = require('mysql')

const conexao = mysql.createConnection({
  host: 'localhost',
  port: 3306,
  user: 'root',
  password: 'a17m10t55',
  database: 'agenda-petshop'
})

module.exports = conexao
