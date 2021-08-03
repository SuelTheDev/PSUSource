/* eslint-disable no-unused-vars */
/* eslint-disable import/no-unresolved */
/* eslint-disable import/extensions */
// ------------------ESLINT CONFIG END-------------------- \\
import { UserDataFactory } from '../models/user-model';
import * as sql from '../utils/sql';

const Factory = UserDataFactory(sql.default);
export default (key:string) => {
  Factory.destroy({
    where: {
      key,
    },
  });
};
