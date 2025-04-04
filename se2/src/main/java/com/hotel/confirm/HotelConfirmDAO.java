package com.hotel.confirm;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class HotelConfirmDAO {
	 
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	//DAO 기본 생성자 
	public HotelConfirmDAO() {
		// TODO Auto-generated constructor stub
	}
	
	//로그인 X
	//예약번호로 확인 클릭시 DB 확인 Method // 사용페이지=(hotelConfirmNM_ok.jsp)
	// 해당 예약번호와 동일한 id 명 일시만 결과 출력 
	public boolean ConfirmNumberCheck (int confirmNumber, String rid) {
		try {
			conn=com.hotel.db.HotelDB.getConn();
			
			String sql="select ridx from reser where ridx=? and rid=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, confirmNumber);
			ps.setString(2, rid);
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
	//로그인 X, O
	//예약번호로 확인 출력 예약확인 화면 구현 관련 Method // 사용페이지=(hotelConfirmM_Page.jsp)
	//넘어온 파라비터를 기반으로 해당 id 를 조회해 예약 내역과 본인 정보 출력 
	public ArrayList<HotelConfirmDTO> hotelConfirmresult(int ridx_s) {
		try {
			conn=com.hotel.db.HotelDB.getConn();
			
			String sql="SELECT "
					+ "    reser.*, "
					+ "    member.*, "
					+ "    (reser.radult + reser.rkid + reser.rbaby) AS persons, "
					+ "    (reser.rcheckout - reser.rcheckin) AS day "
					+ "FROM reser "
					+ "FULL OUTER JOIN member ON member.mid=reser.rid "
					+ "WHERE reser.ridx=? "
					+ "AND reser.rcheckin >= CURRENT_DATE ";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, ridx_s);
			rs=ps.executeQuery();
			ArrayList<HotelConfirmDTO> arr = new ArrayList<HotelConfirmDTO>();
			if(rs.next()) {
				do{
					int ridx=rs.getInt("ridx");
					java.sql.Date rcheckin=rs.getDate("rcheckin");
					java.sql.Date rcheckout=rs.getDate("rcheckout");
					String mlname=rs.getString("mlname");
					String mfname=rs.getString("mfname");
					String mtel=rs.getString("mtel");
					String memail=rs.getString("memail");
					String rtype=rs.getString("rtype");
					int persons=rs.getInt("persons");
					int day=rs.getInt("day");
					
					HotelConfirmDTO dto = new HotelConfirmDTO(ridx, rcheckin, rcheckout, mfname, mlname, mtel, memail, rtype, persons, day);
					arr.add(dto);
				}while(rs.next());
			}
			return arr; 
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
		}
	}
	//로그인 X, O 
	//예약확인 로드 창 현재 예약내역을 사용중인 기간일 경우 관련 Method // 사용페이지=(hotelConfirmM_Page.jsp)
	//예약번호로 확인 및 로그인 시 해당 아이디로 조회하여 예약되어있는 날짜가 현재날짜가 포함되어있는 결우 
	public ArrayList<HotelConfirmDTO> hotelConfirmInUse(String mid){
		try {
			conn=com.hotel.db.HotelDB.getConn();
			
			String sql="SELECT "
					+ "    reser.*, "
					+ "    member.*, "
					+ "    (reser.radult + reser.rkid + reser.rbaby) AS persons, "
					+ "    (reser.rcheckout - reser.rcheckin) AS day "
					+ "FROM reser "
					+ "FULL OUTER JOIN member ON member.mid=reser.rid "
					+ "WHERE member.mid=? "
					+ "AND CURRENT_DATE BETWEEN reser.rcheckin AND reser.rcheckout";
			ps=conn.prepareStatement(sql);
			ps.setString(1, mid);
			rs=ps.executeQuery();
			ArrayList<HotelConfirmDTO> arr = new ArrayList<HotelConfirmDTO>();
			if(rs.next()) {
				do {
					int ridx=rs.getInt("ridx");
					java.sql.Date rcheckin=rs.getDate("rcheckin");
					java.sql.Date rcheckout=rs.getDate("rcheckout");
					String mlname=rs.getString("mlname");
					String mfname=rs.getString("mfname");
					String mtel=rs.getString("mtel");
					String memail=rs.getString("memail");
					String rtype=rs.getString("rtype");
					int persons=rs.getInt("persons");
					int day=rs.getInt("day");
					
					HotelConfirmDTO dto = new HotelConfirmDTO(ridx, rcheckin, rcheckout, mfname, mlname, mtel, memail, rtype, persons, day);
					arr.add(dto);
				}while(rs.next());
			}
			return arr; 
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
		}
	}
}
