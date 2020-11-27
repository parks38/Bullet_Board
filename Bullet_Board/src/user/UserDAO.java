package user;

import java.sql.*;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// SQL 데이터베이스에 접속하게 해주는 부분 
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/Users?characterEncoding=UTF-8&serverTimezone=UTC";			
			String dbID = "root";
			String dbPassword = "Seoul0704";
			// Driver 는 mysql 접속가능하게해주는 매개체 같은 역할 
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword from user WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  userID);
			rs = pstmt.executeQuery();
			//아이디가 있는 경우 
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1; //로그인 성공 
				} else  {
					return 0 ; // 비밀번호 불일치 
				}
			}
			return -1; //아이다가 존재하지 않습니다. 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류 출력 
	}
	
	//join.jsp
	public int join(User user){
		String SQL = "INSERT INTO USER VALUES(?, ?, ?, ?, ?)";
		// VALUES(?, ?, ?, ?, ?) -> mySQL table에 저장된대로 차례대로 기입해준다고 생각하면 된다. 
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			return pstmt.executeUpdate();
			// 성공적인 경우는 무조건 양수이기때문에 회원가입이 정상적으로 이루어졌다면 -1이 나오지 않는다. 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터 베이스 오류 
	}
	
}
