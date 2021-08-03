/* eslint-disable import/no-dynamic-require */
/* eslint-disable consistent-return,no-console */
/* eslint-disable import/prefer-default-export */
/* eslint-disable no-unused-vars */
/* eslint-disable import/no-unresolved */
/* eslint-disable import/extensions */
// ------------------ESLINT CONFIG END-------------------- \\
import * as express from 'express';
import * as expressSession from 'express-session';
import { randomBytes } from 'crypto';

const path = require('./src/routes/routes');

const app = express();
app.use(expressSession({
  secret: randomBytes(36).toString('hex'),
  cookie: {
    secure: true,
    maxAge: 60000,
  },
  resave: true,
  saveUninitialized: false,
}));

app.use('/', path);
app.listen(80, () => {
  console.log('listening on port 80');
});
