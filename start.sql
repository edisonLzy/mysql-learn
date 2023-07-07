-- Active: 1688360143391@@0.0.0.0@3306@hello_mysql

-- 查询指定的列
SELECT name, score FROM student;

-- 修改返回的列名
SELECT name as '名字' FROM student;

-- 条件查询 where
-- 多个条件使用 and 连接

SELECT name, score from student where score > 90 and name = '赵六';

-- 模糊查询 LIKE
-- 比如查询 姓赵的同学并且分数大于90分
SELECT name, score from student where score > 90 and name like '赵%';

-- in 来指定一个集合
-- 比如查询 王五和赵六  并且分数大于90分
SELECT name, score from student where score > 90 and name in ('赵六','王五');

-- not in 
-- 比如查询 出了 王五和赵六 并且分数大于90分
SELECT name, score from student where score > 90 and name not in ('赵六','王五');

-- between and 指定一个区间
-- 比如查询 分数在80到90之间的同学
SELECT * from student where score BETWEEN 80 AND 90;

-- limit 分页
-- 比如 查询 第一页的前5条数据
SELECT * from student limit 0,5;
-- 查询 第二页的前5条数据
SELECT * from student limit 5,5;

-- order by 排序
-- 比如 查询 分数最高的前5个同学,然后再按照 age 升序
SELECT * from student order by score desc, age asc limit 0,5;

-- group by 分组
-- 比如 统计每个班级的平均分, 再按降序排列
-- avg 是用来求平均值的内置函数
SELECT class as '班级', avg(score) as '平均分' from student GROUP BY class ORDER BY '平均分' DESC;

-- 分组之后的过滤使用 HAVING 而不是 WHERE
SELECT class as '班级', avg(score) as '平均分' from student GROUP BY class HAVING AVG(score) > 80;

-- distinct 去重
SELECT DISTINCT class from student;

-- count 统计记录数
-- 统计 每一个班级的人数
select class, count(*) as count from student group by class;

-- max min 求最大值和最小值
-- 比如 每个班级中的最高分和最低分
-- 由于您在查询中使用了聚合函数 MAX() 和 MIN()，需要指定一个分组依据，以便将结果按照某个列进行分组计算。
select class ,max(score) as '最高分', min(score) as '最低分' from student GROUP BY class;

-- IF 条件函数：根据条件是否成立返回不同的值
-- 比如 分数小于 70  则返回 不及格，否则返回及格
select name, score, IF(score < 70, '不及格', '及格') as '是否及格' from student; 
-- CASE 类比 Switch Case 适合多条件
SELECT name, score, CASE WHEN score >=90 THEN '优秀' WHEN score >=60 THEN '良好'ELSE '差' END AS '档次' FROM student;
