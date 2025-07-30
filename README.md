# **COVID-19 Data Exploration & Vaccination Analysis (SQL)**

![SQL](https://img.shields.io/badge/SQL%20Server-TSQL-blue) ![Data Analysis](https://img.shields.io/badge/Domain-Data%20Analytics-green) ![Project Type](https://img.shields.io/badge/Type-Exploratory%20Analysis-orange)

This project demonstrates **real-world data analysis skills** by exploring and analyzing global COVID-19 datasets with a strong focus on vaccination progress. It leverages SQL Server (T-SQL), advanced querying techniques, and data cleaning strategies to deliver actionable insights.


## **Why This Project Matters**

* Showcases **end-to-end SQL data analysis**: data ingestion, cleaning, joining, cumulative calculations, and deriving metrics.
* Demonstrates **window functions, data type conversions, and error handling** – skills highly valued in analytics roles.
* Produces **business-relevant KPIs**, like the percentage of population vaccinated, which can drive real-world decision-making.


## **Key Skills Demonstrated**

* **Advanced SQL**: complex joins, cumulative calculations using `SUM() OVER`, partitioning, and ordering.
* **Data Cleaning & Validation**: handling null values, preventing divide-by-zero errors, and type conversions with `CAST`/`TRY_CONVERT`.
* **Analytical Thinking**: turning raw COVID-19 data into meaningful metrics.
* **Reporting & Visualization Readiness**: query outputs can be directly integrated into tools like **Power BI** or **Tableau**.


## **Project Workflow**

1. **Data Loading:** Two datasets (`CovidDeaths`, `CovidVaccinations`) loaded into SQL Server.
2. **Data Exploration:** Analyze distributions, missing values, and identify join keys.
3. **Data Integration:** Join datasets on `location` and `date` to merge vaccination and population data.
4. **KPI Calculations:** Calculate cumulative vaccinations and percentage of the population vaccinated.
5. **Output Analysis:** Generate a clean table ready for visualization.


## **Sample Query Output**

| Location | Date       | Population    | People Vaccinated | % Vaccinated |
| -------- | ---------- | ------------- | ----------------- | ------------ |
| India    | 2021-06-01 | 1,380,004,385 | 180,000,000       | 13.04%       |
| Spain    | 2021-06-01 | 46,754,778    | 18,500,000        | 39.56%       |

> **Business Insight:** Spain had vaccinated nearly 40% of its population by June 2021, while India stood at just 13% – helping policymakers prioritize vaccine supply chains.


## **Tech Stack**

* **SQL Server (T-SQL)**
* **Window Functions:** `SUM() OVER`, `PARTITION BY`, `ORDER BY`
* **Error Handling:** `NULLIF`, `TRY_CONVERT`
* **Visualization Ready:** Output compatible with **Power BI**, **Tableau**, and Excel.


## **Possible Extensions**

* Build a **Power BI Dashboard** to visualize vaccination trends globally.
* Add additional KPIs such as **mortality rate**, **cases per 100k population**, etc.
* Automate ETL pipelines using Python or SQL Agent.


## **Dataset Sources**
https://ourworldindata.org/covid-deaths
