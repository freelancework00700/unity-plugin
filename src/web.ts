import { WebPlugin } from '@capacitor/core';

import type { UnityPlugin } from './definitions';

export class UnityWeb extends WebPlugin implements UnityPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }

  async launch(): Promise<void> {
    console.log('Unity launch called on web platform');
    // Unity is not available on web platform
    throw new Error('Unity is not available on web platform');
  }
}
