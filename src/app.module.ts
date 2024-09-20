import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PrismaModule } from './prisma/prisma.module';
import { UserModule } from './user/user.module';
import { ClaseModule } from './clase/clase.module';
import { AsistenciaModule } from './asistencia/asistencia.module';
import { AuthModule } from './auth/auth.module';

@Module({
  imports: [PrismaModule, UserModule, ClaseModule, AsistenciaModule, AuthModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
