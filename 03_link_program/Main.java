import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class Main {
	
	static final String driver = "oracle.jdbc.OracleDriver";
	static final String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	static final String id = "C##blossom";
	static final String pw = "djdenls0301";

	public static void main(String[] args) {
		try {
			// addData();
			getData();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void addData() throws Exception {
		// JDBC driver loading
		Class.forName(driver);
		// 접속
		Connection db = DriverManager.getConnection(url, id, pw);
		
		// query
		String sql = "insert into test (test_idx, test_number, test_str) values (seq_1.nextval, ?, ?)";
		PreparedStatement pstmt = db.prepareStatement(sql);
		
		// insert
		pstmt.setInt(1, 100);
		pstmt.setString(2, "String1");
		pstmt.execute();
		
		pstmt.setInt(1,  200);
		pstmt.setString(2, "String2");
		pstmt.execute();
		
		// 작업이 끝나면 db를 닫아주어야한다.
		db.close();
		System.out.println("SAVE COMPLETE");
		
	}
	
	public static void getData() throws Exception {
		Class.forName(driver);
		Connection db = DriverManager.getConnection(url, id, pw);
		
		String sql = "select test_idx, test_number, test_str from test";
		Statement stmt = db.createStatement();
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			int test_idx = rs.getInt("test_idx");
			int test_number = rs.getInt("test_number");
			String test_str = rs.getString("test_str");
			
			System.out.println("test_idx: " + test_idx);
			System.out.println("test_number: " + test_number);
			System.out.println("test_str: " + test_str);
			System.out.println();
		}
		
		db.close();
	}

}
