--Create database 'DataWarehouse'

USE master;
GO

--Drop and recreate the 'Data Warehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
  ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
  DROP DATABASE DataWarehouse;
END;
GO

--Create database 'DataWarehouse'
CREATE DATABASE DataWarehouse;

USE DataWarehouse;

CREATE SCHEMA Bronze;
GO --SEPARATES WHEN WORKING WITH MULTIPLE SCHEMAS
  
CREATE SCHEMA Silver;
GO
  
CREATE SCHEMA Gold;
GO
