import type { AppProps } from 'next/app';
import { ThemeContextProvider } from '@/pages/helper/ThemeContextProvider';
import { ApplicationConfigs } from '@/pages/hooks/useApplicationConfigs';

function App({ Component, pageProps }: AppProps) {
  return (
    <ApplicationConfigs>
      <ThemeContextProvider>
        <Component {...pageProps} />
      </ThemeContextProvider>
    </ApplicationConfigs>
  );
}

export default App;
