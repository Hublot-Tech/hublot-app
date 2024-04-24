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
  IsBoolean,
  IsDateString,
  IsNumber,
  IsOptional,
  IsString,
  ValidateNested,
} from "class-validator";
import { Document } from "mongoose";
import { Hublot, Vote } from "../schemas/hublot.schema";
import {
  CreateHublotPackageDto,
  UpdateHublotPackageDto,
} from "./hublot-package.dto";

export class CreateHublotDto {
  @IsString()
  @ApiProperty()
  name: string;

  @IsString()
  @ApiProperty()
  description: string;

  @IsString()
  @ApiProperty()
  address: string;

  @IsArray()
  @ArrayMinSize(1)
  @ValidateNested()
  @Type(() => CreateHublotPackageDto)
  @ApiProperty({ type: [CreateHublotPackageDto] })
  packages: CreateHublotPackageDto[];

  constructor(props: CreateHublotDto) {
    Object.assign(this, props);
  }
}

export class UpdateHublotDto extends OmitType(PartialType(CreateHublotDto), [
  "packages",
]) {
  @IsArray()
  @IsOptional()
  @ArrayMinSize(1)
  @ValidateNested()
  @Type(() => UpdateHublotPackageDto)
  @ApiPropertyOptional({ type: [UpdateHublotPackageDto] })
  packages?: UpdateHublotPackageDto[];
}

export class VoteDto extends Vote {
  @ApiProperty()
  @IsNumber()
  upvotes: number;

  @ApiProperty()
  @IsNumber()
  downvotes: number;

  constructor(props: Vote) {
    super(props);
    Object.assign(this, props);
  }
}

export class HublotDetailsDto
  extends CreateHublotDto
  implements Omit<Hublot, keyof Document>
{
  @ApiProperty()
  @IsString()
  id: string;

  @IsString()
  @ApiProperty()
  category: string;

  @ApiProperty()
  @ValidateNested()
  @Type(() => Vote)
  vote: Vote;

  @ApiProperty()
  @IsBoolean()
  isVerified: boolean;

  @ApiProperty()
  @IsBoolean()
  isSponsored: boolean;

  @ApiProperty()
  @IsString()
  @Exclude()
  createdBy: string;

  @ApiProperty()
  @IsDateString()
  createdAt: Date;

  constructor(props: HublotDetailsDto) {
    super(props);
    Object.assign(this, props);
  }
}

export class HublotDto extends OmitType(HublotDetailsDto, ["packages"]) {}
