/* eslint-disable no-unused-vars */
/* eslint-disable import/no-unresolved */
/* eslint-disable import/extensions */
import * as express from 'express';
import { randomBytes } from 'crypto';
import * as createNewScript from '../middleware/createNewScript';
import { createNewFile } from '../middleware/createNewScriptFile';

const newScript = createNewScript.default;
const app = express.Router();
app.use(express.json());

app.post('/createscript', (req, res) => {
  if (req.body && req.body.Script) {
    try {
      const scriptHash = randomBytes(32).toString('hex');
      newScript(req.body.ScriptName, scriptHash, `./whitelist/scripts/${scriptHash}.lua`);
      createNewFile(req.body.Script, scriptHash);
      res.status(200).json({
        error: false,
        code: 200,
        data: scriptHash,
      });
    } catch (e) {
      res.status(500).json({
        error: true,
        code: 500,
        data: `an unknown error has occured, ${e.error}`,
      });
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
