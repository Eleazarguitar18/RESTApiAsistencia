-- CreateTable
CREATE TABLE "Usuario" (
    "ID_User" SERIAL NOT NULL,
    "Nombre" TEXT NOT NULL,
    "Apellido" TEXT NOT NULL,
    "Fecha_Nacimiento" TIMESTAMP(3) NOT NULL,
    "Telefono" TEXT,
    "Email" TEXT,

    CONSTRAINT "Usuario_pkey" PRIMARY KEY ("ID_User")
);

-- CreateTable
CREATE TABLE "Clase" (
    "ID_Clase" SERIAL NOT NULL,
    "Nombre_Clase" TEXT NOT NULL,
    "Fecha" TIMESTAMP(3) NOT NULL,
    "ID_Maestro" INTEGER,

    CONSTRAINT "Clase_pkey" PRIMARY KEY ("ID_Clase")
);

-- CreateTable
CREATE TABLE "Asistencia" (
    "ID_Asistencia" SERIAL NOT NULL,
    "Fecha_Asistencia" TIMESTAMP(3) NOT NULL,
    "Estado" TEXT NOT NULL,
    "ID_Asistente" INTEGER NOT NULL,
    "ID_Clase" INTEGER NOT NULL,

    CONSTRAINT "Asistencia_pkey" PRIMARY KEY ("ID_Asistencia")
);

-- AddForeignKey
ALTER TABLE "Clase" ADD CONSTRAINT "Clase_ID_Maestro_fkey" FOREIGN KEY ("ID_Maestro") REFERENCES "Usuario"("ID_User") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Asistencia" ADD CONSTRAINT "Asistencia_ID_Asistente_fkey" FOREIGN KEY ("ID_Asistente") REFERENCES "Usuario"("ID_User") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Asistencia" ADD CONSTRAINT "Asistencia_ID_Clase_fkey" FOREIGN KEY ("ID_Clase") REFERENCES "Clase"("ID_Clase") ON DELETE RESTRICT ON UPDATE CASCADE;
