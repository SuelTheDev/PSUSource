/* eslint-disable no-unused-vars */
/* eslint-disable import/no-unresolved */
/* eslint-disable import/extensions */

import * as express from 'express';
import { encode } from 'js-base64';
import { randomBytes } from 'crypto';
import { checkUser } from '../middleware/checkUser';
import { findSessionKey } from '../middleware/findSessionKey';

const app = express.Router();
app.use(express.json());

app.post('/check', async (req, res) => {
  if (req.body && req.body.Key && req.body.Script && req.body.Hwid && req.body.Timezone) {
    const foundSession = findSessionKey(req.body.Key);

    if (foundSession !== null) {
      res.status(200).json({
        error: true,
        data: 'cannot find session key!',
      });
    } else {
      const foundSessionJSON = (await foundSession).get();
      const found = await checkUser(req.body.key, req.body.hwid, 'privateKey', foundSessionJSON.sessionKey, req.body.Timezone, req.body.Script);
      if (found) {
        res.end(encode(JSON.stringify({
          error: false,
          data: `success_${randomBytes(16).toString('hex')}`,
        })));
      } else {
        res.status(200).json({
          error: true,
          data: 'cannot find user!',
        });
      }
    }
  } else {
    res.status(406).json({
      error: true,
      code: 406,
      data: 'invalid post request',
    });
  }
});

module.exports = app;
