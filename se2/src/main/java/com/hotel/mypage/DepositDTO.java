package com.hotel.mypage;

import java.util.*;
import java.sql.*;

public class DepositDTO {
 
	private String id;
	private String grade;
	private int point;
	private int money;
	
	public DepositDTO() {
		// TODO Auto-generated constructor stub
	}                                                                                                                                                                                                                                                                                         

	public DepositDTO(String id, String grade, int point, int money) {
		super();
		this.id = id;
		this.grade = grade;
		this.point = point;
		this.money = money;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}
	
}
