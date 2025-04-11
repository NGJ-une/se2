package com.hotel.mypage;

import java.util.*;

import java.sql.*;
import java.sql.Date;

public class AsklistDTO {
	
	private int rownum;
	private int iidx;
	private String iid;
	private String itype;
	private String ititle;
	private String icontent;
	private Date idate;
	
	public AsklistDTO() {
		// TODO Auto-generated constructor stub
	}
	


	public String getItype() {
		return itype;
	}



	public void setItype(String itype) {
		this.itype = itype;
	}



	public AsklistDTO(int rownum, String itype,String ititle, Date idate, int iidx) {
		super();
		this.iidx = iidx;
		this.itype = itype;
		this.rownum = rownum;
		this.ititle = ititle;
		this.idate = idate;
	}
	public AsklistDTO(String itype,String ititle, String icontent,Date idate) {
		super();
		this.itype = itype;
		this.ititle = ititle;
		this.idate = idate;
		this.icontent=icontent;
	}
	public int getRownum() {
		return rownum;
	}


	public void setRownum(int rownum) {
		this.rownum = rownum;
	}


	public AsklistDTO(int iidx, String iid, String itype, String ititle, String icontent, Date idate, int iref, int ilev,
			int isunbun) {
		super();
		this.iidx = iidx;
		this.iid = iid;
		this.itype = itype;
		this.ititle = ititle;
		this.icontent = icontent;
		this.idate = idate;

	}


	public int getIidx() {
		return iidx;
	}
	public void setIidx(int iidx) {
		this.iidx = iidx;
	}
	public String getIid() {
		return iid;
	}
	public void setIid(String iid) {
		this.iid = iid;
	}
	public String getItitle() {
		return ititle;
	}
	public void setItitle(String ititle) {
		this.ititle = ititle;
	}
	public String getIcontent() {
		return icontent;
	}
	public void setIcontent(String icontent) {
		this.icontent = icontent;
	}
	public Date getIdate() {
		return idate;
	}
	public void setIdate(Date idate) {
		this.idate = idate;
	}

	

}
