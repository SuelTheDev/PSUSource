/* eslint-disable no-unused-vars */
/* eslint-disable import/no-unresolved */
/* eslint-disable import/extensions */
import { Router } from 'express';

const R = Router();
R.use('/blacklist', require('./routes.blacklist'));
R.use('/check', require('./routes.checkUser'));
R.use('/cracklog', require('./routes.createCrackLog'));
R.use('/info', require('./routes.getUserInfo'));
R.use('/whitelist', require('./routes.whitelist'));
R.use('/createscript', require('./routes.createScript'))
R.use('/flags', require('./routes.flagSystem'));;

module.exports = R;
