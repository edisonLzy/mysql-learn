-- 多对多关系 通常需要一个中间表, 用于存储两个表的外键. 需要建立关系的两个表无需添加外键.

use hello_mysql;

-- 创建文章表

CREATE TABLE
    `article` (
        `id` INT NOT NULL AUTO_INCREMENT,
        `title` VARCHAR(50) NOT NULL,
        `content` TEXT NOT NULL,
        PRIMARY KEY (`id`)
    ) CHARSET = utf8mb4;

INSERT INTO
    `article` (`title`, `content`)
VALUES ('文章1', '这是文章1的内容。'), ('文章2', '这是文章2的内容。'), ('文章3', '这是文章3的内容。'), ('文章4', '这是文章4的内容。'), ('文章5', '这是文章5的内容。');

-- 创建标签表

CREATE TABLE
    `tag` (
        `id` INT NOT NULL AUTO_INCREMENT,
        `name` VARCHAR(50) NOT NULL,
        PRIMARY KEY (`id`)
    );

INSERT INTO `tag` (`name`)
VALUES ('标签1'), ('标签2'), ('标签3'), ('标签4'), ('标签5');

INSERT INTO
    `relationship` (`article_id`, `tag_id`)
VALUES (1, 1), (1, 2), (1, 3), (2, 2), (2, 3), (2, 4), (3, 3), (3, 4), (3, 5), (4, 4), (4, 5), (4, 1), (5, 5), (5, 1), (5, 2);

-- 查询文章1的标签, FROM 表名 别名
SELECT *
FROM article a
    JOIN relationship r ON a.id = r.article_id
    JOIN tag t ON t.id = r.tag_id
WHERE a.id = 1;

delete from article where id = 1;
