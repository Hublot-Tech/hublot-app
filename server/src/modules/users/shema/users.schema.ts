import { Prop, Schema, SchemaFactory } from "@nestjs/mongoose";
import { Document } from "mongoose";
import { v4 as uuidv4 } from "uuid";
import { UserDto } from "../dto/users.dto";

@Schema()
export class User extends Document {
  @Prop({ required: true, default: uuidv4, unique: true })
  id: string;
  @Prop({ type: String, required: true })
  fullname: string;
  @Prop({ type: String, required: true, unique: true })
  email: string;
  @Prop({ required: true, unique: true })
  phoneNumber: string;
  @Prop({ type: Boolean, required: true, default: false })
  isVerified: boolean;
  @Prop({ type: Boolean, required: true, default: false })
  isOnline: boolean;
  @Prop({ type: String, required: true, default: "fr" })
  locale: string;
  @Prop({ type: String, required: true })
  address: string;
  @Prop({ type: String, required: true })
  password: any;
  @Prop({ type: Date, required: true, default: new Date() })
  createdAt: any;
  @Prop({ type: Date, required: false })
  updatedAt: any;
  @Prop({ type: Date, required: false })
  deletedAt: any;

  toJSON() {
    const user = this.toObject();
    user.id = user._id;
    delete user._id;
    delete user.__v;
    return user;
  }

  constructor(userDto: UserDto) {
    super();
    this.fullname = userDto.fullname;
    this.email = userDto.email;
    this.phoneNumber = userDto.phoneNumber;
    this.isVerified = userDto.isVerified;
    this.isOnline = userDto.isOnline;
    this.locale = userDto.locale;
    this.address = userDto.address;
    this.password = userDto.password;
    this.createdAt = userDto.createdAt;
    this.updatedAt = userDto.updatedAt;
    this.deletedAt = userDto.deletedAt;
  }
}

export const UserSchema = SchemaFactory.createForClass(User);
