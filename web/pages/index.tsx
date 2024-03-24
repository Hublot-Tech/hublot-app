import {
  Button,
  Card,
  CardActions,
  CardContent,
  Typography,
} from '@mui/material';
import { useApplicationConfigs } from '@/pages/hooks/useApplicationConfigs';
import { THEME } from '@/theme/constants';
import classes from './index.module.css';

export default function Home() {
  const { changeTheme } = useApplicationConfigs();

  return (
    <article className={classes.home}>
      <Typography variant="h5" className={classes.title}>
        Simple Page with Material-UI and Next.js and Proxima Nova Font
      </Typography>
      <div className={classes.buttons}>
        <Button
          className={classes.button}
          onClick={() => changeTheme(THEME.DARK)}
        >
          Dark
        </Button>
        <Button
          className={classes.button}
          onClick={() => changeTheme(THEME.LIGHT)}
        >
          Light
        </Button>
        <Button
          className={classes.button}
          onClick={() => changeTheme(THEME.SYSTEM)}
        >
          System
        </Button>
      </div>

      <Typography variant="h6">Examples</Typography>
      <div className={classes.cards}>
        <Card>
          <CardContent>
            <Typography gutterBottom variant="h5">
              Lizard
            </Typography>
            <Typography variant="body2">
              Lorem Ipsum is simply dummy text of the printing and typesetting
              industry. Lorem Ipsum has been the industry's standard dummy text
              ever since the 1500s, when an unknown printer took a galley of
              type and scrambled it to make a type specimen book.
            </Typography>
          </CardContent>
        </Card>
      </div>
    </article>
  );
}
