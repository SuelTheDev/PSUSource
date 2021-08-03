/* eslint-disable consistent-return */
/* eslint-disable import/prefer-default-export */
/* eslint-disable no-unused-vars */
/* eslint-disable import/no-unresolved */
/* eslint-disable import/extensions */
// ------------------ESLINT CONFIG END-------------------- \\
import * as nodeFetch from 'node-fetch';

const fetch = nodeFetch.default;

export async function Obfuscate(script:string, options:object) {
  let str:string = '';
  fetch('https://api.psu.dev/obfuscate', {
    method: 'POST',
    body: JSON.stringify(options),
    headers: {
      'Content-Type': 'application/json',
    },
  }).then((res) => {
    res.text().then((strObf) => {
      str = strObf;
    });
  });
  return str;
}
