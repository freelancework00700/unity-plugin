export interface UnityPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
