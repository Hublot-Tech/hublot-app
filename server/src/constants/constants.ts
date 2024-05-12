export const jwtConstants = {
  // if there is no JWT_KEY in the .env file use the value of the server variable
  secret: process.env.JWT_KEY
    ? process
    : "qwertyuiop",
};
