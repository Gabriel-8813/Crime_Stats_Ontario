-- Create Table: Cities
CREATE TABLE "Cities" (
    "City_ID" int NOT NULL,
    "City" varchar UNIQUE NOT NULL,
    CONSTRAINT "pk_Cities" PRIMARY KEY ("City_ID")
);

-- Create Table: Years
CREATE TABLE "Years" (
    "Year_ID" int NOT NULL,
    "Year" varchar UNIQUE NOT NULL,
    CONSTRAINT "pk_Years" PRIMARY KEY ("Year_ID")
);

-- Create Table: Statistic_Types
CREATE TABLE "Statistic_Types" (
    "Stat_Type_ID" int NOT NULL,
    "Statistic_Type" varchar UNIQUE NOT NULL,
    CONSTRAINT "pk_Statistic_Types" PRIMARY KEY ("Stat_Type_ID")
);

-- Create Table: Violations
CREATE TABLE "Violations" (
    "Violation_ID" int NOT NULL,
    "Violation" varchar UNIQUE NOT NULL,
    CONSTRAINT "pk_Violations" PRIMARY KEY ("Violation_ID")
);

-- Create Table: Motivations
CREATE TABLE "Motivations" (
    "Motivation_ID" int NOT NULL,
    "Year" varchar NOT NULL,
    "Motivation" varchar NOT NULL,
    "Value" float NOT NULL,
    CONSTRAINT "pk_Motivations" PRIMARY KEY ("Motivation_ID"),
    CONSTRAINT "fk_Motivations_Year" FOREIGN KEY ("Year") REFERENCES "Years" ("Year")
);

-- Create Table: Crime_Statistics
CREATE TABLE "Crime_Statistics" (
    "Statistic_ID" int NOT NULL,                      -- Unique identifier for rows in this table
    "Year" varchar NOT NULL,                           -- Foreign key to Years
    "City" varchar NOT NULL,                           -- Foreign key to Cities
    "Statistic_detail" varchar NOT NULL,
    "Violation" varchar NOT NULL,                      -- Foreign key to Violations
    "Value" float NOT NULL,
    "Statistic_Type" varchar NOT NULL,                 -- Foreign key to Statistic_Types
    CONSTRAINT "pk_Crime_Statistics" PRIMARY KEY ("Statistic_ID"),
    CONSTRAINT "fk_Crime_Statistics_Year" FOREIGN KEY ("Year") REFERENCES "Years" ("Year"),
    CONSTRAINT "fk_Crime_Statistics_City" FOREIGN KEY ("City") REFERENCES "Cities" ("City"),
    CONSTRAINT "fk_Crime_Statistics_Violation" FOREIGN KEY ("Violation") REFERENCES "Violations" ("Violation"),
    CONSTRAINT "fk_Crime_Statistics_Statistic_Type" FOREIGN KEY ("Statistic_Type") REFERENCES "Statistic_Types" ("Statistic_Type")
);
