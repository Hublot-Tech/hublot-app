import { SetMetadata } from "@nestjs/common";

export const PUBLIC_KEY = "my_public_key";
export const Public = () => SetMetadata(PUBLIC_KEY, true);
