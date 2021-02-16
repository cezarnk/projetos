const Sequelize = require("sequelize");

const connection = new Sequelize('guiapress','root','a17m10t55',{
    host: 'localhost',
    dialect: 'mysql'
});

module.exports = connection;