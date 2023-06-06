/*
  Warnings:

  - Changed the type of `TimeSend` on the `messages` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- AlterTable
ALTER TABLE `messages` DROP COLUMN `TimeSend`,
    ADD COLUMN `TimeSend` DATETIME(3) NOT NULL;
