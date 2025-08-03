# 🧹 SQL Data Cleaning Project

![SQL](https://img.shields.io/badge/Tool-SQL-blue) ![Level](https://img.shields.io/badge/Level-Intermediate-green) ![Status](https://img.shields.io/badge/Status-Completed-brightgreen)

A data cleaning project using **SQL Server** to transform raw housing data into an analysis-ready dataset. This project showcases essential SQL techniques like `UPDATE`, `ALTER`, `CASE`, `ISNULL`, and `JOIN` to clean and standardize data effectively.

---

## 📂 Project Overview

Real-world data is messy. This project focuses on transforming a **raw housing dataset** into a clean format that is:

- Free of inconsistencies  
- Standardized across all columns  
- Ready for analytics and dashboarding

✅ **Key Objectives**:

- Handle NULL and blank values  
- Remove duplicates and incorrect formats  
- Correct date and currency fields  
- Break down address fields (street, city, state)  
- Create new derived columns

---

## 🧰 Tools & Technologies

| Tool           | Purpose                          |
|----------------|----------------------------------|
| SQL Server     | Data cleaning & transformation   |
| SSMS           | Query execution & visualization  |
| Git & GitHub   | Version control & sharing        |

---

## 🛠️ SQL Concepts Used

- `SELECT`, `UPDATE`, `DELETE`, `ALTER`, `DROP`  
- String functions: `TRIM`, `SUBSTRING`, `CHARINDEX`, `REPLACE`  
- Date functions: `GETDATE`, `CONVERT`, `CAST`  
- Conditional logic: `CASE WHEN`, `ISNULL`, `NULLIF`  
- Joins & Subqueries  
- Common Table Expressions (CTEs)

---

## 📊 Before vs After Cleaning Snapshot

| Issue                     | Raw Data                          | Cleaned Data                       |
|--------------------------|-----------------------------------|------------------------------------|
| Blank entries            | `NULL`, `' '`                     | Standardized using `ISNULL()`     |
| Inconsistent dates       | `04-12-2021`, `2021/12/04`        | `YYYY-MM-DD` using `CONVERT()`    |
| Duplicates               | Repeated rows                     | Removed with `ROW_NUMBER()`       |
| Mixed units in prices    | `100K`, `$100000`, `1L`           | Unified numeric format             |
| Address in one column    | `123 Main St, NY`                 | Split into `Street`, `City`, `State` |

---

## 📌 Project Highlights

✨ Cleaned over **1,000+ records** of messy housing data  
✨ Applied **robust string transformations**  
✨ Created **analysis-ready tables**  
✨ Followed **best practices in SQL scripting**

---

## 🧪 Sample Query Output

```sql
SELECT TOP 5 * 
FROM Cleaned_Housing_Data
WHERE City = 'New York';
