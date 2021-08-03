/* eslint-disable no-unused-vars */
/* eslint-disable import/no-unresolved */
/* eslint-disable import/extensions */
// ------------------ESLINT CONFIG END-------------------- \\
import { SessionFactory } from '../models/session-keys';
import * as sql from '../utils/sql';

const Factory = SessionFactory(sql.default);
export default (sessionKey:string, forKey:string) => {
  Factory.create({
    sessionKey,
    forKey,
  });
};
