const express = require("express");
const app = express();

app.get('/', (req,res) => {
  res.send("Bem vindo ao projeto Express + Node");
});

app.get('/blog/canal', (req,res) => {
  // url = http://localhost:3000/blog/canal/?teste=nodejs
  let parametro = req.query["teste"];
  res.send(`Bem vindo ao meu blog ${parametro}`);
})

app.get('/ola/:nome?', (req,res) => {
  let nome = req.params.nome;
  res.send(`<h1>Olá ${nome}</h1>`);
})


app.listen(3000, function(erro){
  if (erro) {
    console.log('Ocorreu um erro!');
  }else{
    console.log('Servidor iniciado com sucesso!');
  }
})
