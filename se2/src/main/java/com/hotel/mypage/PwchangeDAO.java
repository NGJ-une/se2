package com.hotel.mypage;

import java.sql.*;
import java.util.*;

public class PwchangeDAO {

	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public PwchangeDAO() {
		// TODO Auto-generated constructor stub
	}
	//현재 비밀번호 가져오기 메서드
	public String nowPwdBring(String id) {
		try {
			conn = com.hotel.db.HotelDB.getConn();
			String sql = "select mpwd from member where mid = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			String pwd = "";
			if(rs.next()) {
				pwd = rs.getString("mpwd");
			}
			return pwd;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	
	//비밀번호 변경 메서드
	public int pwChange(String id, String pwd) {
		try {
			conn = com.hotel.db.HotelDB.getConn();
			String sql = "update member set mpwd = ? where mid = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, pwd);
			ps.setString(2, id);
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	//프로필 변경 정보 가져오기 메서드
	public ArrayList<PwchangeDTO> memberInfo(String id) {
		try {
			conn = com.hotel.db.HotelDB.getConn();
			String sql ="select mfname,mlname,memail,mtel,maddr from member where mid = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			ArrayList<PwchangeDTO> arr = new ArrayList<PwchangeDTO>();
			while(rs.next()) {
				String fname = rs.getString("mfname");
				String lname = rs.getString("mlname");
				String email = rs.getString("memail");
				String tel = rs.getString("mtel");
				String addr = rs.getString("maddr");
				PwchangeDTO dto2 = new PwchangeDTO(fname, lname, email, tel, addr);
				arr.add(dto2);
			}
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	
	//회원 정보 수정 메서드
	public int memberEdit(String id, PwchangeDTO dto) {
		try {
			conn = com.hotel.db.HotelDB.getConn();
			String sql = "update member set mfname = ?, mlname = ?, memail = ?, mtel = ?, maddr = ? where mid = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getMfname());
			ps.setString(2, dto.getMlname());
			ps.setString(3, dto.getMemail());
			ps.setString(4, dto.getMtel());
			ps.setString(5, dto.getMaddr());
			ps.setString(6, id);
			
			System.out.println("------------");
			System.out.println(dto.getMfname());
			System.out.println(dto.getMlname());
			System.out.println(dto.getMemail());
			System.out.println(dto.getMtel());
			System.out.println(dto.getMaddr());
			System.out.println(dto.getMid());
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!= null) ps.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	//회원탈퇴 메서드
	public int memberDelete(String sid) {
		try {
			conn = com.hotel.db.HotelDB.getConn();
			String sql = "delete member where mid = ? and mmoney < 1000";
			ps = conn.prepareStatement(sql);
			ps.setString(1, sid);
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	public int memeberMmoney(String sid) {
		try {
			conn = com.hotel.db.HotelDB.getConn();
			String sql = "select mmoney from member where mid = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, sid);
			rs = ps.executeQuery();
			int mmoney = 0;
			if(rs.next()) {
				mmoney = rs.getInt("mmoney");
			}
			return mmoney;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
}
