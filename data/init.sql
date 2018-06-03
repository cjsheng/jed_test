 CREATE TABLE `t` (
 `A` bigint(20) unsigned NOT NULL,
 `B` int(11) DEFAULT NULL,
 `C` float DEFAULT NULL,
 `D` double DEFAULT NULL,
 `E` char(120) DEFAULT NULL,
 `F` varchar(255) DEFAULT NULL,
 `H` date DEFAULT NULL,
 `I` datetime DEFAULT NULL,
 `J` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 `K` tinyint(4) DEFAULT NULL,
 `L` mediumtext
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;



 drop procedure batch_insert;
 delimiter //
 create procedure batch_insert(count int unsigned)
 begin
 declare s int unsigned default 1;
 while s <= count do
 insert into t select FLOOR(RAND() * 10000) , FLOOR(RAND() * 10000), RAND() * 10000, RAND() * 10000, MD5(RAND() * 10000) , MD5(RAND() * 10000), now(), now(), now(),FLOOR(RAND() * 100), MD5(RAND() * 10000);
 set s = s+1;
 end while;
 commit;
 end;
 //
 delimiter ;

 call batch_insert(50000);
 update t set B = null where b > 4500 and b < 4600;
 update t set c = null where c > 500 and c < 600;
 update t set d = null where d > 500 and d < 600;
 update t set e = null where e like 'ab%';
 update t set f = null where f like 'bc%';
 update t set j = null where f like 'cd%';
 update t set k = null where e like 'cd%';


 mysqldump  -uroot -psecret -P3306 -h127.0.0.1 xhh t --compact  --extended-insert=false -c --no-create-info> t.sql
