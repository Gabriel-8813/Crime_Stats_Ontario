# Crime_Stats_Ontario
Group 8 project 3 - Crime statistics in Ontario cities from 2013 to 2023

## Data Engineering Track

# Steps
ETL Workflow
1. Extract csv dataframe
2. Transform: 
    - drop Status, Symbol, Terminated and Decimal columns using 'drop' function 
3. Spilt content of 'Geo' column into 'Cities' and 'Province' by creating a list of list from the da
    - Rename Geo as Cities and blank column as Province 
4. Split the 'Violations' column into 2 columns using numbers at the end of text as crime ID
    - Rename blank column as crime ID
5. Save/load to csv

# Create ERD Diagram
4. Design the ERD

SQL
Create tables
Input csv data
CRUD
 Create a connector using SQLAlchemy or API
Optional: Visualize 



For this track, your group will follow data engineering processes. Here are the specific requirements:
Data must be stored in a SQL or NoSQL database (PostgreSQL, MongoDB, SQLite, etc) and the database must include at least two tables (SQL) or collections (NoSQL).

Your project must use ETL workflows to ingest data into the database (i.e. the data should not be exactly the same as the original source; it should have been transformed in some way).

Your project must include a method for reading data from the database and displaying it for future use, such as:
Pandas DataFrame
Flask API with JSON output
Your project must use one additional library not covered in class related to data engineering. Consider libraries for data streaming, cloud, data pipelines, or data validation.
Your GitHub repo must include a README.md with an outline of the project including:
An overview of the project and its purpose
Instructions on how to use and interact with the project
Documentation of the database used and why (e.g. benefits of SQL or NoSQL for this project)
ETL workflow with diagrams or ERD
At least one paragraph summarizing efforts for ethical considerations made in the project
References for the data source(s)
References for any code used that is not your own
OPTIONAL: add user-driven interaction, either before or after the ETL process. e.g.:
BEFORE: provide a menu of options for the user to narrow the range of data being extracted from a data source (e.g. API or CSV file, where fields are known in advance).
AFTER: Once the data is stored in the database, add user capability to extract filtered data from the database prior to loading it in a Pandas DataFrame or a JSON output from a Flask API.


## READ THE DATABASE CREATED AND PERFORM EXPLORATORY ANALYSIS

# Crime Statistics and related Hate crime Database Analysis

 To validate the usefulness of the database created, we performed exploratory analysis of the transformed Crime statistics database as follows:


* Create a Jupyter notebook for your analysis.
* Create a SQLAlchemy engine to the database `chinook.sqlite`.
* Use `automap_base` to reflect the database tables.