/* eslint-disable no-unused-vars */
/* eslint-disable import/no-unresolved */
/* eslint-disable import/extensions */
import * as express from 'express';
import * as deleteUser from '../middleware/removeUser';

const removeUser = deleteUser.default;
const app:express.Router = express.Router();
app.use(express.json());

app.post('/blacklist', (req, res) => {
  if (req.body && req.body.Key) {
    try {
      removeUser(req.body.Key);
      res.status(200).json({
        error: false,
        code: 200,
        data: 'successfully blacklisted user',
      });
    } catch (e) {
      res.status(500).json({
        error: true,
        code: 500,
        data: `an unexpected error occured, ${e.error}`,
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
