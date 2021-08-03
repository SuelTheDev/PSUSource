/* eslint-disable max-len,no-param-reassign */
/* eslint-disable import/prefer-default-export */
/* eslint-disable no-unused-vars */
/* eslint-disable import/no-unresolved */
/* eslint-disable import/extensions */
// ------------------ESLINT CONFIG END-------------------- \\
import { AES, enc } from 'crypto-js';
import { UserDataFactory } from '../models/user-model';

import * as sql from '../utils/sql';

const UserFactory = UserDataFactory(sql.default);

export function checkUser(key:string, hwid:string, privateKey:string, publicKey:string, timezone:string, forScript:string) {
  const decryptHWIDPub = AES.decrypt(hwid, publicKey).toString(enc.Utf8);
  const decryptHWIDPrivate = AES.decrypt(decryptHWIDPub, privateKey).toString(enc.Utf8);
  const decryptTimezonePub = AES.decrypt(timezone, publicKey).toString(enc.Utf8);
  const decryptTimezonePrivate = AES.decrypt(decryptTimezonePub, privateKey).toString(enc.Utf8);
  hwid = decryptHWIDPrivate;
  timezone = decryptTimezonePrivate;
  const found = UserFactory.findOne({
    where: {
      key,
      hwid,
      timezone,
      forScript,
    },
  });
  return !!found;
}
