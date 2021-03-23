const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const mysql = require('mysql');
 
// parseador para converter em application/json
app.use(bodyParser.json());
 
// Dados de conexão com banco de dados
const conn = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'a17m10t55',
  database: 'guiaperguntas'
});
 
//conecta com o banco de dados
conn.connect((err) =>{
  if(err) throw err;
  console.log('Mysql Conectado...');
});
 
//Exibindo todos os dados
// app.get(comando de consulta) e aqui é onde vc cria como parametro a URL de acesso
// no caso esta como /api/produtos (cria o seu de acordo com sua aplicação)
app.get('/api/produtos',(req, res) => {
  let sql = "SELECT * FROM perguntas";
  let query = conn.query(sql, (err, results) => {
    if(err) throw err;
    res.send(JSON.stringify({"status": 200, "error": null, "response": results}));
  });
});
 
 
//Servidor executando na porta 3000
app.listen(3000,() =>{
  console.log('Servidor executando na porta 3000...');
});
