var http = require("http");

http.createServer(function(requisicao,resposta){
	resposta.end("Bem vindo ao meu site!");
}).listen(3000);
console.log("Servidor rodando...");