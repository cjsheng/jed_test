package cases;

import conn.Conn;
import diff.Diff;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Created by xuhaihua on 17-3-18.
 */

/**
 * Extream cases
 *
 *保留两位小数精度情况下
 sql select max(A), min(A), avg(A), count(A),  max(B), min(B), avg(B), count(B),  max(C), min(C), avg(C), count(C), max(D), min(D), avg(D), count(D), max(K), min(K), avg(K), count(D) from t group by I pass ok !
 float not same lhs:4997.374989583333	rhs:4997.375
 lrow 	9774	77	4997.374989583333
 rrow 	9774	77	4997.375
 *
 *
 *
 {
 "sharded": true,
 "vindexes": {
 "hash": {
 "type": "hash"
 }
 },
 "tables": {
 "t": {
 "column_vindexes": [
 {
 "column": "E",
 "name": "hash"
 }
 ]
 }
 }
 }

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


 alter table add column id int(20) primary key;

 * */
public class Aggre implements Runnable {
    private static String[] aggreCases = {
            "select k, count(k), sum(k) from t group by k;",
            "select * from t order by I desc, E limit 1000",
            "select * from t order by E  asc, B limit 4995, 10",
            "select *  from t where A = 5 group by A   limit 5, 5",
            "select * from t group by A order by a asc limit 1",
            "select * from t group by E, F, A, B limit 135",
            "select * from t group by F , E ",
            "select * from t order by E desc, A asc",
            "select * from t order by F desc, E asc",
            "select B, max(A), min(A), avg(A), count(A),  max(B), min(B), avg(B), count(B),  max(C), min(C), avg(C), count(C), max(D), min(D), avg(D), count(D), max(K), min(K), avg(K), count(D) from t group by B, A",
            "select B, max(A), min(A), avg(A), count(A),  max(B), min(B), avg(B), count(B),  max(C), min(C), avg(C), count(C), max(D), min(D), avg(D), count(D), max(K), min(K), avg(K), count(D) from t group by B",

            "select A,  max(D), min(D), avg(D), count(D), count(D) from t where A = 352",
            "select A,  max(D), min(D), avg(D), count(D), count(D) from t where A = 353",
            "select A,  max(D), min(D), avg(D), count(D), count(D) from t where A = 354",
            "select A,  max(D), min(D), avg(D), count(D), count(D) from t where A = 354 group by A",
            "select A,  max(D), min(D), avg(D), count(D), count(D) from t group by A",


            "select * from t order by A, B limit 1",
            "select *  from t group by A, B limit 10",
            "select *  from t group by A limit 0, 1",
            "select *  from t group by A limit 0, 10",
            "select *  from t group by A order by A limit 1, 1",
            "select *  from t group by A limit 1, 10",
            "select a, b  from t group by A , b limit 10, 10",
            "select a, b  from t group by A, B order by a, b limit 10, 10",
            "select a, b  from t group by A, B order by a asc , b desc limit 10, 10",
            "select *  from t group by A, B limit 900, 10",

            "select *  from t group by A, E limit 5000",
            "select *  from t group by A, F limit 5000, 10",
            "select * from t order by E, A  limit 10",
            "select * from t order by E limit 10, 10",
            "select * from t  where A is not null order by A, B  limit 900, 10",
            "select * from t where A is not null order by A, C  limit 5000",
            "select * from t where A is not null order by C, A  limit 4995, 10",
            "select * from t where A is not null order by A, D limit 5000, 10",
            "select * from t where A is not null order by D, A  desc limit 10",
            "select * from t where A is not null order by A, E  desc limit 10, 10",
            "select * from t where A is not null order by E, A  desc limit 900, 10",
            "select * from t where A is not null order by A, F  desc limit 5000",
            "select * from t where A is not null order by F, A  desc limit 4995, 10",
            "select * from t where A is not null order by A, K  desc limit 5000, 10",
            "select * from t where A is not null order by K, A  desc limit 5000, 10",
            "select * from t where A is not null order by A, H  desc limit 5000, 10",
            "select * from t where A is not null order by H, A  desc limit 5000, 10",
            "select * from t where A is not null order by A, J  desc limit 5000, 10",
            "select * from t where A is not null order by J, K  desc limit 5000, 10",

            "select * from t order by B, A  limit 10",
            "select * from t order by B, F  limit 10, 10",
            "select * from t order by B, J, A  limit 10, 1",
            "select * from t order by B,  L  limit 10, 10",
            "select * from t order by B, L  limit 60, 10",
            "select * from t order by B,  L  limit 10, 100",
            "select * from t order by B, C  limit 900, 10",
            "select * from t where b is not null order by B, A, C  limit 5000",
            "select * from t where b is not null order by B, C, A  limit 4995, 10",
            "select * from t where b is not null order by B, L  limit 5000, 10",

            "select * from t order by B desc ,C  limit 10",
            "select * from t order by B,C desc limit 10",
            "select * from t order by B  desc, A limit 10, 10",
            "select * from t order by B  desc, L limit 900, 10",
            "select * from t order by B  desc, L desc limit 5000",
            "select * from t order by B  desc, C limit 4995, 10",
            "select * from t order by B  desc, D desc limit 5000, 10",

            "select * from t order by C desc limit 10",
            "select * from t order by C desc limit 10",
            "select * from t order by C  desc limit 10, 10",
            "select * from t order by C  desc limit 900, 10",
            "select * from t order by C  desc, D ASC, E limit 5000",
            "select * from t order by C  desc, B limit 4995, 10",
            "select * from t order by C  desc limit 5000, 10",


            "select * from t order by C asc, A, B limit 10",
            "select * from t order by C asc, B limit 10",
            "select * from t order by C  asc, D limit 10, 10",
            "select * from t order by C  asc, A, B limit 900, 10",
            "select * from t order by C  asc, F limit 5000",
            "select * from t order by C  asc, B, H limit 4995, 10",
            "select * from t order by C  asc limit 5000, 10",

            "select * from t order by D desc, E limit 10",
            "select * from t order by D  desc, E limit 10, 10",
            "select * from t order by D  desc, E asc limit 900, 10",
            "select * from t order by D  desc, A asc, B limit 5000",
            "select * from t order by D  desc, B limit 4995, 10",
            "select * from t order by D  desc, E limit 5000, 10",


            "select * from t order by D asc , E asc limit 10",
            "select * from t order by D asc, E asc limit 10",
            "select * from t order by D asc, B limit 10",
            "select * from t order by D  asc, E limit 10, 10",
            "select * from t order by D  asc limit 900, 10",
            "select * from t order by D  asc, E limit 5000",
            "select * from t order by D  asc, B limit 4995, 10",
            "select * from t order by D  asc, E limit 5000, 10",


            "select * from t order by E desc limit 10",
            "select * from t order by E  desc limit 10, 10",
            "select * from t order by E  desc limit 900, 10",
            "select * from t order by E  desc, A limit 5000",
            "select * from t order by E  desc, B limit 4995, 10",
            "select * from t order by E  desc limit 5000, 10",

            "select * from t order by E asc limit 10",
            "select * from t order by E asc, B limit 10",
            "select * from t order by E  asc, D limit 10, 10",
            "select * from t order by E  asc limit 900, 10",
            "select * from t order by E, F  asc limit 5000",
            "select * from t order by E  asc, B limit 4995, 10",
            "select * from t order by E  asc limit 5000, 10",


            "select * from t order by I desc, E limit 1000",
            "select * from t order by I desc, E limit 2000",
            "select * from t order by I desc, E limit 3000",

            "select max(A), min(A), avg(A), count(A),  max(B), min(B), avg(B), count(B),  max(C), min(C), avg(C), count(C), max(D), min(D), avg(D), count(D), max(K), min(K), avg(K), count(D) from t",
            "select max(A), min(A), avg(A), count(A),  max(B), min(B), avg(B), count(B),  max(C), min(C), avg(C), count(C), max(D), min(D), avg(D), count(D), max(K), min(K), avg(K), count(D) from t group by A limit 10",
            "select  A, avg(D) from t where A = 354",
            "select max(D),  avg(D), max(D) from t where A = 354",
            "select  A, avg(D), sum(D), count(D), min(D), max(D) from t where A = 354",
            "select  A, avg(D) from t group by A",
            "select  max(D), min(D), avg(D), count(D), count(D) from t group by A",

            "select max(A), min(A), avg(A), count(A),  max(B), min(B), avg(B), count(B),  max(C), min(C), avg(C), count(C), max(D), min(D), avg(D), count(D), max(K), min(K), avg(K), count(D) from t group by A",
            "select max(A), min(A), avg(A), count(A),  max(B), min(B), avg(B), count(B),  max(C), min(C), avg(C), count(C), max(D), min(D), avg(D), count(D), max(K), min(K), avg(K), count(D) from t group by B",
            "select max(A), min(A), avg(A), count(A),  max(B), min(B), avg(B), count(B),  max(C), min(C), avg(C), count(C), max(D), min(D), avg(D), count(D), max(K), min(K), avg(K), count(D) from t group by C",
            "select max(A), min(A), avg(A), count(A),  max(B), min(B), avg(B), count(B),  max(C), min(C), avg(C), count(C), max(D), min(D), avg(D), count(D), max(K), min(K), avg(K), count(D) from t group by D",
            "select max(A), min(A), avg(A), count(A),  max(B), min(B), avg(B), count(B),  max(C), min(C), avg(C), count(C), max(D), min(D), avg(D), count(D), max(K), min(K), avg(K), count(D) from t group by I",
            "select max(A), min(A), avg(A), count(A),  max(B), min(B), avg(B), count(B),  max(C), min(C), avg(C), count(C), max(D), min(D), avg(D), count(D), max(K), min(K), avg(K), count(D) from t group by K",

            "select count(1) from t",
            "select count(1) from t where B is not null",
            "select count(*) from t",
            "select count(*) from t where B is not null",

            "select sum(A) from t group by K order by k",
            "select sum(A), sum(B),sum(c), sum(D), max(A), min(A), avg(A), count(A),  max(B), min(B), avg(B), count(B),  max(C), min(C), avg(C), count(C), max(D), min(D), avg(D), count(D), max(K), min(K), avg(K), count(D) from t group by K order by k",


    };

    public void run() {
        aggreTest();
    }

    private void aggreTest() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        Connection gumConn = Conn.getConn("jdbc:mysql://127.0.0.1:15306/test_keyspace", "mysql_rw", "mysql_password");
        Connection myConn = Conn.getConn("jdbc:mysql://127.0.0.1:3306/xhh", "root", "secret");

        for (int i =0; i < aggreCases.length; i++) {
            Statement gumStmt = null;
            Statement myStmt = null;
            try {
                gumStmt = gumConn.createStatement();
                myStmt = myConn.createStatement();
            } catch (SQLException e) {
                e.printStackTrace();
            }

            try {
                ResultSet gumRs = gumStmt.executeQuery(aggreCases[i]);
                ResultSet myRs = myStmt.executeQuery(aggreCases[i]);

                if (!Diff.isSame(gumRs, myRs, aggreCases[i])) {
                    System.out.println(aggreCases[i] + "\tExecute result not same");
                    System.exit(-1);
                    return;
                }
            } catch (SQLException e) {
                System.out.println("!!!!!!!!!!!!!!!  aggreCases[i]: "+ aggreCases[i]);
                e.printStackTrace();
                System.exit(-1);
            }
        }

        System.out.println("is same, ok!");

        if (gumConn != null) {
            try {
                gumConn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (myConn != null) {
            try {
                myConn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return;
    }
}
