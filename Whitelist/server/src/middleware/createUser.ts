/* eslint-disable max-len */
/* eslint-disable import/no-unresolved */
/* eslint-disable import/extensions */

import { UserDataFactory } from '../models/user-model';
import * as sql from '../utils/sql';

const Factory = UserDataFactory(sql.default);
export default (key?:string, discordId?:string, hwid?:string|null, flags?:number|0, timezone?:string, forScript?:string) => {
  Factory.create({
    key,
    discordId,
    hwid,
    flags,
    timezone,
    forScript,
  });
};
