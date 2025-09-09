import { WebPlugin } from '@capacitor/core';

import type { UnityPlugin } from './definitions';

export class UnityWeb extends WebPlugin implements UnityPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
