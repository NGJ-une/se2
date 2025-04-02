package com.hotel.confirm;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class HotelConfirmDAO {
	 
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	//DAO 기본 생성자 
	public HotelConfirmDAO() {
		// TODO Auto-generated constructor stub
	}
	
	//예약번호로 확인 클릭시 DB 확인 Method // 사용페이지=(hotelConfirmNM_ok.jsp)
	public boolean ConfirmNumberCheck (int confirmNumber) {
		try {
			conn=com.hotel.db.HotelDB.getConn();
			
			String sql="select idx from reser where idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, confirmNumber);
			rs=ps.executeQuery();
			return rs.next(); 	
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
		}
	}
	//예약번호로 확인 출력 예약확인 화면 구현 관련 Method // 사용페이지=(hotelConfirmM_ok.jsp)
//	public HotelConfirmDTO hotelConfirmresult(String id) {
//		try {
//			conn=com.hotel.db.HotelDB.getConn();
//			
//			String sql="select * from reser full outer join member on member.id=reser.id where member.id=?";
//			ps=conn.prepareStatement(sql);
//			ps.setString(1, id);
//			rs=ps.executeQuery();
//			return HotelConfirmDTO;
//		} catch (Exception e) {
//			e.printStackTrace();
//			return null;
//		}finally {
//			try {
//				
//			} catch (Exception e2) {}
//		}
//	}
}
