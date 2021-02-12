/*
	FILE: users_permissions_SARS_CoV-2.sql
    AUTHOR: Derrick Nagy
    DATE: 2020-12-17
    
    COMMENTS:
    Create users and roles and permissions for teh SARS_CoV-2 database. 

*/


USE sars_cov_2;


/*
	Create users
*/
-- user that can just view
DROP USER IF EXISTS 'user1';
CREATE USER 'user1'@'%'  -- where the user can log in from, % is from anywhere
IDENTIFIED by 'password'
;

-- user that can create, update, delete new records
DROP USER IF EXISTS 'user2';
CREATE USER 'user2'@'%' 
IDENTIFIED by 'password'

;

-- admin user

DROP USER IF EXISTS 'admin';
CREATE USER 'admin'@'%'
IDENTIFIED BY 'password';

/*
	Create Roles
*/
-- role that can only see views
DROP ROLE IF EXISTS 'viewer';
CREATE ROLE 'viewer';
GRANT USAGE ON sars_cov_2.* TO 'user1';

-- role that can create, read, update, delete
DROP ROLE IF EXISTS 'crud';
CREATE ROLE 'crud';
GRANT INSERT, UPDATE, DELETE, SELECT
ON sars_cov_2.* TO 'user2';


DROP ROLE IF EXISTS 'role_admin';
CREATE ROLE 'role_admin';
GRANT ALL
ON *.* TO 'admin'
WITH GRANT OPTION
;


/*
	Grant roles to the user
*/

GRANT 'viewer' TO 'user1'@'%';
SET DEFAULT ROLE 'viewer' TO 'user1'@'%'; -- users have to have a default role first to get a new role assigned
SHOW GRANTS FOR 'user1'@'%' USING 'viewer';

GRANT 'crud' TO 'user2'@'%';
SET DEFAULT ROLE 'crud' TO 'user2'@'%';
SHOW GRANTS FOR 'user2'@'%' USING 'crud';

GRANT 'role_admin' TO 'admin'@'%';
SET DEFAULT ROLE 'role_admin' TO 'admin'@'%';
SHOw GRANTS FOR 'admin'@'%' USING 'role_admin';

