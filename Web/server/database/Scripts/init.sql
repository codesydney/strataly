/*
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

                    'D:/Users/Workspace/strataly/Database/Scripts/init.sql'
        
        6. Enjoy!



    TODO: Need a way to check if database exists before executing script.
            Probably have to do with server-side logic.
    
    TODO: Finish all the constraints.

            

*/

-- Generate Schema
CREATE SCHEMA IF NOT EXISTS strataly_schema;

-- Create strata table
    -- TODO: when we have more information about strata plan ids,
    --          may need to impose CHECK constraint.
    -- TODO: office_phone needs proper CHECK constraints. Also, may need
    --          an area code field.
    -- TODO: office_email requires CHECK constraint for email address
CREATE TABLE IF NOT EXISTS strataly_schema.strata(
    strata_plan_id TEXT PRIMARY KEY,
    strata_name TEXT,
    strata_address TEXT,
    office_address TEXT,
    office_phone TEXT, --CHECK(office_phone ~'\d*'),
    office_email TEXT --CHECK()
);

-- CREATE roles table
CREATE TABLE IF NOT EXISTS strataly_schema.roles(
    role_name TEXT PRIMARY KEY CHECK(role_name IN ('owner', 'strata manager', 'building manager', 'tenant')),
    role_description TEXT NOT NULL
);

-- CREATE users table
    -- TODO: email needs a CHECK constraint
    -- TODO: user_password needs some kind of encryption
    -- TODO: user_role needs a default?
CREATE TABLE IF NOT EXISTS strataly_schema.users(
    user_id SERIAL PRIMARY KEY,
    user_email TEXT NOT NULL, -- CHECK(),
    user_password TEXT NOT NULL,
    user_name TEXT,
    strata TEXT NOT NULL REFERENCES strataly_schema.strata(strata_plan_id),
    unit INTEGER NOT NULL,
    user_role TEXT NOT NULL REFERENCES strataly_schema.roles(role_name)
);

-- CREATE issues table
CREATE TABLE IF NOT EXISTS strataly_schema.issues(
    issue_number SERIAL PRIMARY KEY,
    issue_title TEXT NOT NULL,
    issue_description TEXT NOT NULL,
    user_id INTEGER NOT NULL REFERENCES strataly_schema.users(user_id),
    issue_status TEXT NOT NULL CHECK(issue_status IN ('submitted', 'accepted', 'addressing', 'closed', 'rejected')) DEFAULT 'submitted',
    create_time TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- CREATE issue_comments table
    -- NOTE:
    --      * Maybe PK should be comment_number + issue_number
CREATE TABLE IF NOT EXISTS strataly_schema.issue_comments(
    comment_number SERIAL PRIMARY KEY,
    comment TEXT NOT NULL,
    user_id INTEGER NOT NULL REFERENCES strataly_schema.users(user_id),
    issue_number INTEGER NOT NULL REFERENCES strataly_schema.issues(issue_number),
    comment_time TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- CREATE issue_files table
CREATE TABLE IF NOT EXISTS strataly_schema.issue_files(
    file_number SERIAL PRIMARY KEY,
    file_description TEXT,
    file_bytea BYTEA NOT NULL,
    user_id INTEGER NOT NULL REFERENCES strataly_schema.users(user_id),
    issue_number INTEGER NOT NULL REFERENCES strataly_schema.issues(issue_number),
    upload_time TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);


-- POPULATE static table, i.e. strataly_schema.roles
    -- 
INSERT INTO strataly_schema.roles (role_name, role_description)(
    VALUES 
    ('owner', 'The owner of the property'),
    ('strata manager', 'The manager of the strata'),
    ('building manager', 'The building manager'),
    ('tenant', 'the current tenant of a unit')
);

-- CREATE user 'xpress_server'. This user account is used by
    -- the backend code to query the db. It has limited permissions.
CREATE USER xpress_server 
    WITH 
        PASSWORD 'password'
        NOSUPERUSER
        NOCREATEDB
        NOCREATEROLE;
GRANT CONNECT ON DATABASE strataly TO xpress_server;
GRANT USAGE ON SCHEMA strataly_schema TO xpress_server;
GRANT SELECT ON ALL TABLES IN SCHEMA strataly_schema TO xpress_server;
GRANT INSERT ON ALL TABLES IN SCHEMA strataly_schema TO xpress_server;
GRANT DELETE ON ALL TABLES IN SCHEMA strataly_schema TO xpress_server;