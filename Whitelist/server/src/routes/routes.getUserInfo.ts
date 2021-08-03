/* eslint-disable no-unused-vars */
/* eslint-disable import/no-unresolved */
/* eslint-disable import/extensions */
import * as express from 'express';
import { getUserData } from '../middleware/findUserData';

const app:express.Router = express.Router();
app.use(express.json());

app.post('/info', (req, res) => {
  if (req.body && (req.body.DiscordId ?? req.body.Key)) {
    try {
      const found = getUserData(req.body.Key, req.body.DiscordId);
      if (found) {
        found.then((r) => {
          res.send(JSON.stringify(r.toJSON()));
        });
      } else {
        res.status(500).json({
          error: true,
          code: 500,
          data: 'cannot find user data',
        });
      }
    } catch (e) {
      if (e) {
        res.status(500).json({
          error: true,
          code: 500,
          data: `unexpected error occurred, ${e.error}`,
        });
      }
    }
  }
});
module.exports = app;
