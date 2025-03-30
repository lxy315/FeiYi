-- 创建数据库
CREATE DATABASE IF NOT EXISTS heritage DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE heritage;

-- 创建用户表
CREATE TABLE IF NOT EXISTS users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20),
    avatar VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 创建非遗项目表
CREATE TABLE IF NOT EXISTS heritage_items (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    category VARCHAR(50),
    region VARCHAR(100),
    image_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 创建产品表
CREATE TABLE IF NOT EXISTS products (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    image_url VARCHAR(255),
    heritage_item_id BIGINT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (heritage_item_id) REFERENCES heritage_items(id)
);

-- 插入测试用户（密码：123456）
INSERT INTO users (username, password, email, phone) VALUES 
('admin', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBpwTTyU7IxG6O', 'admin@example.com', '13800138000');

-- 插入一些非遗项目数据
INSERT INTO heritage_items (name, description, category, region) VALUES 
('萨满文化', '萨满文化是东北地区重要的非物质文化遗产，包含了丰富的民间信仰和仪式。', '民间信仰', '东北地区'),
('满族秧歌', '满族秧歌是满族传统舞蹈艺术，具有独特的表演形式和艺术特色。', '传统舞蹈', '东北地区'),
('二人转', '二人转是东北地区最具代表性的民间艺术形式之一，融合了说唱、表演等多种艺术元素。', '民间艺术', '东北地区');

-- 插入一些产品数据
INSERT INTO products (name, description, price, stock, heritage_item_id) VALUES 
('萨满鼓', '传统手工制作的萨满鼓，用于萨满仪式。', 299.00, 10, 1),
('满族秧歌服装', '传统满族秧歌表演服装，采用传统工艺制作。', 599.00, 5, 2),
('二人转扇子', '二人转表演用扇子，印有传统图案。', 99.00, 20, 3);
