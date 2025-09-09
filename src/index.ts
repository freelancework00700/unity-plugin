import { registerPlugin } from '@capacitor/core';

import type { UnityPlugin } from './definitions';

const Unity = registerPlugin<UnityPlugin>('Unity', {
  web: () => import('./web').then((m) => new m.UnityWeb()),
});

export * from './definitions';
export { Unity };
