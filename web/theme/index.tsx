import {THEME, ThemeConfig} from "./constants";
import {createTheme, Theme, ThemeOptions} from "@mui/material";
import merge from 'lodash/merge';
import "font-proxima-nova/style.css";


export const baseOptions: ThemeOptions = {
  typography: {
    fontFamily: 'Proxima Nova Rg, BlinkMacSystemFont, "Segoe UI", Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji"',
  }
}

const __color_primary = '#FFC000'
const __color_neutral = '#FFFFFF'
const __color_text = '#0A1128'
const __color_secondary = '#f4f5f7'
const __color_info = '#f4f5f7'
const __color_warning = '#f4f5f7'
const __color_success = '#f4f5f7'
const __color_background = '#FEFEFE'


const __dark_color_primary = '#0A1128'
const __dark_color_neutral = '#646464'
const __dark_color_text = '#FFFFFF'
const __dark_color_secondary = '#f4f5f7'
const __dark_color_info = '#f4f5f7'
const __dark_color_warning = '#f4f5f7'
const __dark_color_success = '#f4f5f7'
const __dark_color_background = '#121212'


export const themesOptions: Record<string, ThemeOptions> = {
  [THEME.LIGHT]: {
    components: {
      MuiButton: {
        styleOverrides: {
          root: {
            backgroundColor: __color_primary,
            color: __color_text
          }
        }
      },
      MuiCard: {
        styleOverrides: {
          root: {
            backgroundColor: __color_neutral,
            color: __color_text
          }
        }
      }
    }
  },
  [THEME.DARK]: {
    components: {
      MuiButton: {
        styleOverrides: {
          root: {
            backgroundColor: __dark_color_primary,
            color: __dark_color_text
          },
        },
      },
      MuiCard: {
        styleOverrides: {
          root: {
            backgroundColor: __dark_color_neutral,
            color: __dark_color_text,
          }
        }
      }
    }
  }
}

export const createCustomTheme = (config: ThemeConfig = {}): Theme => {
  let themeOptions = themesOptions[config.theme || THEME.SYSTEM];

  if (!themeOptions) {
    console.warn(new Error(`The theme ${config.theme} is not valid`));
    themeOptions = themesOptions[THEME.LIGHT];
  }
  return createTheme(merge({}, baseOptions, themeOptions,));
};

