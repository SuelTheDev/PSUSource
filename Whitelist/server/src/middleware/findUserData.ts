/* eslint-disable max-len,no-param-reassign */
/* eslint-disable import/prefer-default-export */
/* eslint-disable no-unused-vars */
/* eslint-disable import/no-unresolved */
/* eslint-disable import/extensions */
// ------------------ESLINT CONFIG END-------------------- \\
import { UserDataFactory } from '../models/user-model';

import * as sql from '../utils/sql';

const UserFactory = UserDataFactory(sql.default);

export function getUserData(key?:string, discordId?:string) {
  if (key !== null) {
    return UserFactory.findOne({ where: { key } });
  }
  return UserFactory.findOne({ where: { discordId } });
}
