import { Prop, Schema, SchemaFactory } from "@nestjs/mongoose";
import { Document } from "mongoose";
import { v4 as uuidv4 } from "uuid";

@Schema({
  autoCreate: true,
  collection: "hublots",
})
export class Hublot extends Document {
  @Prop({
    type: String,
    unique: true,
    default: uuidv4,
    required: true,
  })
  id: string;

  @Prop({ type: String, required: true })
  name: string;

  @Prop({ type: String, required: true })
  location: string;

  @Prop({
    type: Boolean,
    default: false,
    required: true,
  })
  isVerified: boolean;

  @Prop({
    type: Date,
    default: new Date(),
    required: true,
  })
  createdAt: Date;

  @Prop({ type: String, required: true })
  createdBy: string;

  toJSON() {
    const user = this.toObject();
    user.id = user._id;
    delete user._id;
    delete user.__v;
    return user;
  }

  constructor(hublot: Hublot) {
    super();
    Object.assign(this, hublot);
  }
}

export const HublotSchema = SchemaFactory.createForClass(Hublot);
