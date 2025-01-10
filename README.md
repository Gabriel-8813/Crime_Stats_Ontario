# Crime Data Analytics



“Analysis of Crime and Hate Crime Trends in Ontario Cities: A Decade of Statistical Data (2013-2023)”




## Overview
This project is a Python-based solution designed for processing, analyzing, and serving crime data through a web API.
 It will allow users to query the crime trends in Ontario for a 10 years period between 2013 to 2023, and to conduct statistical analysis such as identifying crime hotspots, analyzing the frequency of crimes over time, and filtering crimes by severity or location.
The project employs ETL workflows to process data, stores it in an SQLite database, and serves it via a Flask API. The system is designed for ease of data retrieval, filtering and analysis.
The aim of this project is to provide an accessible tool for researchers, policymakers, and analysts to derive insights from historical and regional crime data.


## Table of Contents


1.	ETL Workflow
2.	Database Design & management
3.	Data Retrieval & Analysis
4.	Technical Tool & Libraries
5.	Ethical Considerations
6.	Conclusion 
7.	Documentation and references 


## ETL Workflow
The ETL process handles the data pipeline efficiently to ensure the database remains accurate and up to date. The Workflow Stages are:

**Extract**: (Techniques and Sources)

•	Use CSV files as a primary data source for crime statistics

•	Use pd.read_csv('path/to/file.csv') to read CSV files into DataFrames

**Transform**: (Processes Used)

•	Dropping Columns: Remove unnecessary columns with DataFrame.drop().

•	Renaming Columns: Use DataFrame.rename() to change column names for clarity.

•	Checking and Handling NaN Values: 
1.	Checking NaN: DataFrame.isna().sum() to get a count of NaN values in each column.
2.	Dropping NaN: DataFrame.dropna() to remove rows with missing values.
3.	Filling NaN: DataFrame.fillna(value) to replace NaN with a specific value.

•	Data Cleaning and Validation:
Implement data validation logic to detect and flag severe value inconsistencies.

**Load**:

•Load the cleaned data into the SQLite database created and managed using “DB Browser for SQLite” tool. Data is inserted into the corresponding tables (CrimeStats, HateStats, CrimeRates & location_year).

•Use SQLite3 Python library to create database connections and ensure lightweight database operations.

## Database Design :

**1.	Selection of Database Type** : SQL DB

Opted for a SQL database for the following reasons:

•	Structured Data and Schema Enforcement:
SQL databases use a predefined schema to structure data, ensuring that all entries adhere to a consistent format. 

•	Complex Querying Capabilities:
SQL databases excel at complex querying using SQL, allowing for sophisticated data retrieval through joins, subqueries, and aggregate functions. This enables users to perform intricate data analysis and reporting.

•	Support for Relational Data Models:
SQL databases are particularly well-suited for applications with complex relationships among data entities. Their ability to handle multi-table joins and enforce relationships through foreign keys makes SQL databases advantageous for maintaining relational data integrity.

**2.	Selection of SQL Database**: SQLite DB

Opted for a SQLite DB for the following reasons:


1.	Readability
: SQLite is easily navigable, and its SQL syntax is compatible with many applications, making it user-friendly.

2.	Simplicity and Ease of Use
SQLite is straightforward to integrate with applications, as it requires no intricate configurations or server management. 

3.	Operability:
SQLite operates seamlessly across various platforms without the need to install a separate database server. This portability allows developers to move databases between different environments easily
4.	Efficiency:
SQLite is a self-contained, serverless, and lightweight database engine. It operates directly on disk files, which minimizes overhead and leads to faster read and write operations

**3.	Entity-Relationship Diagram (ERD):**

Summary of Relationship between tables/schemas:

- **CrimeStats and location_year:**
The CrimeStats table includes a foreign key (locationYear_id) that references location_year.ID. This connects crime statistics to specific years and locations, allowing for an organized comparison of crime incidents
- **CrimeRates and location_year:**
The CrimeRates table also has a foreign key (location_year) that associates each entry with a specific year and location through the location_year.ID. Furthermore, the Violation_ID in both CrimeRatesand CrimeStats creates a link to the HateStats table, ensuring that hate crimes and general crime rates can be related
- **HateStats and location_year:** The HateStats table has a foreign key (Year) linked to the location_year.ID, indicating that each hate statistic is tied to a specific year and location. Additionally, a foreign key (location) in the HateStats table also references HateStats.ID, suggesting self-referential associations for related hate crime data

 



## Data Retrieval & Analysis:

### Flask API with JSON output:
serving Data for further analysis.

### A user_friendly web interface, allowing exploratory of data on the different Ontario cities: 

•Direct SQL Execution:
The code uses SQLite to execute SQL queries directly, optimizing performance by fetching data in bulk and converting it into Pandas DataFrames for quick analysis.

•Dynamic Query Construction: The application constructs queries based on user-provided filter parameters (e.g., year, location), allowing for targeted data retrieval while maintaining efficiency.

•	Error Handling: Robust error handling ensures that any issues during data fetching are logged, while the application gracefully returns an empty DataFrame, promoting resilience and reliability.

### HTML Option of Creating Frontend Interface 
Alternatively we considered using a webpage to display our data having accessed it using a Flask API.
To do this, we used 'render_template' function to render the index.html file. 
Created a dropdown menu of cities in our data as the alternative to further explore the data.


## Technical Tool & Libraries

#### Languages & Libraries:
• Python / Pandas: For ETL and data processing

•SQL: For advanced queries and database interactions.

•SQLite3 (New): For managing connections, and ensuring lightweight database operations.

•HTML, CSS, JavaScript: For Creating an interactive web-based interface for exploring and visualizing crime data.

#### Database: 
SQLite (lightweight relational DB).

#### Framework: 
Flask for building  APIs.

## Ethical Considerations in Data Transformation

**Minimize Bias and Misrepresentation:**

- Ensure transformations do not mislead users or alter original meanings.

- Justify changes in data representation (e.g., aggregating data).

**Transparency:**

- Maintain detailed documentation of the transformations applied.
- Ensure users can trace back to original values if necessary.

## Conclusion

This project transforms raw crime data into actionable insights, empowering policymakers and researchers to identify trends, hotspots, and priorities for crime prevention in Ontario. By combining efficient data processing, user-friendly tools, and ethical transparency, it lays the groundwork for informed decision-making. 



## License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for details.
