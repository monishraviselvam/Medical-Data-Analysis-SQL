## Medical Data Analysis Using SQL

## Project Overview

This project focuses on analyzing a medical dataset using MySQL. It contains SQL solutions for 34 assignment questions involving patient details, hospital admissions, doctors, and province information.

The queries explore patient demographics, admission patterns, medical diagnoses, and other healthcare-related data.

## Tools Used

- MySQL
- MySQL Workbench 8.0

## Database Tables

- `patients`
- `admissions`
- `doctors`
- `province_names`

## SQL Concepts Practiced

- Data retrieval using `SELECT`
- Filtering using `WHERE`, `IN`, `BETWEEN`, and `IS NULL`
- Sorting using `ORDER BY`
- Removing duplicates using `DISTINCT`
- Aggregate functions: `COUNT()`, `SUM()`, `MAX()`, `MIN()`
- Grouping and filtering using `GROUP BY` and `HAVING`
- Pattern matching using `LIKE`
- Date functions: `YEAR()` and `DAY()`
- String functions: `CONCAT()`, `UPPER()`, and `LOWER()`
- Conditional logic using `CASE WHEN`
- Table joins using `INNER JOIN`
- Subqueries
- Combining results using `UNION ALL`
- Calculating BMI using SQL
- Updating records using `UPDATE`

## Project File

- `medical_data_analysis_sql.sql` — Contains SQL solutions for all 34 assignment questions.

## Notes and Limitations

- Questions 21 and 22 are duplicates in the original assignment.
- The `UPDATE` query for Question 5 is included. However, execution was blocked because the database account returned an `UPDATE command denied` permission error.
- The existing column name `attending_doctor_id` was retained. No schema alteration was required.
- No patient records, database credentials, host addresses, or connection details are included in this repository.
