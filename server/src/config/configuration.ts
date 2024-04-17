export default () => ({
  port: parseInt(process.env.PORT, 10) || 3000,
  database: {
    host: process.env.DATABASE_HOST,
    port: parseInt(process.env.DATABASE_PORT, 10) || 5432,
  },
  bcript_round: process.env.SALT_ROUND,
  public_key: process.env.PUBLIC_KEY,
});
