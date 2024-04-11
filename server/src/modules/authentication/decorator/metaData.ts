import { SetMetadata } from "@nestjs/common";

export const IS_PUBLIC_KEY = "my_public_key";
export const SkipAuth = () => SetMetadata(IS_PUBLIC_KEY, true);
