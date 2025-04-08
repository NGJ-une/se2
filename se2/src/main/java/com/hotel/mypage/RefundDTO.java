package com.hotel.mypage;

import java.sql.*;
import java.sql.Date;
import java.util.*;

public class RefundDTO {

	private String mid;
	private int midx;
	private String mpwd;
	private String mfname;
	private String mlname;
	private String mbirth;
	private String memail;
	private String mtel;
	private String maddr;
	private String mgrade;
	private Date mjoin_date;
	private int mpoint;
	private int mmoney;
	private int mquestion;
	private String manswer;
	
	private int bidx;
	private String bid;
	private String bbank;
	private String bacount;
	private int brefund;
	private Date bdate;
	public RefundDTO() {
		// TODO Auto-generated constructor stub
	}
	
	

	public RefundDTO(String mid, int midx, String mpwd, String mfname, String mlname, String mbirth, String memail,
			String mtel, String maddr, String mgrade, Date mjoin_date, int mpoint, int mmoney, int mquestion,
			String manswer) {
		super();
		this.mid = mid;
		this.midx = midx;
		this.mpwd = mpwd;
		this.mfname = mfname;
		this.mlname = mlname;
		this.mbirth = mbirth;
		this.memail = memail;
		this.mtel = mtel;
		this.maddr = maddr;
		this.mgrade = mgrade;
		this.mjoin_date = mjoin_date;
		this.mpoint = mpoint;
		this.mmoney = mmoney;
		this.mquestion = mquestion;
		this.manswer = manswer;
	}

	

	public RefundDTO(int bidx, String bid, String bbank, String bacount, int brefund, Date bdate) {
		super();
		this.bidx = bidx;
		this.bid = bid;
		this.bbank = bbank;
		this.bacount = bacount;
		this.brefund = brefund;
		this.bdate = bdate;
	}



	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public int getMidx() {
		return midx;
	}

	public void setMidx(int midx) {
		this.midx = midx;
	}

	public String getMpwd() {
		return mpwd;
	}

	public void setMpwd(String mpwd) {
		this.mpwd = mpwd;
	}

	public String getMfname() {
		return mfname;
	}

	public void setMfname(String mfname) {
		this.mfname = mfname;
	}

	public String getMlname() {
		return mlname;
	}

	public void setMlname(String mlname) {
		this.mlname = mlname;
	}

	public String getMbirth() {
		return mbirth;
	}

	public void setMbirth(String mbirth) {
		this.mbirth = mbirth;
	}

	public String getMemail() {
		return memail;
	}

	public void setMemail(String memail) {
		this.memail = memail;
	}

	public String getMtel() {
		return mtel;
	}

	public void setMtel(String mtel) {
		this.mtel = mtel;
	}

	public String getMaddr() {
		return maddr;
	}

	public void setMaddr(String maddr) {
		this.maddr = maddr;
	}

	public String getMgrade() {
		return mgrade;
	}

	public void setMgrade(String mgrade) {
		this.mgrade = mgrade;
	}

	public Date getMjoin_date() {
		return mjoin_date;
	}

	public void setMjoin_date(Date mjoin_date) {
		this.mjoin_date = mjoin_date;
	}

	public int getMpoint() {
		return mpoint;
	}

	public void setMpoint(int mpoint) {
		this.mpoint = mpoint;
	}

	public int getMmoney() {
		return mmoney;
	}

	public void setMmoney(int mmoney) {
		this.mmoney = mmoney;
	}

	public int getMquestion() {
		return mquestion;
	}

	public void setMquestion(int mquestion) {
		this.mquestion = mquestion;
	}

	public String getManswer() {
		return manswer;
	}

	public void setManswer(String manswer) {
		this.manswer = manswer;
	}



	public int getBidx() {
		return bidx;
	}



	public void setBidx(int bidx) {
		this.bidx = bidx;
	}



	public String getBid() {
		return bid;
	}



	public void setBid(String bid) {
		this.bid = bid;
	}



	public String getBbank() {
		return bbank;
	}



	public void setBbank(String bbank) {
		this.bbank = bbank;
	}



	public String getBacount() {
		return bacount;
	}



	public void setBacount(String bacount) {
		this.bacount = bacount;
	}



	public int getBrefund() {
		return brefund;
	}



	public void setBrefund(int brefund) {
		this.brefund = brefund;
	}



	public Date getBdate() {
		return bdate;
	}



	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}

	
	
}
