/* eslint-disable max-len,no-param-reassign */
/* eslint-disable import/prefer-default-export */
/* eslint-disable no-unused-vars */
/* eslint-disable import/no-unresolved */
/* eslint-disable import/extensions */
// ------------------ESLINT CONFIG END-------------------- \\
import { UserDataFactory } from '../models/user-model';
import * as sql from '../utils/sql';

const Factory = UserDataFactory(sql.default);

export function findKey(key:string) {
  return Factory.findOne({ where: { key } }).then((found) => {
    if (found) return true;
    return false;
  });
}
