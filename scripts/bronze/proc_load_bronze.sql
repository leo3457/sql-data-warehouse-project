/*

=======================================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
=======================================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files.
    It performs the following actions:
    - Truncates the bronze tables before loading the data.
    - Uses the 'Bulk Insert' command to load data from csv Files to bronze tables.

Parameters:
    None.
    This stored procedure does not accept any parameters or return any values.

Usage Example:
  Exec bronze.load_bronze;
=======================================================================================
*/

create or alter procedure bronze.load_bronze as
begin

	declare @start_time DATETIME, @end_time datetime, @batch_start_time DATETIME, @batch_end_time DATETIME;
	begin try

		set @batch_start_time = getdate();
		print '=====================================';
		print 'Loading Bronze Layer';
		print '=====================================';

		print '-------------------------------------';
		print 'Loading CRM Tables';
		print '-------------------------------------';


		set @start_time = getdate();
		print '>> Truncating Table: bronze.crm_cust_info';
		truncate table bronze.crm_cust_info;

		print '>> Inserting Data Into: bronze.crm_cust_info';
		bulk insert bronze.crm_cust_info
		from 'C:\Users\stude\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE();
		print '>> Load Duration: ' + cast(datediff(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		print '>>-----------------'

		set @start_time = getdate();
		print '>> Truncating Table: bronze.crm_prd_info';
		truncate table bronze.crm_prd_info;

		print '>> Inserting Data Into: bronze.crm_cust_info';
		bulk insert bronze.crm_prd_info
		from 'C:\Users\stude\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE();
		print '>> Load Duration: ' + cast(datediff(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		print '>>-----------------'

		set @start_time = getdate();
		print '>> Truncating Table: bronze.crm_sales_details';
		truncate table bronze.crm_sales_details;

		print '>> Inserting Data Into: bronze.crm_sales_details';
		bulk insert bronze.crm_sales_details
		from 'C:\Users\stude\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE();
		print '>> Load Duration: ' + cast(datediff(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		print '>>-----------------'

		print '-------------------------------------';
		print 'Loading ERP Tables';
		print '-------------------------------------';

		set @start_time = getdate();
		print '>> Truncating Table: bronze.erp_cust_az12';
		truncate table bronze.erp_cust_az12;

		print '>> Inserting Data Into: bronze.erp_cust_az12';
		bulk insert bronze.erp_cust_az12
		from 'C:\Users\stude\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE();
		print '>> Load Duration: ' + cast(datediff(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		print '>>-----------------'

		set @start_time = getdate();
		print '>> Truncating Table: bronze.erp_loc_a101';
		truncate table bronze.erp_loc_a101;
	
		print '>> Inserting Data Into: bronze.erp_loc_a101';
		bulk insert bronze.erp_loc_a101
		from 'C:\Users\stude\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE();
		print '>> Load Duration: ' + cast(datediff(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		print '>>-----------------'

		set @start_time = getdate();
		print '>> Truncating Table: bronze.erp_px_cat_g1v2';
		truncate table bronze.erp_px_cat_g1v2;

		print '>> Inserting Data Into: bronze.erp_px_cat_g1v2';
		bulk insert bronze.erp_px_cat_g1v2
		from 'C:\Users\stude\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE();
		print '>> Load Duration: ' + cast(datediff(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		print '>>-----------------'

		set @batch_end_time = GETDATE();
		print '===========================================';
		print 'Loading Bronze Layer is Completed';
		print '   - Total Load Duration: ' + Cast(datediff(second, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
		print '===========================================';
	
	end try

	begin catch
		print '===========================================';
		print 'ERROR OCCURED DURING LOADING BRONZE LAYER';
		PRINT 'ERROR MESSAGE' + ERROR_MESSAGE();
		PRINT 'ERROR MESSAGE' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'ERROR MESSAGE' + CAST(ERROR_STATE() AS NVARCHAR);
		print '===========================================';
	end catch

end
