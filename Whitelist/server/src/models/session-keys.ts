/* eslint-disable no-unused-vars */
/* eslint-disable import/no-unresolved */
/* eslint-disable import/extensions */
// ------------------ESLINT CONFIG END-------------------- \\
import {
  DataTypes, Model, Sequelize, BuildOptions,
} from 'sequelize';
import { SessionKeys } from '../middleware/interfaces';

export interface SessionModel extends Model<SessionKeys> {}
export type StaticSessions = typeof Model & {
    new (values?:object, options?:BuildOptions): SessionModel;
}

export function SessionFactory(sequelize:Sequelize): StaticSessions {
  return <StaticSessions>sequelize.define('sessionKeys', {
    sessionKey: {
      type: DataTypes.STRING,
    },
    forKey: {
      type: DataTypes.STRING,
    },
  });
}
