NAME: init.sql

    DESCRIPTION: Creates a database and table
        structure for Strataly.

    VERSION: Created & Tested using PostgreSQL 12.2
        for 64bit Windows, installed via the
        EnterpriseDB installer.

    README: This readme section will detail a step 
        by step for executing this file with the 
        psql CLI tool for PostgreSQL. There are 
        several 'gotchas' using psql on Windows and
        I have done my best to address them here.

        1. Install PostgreSQL 12.2 & Tools.
            https://www.enterprisedb.com/downloads/postgres-postgresql-downloads

        2. Connect to the default server via PSQL.
            On Windows, you must first change
            the active console code page to match 
            that of PSQL, i.e. 1252 for en-au or en-us locales.
                c:\> chcp 1252
            Then connect to the server using the
            default user & db credentials you setup
            during the installation. The defaults
            are 'postgres' for both username & db.
                c:\> psql -U 'username' -d 'database'
            
        3. Create the strataly database.
	    This will create a database named strataly and generate
	    a user with the db creators username & password.
		postgres=# CREATE DATABASE strataly;
        
        4. Connect to the strataly database.
	    	postgres=# \c strataly

	5. Run the script.
            Due to another peculiarity of PSQL on 
            Windows, folders in filepaths must be 
            surrounded by single ' quotations and
            delineated by '/', not the Windows
            default of '\'. Copy the filepath of 
            init.sql & replace the backslashes.
                postgres=# \i 'c:/.../Scripts/init.sql'
	
	6. Enjoy!

OPTIONAL:
	7. To generate dummy data, execute the dummy_data.sql script.
	8. While connected to the database, run:
		postgres=# \i 'c:/.../Scripts/dummy_data.sql'
	   Making sure to replace all '\' in the path with '/'
	   and change the path to where you stored the file on
	   your machine.


Here are some useful PSQL commands:
	\list - list all databases
	\c - connect to a database, i.e.
		\c strataly
	\dn - List schema in the current database
	\dt - List tables, i.e.
		\dt strataly_schema.*

	\conninfo - Get connection details, e.g. PORT number

	\? - Help with PSQL
	\q - Quit PSQL

Here are some useful SQL queries:
	SELECT - Can be used to pull data from a table, i.e.
		SELECT * FROM strataly_schema.insert_table_name_here;
	DROP - Can be used to drop tables or schema. Schema and tables can 
		be re-generated	via the init.sql script
		
		DROP SCHEMA strataly CASCADE; -- CASCADE is used to drop schema dependants
	'or
		DROP TABLE strataly_schema.users;
