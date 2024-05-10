import { Prop, Schema, SchemaFactory } from "@nestjs/mongoose";
import { Document, Types } from "mongoose";
import { v4 as uuidv4 } from "uuid";
import { ServiceDto } from "../dto/service.dto";

@Schema()
export class Service extends Document {
  
  @Prop({ required: true, default: uuidv4, unique: true })
  id: string;

  @Prop({ type: String, required: true })
  name: string;

  @Prop({ type: String, required: true })
  description: string;

  @Prop({ type: Number, required: true })
  price: number;

  @Prop({ type: String, required: true })
  updatedAt: Date;

  @Prop({ type: String, required: true })
  createdAt: Date;


  toJSON(){
    const service = this.toObject();
    service.id = service._id;
    delete service._id;
    delete service.__v;
    return service;
  }

  constructor(createService: ServiceDto) {
    super();
    Object.assign(this, createService);
  }
}

export const ServiceSchema = SchemaFactory.createForClass(Service)