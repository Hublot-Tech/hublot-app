import { Body, Controller, Delete, Get, HttpException, HttpStatus, Param, Post, Query } from '@nestjs/common';
import { ApiBadGatewayResponse, ApiCreatedResponse, ApiNoContentResponse, ApiNotFoundResponse, ApiOkResponse, ApiTags } from '@nestjs/swagger';
import { AddServiceResponseDto, CreateServiceDto, GetAllServiceResponseDto, GetOneServiceResponseDto, ServiceDto } from './dto/service.dto';
import { ServiceService } from './service.service';
import { BulkQueryDto, ResponseMetadataDto, ResponseStatus } from '../dto';
import { query } from 'express';

@ApiTags('Service')
@Controller('service')
export class ServiceController {
    constructor(private serviceService: ServiceService) {}

    @Get()
    @ApiOkResponse({
        type: GetAllServiceResponseDto,
        description: 'list of successfully loaded services',
    })
    async findAll(@Query() query : BulkQueryDto): Promise<GetAllServiceResponseDto> {
        const services = await this.serviceService.findAll(query);
        return new GetAllServiceResponseDto({
            data: services,
            page: query.page ?? 1,
            perpage: query.perpage ?? 10,
            status: ResponseStatus.SUCCESS,
            message: 'Successfully retrieved services'
        });
    }

    @Post("add")
    @ApiCreatedResponse({
        type: AddServiceResponseDto,
        description: "Service Created Sucessfully"
    })
    async add(
        @Body() addServiceDto:ServiceDto,
    ) : Promise <AddServiceResponseDto> {
        try {
            const service = await this.serviceService.add(addServiceDto);
            return new AddServiceResponseDto({
                data: service,
                message: "Service Created Sucessfully",
                status: ResponseStatus.SUCCESS,
            });
        } catch (error) {
            throw new HttpException(
              new ResponseMetadataDto({
                message: error.message,
                status: ResponseStatus.ERROR,
              }),
              HttpStatus.INTERNAL_SERVER_ERROR,
            );
        }
    }


    @Get(':id')
    @ApiOkResponse({
        type: GetOneServiceResponseDto,
        description: 'Service information successfully retrieved',
    })
    @ApiNotFoundResponse({ description: 'Service not found' })
    @ApiBadGatewayResponse({ description: 'Invalid service ID' })
    async findOne(@Param('id') serviceId: any): Promise<GetOneServiceResponseDto> {

        const service = await this.serviceService.findOne(serviceId); // Call the findOne method with the serviceId parameter
        return new GetOneServiceResponseDto({
            data: service,
            message: 'Successfully retrieved service',
            status: ResponseStatus.SUCCESS,
        });
    }

    @Delete(":id")
    @ApiNoContentResponse({
      type: ResponseMetadataDto,
      description: "Service successfully deleted",
    })
    async delete(@Param("id") serviceId: any): Promise<ResponseMetadataDto> {
      await this.serviceService.delete(serviceId);
      return new ResponseMetadataDto({
        status: ResponseStatus.SUCCESS,
        message: "Service successfully deleted",
      });
    }

}
