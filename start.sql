-- Active: 1688360143391@@0.0.0.0@3306@hello_mysql

# 查询指定的列
SELECT name, score FROM student;

# 修改返回的列名
SELECT name as '名字' FROM student;

# 条件查询 where
# 多个条件使用 and 连接

SELECT name, score from student where score > 90 and name = '赵六';

# 模糊查询 LIKE
# 比如查询 姓赵的同学并且分数大于90分
SELECT name, score from student where score > 90 and name like '赵%';

# in 来指定一个集合
# 比如查询 王五和赵六  并且分数大于90分
SELECT name, score from student where score > 90 and name in ('赵六','王五');

# not in 
# 比如查询 出了 王五和赵六 并且分数大于90分
SELECT name, score from student where score > 90 and name not in ('赵六','王五');

# between and 指定一个区间
# 比如查询 分数在80到90之间的同学
SELECT * from student where score BETWEEN 80 AND 90;

# limit 分页
# 比如 查询 第一页的前5条数据
SELECT * from student limit 0,5;
# 查询 第二页的前5条数据
SELECT * from student limit 5,5;

# order by 排序
# 比如 查询 分数最高的前5个同学,然后再按照 age 升序
SELECT * from student order by score desc, age asc limit 0,5;