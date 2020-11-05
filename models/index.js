const dbConfig = require("../configurazione/database.config.js");

const Sequelize = require("sequelize");
const sequelize = new Sequelize(dbConfig.DB, dbConfig.USER, dbConfig.PASSWORD, {
    host: dbConfig.HOST,
    dialect: dbConfig.dialect,
    operatorsAliases: 0,


const db = {};

db.Sequelize = Sequelize;
db.sequelize = sequelize;

db.utente = require("./utente.model")(sequelize, Sequelize);
db.camera = require("./camera.model")(sequelize,Sequelize);
db.struttura = require("./struttura.model")(sequelize,Sequelize);
db.prenotazione = require("./prenotazione.model")(sequelize,Sequelize);
db.pagamento = require("./pagamento.model")(sequelize,Sequelize);
db.immagini = require("./immagini.model")(sequelize,Sequelize);

module.exports = db;
