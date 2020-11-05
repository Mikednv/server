const dbConfig = require("../configurazione/database.config.js");

const Sequelize = require("sequelize");
const sequelize = new Sequelize(dbConfig.DB, dbConfig.USER, dbConfig.PASSWORD, {
    host: dbConfig.HOST,
    dialect: dbConfig.dialect,
    operatorsAliases: 0,


const dbs = {};

dbs.Sequelize = Sequelize;
dbs.sequelize = sequelize;

dbs.utente = require("./utente.model")(sequelize, Sequelize);
dbs.camera = require("./camera.model")(sequelize,Sequelize);
dbs.struttura = require("./struttura.model")(sequelize,Sequelize);
dbs.prenotazione = require("./prenotazione.model")(sequelize,Sequelize);
dbs.pagamento = require("./pagamento.model")(sequelize,Sequelize);
dbs.immagini = require("./immagini.model")(sequelize,Sequelize);

module.exports = dbs;
