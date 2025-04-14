package com.hotel.seoul;

import java.util.*;
import java.sql.*;


public class HotelReplyDAO {

	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public HotelReplyDAO() {
		
	}

	//cref의 최대값 구하기
	public int getMaxRef(int vidx) {
		try {
			conn = com.hotel.db.HotelDB.getConn();
			String sql = "select nvl(max(cref), 0) from reply where vidx = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, vidx);
			rs = ps.executeQuery();
			int ref = 0;
			if(rs.next()) {
				ref = rs.getInt(1);
			}
			return ref;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
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
	
	//댓글 쓰기 메서드
		public int writeReply(HotelReplyDTO dto) {
			try {
				conn = com.hotel.db.HotelDB.getConn();
				String sql = "insert into reply (cidx, vidx, cid, ccontent, cdate, cref, clev, csunbun) "
						+ "values (sq_reply_idx.nextval,?,?,?,sysdate,?,0,0)";
				ps = conn.prepareStatement(sql);
				int cref = getMaxRef(dto.getVidx());
				ps.setInt(1, dto.getVidx());
				ps.setString(2, dto.getCid());
				ps.setString(3, dto.getCcontent());
				ps.setInt(4, cref+1);
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
	//sunbun 업데이트
		public void setCsunbunUpdate(int cref, int csunbun, int vidx) {
			try {
				conn = com.hotel.db.HotelDB.getConn();
				String sql = "update reply set csunbun = csunbun+1 where cref = ? and csunbun >= ? and vidx = ?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, cref);
				ps.setInt(2, csunbun);
				ps.setInt(3, vidx);
				ps.executeUpdate();
			} catch (Exception e) {
				// TODO: handle exception
			}finally {
				try {
					if(ps!=null) ps.close();
					if(conn!=null) conn.close();
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}
		}
	//답글 쓰기 메서드
		public int reWriteReply(HotelReplyDTO dto) {
			try {
				conn = com.hotel.db.HotelDB.getConn();
				setCsunbunUpdate(dto.getCref(), dto.getCsunbun()+1, dto.getVidx());
				String sql = "insert into reply values (sq_reply_idx.nextval,?,?,?,sysdate,0,0,?,?,?)";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, dto.getVidx());
				ps.setString(2, dto.getCid());
				ps.setString(3, dto.getCcontent());
				ps.setInt(4, dto.getCref());
				ps.setInt(5, dto.getClev()+1);
				ps.setInt(6, dto.getCsunbun()+1);
				int count = ps.executeUpdate();
				return count;
			} catch (Exception e) {
				e.printStackTrace();
				return -1;
			}finally {
				try {
					if(ps!=null) ps.close();
					if(conn != null) conn.close();
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}
		}
}
