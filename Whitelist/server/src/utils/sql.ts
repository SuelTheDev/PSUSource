import { Options, Sequelize } from 'sequelize';
import * as dotenv from 'dotenv';

dotenv.config();
class Opts implements Options {
    database:string = process.env.DATABASE;

    username:string = process.env.USERNAME;

    password:string = process.env.PASSWORD;

    host:string = process.env.HOST;

    dialect:Options['dialect'] = 'postgres';
}
const seq = new Sequelize(new Opts());

export default seq;
