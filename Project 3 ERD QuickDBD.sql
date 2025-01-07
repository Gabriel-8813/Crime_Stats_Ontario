-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [HateStats] (
    [ID] SERIAL  NOT NULL ,
    [Year] INT  NOT NULL ,
    [Hate_Crime] VARCHAR  NOT NULL ,
    [Hate_crime_count] INT  NOT NULL ,
    [location] int  NOT NULL ,
    CONSTRAINT [PK_HateStats] PRIMARY KEY CLUSTERED (
        [ID] ASC
    )
)

CREATE TABLE [CrimeStats] (
    [ID] SERIAL  NOT NULL ,
    [Year] INT  NOT NULL ,
    [Cities] VARCHAR  NOT NULL ,
    [Violation] VARCHAR  NOT NULL ,
    [Crime_incidents] DOUBLE  NOT NULL ,
    [locationYear_id] int  NOT NULL ,
    [Violation_ID] int  NOT NULL ,
    CONSTRAINT [PK_CrimeStats] PRIMARY KEY CLUSTERED (
        [ID] ASC
    )
)

CREATE TABLE [CrimeRates] (
    [ID] serial  NOT NULL ,
    [Year] INT  NOT NULL ,
    [Province] VARCHAR  NOT NULL ,
    [Cities] VARCHAR  NOT NULL ,
    [City_ID] VARCHAR  NOT NULL ,
    [Violation] VARCHAR  NOT NULL ,
    [Violation_ID] INT  NOT NULL ,
    [Statistics] VARCHAR  NOT NULL ,
    [Crime_rate] DOUBLE  NOT NULL ,
    [location_year] VARCHAR  NOT NULL ,
    CONSTRAINT [PK_CrimeRates] PRIMARY KEY CLUSTERED (
        [ID] ASC
    )
)

CREATE TABLE [location_year] (
    [ID] serial  NOT NULL ,
    [Year] INT  NOT NULL ,
    [Province] VARCHAR  NOT NULL ,
    [Cities] VARCHAR  NOT NULL ,
    CONSTRAINT [PK_location_year] PRIMARY KEY CLUSTERED (
        [ID] ASC
    )
)

ALTER TABLE [HateStats] WITH CHECK ADD CONSTRAINT [FK_HateStats_Year] FOREIGN KEY([Year])
REFERENCES [location_year] ([ID])

ALTER TABLE [HateStats] CHECK CONSTRAINT [FK_HateStats_Year]

ALTER TABLE [HateStats] WITH CHECK ADD CONSTRAINT [FK_HateStats_location] FOREIGN KEY([location])
REFERENCES [HateStats] ([ID])

ALTER TABLE [HateStats] CHECK CONSTRAINT [FK_HateStats_location]

ALTER TABLE [CrimeStats] WITH CHECK ADD CONSTRAINT [FK_CrimeStats_locationYear_id] FOREIGN KEY([locationYear_id])
REFERENCES [location_year] ([ID])

ALTER TABLE [CrimeStats] CHECK CONSTRAINT [FK_CrimeStats_locationYear_id]

ALTER TABLE [CrimeStats] WITH CHECK ADD CONSTRAINT [FK_CrimeStats_Violation_ID] FOREIGN KEY([Violation_ID])
REFERENCES [HateStats] ([ID])

ALTER TABLE [CrimeStats] CHECK CONSTRAINT [FK_CrimeStats_Violation_ID]

ALTER TABLE [CrimeRates] WITH CHECK ADD CONSTRAINT [FK_CrimeRates_Violation_ID] FOREIGN KEY([Violation_ID])
REFERENCES [HateStats] ([ID])

ALTER TABLE [CrimeRates] CHECK CONSTRAINT [FK_CrimeRates_Violation_ID]

ALTER TABLE [CrimeRates] WITH CHECK ADD CONSTRAINT [FK_CrimeRates_location_year] FOREIGN KEY([location_year])
REFERENCES [location_year] ([ID])

ALTER TABLE [CrimeRates] CHECK CONSTRAINT [FK_CrimeRates_location_year]

COMMIT TRANSACTION QUICKDBD