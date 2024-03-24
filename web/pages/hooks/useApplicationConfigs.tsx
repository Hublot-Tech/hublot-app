import React, {
  createContext,
  useCallback,
  useContext,
  useEffect,
  useState,
} from 'react';
import { useLocalStorage } from '@/pages/hooks/useLocalStorage';
import { THEME, Theme } from '@/theme/constants';

interface ApplicationConfigsProps {
  children: JSX.Element;
}

interface ApplicationConfigsContextInterface {
  changeTheme: (theme: Theme) => void;
  theme: Theme;
  systemChanged: boolean;
}

export const defaultApplicationConfigsContext: ApplicationConfigsContextInterface =
  {
    theme: THEME.LIGHT,
    changeTheme: (theme: Theme) => {},
    systemChanged: false,
  };

const MEDIA = '(prefers-color-scheme: dark)';

export const ApplicationConfigsContext = createContext(
  defaultApplicationConfigsContext,
);

const useApplicationConfigs = () => useContext(ApplicationConfigsContext);

const ApplicationConfigs = ({ children }: ApplicationConfigsProps) => {
  const defaultConfig = {
    theme: THEME.SYSTEM,
  };

  const [config, setConfig] = useLocalStorage('config', defaultConfig);
  const [systemChanged, setSystemChanged] = useState(false);

  const changeTheme = useCallback(
    (theme: Theme) => {
      setConfig({ ...config, theme });
    },
    [config.theme],
  );

  const handleMediaQuery = useCallback(() => {
    if (config.theme === THEME.SYSTEM) {
      setSystemChanged((prevState) => !prevState);
    }
  }, [config.theme]);

  // Always listen to System preference
  useEffect(() => {
    const media = window.matchMedia(MEDIA);

    // Intentionally use deprecated listener methods to support iOS & old browsers
    media.addListener(handleMediaQuery);

    return () => media.removeListener(handleMediaQuery);
  }, [handleMediaQuery]);

  return (
    <ApplicationConfigsContext.Provider
      value={{
        theme: config.theme,
        changeTheme,
        systemChanged,
      }}
    >
      {children}
    </ApplicationConfigsContext.Provider>
  );
};

export { ApplicationConfigs, useApplicationConfigs };
