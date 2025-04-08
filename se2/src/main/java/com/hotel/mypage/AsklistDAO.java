package com.hotel.mypage;

import java.util.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AsklistDAO {
	
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public AsklistDAO() {
		// TODO Auto-generated constructor stub
	}
	/*문의내역 가져오기*/
	public ArrayList<AsklistDTO> askList(String id) {
		try {
			conn = com.hotel.db.HotelDB.getConn();
			
//			String sql = "select * from jsp_bbs order by idx desc";
//			쿼리문에는 되도록 계산식 넣지않고 변수를 만들어 인파라미터로 넣기
			String sql = "select rownum,ititle,idate from inquiry "
					+ "where iid = ? order by rownum desc";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			ArrayList<AsklistDTO> arr = new ArrayList<AsklistDTO>();
			while(rs.next()) {
				int rownum = rs.getInt("rownum");
				String ititle = rs.getString("ititle");
				java.sql.Date idate = rs.getDate("idate");
				AsklistDTO dto = new AsklistDTO(rownum,ititle,idate);
				arr.add(dto);
			}
			return arr;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null) ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {}
		}
	}
}
