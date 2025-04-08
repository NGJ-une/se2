package com.hotel.mypage;

import java.sql.*;
import java.sql.Date;
import java.util.*;

public class MainPageDTO {

	private int ridx;
	private String rid;
	private String rname;
	private String rtype;
	private Date rcheckin;
	private Date rcheckout;
	private int radult;
	private int rkid;
	private int rbaby;
	private int rmoney;
	
	public MainPageDTO() {
		// TODO Auto-generated constructor stub
	}

	public MainPageDTO(int ridx, String rid, String rname, String rtype, Date rcheckin, Date rcheckout, int radult,
			int rkid, int rbaby, int rmoney) {
		super();
		this.ridx = ridx;
		this.rid = rid;
		this.rname = rname;
		this.rtype = rtype;
		this.rcheckin = rcheckin;
		this.rcheckout = rcheckout;
		this.radult = radult;
		this.rkid = rkid;
		this.rbaby = rbaby;
		this.rmoney = rmoney;
	}

	public int getRidx() {
		return ridx;
	}

	public void setRidx(int ridx) {
		this.ridx = ridx;
	}

	public String getRid() {
		return rid;
	}

	public void setRid(String rid) {
		this.rid = rid;
	}

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	public String getRtype() {
		return rtype;
	}

	public void setRtype(String rtype) {
		this.rtype = rtype;
	}

	public Date getRcheckin() {
		return rcheckin;
	}

	public void setRcheckin(Date rcheckin) {
		this.rcheckin = rcheckin;
	}

	public Date getRcheckout() {
		return rcheckout;
	}

	public void setRcheckout(Date rcheckout) {
		this.rcheckout = rcheckout;
	}

	public int getRadult() {
		return radult;
	}

	public void setRadult(int radult) {
		this.radult = radult;
	}

	public int getRkid() {
		return rkid;
	}

	public void setRkid(int rkid) {
		this.rkid = rkid;
	}

	public int getRbaby() {
		return rbaby;
	}

	public void setRbaby(int rbaby) {
		this.rbaby = rbaby;
	}

	public int getRmoney() {
		return rmoney;
	}

	public void setRmoney(int rmoney) {
		this.rmoney = rmoney;
	}
	
	
}
