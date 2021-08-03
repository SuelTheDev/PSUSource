/* eslint-disable no-unused-vars */
/* eslint-disable import/no-unresolved */
/* eslint-disable import/extensions */
import * as express from 'express';
import { randomBytes } from 'crypto';
import { encode } from 'js-base64';
import { getFlags } from '../middleware/getFlagsFromKey';
import * as removeUser from '../middleware/removeUser';

const app:express.Router = express.Router();
app.use(express.json());
app.post('/flag', (req, res) => {
  if (req.body && req.body.Key) {
    const flags = getFlags(req.body.Key);
    if (flags < 3) {
      res.status(200).end(encode(JSON.stringify({
        error: false,
        code: 200,
        data: `passed_${randomBytes(16).toString('hex')}`,
      })));
    } else {
      try {
        removeUser.default(req.body.Key);
      } catch (e) {
        if (e) {
          res.status(500).json({
            error: true,
            code: 500,
            data: `an unexpected error occurred, ${e.error}`,
          });
        }
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
