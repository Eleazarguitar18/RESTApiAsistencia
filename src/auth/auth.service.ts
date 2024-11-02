import { Injectable } from '@nestjs/common';
import { CreateAuthDto } from './dto/create-auth.dto';
import { UpdateAuthDto } from './dto/update-auth.dto';
import { Login } from './dto/login-auth.dto';
import { PrismaService } from '../prisma/prisma.service';

import bcrypt from 'bcrypt';
@Injectable()
export class AuthService {
  constructor(private prisma: PrismaService) {}
  async IniciarSesion(credenciales: Login) {}
  async encriptar(password: string): Promise<string> {
    try {
      const salto: number = parseInt(process.env.SALT_ROUNDS);
      const salt = await bcrypt.genSalt(salto);
      // Genera el hash utilizando la contraseña y el salt
      const hashedPassword = await bcrypt.hash(password, salt);
      // console.log(hashedPassword)
      return hashedPassword;
    } catch (error) {
      throw new Error(`Error al encriptar: ${error.message}`);
    }
  }
  async comparePassword(password: string, passwordHas): Promise<boolean> {
    return await bcrypt.compare(password, passwordHas);
  }
  async create(createAuthDto: CreateAuthDto) {
    return 'This action adds a new auth';
  }
  async login(credenciales: Login) {
    return 'This action adds a new auth';
  }

  findAll() {
    return `This action returns all auth`;
  }

  async findOne(id: number) {
    const user = this.prisma.usuario.findMany();
    return `This action returns a #${id} auth`;
  }

  async update(id: number, updateAuthDto: UpdateAuthDto) {
    return `This action updates a #${id} auth`;
  }

  async remove(id: number) {
    return `This action removes a #${id} auth`;
  }
}
