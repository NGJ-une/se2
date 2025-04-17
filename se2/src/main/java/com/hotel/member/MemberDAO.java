package com.hotel.member;

import java.util.*;

import java.sql.*;

public class MemberDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	public MemberDAO() {
		
	}
	
	/** 회원가입 관련 메서드*/
	public int memberJoin(MemberDTO mdto) {
		try {
			conn=com.hotel.db.HotelDB.getConn();
			String sql="INSERT INTO MEMBER(MID,MIDX,MPWD,MFNAME,MLNAME,MBIRTH,MEMAIL,MTEL,MADDR,MJOIN_DATE,MQUESTION,MANSWER) "
					+ "VALUES(?,sq_member_idx.NEXTVAL,?,?,?,?,?,?,?,sysdate,?,?)";

			ps = conn.prepareStatement(sql);
			
			ps.setString(1, mdto.getId());
			ps.setString(2, mdto.getPwd());
			ps.setString(3, mdto.getFname());
			ps.setString(4, mdto.getLname());
			ps.setString(5, mdto.getBirth());
			ps.setString(6, mdto.getEmail());
			ps.setString(7, mdto.getTel());
			ps.setString(8, mdto.getAddr());
			ps.setInt(9, mdto.getQuestion());
			ps.setString(10, mdto.getAnswer());
			int count = ps.executeUpdate(); 
			return count; 
		}catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if (ps != null) ps.close();
				if (conn != null) conn.close();
			}catch (Exception e2) {
				
			}
		}
	}
	

	/** 아이디 중복검사 관련 메서드 */
	// member테이블에서 ID컬럼만 파라미터 받아서 중복검사
	public boolean idCheck(String userid) {
		try {
			conn = com.hotel.db.HotelDB.getConn();
			String sql = "SELECT * FROM MEMBER WHERE MID=?"; 
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery(); 
			return rs.next(); 
		} catch (Exception e) {
			e.printStackTrace();
			return false; 
		} finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {
			}
		}
	}
	
	
	/**  로그인 메소드1   */  //ID 입력 시 비밀번호 찾는 메소드
	
	public MemberDTO loginCheckPwd(String userid) {
		try {
			conn=com.hotel.db.HotelDB.getConn();
			String sql="SELECT mpwd, grade, mpoint, mmoney, discount FROM member, grade "
					+ "WHERE mpoint BETWEEN min_point AND max_point AND mid = ?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs=ps.executeQuery();

			if(rs.next()) {
				return new MemberDTO(userid, 0, rs.getString("mpwd"), null, null, null, null, null, null,
						rs.getString("grade"), null, rs.getInt("mpoint"), rs.getInt("mmoney"), rs.getInt("discount"), 0, null);
			} 
			return null;
		}
		catch (Exception e) {
			e.printStackTrace();
			return null;

		}finally {
			try {
				if (rs != null) rs.close(); 
				if (ps != null) ps.close();
				if (conn != null) conn.close();
			}catch (Exception e2) {
				}
			}
		}
	
////	
/**  로그인 메소드2   */  //pwd 입력시 아이디 찾는 메소드
	
	public String loginCheckId(String userpwd) {
		try {
			conn=com.hotel.db.HotelDB.getConn();
			String sql="SELECT MID FROM MEMBER WHERE MPWD=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, userpwd);
			rs=ps.executeQuery();
			String userid=null;
			if(rs.next()) {
				userid= rs.getString("MID");
			} 
			return userid;
		}
		catch (Exception e) {
			e.printStackTrace();
			return null;

		}finally {
			try {
				if (rs != null) rs.close(); 
				if (ps != null) ps.close();
				if (conn != null) conn.close();
			}catch (Exception e2) {
				}
			}
		}
	
	

	/** 아이디 찾기 */ 
	public String idFind(String usertel, int userquestion, String useranswer) {
		try {
			conn=com.hotel.db.HotelDB.getConn();
			String sql="SELECT MID FROM MEMBER WHERE MTEL=? AND MQUESTION=? AND MANSWER=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, usertel);
			ps.setInt(2, userquestion);
			ps.setString(3, useranswer);
			rs=ps.executeQuery();
			
			String userid=null;
			
			if(rs.next()) { //컬럼의 데이터있니?
				userid= rs.getString("MID");
			}
			return userid;
			
		}catch (Exception e) {
			e.printStackTrace();
			return null;
			
		}finally {
			try {
				if (rs != null) rs.close(); 
				if (ps != null) ps.close();
				if (conn != null) conn.close();
				
			}catch (Exception e2) {
				 		
			}
		}
	}
	
	
	
	/** 비밀번호 찾는 메소드 */ 
	
	public String pwdFind(String userid,String usertel) {
		try {
			conn=com.hotel.db.HotelDB.getConn();
			String sql="SELECT MPWD FROM MEMBER WHERE MID=? AND MTEL=? ";
			ps=conn.prepareStatement(sql);
			ps.setString(1, userid);
			ps.setString(2, usertel);
			rs=ps.executeQuery();
			
			String userpwd=null;
			
			if(rs.next()) { //컬럼의 데이터있니?
				userpwd= rs.getString("MPWD");
			}
			return userpwd;
			
		}catch (Exception e) {
			e.printStackTrace();
			return null;
			
		}finally {
			try {
				if (rs != null) rs.close(); 
				if (ps != null) ps.close();
				if (conn != null) conn.close();
			}catch (Exception e2) {
				
			}
		}
	}
	
	  /** registerDTO 이용해서 정보 가져오기 */
	   public RegisterDTO registerOk() {
	      try {
	         conn=com.hotel.db.HotelDB.getConn();
	         String sql="SELECT MIDX,MID,MFNAME,MLNAME FROM (SELECT MIDX,MID,MFNAME,MLNAME FROM member ORDER BY mjoin_date DESC) WHERE ROWNUM = 1";
	         ps=conn.prepareStatement(sql);
	          
	           rs= ps.executeQuery();
	           RegisterDTO dto=null;
	           if(rs.next()) {
	              int midx  = rs.getInt("midx");
	              String mid = rs.getString("mid");
	              String mfname = rs.getString("mfname");
	              String mlname = rs.getString("mlname");
	              dto= new RegisterDTO(midx,mid,mfname,mlname);
	              
	           }
	           return dto;
	      
	      }catch (Exception e) {
	         e.printStackTrace();
	              return null;
	      }finally {
	         try {
	            if (rs != null) rs.close();
	                  if (ps != null) ps.close();
	                  if (conn != null) conn.close();
	         }catch (Exception e2) {
	            e2.printStackTrace();
	            
	         }
	      }
	   }
	   
	}




/** 가입 완료 시 최신 정보의 이름, 아이디 창 보이도록 하는 메서드 */

//public int registerInfo1() {
//  int midx = -1; // 실패 시 -1
//
//  try {
//      conn = com.hotel.db.HotelDB.getConn();
//      String sql = "SELECT midx FROM (SELECT midx FROM member ORDER BY midx DESC) WHERE ROWNUM = 1";
//      ps = conn.prepareStatement(sql);
//      rs = ps.executeQuery();
//
//      if (rs.next()) {
//          midx = rs.getInt("midx"); 
//        
//      }
//
//  } catch (Exception e) {
//      e.printStackTrace(); 
//  } finally {
//      try {
//          if (rs != null) rs.close();
//          if (ps != null) ps.close();
//          if (conn != null) conn.close();
//      } catch (Exception e2) {
//          
//      }
//  }
//  return midx;
//  
//}


	


   

   

      


