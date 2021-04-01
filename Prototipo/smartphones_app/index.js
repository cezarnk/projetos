// index.js
const express = require('express');
const bodyParser = require('body-parser');

// Importa Routes
const smartphones = require('./routes/smartphones.route'); 
const app = express();

//Acesso à BD
const mongoose = require('mongoose');
let url = 'mongodb+srv://mongo:a17m10t55@cluster0.1hp6n.mongodb.net/smartphones?retryWrites=true&w=majority';
let mongoDB = process.env.MONGODB_URI || url;
mongoose.connect(mongoDB,{useNewUrlParser: true },{ useUnifiedTopology: true });
mongoose.Promise = global.Promise;
let db = mongoose.connection;
db.on('error', console.error.bind(console, 'Erro na Ligação ao MongoDB'));

//Body Parser
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));
app.use('/', smartphones);

//Servidor
let porto = 3000;
app.listen(porto, () => {
 console.log('Servidor em execução no porta: ' + porto);
});