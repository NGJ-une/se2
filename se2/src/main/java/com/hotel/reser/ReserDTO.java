package com.hotel.reser;

import java.sql.Date;

public class ReserDTO {
	private int idx;
	private String id;
	private String name;
	private String type;
	private Date checkIn;
	private Date checkOut;
	private int adult;
	private int kid;
	private int baby;
	private int money;


	public ReserDTO() {
		
	}


	public ReserDTO(int idx, String id, String name, String type, Date checkIn, Date checkOut, int adult, int kid,
			int baby, int money) {
		super();
		this.idx = idx;
		this.id = id;
		this.name = name;
		this.type = type;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.adult = adult;
		this.kid = kid;
		this.baby = baby;
		this.money = money;
	}


	public int getIdx() {
		return idx;
	}


	public void setIdx(int idx) {
		this.idx = idx;
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


	public Date getCheckIn() {
		return checkIn;
	}


	public void setCheckIn(Date checkIn) {
		this.checkIn = checkIn;
	}


	public Date getCheckOut() {
		return checkOut;
	}


	public void setCheckOut(Date checkOut) {
		this.checkOut = checkOut;
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
	
	
}