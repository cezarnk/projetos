var Smartphone = require('../models/smartphones.model');

exports.test = function (req, res) {
    res.send('Olá! Teste ao Controller');
};

//Adicionar smartphone à BD
exports.create = function (req, res) {
let smartphone = new Smartphone(
 {
   nome: req.body.nome,
   marca: req.body.marca
 }
 );
 console.log(smartphone);
 smartphone.save(function (err) {
if (err) {
return next(err);
 }
  res.send('Registo de Smartphone criado com sucesso')
 })
};

//Consultar smartphone ao BD
exports.details = function (req, res) {
    Smartphone.findById(req.params.id, function (err, product) {
if (err) return next(err);
        res.send(smartphone);
    })
};