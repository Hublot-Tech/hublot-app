import { NotFoundException } from "@nestjs/common";
import { FilterQuery, Model, UpdateQuery } from "mongoose";
import { BulkQueryDto } from "../dto/response.dto";

export class BaseService<T> {
  constructor(private readonly model: Model<T>) {}

  async create(data: Partial<T>): Promise<T> {
    const createdRecord = await new this.model(data).save();
    return createdRecord.toJSON();
  }

  async findById(id: string): Promise<T> {
    const record = await this.model.findById(id).exec();
    return record.toJSON();
  }

  async findOne(query: FilterQuery<T>): Promise<T> {
    const record = await this.model.findOne(query).exec();
    return record.toJSON();
  }

  async findAll(query: BulkQueryDto): Promise<T[]> {
    const records = await this.model
      .find()
      .limit(query.perpage ?? 10)
      .skip(query.page ?? 1)
      .exec();
    return records;
  }

  async delete(id: string): Promise<void> {
    const record = await this.model.findByIdAndDelete(id).exec();
    if (!record) throw new NotFoundException(`Record with id ${id} not found`);
  }

  async update(id: string, data: UpdateQuery<T>): Promise<T> {
    const record = await this.model
      .findByIdAndUpdate(id, { ...data, updatedAt: new Date() }, { new: true })
      .exec();
    return record.toJSON();
  }
}
