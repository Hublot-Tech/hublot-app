import { Module } from "@nestjs/common";
import { MongooseModule } from "@nestjs/mongoose";
import { Hublot } from "./schemas/hublot.schema";
import { HublotImage } from "./schemas/hublot-image.schema";
import { HublotPackage } from "./schemas/hublot-package.schema";
import { HublotPackageItem } from "./schemas/hublot-package-item.schema";

@Module({
  imports: [
    MongooseModule.forFeature([
      { name: Hublot.name, schema: Hublot },
      { name: HublotImage.name, schema: HublotImage },
      { name: HublotPackage.name, schema: HublotPackage },
      { name: HublotPackageItem.name, schema: HublotPackageItem },
    ]),
  ],
})
export class HublotsModule {}
