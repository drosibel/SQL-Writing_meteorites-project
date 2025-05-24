# 🌠 Meteorite Landings Data Cleanup and Transformation (SQLite)
This project focuses on cleaning, transforming, and organizing a dataset of meteorite landings using SQLite. It demonstrates how to handle real-world data issues such as missing values, inconsistent formatting, and the need for meaningful sorting and indexing.

## 📌 Dataset
The data comes from a CSV file containing meteorite landings, with the following key fields:

- `id`: ID of the meteorite operation
- `name`: Name of the meteorite
- `class`: Classification
- `mass`: Mass (in grams)
- `year`: Year of fall  
- `lat`: Geographic coordinates
- `long`: Geographic coordinates
- `nametype`: Should be used to filter out irrelevant entries

## ✅ Data Cleaning and Transformation Steps

- Convert empty values to NULL for the fields: `mass`, `year`, `lat`, and `long`.
- Round decimal columns (mass, lat, long) to the nearest hundredths place (e.g., 70.4777 → 70.48).
- Filter out meteorites with `nametype` = 'Relict', as these are not considered relevant falls.
- Extract the `year` from the full date if necessary, and ensure it's stored as an integer.
- Assign unique `ID`s starting from 1 based on: `year` (ascending), `name` (alphabetical) within the same year
- Store the cleaned and transformed data in a final meteorites table, ready for analysis or visualization.

## 🛠️ Technologies Used
- SQLite 3
- SQL window functions (ROW_NUMBER())
- CSV import and manipulation
- Data wrangling techniques

## 📁 Structure

- `meteorites.csv` (original dataset)
- `import.sql` (script to import CSV and create temp table)
- `transform.sql` (SQL script to clean and insert into final table)
- `README.md` (Project documentation)

## 🚀 How to Use
1. Using the `import.sql` import the CSV into a temporary table (`temp_table`). Be careful when using the ".import --csv --skip 1 meteorites.csv temp_table" command, as you will need to run it directly in the terminal. This is because SQL treats it as text in the import.sql file.
2. Run the transformation script (`transform.sql`) to clean and insert into the final meteorites table.
3. Query the meteorites table for sorted, cleaned data ready for analysis.









