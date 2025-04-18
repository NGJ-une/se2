package com.hotel.seoul;

import java.util.*;
import java.sql.*;
import java.sql.Date;


public class HotelReplyDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
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
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	//댓글 쓰기 메서드
		public int writeReply(int vidx, String cid, String ccontent) {
			try {
				int cref = getMaxRef(vidx);
				String sql = "insert into reply(cidx, vidx, cid, ccontent, cdate, crecommend, cnotrecommend, cref, clev, csunbun) "
						+ "values (sq_reply_idx.nextval, ?, ?, ?, sysdate, 0, 0, ?, 0, 0)";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, vidx);
				ps.setString(2, cid);
				ps.setString(3, ccontent);
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
		//댓글 가져오기 메서드
		public ArrayList<HotelReplyDTO> getReplyList(int idx) {
			try {
				conn = com.hotel.db.HotelDB.getConn();
				String sql = "select * from reply where vidx = ? order by cref asc, csunbun asc";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, idx);
				rs = ps.executeQuery();
				ArrayList<HotelReplyDTO> arr = new ArrayList<HotelReplyDTO>();
				while (rs.next()) {
					int cidx = rs.getInt("cidx");
		            int vidx = rs.getInt("vidx");
		            String cid = rs.getString("cid");
		            String ccontent = rs.getString("ccontent");
		            Date cdate = rs.getDate("cdate");
		            int crecommend = rs.getInt("crecommend");
		            int cnotrecommend = rs.getInt("cnotrecommend");
		            int cref = rs.getInt("cref");
		            int clev = rs.getInt("clev");
		            int csunbun = rs.getInt("csunbun");
		            HotelReplyDTO dto = new HotelReplyDTO(cidx, vidx, cid, ccontent, cdate, crecommend, cnotrecommend, cref, clev, csunbun);
		            arr.add(dto);
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
		//댓글 추천 메서드
		public int replyRecommendUpdate(int cidx) {
			try {
				conn = com.hotel.db.HotelDB.getConn();
				String sql = "update reply set crecommend = crecommend+1 where cidx = ?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, cidx);
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
		//댓글 비 추천 메서드
		public int replyNotRecommendUpdate(int cidx) {
			try {
				conn = com.hotel.db.HotelDB.getConn();
				String sql = "update reply set cnotrecommend = cnotrecommend +1 where cidx = ?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, cidx);
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
}

