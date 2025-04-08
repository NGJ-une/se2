package com.hotel.mypage;

import java.util.*;

import java.sql.*;
import java.sql.Date;

public class AsklistDTO {
	
	private int rownum;
	private int iidx;
	private String iid;
	private String ititle;
	private String icontent;
	private Date idate;
	private int iref;
	private int ilev;
	private int isunbun;
	
	public AsklistDTO() {
		// TODO Auto-generated constructor stub
	}
	public AsklistDTO(int rownum, String ititle, Date idate) {
		super();
		this.rownum = rownum;
		this.ititle = ititle;
		this.idate = idate;
	}
	
	public int getRownum() {
		return rownum;
	}


	public void setRownum(int rownum) {
		this.rownum = rownum;
	}


	public AsklistDTO(int iidx, String iid, String ititle, String icontent, Date idate, int iref, int ilev,
			int isunbun) {
		super();
		this.iidx = iidx;
		this.iid = iid;
		this.ititle = ititle;
		this.icontent = icontent;
		this.idate = idate;
		this.iref = iref;
		this.ilev = ilev;
		this.isunbun = isunbun;
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
	public int getIref() {
		return iref;
	}
	public void setIref(int iref) {
		this.iref = iref;
	}
	public int getIlev() {
		return ilev;
	}
	public void setIlev(int ilev) {
		this.ilev = ilev;
	}
	public int getIsunbun() {
		return isunbun;
	}
	public void setIsunbun(int isunbun) {
		this.isunbun = isunbun;
	}
	
	

}
