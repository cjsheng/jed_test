
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;

//import org.apache.commons.lang3.RandomStringUtils;

public class Test1 {
    private static String URL = "jdbc:mysql://127.0.0.1:15306/test_keyspace";
//        private static String URL = "jdbc:mysql://127.0.0.1:3306/sheng?useUnicode=true&characterEncoding=utf8";
    private static String USERNAME = "mysql_admin";
//            private static String USERNAME = "root";
    private static String PWD = "mysql_password";
//    private static String PWD = "";

    private static int MAX = 20000;
    private static String SQL = "insert into chat_message(src_userid,target_userid,message,s1,s2,s3,s4) values(?,?,?,?,?,?,?)";

    public static void main(String[] args) throws ClassNotFoundException, SQLException, UnsupportedEncodingException {
        long start = System.currentTimeMillis();
        for (int i = 0; i < 1; i++) {

            new Thread() {
                @Override
                public void run() {
                    try {
                        testLoadFile(500000);
                        long end = System.currentTimeMillis();
                        System.out.println((end - start));
                        System.out.println(((end - start) / 1000));
                    } catch (Exception e) {
                        System.out.println(e.toString());
                    }
                }
            }.start();




        }
    }

    private static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(URL, USERNAME, PWD);
        return con;
    }


    private static void testLoadFile(int batchSize)
            throws ClassNotFoundException, SQLException, UnsupportedEncodingException {
        String fieldsterminated = "\t";
        String linesterminated = "\n";

        int i = 1;
        StringBuilder sb = new StringBuilder(1);
        while (i < batchSize) {
            sb.append(i+"ids");
            sb.append(fieldsterminated);
            sb.append(i);



            sb.append(fieldsterminated);
            sb.append(i + "message");
            sb.append(fieldsterminated);
            sb.append("\\\"\'s1");
            sb.append(fieldsterminated);
            if(i%2==0){
                sb.append("hello s2");

            }else{
                sb.append("s2");
            }
            sb.append(fieldsterminated);
            sb.append(i + "s3");
            sb.append(fieldsterminated);
            sb.append(i + "s4");
            sb.append(fieldsterminated);
            sb.append(i + "s5");
            sb.append(fieldsterminated);
            sb.append(i + "s6");
            sb.append(fieldsterminated);
            sb.append(i + "s7");
            sb.append(fieldsterminated);
            sb.append(i + "s8");
            sb.append(fieldsterminated);
            sb.append(i + "s9");
            sb.append(fieldsterminated);
            sb.append(i + "s10");
            sb.append(linesterminated);
            i++;
        }


        byte[] bytes = sb.toString().getBytes();

        String fileName = "/export" + File.separator + "hello.csv";
        File file = new File(fileName);
        try {
            file.createNewFile();
            BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(file));
            bufferedWriter.write(sb.toString());
            bufferedWriter.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
        String loadDataSql = "LOAD DATA LOCAL INFILE 'sql.csa' INTO TABLE message FIELDS TERMINATED BY '"
                + fieldsterminated + "'  LINES TERMINATED BY '" + linesterminated
                + "' ( id,user_id,message,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10 ) ";
        System.out.println(loadDataSql);
        Connection con = getConnection();
        con.setAutoCommit(false);
        PreparedStatement pt = con.prepareStatement(loadDataSql);
        com.mysql.jdbc.PreparedStatement mysqlStatement = null;
        if (pt.isWrapperFor(com.mysql.jdbc.Statement.class)) {
            mysqlStatement = pt.unwrap(com.mysql.jdbc.PreparedStatement.class);
        }
        InputStream in = new ByteArrayInputStream(bytes);
        mysqlStatement.setLocalInfileInputStream(in);

        try {
            int n = mysqlStatement.executeUpdate();
            System.out.println("batchSize = [" + n + "]" + Thread.currentThread().getName());
            con.commit();

            con.close();
        } catch (Exception e) {
            System.out.println("异常！！！！" + e.toString());
            con.rollback();
        }

    }
}

//    LOAD DATA LOCAL INFILE 'sql.csv' INTO TABLE eis_data_doc FIELDS TERMINATED BY ';'  LINES TERMINATED BY '' ( id,TITLE,KEYWORD,SECRET_STATUS,RELEASE_STATUS,SAVE_PATH,FILE_NAME,FILE_SIZE,FILE_TYPE,FILE_HITS,STATUS,CREATOR,CREATE_TIME,MODIFIER,DESCRIPTION,JSS_FILE_KEY,modify_time,to_es)

//    LOAD DATA LOCAL INFILE '/export/hello1.csv' INTO TABLE message FIELDS TERMINATED BY '\t'  LINES TERMINATED BY '\n' ( id,user_id,message,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10 )