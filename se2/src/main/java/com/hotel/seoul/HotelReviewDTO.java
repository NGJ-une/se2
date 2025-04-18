package com.hotel.seoul;

import java.sql.*;
import java.sql.Date;
import java.util.*;

//후기 게시판 테이블
public class HotelReviewDTO {

	private int vidx;
	private String vid;
	private String vtitle;
	private String vcontent;
	private Date vdate;
	private int vreadnum;
	private int vrecommend;
	private int vcomment;
	private int vtotal;
	private int rnum;
	private int vridx;
	
	public HotelReviewDTO() {

		
	}

	public HotelReviewDTO(String vid, String vtitle) {
		super();
		
		this.vid = vid;
		this.vtitle = vtitle;
		
	}

	public HotelReviewDTO(int vidx, String vid, String vtitle, String vcontent, Date vdate, int vreadnum,
			int vrecommend, int vcomment, int vtotal, int vridx) {
		super();
		this.vidx = vidx;
		this.vid = vid;
		this.vtitle = vtitle;
		this.vcontent = vcontent;
		this.vdate = vdate;
		this.vreadnum = vreadnum;
		this.vrecommend = vrecommend;
		this.vcomment = vcomment;
		this.vtotal = vtotal;
		this.vridx = vridx;
	}



	public HotelReviewDTO(int vidx, String vid, String vtitle, String vcontent, Date vdate, int vreadnum,
			int vrecommend, int vcomment, int vtotal, int rnum, int vridx) {
		super();
		this.vidx = vidx;
		this.vid = vid;
		this.vtitle = vtitle;
		this.vcontent = vcontent;
		this.vdate = vdate;
		this.vreadnum = vreadnum;
		this.vrecommend = vrecommend;
		this.vcomment = vcomment;
		this.vtotal = vtotal;
		this.rnum = rnum;
		this.vridx = vridx;
	}


	public int getVridx() {
		return vridx;
	}

	public void setVridx(int vridx) {
		this.vridx = vridx;
	}

	public int getVidx() {
		return vidx;
	}


	public void setVidx(int vidx) {
		this.vidx = vidx;
	}


	public String getVid() {
		return vid;
	}


	public void setVid(String vid) {
		this.vid = vid;
	}


	public String getVtitle() {
		return vtitle;
	}


	public void setVtitle(String vtitle) {
		this.vtitle = vtitle;
	}


	public String getVcontent() {
		return vcontent;
	}


	public void setVcontent(String vcontent) {
		this.vcontent = vcontent;
	}


	public Date getVdate() {
		return vdate;
	}


	public void setVdate(Date vdate) {
		this.vdate = vdate;
	}


	public int getVreadnum() {
		return vreadnum;
	}


	public void setVreadnum(int vreadnum) {
		this.vreadnum = vreadnum;
	}


	public int getVrecommend() {
		return vrecommend;
	}


	public void setVrecommend(int vrecommend) {
		this.vrecommend = vrecommend;
	}


	public int getVcomment() {
		return vcomment;
	}


	public void setVcomment(int vcomment) {
		this.vcomment = vcomment;
	}


	public int getVtotal() {
		return vtotal;
	}


	public void setVtotal(int vtotal) {
		this.vtotal = vtotal;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	
	
}
