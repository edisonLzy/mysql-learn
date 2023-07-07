-- 子查询和EXISTS

use hello_mysql;

-- 子查询
-- 查询学生表中成绩最高的学生的姓名和班级名称

SELECT name, class FROM student WHERE score = (SELECT MAX(score) FROM student);

-- EXISTS 

-- 查询: 有员工的部门

-- SELECT * FROM department WHERE EXISTS (SELECT * FROM employee WHERE employee.department_id = department.id);

-- 子查询不止 select 里可以用，insert、update、delete 语句同样可以
CREATE TABLE product (
     id INT PRIMARY KEY,
     name VARCHAR(50),
     price DECIMAL(10,2),
     category VARCHAR(50),
     stock INT
);

INSERT INTO product (id, name, price, category, stock)
	VALUES 
		(1, 'iPhone12',6999.00, '手机',100),
		(2, 'iPad Pro',7999.00, '平板电脑',50),
		(3, 'MacBook Pro',12999.00, '笔记本电脑',30),
		(4, 'AirPods Pro',1999.00, '耳机',200),
		(5, 'Apple Watch',3299.00, '智能手表',80);

-- 查询 价格最高的产品
SELECT name from product WHERE price = (SELECT MAX(price) FROM product);

CREATE TABLE avg_price_by_category (
 id INT AUTO_INCREMENT,
 category VARCHAR(50) NOT NULL,
 avg_price DECIMAL(10,2) NOT NULL,
 PRIMARY KEY (id)
);

-- INSERT 中使用子查询
-- 比如下面要插入的值是 SELECT 的返回结果
INSERT INTO avg_price_by_category (category, avg_price) 
    SELECT category, AVG(price) FROM product GROUP BY category;

select * from avg_price_by_category
