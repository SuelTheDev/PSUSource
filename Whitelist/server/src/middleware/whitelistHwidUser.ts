/* eslint-disable no-unused-vars */
/* eslint-disable import/no-unresolved */
/* eslint-disable import/extensions */
// ------------------ESLINT CONFIG END-------------------- \\
import { UserDataFactory } from '../models/user-model';
import * as sql from '../utils/sql';

const seq = UserDataFactory(sql.default);
export default (key:string, hwid:string) => {
  seq.update({ hwid }, { where: { key } });
};
