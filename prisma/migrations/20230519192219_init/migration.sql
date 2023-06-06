/*
  Warnings:

  - You are about to drop the `klema` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `kryka` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE `klema`;

-- DropTable
DROP TABLE `kryka`;

-- CreateTable
CREATE TABLE `Users` (
    `UserId` INTEGER NOT NULL,
    `Name` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`UserId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Messages` (
    `Id` INTEGER NOT NULL AUTO_INCREMENT,
    `UserId` INTEGER NOT NULL,
    `MessageText` VARCHAR(191) NOT NULL,
    `TimeSend` INTEGER NOT NULL,
    `Who_send` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`Id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
