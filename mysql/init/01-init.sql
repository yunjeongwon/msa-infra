-- 추가 DB 생성
CREATE DATABASE IF NOT EXISTS board_db;
CREATE DATABASE IF NOT EXISTS point_db;

-- 서비스별 계정 생성
CREATE USER IF NOT EXISTS 'user_service'@'%' IDENTIFIED BY 'user_pw';
CREATE USER IF NOT EXISTS 'board_service'@'%' IDENTIFIED BY 'board_pw';
CREATE USER IF NOT EXISTS 'point_service'@'%' IDENTIFIED BY 'point_pw';

-- 권한 부여
GRANT ALL PRIVILEGES ON user_db.* TO 'user_service'@'%';
GRANT ALL PRIVILEGES ON board_db.* TO 'board_service'@'%';
GRANT ALL PRIVILEGES ON point_db.* TO 'point_service'@'%';

FLUSH PRIVILEGES;