import { Injectable } from '@nestjs/common';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { PrismaService } from '../prisma/prisma.service';
@Injectable()
export class UserService {
  constructor(private prisma: PrismaService) {}
  create(createUserDto: CreateUserDto) {
    const [day, month, year] = createUserDto.fecha_nacimiento.split('-');
    const formattedDate = new Date(`${year}-${month}-${day}`);

    return this.prisma.usuario.create({
      data: {
        nombre: createUserDto.nombre,
        apellido: createUserDto.apellido,
        fecha_nacimiento: formattedDate, // Ahora es un Date válido
        telefono: createUserDto.telefono,
        email: createUserDto.email,
      },
    });
    // return 'This action adds a new user';
  }

  async findAll() {
    const data = {
      status: 200,
      mesasage: `This action returns all user`,
      data: await this.prisma.usuario.findMany(),
    };
    return data;
  }
  async buscar_email(email: string) {
    // const emailUser: string = email;
    return this.prisma.usuario.findFirst({
      where: {
        email: email,
      },
    });
  }
  findOne(id: number) {
    return `This action returns a #${id} user`;
  }

  update(id: number, updateUserDto: UpdateUserDto) {
    return `This action updates a #${id} user`;
  }

  remove(id: number) {
    return `This action removes a #${id} user`;
  }
}
