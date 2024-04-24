import { ApiProperty, PartialType } from "@nestjs/swagger";
import { Exclude } from "class-transformer";
import { IsDateString, IsString } from "class-validator";
import { Document } from "mongoose";
import { HublotPackageItem } from "../schemas/hublot-package-item.schema";

export class CreateHublotPackageItemDto {
  @IsString()
  @ApiProperty()
  name: string;

  @IsString()
  @ApiProperty()
  value: string;

  constructor(props: CreateHublotPackageItemDto) {
    Object.assign(this, props);
  }
}

export class HublotPackageItemDto
  extends CreateHublotPackageItemDto
  implements Omit<HublotPackageItem, keyof Document>
{
  @ApiProperty()
  @IsString()
  id: string;

  @IsString()
  @ApiProperty()
  hublotId: string;

  @IsString()
  @ApiProperty()
  hublotPackageId: string;

  @ApiProperty()
  @IsDateString()
  createdAt: Date;

  @Exclude()
  createdBy: string;

  constructor(props: HublotPackageItemDto) {
    super(props);
    Object.assign(this, props);
  }
}

export class UpdateHublotPackageItemDto extends PartialType(
  CreateHublotPackageItemDto,
) {
  @ApiProperty()
  @IsString()
  id: string;

  constructor(props: UpdateHublotPackageItemDto) {
    super(props);
    Object.assign(this, props);
  }
}
