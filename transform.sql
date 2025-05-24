--Cleaning the data in the temp_table
-- Empty values= NULL
UPDATE "temp_table" SET "mass" = NULL WHERE TRIM("mass") = '';
UPDATE "temp_table" SET "year" = NULL WHERE TRIM("year") = '';
UPDATE "temp_table" SET "lat" = NULL WHERE TRIM("lat") = '';
UPDATE "temp_table" SET "long" = NULL WHERE TRIM("long") = '';
-- Decimal values rounded
UPDATE "temp_table"
SET
"mass" = ROUND("mass", 2),
"lat" = ROUND("lat", 2),
"long" = ROUND("long", 2)
WHERE "mass" IS NOT NULL OR "lat" IS NOT NULL OR "long" IS NOT NULL;
-- Droping values with nametype= 'Relict'
SELECT DISTINCT "nametype" FROM "temp_table";          -- Making sure there are not misspelling in the column
DELETE FROM "temp_table" WHERE "nametype"= 'Relict';
--Meteorites sorted by year, oldest to newest, and then—if any two meteorites landed in the same year—by name, in alphabetical order.
--                     Keeping just the year
UPDATE "temp_table" SET year = SUBSTR("year", 1, 4) WHERE year IS NOT NULL;
-- Creating the final table "meteorites" with just the rows we need:
DROP TABLE IF EXISTS "meteorites";
CREATE TABLE "meteorites"(
"id" PRIMARY KEY,
"name" TEXT,
"class" TEXT,
"mass" REAL,
"discovery" TEXT,
"year" INTEGER,
"lat" REAL,
"long" REAL
);
-- Bringing the date from the "temp_table" to the "meteorites" table
DELETE FROM "meteorites";            -- In case there was something
INSERT INTO "meteorites" ("name","class","mass","discovery","year","lat","long")
SELECT "name","class","mass","discovery","year","lat","long"
FROM "temp_table";
-- Sorting by year and asigning an ID base on the year (oldest to newest), or by the name if in the same year
DROP TABLE IF EXISTS "meteorites_ordered";
CREATE TABLE "meteorites_ordered" AS
SELECT
ROW_NUMBER() OVER (ORDER BY CAST("year" AS INTEGER), "name") AS "id",
"name",
"class",
"mass",
"year",
"lat",
"long"
FROM "meteorites"
WHERE "year" IS NOT NULL;
-- Asssigning the original name "meteorites" to the "meteorites_ordered" table
DROP TABLE "meteorites";
ALTER TABLE "meteorites_ordered" RENAME TO "meteorites";
