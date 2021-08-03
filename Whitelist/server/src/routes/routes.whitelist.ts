/* eslint-disable no-unused-vars */
/* eslint-disable import/no-unresolved */
/* eslint-disable import/extensions */
// ------------------ESLINT CONFIG END-------------------- \\

import * as express from 'express';
import { randomBytes } from 'crypto';
import { encode } from 'js-base64';
import * as whitelistHwidUser from '../middleware/whitelistHwidUser';
import * as whitelistTimezoneUser from '../middleware/whitelistTimezoneUser';
import { findKey } from '../middleware/checkKey';

const whitelistHwid = whitelistHwidUser.default;
const whitelistTimezone = whitelistTimezoneUser.default;

const app:express.Router = express.Router();
app.use(express.json());

app.post('/whitelist', async (req, res) => {
  if (req.body && req.body.Key && req.body.Hwid && req.body.Timezone && req.body.Script) {
    if (await findKey(req.body.Key)) {
      try {
        whitelistHwid(req.body.Key, req.body.Hwid);
        whitelistTimezone(req.body.Key, req.body.Timezone);
        res.end(encode(JSON.stringify({
          error: false,
          data: `success_${randomBytes(16).toString('hex')}`,
        })));
      } catch (e) {
        if (e) {
          res.status(500).json({
            error: true,
            code: 500,
            data: 'an unexpected error occured',
          });
        }
      }
    } else {
      res.status(200).json({
        error: true,
        data: 'cannot find key',
      });
    }
  } else {
    res.status(406).json({
      error: true,
      code: 406,
      data: 'invalid post request!',
    });
  }
});
module.exports = app;
