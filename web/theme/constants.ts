export enum THEME {
  LIGHT = 'light',
  DARK = 'dark',
  SYSTEM = 'system',
}

export type Theme = THEME.DARK | THEME.LIGHT | THEME.SYSTEM


export type CustomOptions =Omit<Theme, THEME.SYSTEM>;

export interface ThemeConfig {
  theme?: string;
}



