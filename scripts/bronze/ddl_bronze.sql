/*

=====================================================================================
DDL Script: Create Bronze Tables
=====================================================================================
Script Purpose:
    This script creates tables in the 'bronze' schema, dropping existing tables
    if they already exist.
    Run this script to re-define the DDL structure of 'bronze' Tables
=====================================================================================
*/

if object_id ('bronze.crm_cust_info', 'U') IS NOT NULL
	Drop Table bronze.crm_cust_info;
GO
  
create table bronze.crm_cust_info (
	cst_id INT,
	cst_key NVARCHAR(50),
	cst_firstname NVARCHAR(50),
	cst_lastname NVARCHAR(50),
	cst_material_status NVARCHAR(50),
	cst_gndr NVARCHAR(50),
	cst_create_date DATE,
);

if object_id ('bronze.crm_prd_info', 'U') IS NOT NULL
	Drop Table bronze.crm_prd_info;
create table bronze.crm_prd_info (
	prd_id INT,
	prd_key NVARCHAR(50),
	prd_nm NVARCHAR(50),
	prd_cost INT,
	prd_line NVARCHAR(50),
	prd_start_dt DATETIME,
	prd_end_dt DATETIME,
);

if object_id ('bronze.crm_sales_details', 'U') IS NOT NULL
	Drop Table bronze.crm_sales_details;
create table bronze.crm_sales_details (
	sls_ord_num NVARCHAR(50),
	sls_prd_key NVARCHAR(50),
	sls_cust_id INT,
	sls_order_dt INT,
	sls_ship_dt INT,
	sls_due_dt INT,
	sls_sales INT,
	sls_quantity INT,
	sls_price INT,
);

if object_id ('bronze.erp_loc_a101', 'U') IS NOT NULL
	Drop Table bronze.erp_loc_a101;
create table bronze.erp_loc_a101 (
	cid NVARCHAR(50),
	cntry NVARCHAR(50),
);

if object_id ('bronze.erp_cust_az12', 'U') IS NOT NULL
	Drop Table bronze.erp_cust_az12;
create table bronze.erp_cust_az12 (
	cid nvarchar(50),
	bdate nvarchar(50),
	gen nvarchar(50),
);

if object_id ('bronze.erp_px_cat_g1v2', 'U') IS NOT NULL
	Drop Table bronze.erp_px_cat_g1v2;
create table bronze.erp_px_cat_g1v2 (
	id nvarchar(50),
	cat nvarchar(50),
	subcat nvarchar(50),
	maintenance nvarchar(50),
);
