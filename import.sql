--================================================================
-- Problem to solve: Import data from a CSV file and cleaned it
-- ================================================================
--=================================================================
-- **Cleaning the data**
-- To consider the data in the meteorites table clean, you should ensure:
-- 1. Any empty values in meteorites.csv are represented by NULL in the meteorites table (The mass, year, lat, and long columns have empty values in the CSV).
-- 2. All columns with decimal values (e.g., 70.4777) should be rounded to the nearest hundredths place (e.g., 70.4777 becomes 70.48).
-- 3. All meteorites with the nametype “Relict” are not included in the meteorites table.
-- 4. The meteorites are sorted by year, oldest to newest, and then—if any two meteorites landed in the same year—by name, in alphabetical order.
-- 5. You’ve updated the IDs of the meteorites from meteorites.csv, according to the order specified in #5.
--==================================================================
--To start...
--              cd meteorites              --To enter to the directory
--              sqlite3 meteorites.db      --creating the db
--
--====================================================================
-- Creating the temporary table to storage the date in the csv file
DROP TABLE IF EXISTS "temp_table";
CREATE TABLE "temp_table" (
"name" TEXT,
"id" TEXT,
"nametype" TEXT,
"class" TEXT,
"mass" TEXT,
"discovery" TEXT,
"year" TEXT,
"lat" TEXT,
"long");
-- Importing the data from the csv file to the temporal table:
--Directly in the terminal.
--  .import --csv --skip 1 meteorites.csv temp_table        Importing the values in csv file, skiping the first row (firts row are titles) into the temp_table
-- sqlite> SELECT * FROM "temp_table" LIMIT 3;            See the first 3 rows in our temp_table
