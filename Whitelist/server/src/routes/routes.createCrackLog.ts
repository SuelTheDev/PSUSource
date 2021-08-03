/* eslint-disable no-unused-vars */
/* eslint-disable import/no-unresolved */
/* eslint-disable import/extensions */
import * as express from 'express';
import * as createCrackLog from '../middleware/createCrackLog';

const app:express.Router = express.Router();
app.use(express.json());

app.post('/createlog', (req, res) => {
  if (req.body && req.body.Key && req.body.Code && req.body.Script) {
    try {
      createCrackLog.default(null, req.body.Code, req.body.Script);
    } catch (e) {
      res.status(500).json({
        error: true,
        code: 500,
        data: `an unexpected error occurred, ${e.error}`,
      });
    }
  } else {
    res.status(406).json({
      error: true,
      code: 406,
      data: 'invalid post request format',
    });
  }
});
module.exports = app;
