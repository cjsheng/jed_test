package diff;

import java.sql.*;
import java.text.DecimalFormat;

/**
 * Created by xuhaihua on 17-3-18.
 */
public class Diff {

    public static boolean isSame(ResultSet lhs, ResultSet rhs, String sql) {
        try {
            ResultSetMetaData metaData = rhs.getMetaData();
            int colCnt = metaData.getColumnCount();

            int rowIdx = 0;

            while (lhs.next() && rhs.next()) {
                rowIdx++;
                if (rowIsDiff(lhs, rhs, metaData, colCnt, rowIdx)) {
                    return false;
                }

            }
            boolean ln = lhs.next();
            boolean rn = rhs.next();
            if (ln || rn) {
                if (ln) {
                    System.out.print(" lhs  more rows : ");
                    printRrow(rhs, metaData);
                }

                if (rn) {
                    System.out.print(" rhs more rows : ");
                    printRrow(rhs, metaData);
                }
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        System.out.println("sql " + sql + " pass ok !");
        return true;
    }

    private static boolean rowIsDiff(ResultSet lhs, ResultSet rhs, ResultSetMetaData metaData, int colCnt, int rowIdx) throws SQLException {
        StringBuffer lRowCache = new StringBuffer();
        StringBuffer rRowCache = new StringBuffer();

        for (int i = 1; i <= colCnt; i++) {
            int type = metaData.getColumnType(i);
            String colNmae = metaData.getColumnName(i);
            switch (type) {
                case Types.BIGINT:
                case Types.INTEGER:
                case Types.REAL:
                case Types.TINYINT:
                    Long ll = lhs.getLong(i);
                    Long rl = rhs.getLong(i);
                    lRowCache.append("\t").append(ll);
                    rRowCache.append("\t").append(rl);

                    if (colNmae.equals("id")) {
                        break;
                    }

                    if (!ll.equals(rl)) {
                        System.out.println("long not same lhs:" + ll + "\trhs:" + rl + "\trow idx:" + rowIdx);
                        System.out.println("lrow " + lRowCache);
                        System.out.println("rrow " + rRowCache);
                        return true;
                    }
                    break;
                case Types.VARCHAR:
                case Types.CHAR:
                case Types.CLOB:
                case Types.BLOB:
                case Types.LONGVARCHAR:
                    String ls = lhs.getString(i);
                    String rs = rhs.getString(i);
                    if (ls == null && rs == null) {
                        break;
                    }
                    lRowCache.append("\t").append(ls);
                    rRowCache.append("\t").append(rs);

                    if (!ls.equals(rs)) {
                        System.out.println("string not same lhs:" + ls + "\trhs:" + rs);
                        System.out.println("lrow " + lRowCache);
                        System.out.println("rrow " + rRowCache);
                        return true;
                    }
                    break;
                case Types.DATE:
                case Types.TIME:
                    Date ld = lhs.getDate(i);
                    Date rd = rhs.getDate(i);

                    lRowCache.append("\t").append(ld);
                    rRowCache.append("\t").append(rd);
                    if (!ld.equals(rd)) {
                        System.out.println("date not same, col name :" + colNmae + ", col type:" + type + " lhs:" + ld + "\trhs:" + rd);
                        System.out.println("lrow " + lRowCache);
                        System.out.println("rrow " + rRowCache);
                        return true;
                    }
                    break;
                case Types.TIMESTAMP:
                    Timestamp lstmp = lhs.getTimestamp(i);
                    Timestamp rstmp = rhs.getTimestamp(i);

                    lRowCache.append("\t").append(lstmp);
                    rRowCache.append("\t").append(rstmp);
                    if (colNmae.equals("J")) {
                        break;
                    }
                    if (!lstmp.equals(rstmp)) {
                        System.out.println("timestamp not same, col name :" + colNmae + ", col type:" + type + " lhs:" + lstmp + "\trhs:" + rstmp);
                        System.out.println("lrow " + lRowCache);
                        System.out.println("rrow " + rRowCache);
                        return true;
                    }
                    break;
                case Types.FLOAT:
                case Types.DOUBLE:
                case Types.DECIMAL:
                    Double ldou = lhs.getDouble(i);
                    Double rdou = rhs.getDouble(i);

                    lRowCache.append("\t").append(ldou);
                    rRowCache.append("\t").append(rdou);

                    if (Math.abs(ldou - rdou) > 0.01) {

                        DecimalFormat df = new DecimalFormat(".000");
                        if (!df.format(ldou).equals(df.format(rdou))) {
                            System.out.println("WARGING XXXXXXXXXXXXXX float not same lhs:" + df.format(ldou) + "\trhs:" + df.format(rdou));
                            System.out.println("lrow " + lRowCache);
                            System.out.println("rrow " + rRowCache);
                            return true;
                        }
                    }
                    break;
                default:
                    System.out.println("unknown type " + type);
                    return true;
            }

        }
        return false;
    }

    public static void printRrow(ResultSet lhs, ResultSetMetaData metaData) throws Exception {

        StringBuffer lRowCache = new StringBuffer();

        int colCnt = metaData.getColumnCount();

        for (int i = 1; i <= colCnt; i++) {
            int type = metaData.getColumnType(i);
            switch (type) {
                case Types.BIGINT:
                case Types.INTEGER:
                case Types.REAL:
                case Types.TINYINT:
                    Long ll = lhs.getLong(i);
                    lRowCache.append("\t").append(ll);
                    break;
                case Types.VARCHAR:
                case Types.CHAR:
                case Types.CLOB:
                case Types.BLOB:
                case Types.LONGVARCHAR:
                    String ls = lhs.getString(i);
                    lRowCache.append("\t").append(ls);
                    break;
                case Types.DATE:
                case Types.TIME:
                    Date ld = lhs.getDate(i);

                    lRowCache.append("\t").append(ld);
                    break;
                case Types.TIMESTAMP:
                    Timestamp lstmp = lhs.getTimestamp(i);
                    lRowCache.append("\t").append(lstmp);
                    break;
                case Types.FLOAT:
                case Types.DOUBLE:
                case Types.DECIMAL:
                    Double ldou = lhs.getDouble(i);
                    lRowCache.append("\t").append(ldou);

                    DecimalFormat df = new DecimalFormat("######0.00");
                    break;
                default:
                    System.out.println("unknown type " + type);
                    return;
            }

        }

        System.out.println(lRowCache);

        return;

    }


}
