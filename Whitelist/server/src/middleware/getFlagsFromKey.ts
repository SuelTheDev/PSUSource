/* eslint-disable import/prefer-default-export,no-return-assign */
/* eslint-disable no-unused-vars */
/* eslint-disable import/no-unresolved */
/* eslint-disable import/extensions */
// ------------------ESLINT CONFIG END-------------------- \\
import { StaticUser, UserDataFactory } from '../models/user-model';
import * as sql from '../utils/sql';

const Factory:StaticUser = UserDataFactory(sql.default);
export function getFlags(key:string) {
  let flags = 0;
  Factory.findOne({
    where: {
      key,
    },
  }).then((f) => flags = f.get().flags);
  return flags;
}
