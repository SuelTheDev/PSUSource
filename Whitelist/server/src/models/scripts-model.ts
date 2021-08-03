/* eslint-disable no-unused-vars */
/* eslint-disable import/no-unresolved */
/* eslint-disable import/extensions */
// ------------------ESLINT CONFIG END-------------------- \\
import {
  DataTypes, Model, BuildOptions, Sequelize,
} from 'sequelize';
import * as sql from '../utils/sql';
import { ScriptModel } from '../middleware/interfaces';

export interface Scripts extends Model<ScriptModel> {}
export type ScriptStatic = typeof Model & {
    new (values?:object, options?:BuildOptions): Scripts
}
export function ScriptFactory(sequelize:Sequelize): ScriptStatic {
  return <ScriptStatic>sequelize.define('scriptData', {
    ScriptName: {
      type: DataTypes.STRING,
    },
    ScriptHash: {
      type: DataTypes.STRING,
    },
    ScriptPath: {
      type: DataTypes.STRING,
    },
  });
}
