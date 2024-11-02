-- CreateTable
CREATE TABLE "Usuario" (
    "id_user" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "apellido" TEXT NOT NULL,
    "fecha_nacimiento" TIMESTAMP(3) NOT NULL,
    "telefono" TEXT,
    "email" TEXT,

    CONSTRAINT "Usuario_pkey" PRIMARY KEY ("id_user")
);

-- CreateTable
CREATE TABLE "Clase" (
    "id_clase" SERIAL NOT NULL,
    "nombre_clase" TEXT NOT NULL,
    "fecha" TIMESTAMP(3) NOT NULL,
    "id_maestro" INTEGER,

    CONSTRAINT "Clase_pkey" PRIMARY KEY ("id_clase")
);

-- CreateTable
CREATE TABLE "Asistencia" (
    "id_asistencia" SERIAL NOT NULL,
    "fecha_asistencia" TIMESTAMP(3) NOT NULL,
    "estado" TEXT NOT NULL,
    "id_asistente" INTEGER NOT NULL,
    "id_clase" INTEGER NOT NULL,

    CONSTRAINT "Asistencia_pkey" PRIMARY KEY ("id_asistencia")
);

-- AddForeignKey
ALTER TABLE "Clase" ADD CONSTRAINT "Clase_id_maestro_fkey" FOREIGN KEY ("id_maestro") REFERENCES "Usuario"("id_user") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Asistencia" ADD CONSTRAINT "Asistencia_id_asistente_fkey" FOREIGN KEY ("id_asistente") REFERENCES "Usuario"("id_user") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Asistencia" ADD CONSTRAINT "Asistencia_id_clase_fkey" FOREIGN KEY ("id_clase") REFERENCES "Clase"("id_clase") ON DELETE RESTRICT ON UPDATE CASCADE;
