/* eslint-disable no-unused-vars */
/* eslint-disable import/no-unresolved */
/* eslint-disable import/extensions */
// ------------------ESLINT CONFIG END-------------------- \\
import { ScriptFactory } from '../models/scripts-model';
import * as sql from '../utils/sql';

const Factory = ScriptFactory(sql.default);

export default (ScriptName:string, ScriptHash:string, ScriptPath:string) => {
  Factory.create({
    ScriptName,
    ScriptHash,
    ScriptPath,
  });
};
