import { Prop, Schema, SchemaFactory } from "@nestjs/mongoose";
import { Document, Types } from "mongoose";
import { v4 as uuidv4 } from "uuid";
import { Locale, Role,  UserDto } from "../dto/users.dto";
import { Service } from "src/modules/service/schema/service.schema";

@Schema()
export class User extends Document {
  @Prop({ required: true, default: uuidv4, unique: true })
  id: string;

  @Prop({ type: String, required: true })
  fullname: string;

  @Prop({
    type: String,
    required: true,
    unique: true,
  })
  email: string;

  @Prop({
    required: true,
    unique: true,
  })
  phoneNumber: string;

  @Prop({
    type: Boolean,
    required: true,
    default: false,
  })
  isVerified: boolean;

  @Prop({
    type: Boolean,
    required: true,
    default: false,
  })
  isOnline: boolean;

  @Prop({
    type: String,
    enum: Locale,
    required: true,
    default: Locale.FR,
  })
  locale: Locale;

  @Prop({
    type: String,
    required: true,
    default: Role.CLIENT,
  })
  role: string;

  @Prop({
    type: String,
    required: true,
  })
  address: string;

  @Prop({
    type: String,
    required: true,
  })
  password: string;

  //reference to the provider
  @Prop({  type: [{ type: Types.ObjectId, ref: 'Owner' }] })
  services: Service[]  

  @Prop({
    type: Date,
    required: true,
    default: new Date(),
  })
  createdAt: Date;

  @Prop({
    type: Date,
    required: false,
  })
  updatedAt: Date;

  @Prop({
    type: Date,
    required: false,
  })
  deletedAt: Date;


  toJSON() {
    const user = this.toObject();
    user.id = user._id;
    delete user._id;
    delete user.__v;
    return user;
  }

  constructor(userDto: UserDto) {
    super();
    Object.assign(this, userDto);
  }
}

export const UserSchema = SchemaFactory.createForClass(User);
