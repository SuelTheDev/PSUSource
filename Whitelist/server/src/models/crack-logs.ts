/* eslint-disable no-unused-vars */
/* eslint-disable import/no-unresolved */
/* eslint-disable import/extensions */
// ------------------ESLINT CONFIG END-------------------- \\
import {
  DataTypes, Model, Sequelize, BuildOptions,
} from 'sequelize';
import { CrackLog } from '../middleware/interfaces';

export interface CrackLogModel extends Model<CrackLog> {}
export type StaticCrackLog = typeof Model & {
    new (values?:object, options?:BuildOptions): CrackLogModel;
}
export function CrackLogFactory(sequelize:Sequelize): StaticCrackLog {
  return <StaticCrackLog>sequelize.define('crackLogData', {
    discordId: {
      type: DataTypes.STRING,
    },
    description: {
      type: DataTypes.STRING,
    },
    fromScript: {
      type: DataTypes.STRING,
    },
  });
}
