/* eslint-disable import/prefer-default-export */
/* eslint-disable no-unused-vars */

import { SHA256 } from 'crypto-js';

export function hash(str:string) {
  return SHA256(str);
}
