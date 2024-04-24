import {
  ApiProperty,
  ApiPropertyOptional,
  OmitType,
  PartialType,
} from "@nestjs/swagger";
import { Exclude, Type } from "class-transformer";
import {
  ArrayMinSize,
  IsArray,
  IsDateString,
  IsNumber,
  IsOptional,
  IsString,
  ValidateNested,
} from "class-validator";
import {
  CreateHublotPackageItemDto,
  HublotPackageItemDto,
  UpdateHublotPackageItemDto,
} from "./hublot-package-item.dto";
import { HublotPackage } from "../schemas/hublot-package.schema";
import { Document } from "mongoose";

export class CreateHublotPackageDto {
  @IsString()
  @ApiProperty()
  name: string;

  @IsNumber()
  @ApiProperty({ description: "estimated duration in days" })
  estimated_duration: number;

  @IsArray()
  @ArrayMinSize(1)
  @ValidateNested()
  @Type(() => CreateHublotPackageItemDto)
  @ApiProperty({ type: [CreateHublotPackageItemDto] })
  items: CreateHublotPackageItemDto[];

  constructor(props: CreateHublotPackageDto) {
    Object.assign(this, props);
  }
}

export class HublotPackageDetailsDto
  extends CreateHublotPackageDto
  implements Omit<HublotPackage, keyof Document>
{
  @IsString()
  @ApiProperty()
  id: string;

  @IsString()
  @ApiProperty()
  description: string;

  @IsString()
  @ApiProperty()
  hublotId: string;

  @IsNumber()
  @ApiProperty()
  price: number;

  @ApiProperty()
  @IsDateString()
  createdAt: Date;

  @Exclude()
  createdBy: string;

  @IsArray()
  @ArrayMinSize(1)
  @ValidateNested()
  @Type(() => HublotPackageItemDto)
  @ApiProperty({ type: [HublotPackageItemDto] })
  items: HublotPackageItemDto[];

  constructor(props: HublotPackageDetailsDto) {
    super(props);
    Object.assign(this, props);
  }
}

export class HublotPackageDto extends OmitType(HublotPackageDetailsDto, [
  "items",
]) {}

export class UpdateHublotPackageDto extends OmitType(
  PartialType(CreateHublotPackageDto),
  ["items"],
) {
  @IsArray()
  @IsOptional()
  @ArrayMinSize(1)
  @ValidateNested()
  @Type(() => UpdateHublotPackageItemDto)
  @ApiPropertyOptional({ type: [UpdateHublotPackageItemDto] })
  items?: UpdateHublotPackageItemDto[];

  constructor(props: UpdateHublotPackageDto) {
    super(props);
    Object.assign(this, props);
  }
}
