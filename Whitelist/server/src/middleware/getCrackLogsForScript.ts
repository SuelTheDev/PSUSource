/* eslint-disable no-unused-vars,import/prefer-default-export */
/* eslint-disable import/no-unresolved */
/* eslint-disable import/extensions */
// ------------------ESLINT CONFIG END-------------------- \\
import { CrackLogFactory, StaticCrackLog } from '../models/crack-logs';
import * as sql from '../utils/sql';

const Factory:StaticCrackLog = CrackLogFactory(sql.default);

export async function getCrackLogs(scriptHash:string) {
  await Factory.findAll({
    where: {
      fromScript: scriptHash,
    },
  }).then((f) => {
    f.every((logs) => logs.toJSON());
  });
}
