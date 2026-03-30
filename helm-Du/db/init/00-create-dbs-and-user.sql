-- 00-create-dbs-and-user.sql

-- Create databases
CREATE DATABASE IF NOT EXISTS grievance_db;
CREATE DATABASE IF NOT EXISTS leave_db;
CREATE DATABASE IF NOT EXISTS timetable_db;
CREATE DATABASE IF NOT EXISTS exams_db;

-- Create user for backend (idempotent)
CREATE USER IF NOT EXISTS 'college_user'@'%' IDENTIFIED BY 'deereddy@123';

-- Grant privileges on all service DBs
GRANT ALL PRIVILEGES ON grievance_db.* TO 'college_user'@'%';
GRANT ALL PRIVILEGES ON leave_db.*     TO 'college_user'@'%';
GRANT ALL PRIVILEGES ON timetable_db.* TO 'college_user'@'%';
GRANT ALL PRIVILEGES ON exams_db.*     TO 'college_user'@'%';
FLUSH PRIVILEGES;