package com.hotel.index;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class indexDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public indexDTO indexshow(String mid) {
		try {
			conn=com.hotel.db.HotelDB.getConn();
			
			String sql="SELECT "
					+ "    TO_CHAR(member.mmoney, '999,999,999') AS unu_point, "
					+ "    TO_CHAR(member.mpoint, '999,999,999') AS total_point, "
					+ "    member.mfname,"
					+ "    member.mlname,"
					+ "    grade.grade AS now_grade, "
					+ "    grade.discount AS now_discount, "
					+ "    ( SELECT COUNT(*) "
					+ "      FROM reser "
					+ "      WHERE reser.rid = member.mid )AS total_reser, "
					+ "    TO_CHAR(CASE "
					+ "                 WHEN member.mpoint >= grade.max_point THEN 0 "
					+ "                 ELSE grade.max_point - member.mpoint "
					+ "            END, '999,999,999') AS remain_grade "
					+ "FROM member "
					+ "JOIN grade "
					+ "    ON member.mpoint BETWEEN grade.min_point AND grade.max_point "
					+ "WHERE member.mid=? ";
			
			ps=conn.prepareStatement(sql);
			ps.setString(1, mid);
			rs=ps.executeQuery();
			indexDTO dto = null;
			if(rs.next()) {
				do {
					String unu_point=rs.getString("unu_point");
					String total_point=rs.getString("total_point");
					String now_grade=rs.getString("now_grade");
					int now_discount=rs.getInt("now_discount");
					int total_reser=rs.getInt("total_reser");
					String remain_grade=rs.getString("remain_grade");
					String mfname=rs.getString("mfname");
					String mlname=rs.getString("mlname");
					
					dto = new indexDTO(unu_point, total_point, now_grade, now_discount, total_reser, remain_grade, mfname, mlname);
				}while(rs.next());
			}
			return dto;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			com.hotel.db.HotelDB.close(conn,ps,rs);
		}
	}
	/*고객 후기 관련 메서드 */
	public ArrayList<indexDTO> indexReview() {
		try {
			conn = com.hotel.db.HotelDB.getConn();
			String sql = "SELECT vidx, vid, vtitle FROM (SELECT * FROM review ORDER BY vidx DESC) WHERE ROWNUM <= 10";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList<indexDTO> list = new ArrayList<>();
			
			while(rs.next()) {
				indexDTO dto = new indexDTO();
				dto.setVidx(rs.getInt("vidx"));
				dto.setVid(rs.getString("vid"));
				dto.setVtitle(rs.getString("vtitle"));
				list.add(dto);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			com.hotel.db.HotelDB.close(conn,ps,rs);
		}
	}
}
