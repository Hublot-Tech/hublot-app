import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';

async function bootstrap() {

  const app = await NestFactory.create(AppModule);

  // Swagger initialise
  const config = new DocumentBuilder()
    .setTitle('Hublot')
    .setDescription(
      'Hublot for connecting service providers and customers. The general idea of the project is to design software program connecting service providers and customers')
    .setVersion('1.0')
    .build();
  const document = SwaggerModule.createDocument(app, config);
  SwaggerModule.setup('api', app, document);


  await app.listen(3000);



}
bootstrap();
