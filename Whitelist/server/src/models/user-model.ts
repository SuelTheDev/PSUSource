/* eslint-disable no-unused-vars */
/* eslint-disable import/no-unresolved */
/* eslint-disable import/extensions */
// ------------------ESLINT CONFIG END-------------------- \\
import {
  DataTypes, Model, Sequelize, BuildOptions,
} from 'sequelize';
import { UserDataModel } from '../middleware/interfaces';

export interface UserModel extends Model<UserDataModel>{}
export type StaticUser = typeof Model & {
    new (values?: object, options?: BuildOptions): UserModel;
};

export function UserDataFactory(sequelize:Sequelize): StaticUser {
  return <StaticUser>sequelize.define('userData', {
    hwid: {
      type: DataTypes.STRING,
      defaultValue: null,
    },
    key: {
      type: DataTypes.STRING,
    },
    flags: {
      type: DataTypes.SMALLINT,
      defaultValue: 0,
    },
    discordId: {
      type: DataTypes.STRING,
    },
    timezone: {
      type: DataTypes.STRING,
    },
    forScript: {
      type: DataTypes.STRING,
    },
  });
}
