import { Injectable } from '@nestjs/common';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { PrismaService } from "../prisma/prisma.service";
@Injectable()
export class UserService {
  constructor(private prisma: PrismaService) {}
  create(createUserDto: CreateUserDto) {
    const [day, month, year] = createUserDto.Fecha_Nacimiento.split('-');
    const formattedDate = new Date(`${year}-${month}-${day}`);
    return this.prisma.usuario.create({
      data: {
      Nombre: createUserDto.Nombre,
      Apellido: createUserDto.Apellido,
      Fecha_Nacimiento: formattedDate, // Ahora es un Date válido
      Telefono: createUserDto.Telefono,
      Email: createUserDto.Email,
    },})
    // return 'This action adds a new user';
  }

  async findAll() {
    const data={
      status:200,
      mesasage:`This action returns all user`,
      data: await this.prisma.usuario.findMany(),
    }
    return data;
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
