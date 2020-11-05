module.exports = {
    HOST: "eu-cdbr-west-03.cleardb.net",
    USER: "b4043876d65978",
    PASSWORD: "9ef48349",
    DB: "heroku_edc6ea90c028774",
    dialect: "mysql",
    pool: {
        max: 5,
        min: 0,
        acquire: 30000,
        idle: 10000,
    },
};
