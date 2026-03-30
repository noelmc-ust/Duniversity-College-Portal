-- 01-schema.sql

-- grievance_db
USE grievance_db;
DROP TABLE IF EXISTS grievances;
CREATE TABLE grievances (
  id INT AUTO_INCREMENT PRIMARY KEY,
  student_name VARCHAR(100),
  student_email VARCHAR(100),
  grievance_text TEXT,
  status ENUM('pending', 'accepted', 'rejected') DEFAULT 'pending',
  submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- leave_db
CREATE DATABASE IF NOT EXISTS leave_db;
USE leave_db;
DROP TABLE IF EXISTS leave_requests;
CREATE TABLE leave_requests (
  id INT AUTO_INCREMENT PRIMARY KEY,
  student_name VARCHAR(100),
  roll_no VARCHAR(50),
  reason TEXT,
  from_date DATE,
  to_date DATE,
  status ENUM('pending', 'accepted', 'rejected') DEFAULT 'pending',
  submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- timetable_db
CREATE DATABASE IF NOT EXISTS timetable_db;
USE timetable_db;
DROP TABLE IF EXISTS timetables;
CREATE TABLE timetables (
  id INT AUTO_INCREMENT PRIMARY KEY,
  branch VARCHAR(50) NOT NULL,
  semester VARCHAR(10) NOT NULL,
  timetable_json JSON NOT NULL,
  published_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY unique_branch_sem (branch, semester)
);

-- exams_db
CREATE DATABASE IF NOT EXISTS exams_db;
USE exams_db;
DROP TABLE IF EXISTS exam_schedules;
CREATE TABLE exam_schedules (
  id INT AUTO_INCREMENT PRIMARY KEY,
  branch VARCHAR(50) NOT NULL,
  semester VARCHAR(10) NOT NULL DEFAULT 'all',
  exams_json JSON NOT NULL,
  published_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY unique_branch (branch)
);