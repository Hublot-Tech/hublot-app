import { ApiProperty, OmitType, PartialType } from "@nestjs/swagger";
import { Type } from "class-transformer";
import {
    IsString,
    IsUUID,
    IsNumber,
    IsOptional,
    MinLength,
    ValidateNested,
    IsArray,
} from "class-validator";
import { Types } from "mongoose";
import { BulkResponseMetadataDto, ResponseMetadataDto } from "src/modules/dto";


export class CreateServiceDto {
    @ApiProperty({
        example: "Plomberie et sanitaire",
        description: "Name of the service",
    })
    @IsString({ message: "name is required" })
    @MinLength(3, { message: "Service Name must be at least 3 characters long" })
    name: string;
    
    @ApiProperty({
        example: "Nettoyage des canalisations, installation de robinetterie, etc.",
        description: "Description of the service",
    })
    @IsString({ message: "Service description is required" })
    @MinLength(30, { message: "description must be at least 40 characters long" })
    description: string;
    
    @ApiProperty({
        example: 5000,
        description: "Price of the service",
    })
    @IsNumber()
    price: number;
    
    constructor(createService: CreateServiceDto) {
        Object.assign(this, createService);
    }
}

export class GetServiceByIdDto {
    @ApiProperty({
        example: "Service ID",
        description: "The service ID is required to obtain a service.",
    })
    @IsUUID()
    id: string;
}

export class ServiceDto extends CreateServiceDto {
    @ApiProperty({
        description: "Timestamp of last update",
    })
    updatedAt: Date;
    
    @ApiProperty({
        description: "Timestamp of creation",
    })
    createdAt: Date;
    
    @ApiProperty({
        description: "Timestamp of deletion",
    })
    deletedAt: Date;

        
    @ApiProperty({
        example: "Available from 9 AM to 5 PM",
        description: "Availability times for the service",
    })
    @IsOptional()
    @IsString()
    availability: string;

    //referencing the user who created the service
    @ApiProperty({
        example: "60e1f9f1c3c7b40015f7c4b5",
        description: "User ID of the service provider",
        
    })
    @IsUUID()
    provider: string;
    
    constructor(service: ServiceDto) {
        super(service);
        Object.assign(this, service);
    }
}

export class UpdateServiceDto extends PartialType(
    OmitType(ServiceDto, ["name", "description", "price"] as const),
) {}
// -------------------- Responses ----------------------------------
export class AddServiceResponseDto extends ResponseMetadataDto {
    @ApiProperty()
    @ValidateNested()
    @Type(() => ServiceDto)
    data: ServiceDto;

    constructor(responseBody : AddServiceResponseDto){
        super(responseBody);
        Object.assign(this, responseBody)
    }
}

export class RegisterServiceResponseDto extends ResponseMetadataDto {
    @ApiProperty({
        example: "Service created successfully",
        description: "Message to display",
    })
    @ValidateNested()
    @Type(() => ServiceDto)
    data: ServiceDto;

    constructor(responseBody : RegisterServiceResponseDto) {
        super(responseBody);
        Object.assign(this, responseBody);
    }
}

export class GetAllServiceResponseDto extends BulkResponseMetadataDto {
    @IsArray()
    @ApiProperty()
    @ValidateNested()
    @Type(() => ServiceDto)
    data: ServiceDto[];

    constructor(response : GetAllServiceResponseDto){
        super(response);
        Object.assign(this, response);
    }
}

export class GetOneServiceResponseDto extends ResponseMetadataDto {
    @ApiProperty()
    @ValidateNested()
    @Type(() => ServiceDto)
    data: ServiceDto;
    
    constructor (response: GetOneServiceResponseDto){
        super(response);
        Object.assign(this, response);
    }
}

