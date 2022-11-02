/*
  Warnings:

  - You are about to alter the column `firtTeamCountryCode` on the `Game` table. The data in that column could be lost. The data in that column will be cast from `String` to `Int`.
  - You are about to alter the column `secondTeamCountryCode` on the `Game` table. The data in that column could be lost. The data in that column will be cast from `String` to `Int`.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Game" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "date" DATETIME NOT NULL,
    "firtTeamCountryCode" INTEGER NOT NULL,
    "secondTeamCountryCode" INTEGER NOT NULL
);
INSERT INTO "new_Game" ("date", "firtTeamCountryCode", "id", "secondTeamCountryCode") SELECT "date", "firtTeamCountryCode", "id", "secondTeamCountryCode" FROM "Game";
DROP TABLE "Game";
ALTER TABLE "new_Game" RENAME TO "Game";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
