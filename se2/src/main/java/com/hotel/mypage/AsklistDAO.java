package com.hotel.mypage;

import java.util.*;

import com.hotel.reser.ReserDTO;

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
	public ArrayList<AsklistDTO> askList(String id, int cp, int ls) {
		try {
			conn = com.hotel.db.HotelDB.getConn();
			
			int start = (cp-1)*ls+1;
			int end = cp*ls;
			
			String sql = "select * from"
					+ " (select rownum as rnum,iidx,ititle,idate from inquiry"
					+ " where iid = ? )"
					+ " where rnum >= ? and rnum <= ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setInt(2, start);
			ps.setInt(3, end);
			rs = ps.executeQuery();
			ArrayList<AsklistDTO> arr = new ArrayList<AsklistDTO>();
			while(rs.next()) {
				int rnum = rs.getInt("rnum");
				int iidx = rs.getInt("iidx");
				String ititle = rs.getString("ititle");
				java.sql.Date idate = rs.getDate("idate");
				AsklistDTO dto = new AsklistDTO(rnum,ititle,idate,iidx);
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
	
	public int getTotalCnt(String id) {
		try {
			conn = com.hotel.db.HotelDB.getConn();
			String sql = "select count(*) from inquiry where iid = ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			return count == 0 ? 1:count;
		}catch(Exception e) {
			e.printStackTrace();
			return 1;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null) ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {}
		}
	}
	
	public int askWrite(String iid,String ititle,String icontent) {
		try {
			conn = com.hotel.db.HotelDB.getConn();
			
			String sql = "INSERT INTO inquiry VALUES (sq_inquiry_idx.NEXTVAL, ?, ?, ? ,sysdate, 0, 0, 0)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, iid);
			ps.setString(2, ititle);
			ps.setString(3, icontent);
			return ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (ps != null) ps.close();
				if (conn != null) conn.close();
			} catch(Exception e) {}
		}
	}
	
	public AsklistDTO askcontent(int iidx) {
		try {
			conn = com.hotel.db.HotelDB.getConn(); 
			
			String sql = "select ititle,icontent,idate from inquiry where iidx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, iidx);
			AsklistDTO dto=null;
			rs=ps.executeQuery();
			if(rs.next()) {
				String ititle = rs.getString("ititle");
				String icontent = rs.getString("icontent");
				java.sql.Date idate = rs.getDate("idate");
				dto = new AsklistDTO(ititle, icontent, idate);
			}
			return dto;
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
				if (conn != null) conn.close();
			} catch(Exception e) {}
		}
	}
	

}
