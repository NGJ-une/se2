package com.hotel.confirm;

import java.sql.Date;

public class HotelConfirmDTO {
	
	//기본 예약 테이블 컬럼 
	private int ridx; // 예약번호 
	private String rid; //아이디 
	private String rname; //호텔 이름
	private String rtype; //객실 타입
	private java.sql.Date rcheckin; //체크인 날짜
	private java.sql.Date rcheckout; //체크인 날짜 
	private int radult; //성인
	private int rkid; //어린이
	private int rbaby; //유아
	private int rmoney; //결제금액

	// 회원가입에서 테이블에서 가져올 컬럼
	private String mid; //회원아이디
	private String mfname; //회원이름
	private String mlname; //회원 성  
	private String mtel; //회원 연락처
	private String memail; //회원 이메일 
	
	//예약 확인 출력용 가상 컬럼
	private int persons;
	private int day;
	
	public HotelConfirmDTO() {
		// TODO Auto-generated constructor stub
	}
	//예약 테이블 전체 필드 
	public HotelConfirmDTO(int ridx, String rid, String rname, String rtype, Date rcheckin, Date rcheckout, int radult,
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
	
	//예약확인 출력 필드 persons 가상컬럼 추가 버전  
	public HotelConfirmDTO(int ridx, Date rcheckin, Date rcheckout, String mfname, String mlname, String mtel, String memail,String rtype,int persons, int day) {
		super();
		this.ridx = ridx;
		this.rcheckin = rcheckin;
		this.rcheckout = rcheckout;
		this.mfname = mfname;
		this.mlname = mlname;
		this.mtel = mtel;
		this.memail = memail;
		this.rtype = rtype;
		this.persons = persons;
		this.day = day;
	}
	
	//예약 테이블 getter setter
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
	public java.sql.Date getRcheckin() {
		return rcheckin;
	}
	public void setRcheckin(java.sql.Date rcheckin) {
		this.rcheckin = rcheckin;
	}
	public java.sql.Date getRcheckout() {
		return rcheckout;
	}
	public void setRcheckout(java.sql.Date rcheckout) {
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
	
	//회원 테이블 getter setter
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
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
	public String getMtel() {
		return mtel;
	}
	public void setMtel(String mtel) {
		this.mtel = mtel;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	
	//가상 컬럼전용 getter setter
	public int getPersons() {
		return persons;
	}
	public void setPersons(int persons) {
		this.persons = persons;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	
	
	
}
