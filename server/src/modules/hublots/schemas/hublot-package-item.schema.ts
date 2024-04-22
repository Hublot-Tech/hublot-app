import { Prop, Schema, SchemaFactory } from "@nestjs/mongoose";
import { v4 as uuidv4 } from "uuid";
import { Document } from "mongoose";

@Schema({
  autoCreate: true,
  collection: "hublot_package_items",
})
export class HublotPackageItem extends Document {
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
    type: String,
    required: true,
    index: true,
  })
  hublotPackageId: string;

  @Prop({
    type: String,
    required: true,
  })
  value: string;

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

  constructor(hublotPackageItem: HublotPackageItem) {
    super();
    Object.assign(this, hublotPackageItem);
  }
}

export const HublotPackageItemSchema =
  SchemaFactory.createForClass(HublotPackageItem);
