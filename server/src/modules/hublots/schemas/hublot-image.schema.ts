import { Prop, Schema, SchemaFactory } from "@nestjs/mongoose";
import { Document } from "mongoose";
import { v4 as uuidv4 } from "uuid";

@Schema({
  autoCreate: true,
  collection: "hublot_images",
})
export class HublotImage extends Document {
  @Prop({
    type: String,
    required: true,
    default: uuidv4,
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
  })
  caption: string;

  @Prop({
    type: String,
    required: true,
  })
  imageRef: string;

  @Prop({
    type: Boolean,
    required: true,
  })
  isProfile: boolean;

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

  constructor(hublotImage: HublotImage) {
    super();
    Object.assign(this, hublotImage);
  }
}

export const HublotImageSchema = SchemaFactory.createForClass(HublotImage);
