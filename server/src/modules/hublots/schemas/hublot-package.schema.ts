import { Prop, Schema, SchemaFactory } from "@nestjs/mongoose";
import { v4 as uuidv4 } from "uuid";
import { Document } from "mongoose";

@Schema({
  autoCreate: true,
  collection: "hublot_packages",
})
export class HublotPackage extends Document {
  @Prop({
    type: String,
    required: true,
    default: uuidv4,
    unique: true,
  })
  id: string;

  @Prop({
    type: String,
    required: true,
    index: true,
  })
  hublotId: string;

  @Prop({
    type: Number,
    required: true,
  })
  price: number;

  @Prop({
    type: String,
    required: true,
  })
  name: string;

  @Prop({
    type: Date,
    required: true,
  })
  createdAt: Date;

  @Prop({
    type: String,
    required: true,
    index: true,
  })
  createdBy: string;

  toJSON() {
    const user = this.toObject();
    user.id = user._id;
    delete user._id;
    delete user.__v;
    return user;
  }

  constructor(hublotPackage: HublotPackage) {
    super();
    Object.assign(this, hublotPackage);
  }
}

export const HublotPackageSchema = SchemaFactory.createForClass(HublotPackage);
