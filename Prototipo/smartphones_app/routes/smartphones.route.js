const express = require('express');
const router = express.Router();

// Colocar controller que ainda não foi criado
const smartphone_controller = require('../controllers/smartphones.controller');

// teste simples
router.get('/testar', smartphone_controller.test);

router.post('/create', smartphone_controller.create);

router.get('/:id', smartphone_controller.details);

module.exports = router;