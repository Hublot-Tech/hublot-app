import { SetMetadata } from "@nestjs/common";

export const publicKey = "my_public_key";
export const Public = () => SetMetadata(publicKey, true);
