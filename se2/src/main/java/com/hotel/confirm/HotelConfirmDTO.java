package com.hotel.confirm;

import java.sql.Date;

public class HotelConfirmDTO {
	
	//기본 예약 테이블 컬럼 
	private int number; // 예약번호 
	private String id; //아이디 
	private String name; //호텔 이름
	private String type; //객실 타입
	private java.sql.Date checkin; //체크인 날짜
	private java.sql.Date checkout; //체크인 날짜 
	private int adult; //성인
	private int kid; //어린이
	private int baby; //유아
	private int money; //결제금액

	// 회원가입에서 테이블에서 가져올 컬럼
	private String u_id; //회원아이디
	private String u_fname; //회원이름
	private String u_lname; //회원 성  
	private String u_tel; //회원 연락처
	private String u_email; //회원 이메일 
	
	public HotelConfirmDTO() {
		// TODO Auto-generated constructor stub
	}
	//예약 테이블 전체 필드 
	public HotelConfirmDTO(int number, String id, String name, String type, Date checkin, Date checkout, int adult,
			int kid, int baby, int money) {
		super();
		this.number = number;
		this.id = id;
		this.name = name;
		this.type = type;
		this.checkin = checkin;
		this.checkout = checkout;
		this.adult = adult;
		this.kid = kid;
		this.baby = baby;
		this.money = money;
	}
	//예약 테이블 getter setter
	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public java.sql.Date getCheckin() {
		return checkin;
	}

	public void setCheckin(java.sql.Date checkin) {
		this.checkin = checkin;
	}

	public java.sql.Date getCheckout() {
		return checkout;
	}

	public void setCheckout(java.sql.Date checkout) {
		this.checkout = checkout;
	}

	public int getAdult() {
		return adult;
	}

	public void setAdult(int adult) {
		this.adult = adult;
	}

	public int getKid() {
		return kid;
	}

	public void setKid(int kid) {
		this.kid = kid;
	}

	public int getBaby() {
		return baby;
	}

	public void setBaby(int baby) {
		this.baby = baby;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}
	
	//회원 테이블 getter setter
	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_fname() {
		return u_fname;
	}

	public void setU_fname(String u_fname) {
		this.u_fname = u_fname;
	}

	public String getU_lname() {
		return u_lname;
	}

	public void setU_lname(String u_lname) {
		this.u_lname = u_lname;
	}

	public String getU_tel() {
		return u_tel;
	}

	public void setU_tel(String u_tel) {
		this.u_tel = u_tel;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	
}
