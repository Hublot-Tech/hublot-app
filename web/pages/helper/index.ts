import {THEME} from "@/theme/constants";

const MEDIA = '(prefers-color-scheme: dark)'

export const getSystemTheme = (e?: MediaQueryList | MediaQueryListEvent) => {
  if (!e) e = window.matchMedia(MEDIA)
  const isDark = e.matches
  return isDark ? THEME.DARK : THEME.LIGHT
}
