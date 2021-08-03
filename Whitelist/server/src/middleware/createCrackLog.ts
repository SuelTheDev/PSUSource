/* eslint-disable import/no-unresolved */
/* eslint-disable import/extensions */

import { CrackLogFactory } from '../models/crack-logs';
import * as sql from '../utils/sql';

const Factory = CrackLogFactory(sql.default);
export default (discordId:string, description:string, fromScript:string) => {
  Factory.create({
    discordId,
    description,
    fromScript,
  });
};
