import { Theme as ThemeMaterialUI, ThemeProvider } from '@mui/material';
import { createContext, useCallback, useEffect, useState } from 'react';
import { createCustomTheme } from '@/theme';
import { THEME, Theme } from '@/theme/constants';
import { useApplicationConfigs } from '@/pages/hooks/useApplicationConfigs';
import { getSystemTheme } from '@/pages/helper/index';

interface ApplicationConfigsContextInterface {
  theme: Theme;
}

export const defaultThemeContext: ApplicationConfigsContextInterface = {
  theme: THEME.LIGHT,
};

export const ThemeContext = createContext(defaultThemeContext);

/**
 * I needed to create this ThemeContextProvider because <ThemeProvider needs a value that is on my context. For that reason
 * I needed to separate from _app.tsx. Since I'm using his provider there I could not use the consumer in the same component.
 *
 * This logic was found out here:
 * https://stackoverflow.com/questions/71516195/using-usecontext-to-set-dark-mode-for-all-pages-in-next-js-and-material-ui
 *
 */

export const ThemeContextProvider = (props: { children: JSX.Element }) => {
  const { theme, systemChanged } = useApplicationConfigs();

  const darkTheme = createCustomTheme({
    theme: THEME.DARK,
  });

  const lightTheme = createCustomTheme({
    theme: THEME.LIGHT,
  });

  const [themeResolved, setThemeResolved] =
    useState<ThemeMaterialUI>(lightTheme);

  useEffect(() => {
    if (theme === THEME.SYSTEM) {
      const themeResolved = getSystemTheme();
      if (themeResolved === THEME.DARK) {
        setThemeResolved(darkTheme);
      } else {
        setThemeResolved(lightTheme);
      }
      document.documentElement.style.colorScheme = themeResolved;
    } else {
      theme === THEME.DARK
        ? setThemeResolved(darkTheme)
        : setThemeResolved(lightTheme);
      document.documentElement.style.colorScheme = theme;
    }
  }, [theme, systemChanged]);

  return (
    <ThemeContext.Provider value={{ theme }}>
      <ThemeProvider theme={themeResolved}>{props.children}</ThemeProvider>
    </ThemeContext.Provider>
  );
};
