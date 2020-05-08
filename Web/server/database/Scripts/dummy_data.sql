/*
    NAME: dummy_data.sql

        DESCRIPTION: Populates tables with dummy data in the strataly database.

        VERSION: Created & Tested using PostgreSQL 12.2
            for 64bit Windows, installed via the
            EnterpriseDB installer.

        README: 
            1. Perform all steps in the init.sql README for the strataly database.
            
            2. While connected to the strataly database.
            
            3. Run the dummy_data.sql script.
                Due to a peculiarity of PSQL on 
                Windows, folders in filepaths must be 
                surrounded by single ' quotations and
                delineated by '/', not the Windows
                default of '\'. Copy the filepath of 
                dummy_data.sql & replace the backslashes.
                    postgres=# \i 'c:/.../Scripts/dummy_data.sql'

                'D:/Users/Workspace/strataly/Web/server/database/Scripts/dummy_data.sql'
*/

-- NOTE: Data needs to be added in dependency order, e.g. strata -> user
-- See the ERD for schema

--POPULATE strata
INSERT INTO strataly_schema.strata (strata_plan_id, strata_name, strata_address, office_address, office_phone, office_email)(
    VALUES
    ('1', 'strata name', 'strata address', 'office address', 'office phone', 'office email'),
    ('2', 'arata name', 'trata address', 'affice address', 'pffice phone', 'affice email')
);

--POPULATE users
INSERT INTO strataly_schema.users (user_id, user_email, user_password, user_name, strata, unit, user_role)(
    VALUES
    (DEFAULT, 'user@email.com', 'usr password', 'Mike Mikenton', '1', 1, 0),
    (DEFAULT, 'second@email.com', 'seconds password', 'greg gregington', '1', 2, 1)
);