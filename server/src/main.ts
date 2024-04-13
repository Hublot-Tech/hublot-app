import { NestFactory } from "@nestjs/core";
import { AppModule } from "./app.module";
import { DocumentBuilder, SwaggerModule } from "@nestjs/swagger";
import { readFileSync } from "fs";
import { join } from "path";
import { ValidationPipe } from "@nestjs/common";

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  app.useGlobalPipes(new ValidationPipe());

  // Swagger initialise
  const config = new DocumentBuilder()
    .setTitle("Hublot")
    .setDescription(
      "Hublot for connecting service providers and customers. The general idea of the project is to design software program connecting service providers and customers",
    )
    .setVersion("1.0")
    .build();

  // Customize Swagger UI setup
  const customCss = readFileSync(join(__dirname, "../custom.css"), "utf8"); // Optional: Load custom CSS
  const customScript = readFileSync(
    join(__dirname, "../custom-script.js"),
    "utf8",
  ); // Load custom script

  const document = SwaggerModule.createDocument(app, config);
  SwaggerModule.setup("api", app, document, {
    customCss,
    customSiteTitle: "Hublot",
    swaggerOptions: {
      customJs: customScript,
    },
  });

  await app.listen(3000);
}
bootstrap();
