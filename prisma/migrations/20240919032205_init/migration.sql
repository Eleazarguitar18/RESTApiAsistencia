/*
  Warnings:

  - The primary key for the `Asistencia` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `ID_Asistencia` on the `Asistencia` table. All the data in the column will be lost.
  - You are about to drop the column `ID_Asistente` on the `Asistencia` table. All the data in the column will be lost.
  - You are about to drop the column `ID_Clase` on the `Asistencia` table. All the data in the column will be lost.
  - The primary key for the `Clase` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `ID_Clase` on the `Clase` table. All the data in the column will be lost.
  - You are about to drop the column `ID_Maestro` on the `Clase` table. All the data in the column will be lost.
  - The primary key for the `Usuario` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `ID_User` on the `Usuario` table. All the data in the column will be lost.
  - Added the required column `id_asistente` to the `Asistencia` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id_clase` to the `Asistencia` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Asistencia" DROP CONSTRAINT "Asistencia_ID_Asistente_fkey";

-- DropForeignKey
ALTER TABLE "Asistencia" DROP CONSTRAINT "Asistencia_ID_Clase_fkey";

-- DropForeignKey
ALTER TABLE "Clase" DROP CONSTRAINT "Clase_ID_Maestro_fkey";

-- AlterTable
ALTER TABLE "Asistencia" DROP CONSTRAINT "Asistencia_pkey",
DROP COLUMN "ID_Asistencia",
DROP COLUMN "ID_Asistente",
DROP COLUMN "ID_Clase",
ADD COLUMN     "id_asistencia" SERIAL NOT NULL,
ADD COLUMN     "id_asistente" INTEGER NOT NULL,
ADD COLUMN     "id_clase" INTEGER NOT NULL,
ADD CONSTRAINT "Asistencia_pkey" PRIMARY KEY ("id_asistencia");

-- AlterTable
ALTER TABLE "Clase" DROP CONSTRAINT "Clase_pkey",
DROP COLUMN "ID_Clase",
DROP COLUMN "ID_Maestro",
ADD COLUMN     "id_clase" SERIAL NOT NULL,
ADD COLUMN     "id_maestro" INTEGER,
ADD CONSTRAINT "Clase_pkey" PRIMARY KEY ("id_clase");

-- AlterTable
ALTER TABLE "Usuario" DROP CONSTRAINT "Usuario_pkey",
DROP COLUMN "ID_User",
ADD COLUMN     "id_user" SERIAL NOT NULL,
ADD CONSTRAINT "Usuario_pkey" PRIMARY KEY ("id_user");

-- AddForeignKey
ALTER TABLE "Clase" ADD CONSTRAINT "Clase_id_maestro_fkey" FOREIGN KEY ("id_maestro") REFERENCES "Usuario"("id_user") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Asistencia" ADD CONSTRAINT "Asistencia_id_asistente_fkey" FOREIGN KEY ("id_asistente") REFERENCES "Usuario"("id_user") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Asistencia" ADD CONSTRAINT "Asistencia_id_clase_fkey" FOREIGN KEY ("id_clase") REFERENCES "Clase"("id_clase") ON DELETE RESTRICT ON UPDATE CASCADE;
