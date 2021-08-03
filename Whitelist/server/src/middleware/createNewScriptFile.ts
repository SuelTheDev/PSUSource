/* eslint-disable no-unused-vars */
/* eslint-disable import/no-unresolved */
/* eslint-disable import/extensions */
// ------------------ESLINT CONFIG END-------------------- \\
import { writeFile } from 'fs/promises';
import { Obfuscate } from './obfuscation';

// eslint-disable-next-line import/prefer-default-export
export function createNewFile(script:string, scriptHash:string) {
  const Obfuscated = Obfuscate(script, {
    MaxSecurityEnabled: true,
    ControlFlowObfuscation: true,
    EnhancedOutput: true,
  });
  Obfuscated.then((obfCode) => {
    writeFile(`./whitelist/scripts/${scriptHash}`, obfCode, 'utf-8');
  });
}
