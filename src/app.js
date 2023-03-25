import express from "express";
import mysql from "mysql2"
import myConnection from "express-myconnection";
//import dotenv from "dotenv";
import routes from "./routes/index.js"
import {
    PORT,
    DB_HOST,
    DB_NAME,
    DB_PASSWORD,
    DB_USER,
    DB_PORT
} from './config.js'

//dotenv.config();

const app = express();


//Settings
//const PORT = parseInt(process.env.PORT);

//Middlewares
app.use(myConnection(mysql, {
    host: DB_HOST,
    database: DB_NAME,
    user: DB_USER,
    password: DB_PASSWORD,
    port: DB_PORT
}))
app.use(express.urlencoded({extended: false}));
app.use(express.json());

//Routes
app.use(routes);

app.listen(PORT,()=> console.log('server on port ' + PORT));

