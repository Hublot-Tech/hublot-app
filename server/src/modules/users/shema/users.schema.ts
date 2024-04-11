import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { HydratedDocument } from 'mongoose';

export type UserDocument = HydratedDocument<User>;

@Schema()
export class User {
      fullname: string;
      email: string;
      phoneNumber: string;
      isVerified: boolean;
      isOnline: boolean;
      locale: string;
      address: string;
      password: string;
}

export const CatSchema = SchemaFactory.createForClass(User);