/*
===============================================================================

Stored Procedure: Load Bronze Layer (Source - > Bronze)

===============================================================================

Script Purpose:
	This stored procedure loads data from external CSV files into the 'bronze' schema.
	It performs the following actions:
	- It truncates the bronze tables before loading data.
	- Uses the 'BULK INSERT' command to load data from CSV files into bronze tables.

Parameters:
	None: This stored procedure does not accept any parameters or return any values.

Usage example:
	EXEC bronze.load_bronze;
===============================================================================
*/

EXEC bronze.load_bronze

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
	BEGIN TRY
			SET @batch_start_time = GETDATE();
			PRINT '====================================';
			PRINT 'Loading the Bronze Layer';
			PRINT '====================================';

			PRINT '------------------------------------';
			PRINT 'Load CRM Tables';
			PRINT '------------------------------------';

			SET @start_time = GETDATE();
			PRINT '>> Truncating Table: bronze.crm_cust_info';
			TRUNCATE TABLE bronze.crm_cust_info;

			PRINT '>> Inserting Data Into: bronze.crm_cust_info';
			BULK INSERT bronze.crm_cust_info
			FROM 'C:\Users\user\Documents\Data Work\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
			WITH (
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK
			);
			SET @end_time = GETDATE();
			PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
			PRINT '---------------------------------------------------------------------------------------------'


			-- Always validate data quality.

			--SELECT *
			--FROM bronze.crm_cust_info

			--Count the rows

			--SELECT COUNT (*)
			--FROM bronze.crm_cust_info

			---------------------------------------------------------------------

			SET @start_time = GETDATE();
			PRINT '>> Truncating Table: bronze.crm_prd_info';
			TRUNCATE TABLE bronze.crm_prd_info

			PRINT '>> Inserting Data Into: bronze.crm_prd_info';
			BULK INSERT bronze.crm_prd_info
			FROM 'C:\Users\user\Documents\Data Work\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
			WITH (
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK
			);
			SET @end_time = GETDATE();
			PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
			PRINT '---------------------------------------------------------------------------------------------'

			-- Always validate data quality.

			--SELECT *
			--FROM bronze.crm_prd_info

			--Count the rows

			--SELECT COUNT (*)
			--FROM bronze.crm_prd_info

			---------------------------------------------------------------------

			SET @start_time = GETDATE();
			PRINT '>> Truncating Table: bronze.crm_sales_details';
			TRUNCATE TABLE bronze.crm_sales_details

			PRINT '>> Inserting Data Into: bronze.crm_sales_details';
			BULK INSERT bronze.crm_sales_details
			FROM 'C:\Users\user\Documents\Data Work\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
			WITH (
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK
			);
			SET @end_time = GETDATE();
			PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
			PRINT '---------------------------------------------------------------------------------------------'

			-- Always validate data quality.

			--SELECT *
			--FROM bronze.crm_sales_details

			--Count the rows

			--SELECT COUNT (*)
			--FROM bronze.crm_sales_details

			---------------------------------------------------------------------
			---------------------------------------------------------------------
			---------------------------------------------------------------------

			PRINT '------------------------------------';
			PRINT 'Load ERP Tables';
			PRINT '------------------------------------';

			SET @start_time = GETDATE();
			PRINT '>> Truncating Table: bronze.erp_loc_a101';
			TRUNCATE TABLE bronze.erp_loc_a101;

			PRINT '>> Inserting Data Into: bronze.erp_loc_a101'
			BULK INSERT bronze.erp_loc_a101
			FROM 'C:\Users\user\Documents\Data Work\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
			WITH (
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK
			);
			SET @end_time = GETDATE();
			PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
			PRINT '---------------------------------------------------------------------------------------------'

			-- Always validate data quality.

			--SELECT *
			--FROM bronze.erp_loc_a101

			--Count the rows

			--SELECT COUNT (*)
			--FROM bronze.erp_loc_a101

			---------------------------------------------------------------------
			SET @start_time = GETDATE();
			PRINT 'Truncating Table: bronze.erp_cust_az12';
			TRUNCATE TABLE bronze.erp_cust_az12;

			PRINT '>> Inserting Data Into: bronze.erp_cust_az12';
			BULK INSERT bronze.erp_cust_az12
			FROM 'C:\Users\user\Documents\Data Work\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
			WITH (
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK
			);
			SET @end_time = GETDATE();
			PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
			PRINT '---------------------------------------------------------------------------------------------'

			-- Always validate data quality.

			--SELECT *
			--FROM bronze.erp_cust_az12

			--Count the rows

			--SELECT COUNT (*)
			--FROM bronze.erp_cust_az12

			---------------------------------------------------------------------
			SET @start_time = GETDATE();
			PRINT '>> Truncating Table: bronze.erp_px_cat_g1v2';
			TRUNCATE TABLE bronze.erp_px_cat_g1v2;

			PRINT '>> Inserting Data Into: bronze.erp_px_cat_g1v2';
			BULK INSERT bronze.erp_px_cat_g1v2
			FROM 'C:\Users\user\Documents\Data Work\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
			WITH (
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK
			);
			SET @end_time = GETDATE();
			PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
			PRINT '---------------------------------------------------------------------------------------------'

			SET @batch_end_time = GETDATE();
			PRINT '================================';
			PRINT 'Loading Bronze Layer is Completed';
			PRINT '	-	Total Load Duration: ' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
			PRINT '================================';
			-- Always validate data quality.

			--SELECT *
			--FROM bronze.erp_px_cat_g1v2

			--Count the rows

			--SELECT COUNT (*)
			--FROM bronze.erp_px_cat_g1v2

			---------------------------------------------------------------------
	END TRY
	BEGIN CATCH
		PRINT '===================================';
		PRINT 'ERROR OCCURRED DURING LOADING BRONZE LAYER';
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '===================================';
		--Track ETL Duration to help identify bottlenecks, optimize performance, monitor trends and detect issues.
	END CATCH
END
