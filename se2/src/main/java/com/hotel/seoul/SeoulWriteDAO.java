package com.hotel.seoul;

import java.sql.*;
import java.util.*;
import java.util.Date;


public class SeoulWriteDAO {

	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public SeoulWriteDAO() {
		
	}
	
	
	/** 글 쓰기 등록 메서드*/
	public int reviewWrite(SeoulWriteDTO vdto) {
		try {
			conn = com.hotel.db.HotelDB.getConn();
			
			String sql = "INSERT INTO REVIEW (VIDX, VID, VTITLE, VCONTENT, VDATE, VTOTAL) VALUES(SQ_REVIEW_IDX.NEXTVAL,?,?,?,SYSDATE,?)";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, vdto.getVid()); // dto에 있는 변수에 넣음 내가 넣을 변수들
			ps.setString(2, vdto.getVtitle());
			ps.setString(3, vdto.getVcontent());
			ps.setInt(4, vdto.getVtotal());
			
			int count=ps.executeUpdate();
			
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {}
		}
	}
	
	
	/** 글 쓰기 후 파일을 등록하기 위해 foreign key - vidx 가져오는 메서드 */
	public int FileUploadvidx(int vidx) {
		try {
			conn=com.hotel.db.HotelDB.getConn();
			String sql="SELECT * FROM REVIEW WHERE VIDX = ? ";
			
			
			ps=conn.prepareStatement(sql);
			ps.setInt(1, vidx);
			ps.execute();
			return vidx;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				
			}
		}
	}

	
	/** 제일 최신 글 가져오기*/
	public int recentPost() {
	    int vidx = -1; // 기본값: 실패 시 -1
	    try {
	        conn = com.hotel.db.HotelDB.getConn();
	        String sql = "SELECT * FROM (SELECT * FROM review ORDER BY vidx DESC) WHERE ROWNUM = 1";
	        ps = conn.prepareStatement(sql);
	        rs = ps.executeQuery();

	        if (rs.next()) {
	            vidx = rs.getInt("vidx"); 
	        }

	    } catch (Exception e) {
	        e.printStackTrace(); 
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (ps != null) ps.close();
	            if (conn != null) conn.close();
	        } catch (Exception e2) {
	            e2.printStackTrace();
	        }
	    }
	    return vidx;
	}
	
	
	
	/**리뷰게시판 vidx 만 뽑아옴! */ //리뷰 게시판 vridx(예약번호) == vidx(후기번호) 비교
	
	public ArrayList<Integer> getVridxList(String id) {
	    ArrayList<Integer> vridxList = new ArrayList<>();

	    try {
	        conn = com.hotel.db.HotelDB.getConn();
	        String sql = "SELECT VRIDX FROM REVIEW WHERE VID=?";
	        ps = conn.prepareStatement(sql);
	        ps.setString(1, id);
	        rs = ps.executeQuery();

	        while (rs.next()) {
	            vridxList.add(rs.getInt("vridx"));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (ps != null) ps.close();
	            if (conn != null) conn.close();
	        } catch (Exception e2) {
	            e2.printStackTrace();
	        }
	    }

	    return vridxList;
	}
}

	
	/** 체크아웃 후 7일 이내 후기작성 메서드 */
	
//	public boolean reviewCanWrite (int ridx) {
//		
//	    boolean result = false;
//	    try {
//	    	conn = com.hotel.db.HotelDB.getConn();
//	        String sql = "SELECT RCEHCKOUT FROM RESER WHERE RIDX = ?";
//	        ps = conn.prepareStatement(sql);
//	        ps.setInt(1, ridx);
//	        rs = ps.executeQuery();
//
//	        if (rs.next()) {
//	            Date rcheckout = rs.getDate("rcheckout");
//	        
//	            long checkoutTime = rcheckout.getTime(); //체크아웃 날짜 시간
//	            long now = System.currentTimeMillis(); //현재 시간 가져옴
//
//	            // 7일 = 7 * 24 * 60 * 60 * 1000 (밀리초 기준임)
//	            long writeCan = now - checkoutTime;
//
//	            if (writeCan >= 0 && writeCan <= 7L * 24 * 60 * 60 * 1000) {
//	                result = true;
//	            }
//	        }
//	    }catch (Exception e) {
//	    	e.printStackTrace();
//	    	
//		}finally {
//			try {
//				if (rs != null) rs.close();
//	            if (ps != null) ps.close();
//	            if (conn != null) conn.close();
//			}catch (Exception e2) {
//	        }
//	    }
//	    	return result;
//	}
//}
//
//	