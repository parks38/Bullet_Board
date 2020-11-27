package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO {
	private Connection conn;
	private ResultSet rs;
	
	public BbsDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/Users?characterEncoding=UTF-8&serverTimezone=UTC";
			   String dbID = "root";
			String dbPassword = "Seoul0704";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			
		} catch (Exception e){
			e.printStackTrace();
		}
	}
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			//결과가 있는 경우에는 
			if(rs.next()) {
				return rs.getString(1); //현재의 날짜를 반환해 줄수있도록 설정. 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; //database error
	}
	
	// 게시글 번호 불러오기 
	public int getNext() {
		//게시글 번호는 순차적으로 늘어나기 때문에 마지막으로 쓰인 게시글번호를 가져와서 
		// 그 번호에다가 +1 한 값이 다음글의 번호 
		// desc-> 내림차수 하여 가장 마지막 번호를 불러와라 
		String SQL = "SELECT bbsID FROM bbs ORDER BY bbsID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			//결과가 있는 경우에는 
			if(rs.next()) {
				return rs.getInt(1)+1; //마지막 게시물 +1  
			}
			//현재가 첫 게시물인 경우
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //database error
	}
	
	// writeAction에 포함되는 함수이기때문에 매개변수 기억해야함. 
	public int write(String bbsTitle, String userID, String bbsContent) {
		//하나의 게시물 작성한 데이터를 넣어준다 
		String SQL = "INSERT INTO bbs VALUES(?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			//하나의 게시판 글을 data에 삽입하는 형식 
			pstmt.setInt(1,  getNext());
			pstmt.setString(2,  bbsTitle);
			pstmt.setString(3,  userID);
			pstmt.setString(4,  getDate());
			pstmt.setString(5,  bbsContent);
			pstmt.setInt(6,  1);
			//결과가 잘 들어갔을 경우에 
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //database error
	}
	
	// 페이지를 넘겨가면서 읽을 수 있도록 설정 
	// 주어진 페이지에 따른 10개의 게시물을 불러올 수 있도록 
	public ArrayList<Bbs> getList(int pageNumber){
		String SQL = "SELECT * FROM bbs WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10"; // 10개 까지 불러올수 있음 
		//ORDER BY -> 내림차수 
		//bbsAvailable 1 -> 존재하는 게시물 
		
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  getNext() - (pageNumber-1) * 10);
			rs = pstmt.executeQuery();
			//결과가 있는 경우에는 
			while(rs.next()) {
				Bbs bbs = new Bbs();
				//bbs안에 값을 다 넣어준다. 
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				list.add(bbs); // 해당 list에 bbs를 담아 반환 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; //게시글 list 가 어레이리스트인 list에 담겨 반환 
	}
	
	//게시글의 수에 따라 다음페이지 여부를 확인해준다 
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND  bbsAvailable = 1 ORDER BY bbsID"
				+ "DESC LIMIT 10"; 

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  getNext() - (pageNumber-1) * 10);
			rs = pstmt.executeQuery();
			//10 개 이상의 content가 있어 다음페이지로 넘어갈수 있다. 
			if(rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 게시글이 10 개 이하일 경우에는 nextpage 가 없다. 
		return false; 
	}
	
	//하나의 글내용을 불러오는 함수
	// view.jsp 
	public Bbs getBbs(int bbsID) {
		String SQL = "SELECT * FROM BBS WHERE bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Bbs bbs = new Bbs();
				//bbs안에 값을 다 넣어준다. 
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				return bbs;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null; 
	}	
}
