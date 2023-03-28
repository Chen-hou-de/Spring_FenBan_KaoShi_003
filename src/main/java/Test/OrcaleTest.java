package Test;
import java.sql.*;
import java.time.LocalDateTime;


public class OrcaleTest {


    public static void main(String[]args) throws Exception {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        String url="jdbc:oracle:thin:@localhost:1521:orcl";
        String uname ="scott";
        String pwd = "123";
        Connection con = DriverManager.getConnection(url,uname,pwd);
        System.out.println(con.getClass().getName());
        LocalDateTime dateTime;
        Statement stmt = con.createStatement();
        String sql = "select t.*  from TYPE t";
        ResultSet rs = stmt.executeQuery(sql);
        while(rs.next()) {
            System.out.println("姓名:"+rs.getObject("job")+","+"薪资:"+rs.getObject("ename"));
        }
        con.close();
        stmt.close();
        rs.close();

    }

}
