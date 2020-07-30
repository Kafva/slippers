--- Create a new MySQL user with `mysql_native_password` authentcation to support the current PHP setup
--- UPDATE user SET plugin='mysql_native_password' WHERE User='maria';

START TRANSACTION;

USE mysql;
CREATE USER IF NOT EXISTS 'maria'@'%' IDENTIFIED BY '';
GRANT ALL PRIVILEGES ON *.* TO 'maria'@'%';
FLUSH PRIVILEGES;


CREATE DATABASE IF NOT EXISTS slippers;
USE slippers;

--- USERS
CREATE TABLE IF NOT EXISTS slippers.`users` 
(
  `id` int(11) NOT NULL PRIMARY KEY,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `loginKey` text NOT NULL,
  `rank` int(1) NOT NULL,
  `banned` int(1) NOT NULL,
  `coins` int(11) NOT NULL,
  `buddies` text NOT NULL,
  `head` int(11) NOT NULL,
  `face` int(11) NOT NULL,
  `neck` int(11) NOT NULL,
  `body` int(11) NOT NULL,
  `hand` int(11) NOT NULL,
  `feet` int(11) NOT NULL,
  `color` int(11) NOT NULL,
  `photo` int(11) NOT NULL,
  `flag` int(11) NOT NULL
); 

--- INVENTORIES
CREATE TABLE IF NOT EXISTS slippers.`inventory`
(
    `userId` int(11) NOT NULL,
    `itemId` int(11) NOT NULL,
    PRIMARY KEY (`userId`,`itemId`) USING BTREE,
    FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);


-- DEFAULT USER:
-- bcrypt.hashpw(b"xDDD",bcrypt.gensalt(14))
INSERT IGNORE INTO slippers.`users` (`id`, `username`, `password`, `loginKey`, `rank`, `banned`, `coins`, `buddies`, `head`, `face`, `neck`, `body`, `hand`, `feet`, `color`, `photo`, `flag`) 
VALUES (1, 'Zzz', '$2b$14$FefGa9CH.AuaUsxGtNHYaO1ByTdOZ2Cx/OMAwXNhs6yCT9UjEHv22', 'SeMBxfklcAQ3MTX', 2, 0, 10000, '[]', 0, 0, 0, 0, 0, 0, 4, 0, 0);

INSERT IGNORE INTO slippers.`users` (`id`, `username`, `password`, `loginKey`, `rank`, `banned`, `coins`, `buddies`, `head`, `face`, `neck`, `body`, `hand`, `feet`, `color`, `photo`, `flag`) 
VALUES (2, 'Blue', '$2b$14$FefGa9CH.AuaUsxGtNHYaO1ByTdOZ2Cx/OMAwXNhs6yCT9UjEHv22', 'SeMBxfklcAQ3MTX', 2, 0, 10000, '[]', 0, 0, 0, 0, 0, 0, 1, 0, 0);

INSERT IGNORE INTO slippers.`users` (`id`, `username`, `password`, `loginKey`, `rank`, `banned`, `coins`, `buddies`, `head`, `face`, `neck`, `body`, `hand`, `feet`, `color`, `photo`, `flag`) 
VALUES (3, 'Cyan', '$2b$14$FefGa9CH.AuaUsxGtNHYaO1ByTdOZ2Cx/OMAwXNhs6yCT9UjEHv22', 'SeMBxfklcAQ3MTX', 2, 0, 10000, '[]', 0, 0, 0, 0, 0, 0, 12, 0, 0);

INSERT IGNORE INTO slippers.`users` (`id`, `username`, `password`, `loginKey`, `rank`, `banned`, `coins`, `buddies`, `head`, `face`, `neck`, `body`, `hand`, `feet`, `color`, `photo`, `flag`) 
VALUES (4, 'Red', '$2b$14$FefGa9CH.AuaUsxGtNHYaO1ByTdOZ2Cx/OMAwXNhs6yCT9UjEHv22', 'SeMBxfklcAQ3MTX', 2, 0, 10000, '[]', 0, 0, 0, 0, 0, 0, 5, 0, 0);

COMMIT;