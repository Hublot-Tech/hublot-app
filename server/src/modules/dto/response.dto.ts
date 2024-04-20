import { ApiProperty, ApiPropertyOptional } from "@nestjs/swagger";
import { IsEnum, IsNumber, IsOptional, IsString } from "class-validator";

export enum ResponseStatus {
  SUCCESS = "success",
  ERROR = "error",
}

export class BulkQueryDto {
  @IsNumber()
  @IsOptional()
  @ApiPropertyOptional()
  perpage?: number;

  @IsNumber()
  @IsOptional()
  @ApiPropertyOptional()
  page?: number;

  @IsNumber()
  @IsOptional()
  @ApiPropertyOptional()
  limit?: number;
}

export class ResponseMetadataDto {
  @IsString()
  @ApiProperty()
  message: string;

  @IsEnum(ResponseStatus)
  @ApiProperty({ enum: ResponseStatus })
  status: ResponseStatus;

  constructor(responseBody: ResponseMetadataDto) {
    Object.assign(this, responseBody);
  }
}

export class BulkResponseMetadataDto extends ResponseMetadataDto {
  @IsNumber()
  @ApiProperty()
  perpage: number;

  @IsNumber()
  @ApiProperty()
  page: number;

  @IsNumber()
  @IsOptional()
  @ApiPropertyOptional()
  limit?: number;

  constructor(metadata: BulkResponseMetadataDto) {
    super(metadata);
    Object.assign(this, metadata);
  }
}
