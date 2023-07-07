INSERT INTO `user` (`name`)
VALUES ('张三'), ('李四'), ('王五'), ('赵六'), ('孙七'), ('周八'), ('吴九'), ('郑十'), ('钱十一'), ('陈十二');

SELECT * FROM user;

INSERT INTO id_card (card_name, user_id) 
    VALUES
        ('110101199001011234',1),
	('310101199002022345',2),
	('440101199003033456',3),
	('440301199004044567',4),
	('510101199005055678',5),
	('330101199006066789',6),
	('320101199007077890',7),
	('500101199008088901',8),
	('420101199009099012',9),
	('610101199010101023',10);


-- JOIN <table_name> ON <condition>: 多表关联查询
-- 比如 下方的sql 用于查询用户的身份证信息
SELECT user.id , name, id_card.id as card_id, card_name  from user JOIN id_card ON user.id = id_card.user_id;

-- INNER JOIN: 默认的关联查询方式, 只返回两个表中能关联上的数据
-- 我们先删除了 id_card中的最后两条数据的 user_id, 然后再次执行上面的sql, 可以看到只返回了8条数据
SELECT user.id , name, id_card.id as card_id, card_name  from user INNER JOIN id_card ON user.id = id_card.user_id;

-- LEFT JOIN 是额外返回左表中没有关联上的数据
-- 在 FROM 后的是左表，JOIN 后的表是右表, 也就是结果还是 10条数据, 只是最后两条数据的 card_id 和 card_name 为 NULL
SELECT user.id , name, id_card.id as card_id, card_name  from user LEFT JOIN id_card ON user.id = id_card.user_id;

-- RIGHT JOIN 是额外返回右表中没有关联上的数据
-- 结果还是 10条数据, 只是最后两条数据的 id 和 name 为 NUL
SELECT user.id , name, id_card.id as card_id, card_name  from user RIGHT JOIN id_card ON user.id = id_card.user_id;

-- UPDATE ACTION 和 DELETE ACTION
-- CASCADE： 主表主键更新，从表关联记录的外键跟着更新，主表记录删除，从表关联记录删除
-- SET NULL：主表主键更新或者主表记录删除，从表关联记录的外键设置为 null
-- RESTRICT：只有没有从表的关联记录时，才允许删除主表记录或者更新主表记录的主键 id
-- NO ACTION： 同 RESTRICT，只是 sql 标准里分了 4 种，但 mysql 里 NO ACTION 等同于 RESTRICT。
