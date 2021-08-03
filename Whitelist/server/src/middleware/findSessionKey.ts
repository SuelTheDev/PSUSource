/* eslint-disable consistent-return */
/* eslint-disable import/prefer-default-export */
/* eslint-disable no-unused-vars */
/* eslint-disable import/no-unresolved */
/* eslint-disable import/extensions */
// ------------------ESLINT CONFIG END-------------------- \\
import { SessionFactory } from '../models/session-keys';
import * as sql from '../utils/sql';

const Factory = SessionFactory(sql.default);

export function findSessionKey(key:string) {
  const Found = Factory.findOne({
    where: {
      forKey: key,
    },
  });
  if (Found !== null) {
    return Found;
  }
}
