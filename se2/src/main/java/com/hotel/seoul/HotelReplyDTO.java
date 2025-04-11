package com.hotel.seoul;

import java.sql.*;

// 댓글 테이블 
public class HotelReplyDTO {

	private int cidx;
	private String cnum;
	private String cid;
	private String ccontent;
	private Date cdate;
	private int crecommend;
	private int cnotrecommend;
	private int cref;
	private int clev;
	private int csunbun;
	
	public HotelReplyDTO() {
		
	}

	public HotelReplyDTO(int cidx, String cnum, String cid, String ccontent, Date cdate, int crecommend,
			int cnotrecommend, int cref, int clev, int csunbun) {
		super();
		this.cidx = cidx;
		this.cnum = cnum;
		this.cid = cid;
		this.ccontent = ccontent;
		this.cdate = cdate;
		this.crecommend = crecommend;
		this.cnotrecommend = cnotrecommend;
		this.cref = cref;
		this.clev = clev;
		this.csunbun = csunbun;
	}

	public int getCidx() {
		return cidx;
	}

	public void setCidx(int cidx) {
		this.cidx = cidx;
	}

	public String getCnum() {
		return cnum;
	}

	public void setCnum(String cnum) {
		this.cnum = cnum;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getCcontent() {
		return ccontent;
	}

	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}

	public Date getCdate() {
		return cdate;
	}

	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}

	public int getCrecommend() {
		return crecommend;
	}

	public void setCrecommend(int crecommend) {
		this.crecommend = crecommend;
	}

	public int getCnotrecommend() {
		return cnotrecommend;
	}

	public void setCnotrecommend(int cnotrecommend) {
		this.cnotrecommend = cnotrecommend;
	}

	public int getCref() {
		return cref;
	}

	public void setCref(int cref) {
		this.cref = cref;
	}

	public int getClev() {
		return clev;
	}

	public void setClev(int clev) {
		this.clev = clev;
	}

	public int getCsunbun() {
		return csunbun;
	}

	public void setCsunbun(int csunbun) {
		this.csunbun = csunbun;
	}
}
