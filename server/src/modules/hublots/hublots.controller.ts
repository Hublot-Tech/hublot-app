import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  ParseIntPipe,
  Patch,
  Post,
  Put,
  Query,
} from "@nestjs/common";
import {
  ApiCreatedResponse,
  ApiNoContentResponse,
  ApiOkResponse,
  ApiTags,
} from "@nestjs/swagger";
import { BulkQueryDto } from "../dto";
import {
  CreateHublotDto,
  HublotDetailsDto,
  HublotDto,
  UpdateHublotDto,
} from "./dto/hublot.dto";
import { HublotsService } from "./hublots.service";

@ApiTags("Hublots")
@Controller("hublots")
export class HublotsController {
  constructor(private readonly hublotsService: HublotsService) {}

  @Get()
  @ApiOkResponse({ type: [HublotDto] })
  async getHublots(@Query() params: BulkQueryDto) {
    const hublots = await this.hublotsService.findAll(params);
    return hublots.map((hublot) => new HublotDto(hublot));
  }

  @Get(":id")
  @ApiOkResponse({ type: HublotDetailsDto })
  async getHublotDetails(@Param("id") id: string) {
    const hublot = await this.hublotsService.findById(id);
    return new HublotDetailsDto({ packages: [], ...hublot });
  }

  @Post()
  @ApiCreatedResponse({ type: HublotDto })
  async createNewHublots(@Body() createHublotDto: CreateHublotDto) {
    const newHublot = await this.hublotsService.create(createHublotDto);
    return new HublotDto(newHublot);
  }

  @Put(":id")
  @ApiNoContentResponse()
  async updateHublot(
    @Param("id") id: string,
    @Body() updateHublotDto: UpdateHublotDto,
  ) {
    await this.hublotsService.update(id, updateHublotDto);
  }

  @Delete(":id")
  @ApiNoContentResponse()
  async deleteHublot(@Param("id") id: string) {
    await this.hublotsService.delete(id);
  }

  @Patch(":id/votes")
  async submitVoteHublot(
    @Param("id") id: string,
    @Body("vote", ParseIntPipe) vote: number,
  ) {
    await this.hublotsService.update(id, { vote });
  }
}
