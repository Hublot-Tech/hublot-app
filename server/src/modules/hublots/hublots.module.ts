import { Module } from "@nestjs/common";
import { MongooseModule } from "@nestjs/mongoose";
import { HublotsController } from "./hublots.controller";
import { HublotsService } from "./hublots.service";
import { HublotImage, HublotImageSchema } from "./schemas/hublot-image.schema";
import {
  HublotPackageItem,
  HublotPackageItemSchema,
} from "./schemas/hublot-package-item.schema";
import {
  HublotPackage,
  HublotPackageSchema,
} from "./schemas/hublot-package.schema";
import { Hublot, HublotSchema } from "./schemas/hublot.schema";

@Module({
  imports: [
    MongooseModule.forFeature([
      { name: Hublot.name, schema: HublotSchema },
      { name: HublotImage.name, schema: HublotImageSchema },
      { name: HublotPackage.name, schema: HublotPackageSchema },
      { name: HublotPackageItem.name, schema: HublotPackageItemSchema },
    ]),
  ],
  providers: [HublotsService],
  controllers: [HublotsController],
})
export class HublotsModule {}
