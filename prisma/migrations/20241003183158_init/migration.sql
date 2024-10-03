/*
  Warnings:

  - You are about to drop the column `Estado` on the `Asistencia` table. All the data in the column will be lost.
  - You are about to drop the column `Fecha_Asistencia` on the `Asistencia` table. All the data in the column will be lost.
  - You are about to drop the column `Fecha` on the `Clase` table. All the data in the column will be lost.
  - You are about to drop the column `Nombre_Clase` on the `Clase` table. All the data in the column will be lost.
  - You are about to drop the column `Apellido` on the `Usuario` table. All the data in the column will be lost.
  - You are about to drop the column `Email` on the `Usuario` table. All the data in the column will be lost.
  - You are about to drop the column `Fecha_Nacimiento` on the `Usuario` table. All the data in the column will be lost.
  - You are about to drop the column `Nombre` on the `Usuario` table. All the data in the column will be lost.
  - You are about to drop the column `Telefono` on the `Usuario` table. All the data in the column will be lost.
  - Added the required column `estado` to the `Asistencia` table without a default value. This is not possible if the table is not empty.
  - Added the required column `fecha_asistencia` to the `Asistencia` table without a default value. This is not possible if the table is not empty.
  - Added the required column `fecha` to the `Clase` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nombre_clase` to the `Clase` table without a default value. This is not possible if the table is not empty.
  - Added the required column `apellido` to the `Usuario` table without a default value. This is not possible if the table is not empty.
  - Added the required column `fecha_nacimiento` to the `Usuario` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nombre` to the `Usuario` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Asistencia" DROP COLUMN "Estado",
DROP COLUMN "Fecha_Asistencia",
ADD COLUMN     "estado" TEXT NOT NULL,
ADD COLUMN     "fecha_asistencia" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Clase" DROP COLUMN "Fecha",
DROP COLUMN "Nombre_Clase",
ADD COLUMN     "fecha" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "nombre_clase" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Usuario" DROP COLUMN "Apellido",
DROP COLUMN "Email",
DROP COLUMN "Fecha_Nacimiento",
DROP COLUMN "Nombre",
DROP COLUMN "Telefono",
ADD COLUMN     "apellido" TEXT NOT NULL,
ADD COLUMN     "email" TEXT,
ADD COLUMN     "fecha_nacimiento" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "nombre" TEXT NOT NULL,
ADD COLUMN     "telefono" TEXT;
