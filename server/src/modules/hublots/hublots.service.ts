import { Injectable } from "@nestjs/common";
import { BaseService } from "./base.service";
import { Hublot } from "./schemas/hublot.schema";
import { InjectModel } from "@nestjs/mongoose";
import { Model } from "mongoose";

@Injectable()
export class HublotsService extends BaseService<Hublot> {
  constructor(
    @InjectModel(Hublot.name) protected readonly hublotModel: Model<Hublot>,
  ) {
    super(hublotModel);
  }
}
