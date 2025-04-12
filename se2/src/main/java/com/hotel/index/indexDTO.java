package com.hotel.index;

public class indexDTO {
	
	private String unu_point;
	private String total_point;
	private String now_grade;
	private int now_discount;
	private int total_reser;
	private String remain_grade;
	
	public indexDTO() {
		// TODO Auto-generated constructor stub
	}

	public indexDTO(String unu_point, String total_point, String now_grade, int now_discount, int total_reser,
			String remain_grade) {
		super();
		this.unu_point = unu_point;
		this.total_point = total_point;
		this.now_grade = now_grade;
		this.now_discount = now_discount;
		this.total_reser = total_reser;
		this.remain_grade = remain_grade;
	}

	public String getUnu_point() {
		return unu_point;
	}

	public void setUnu_point(String unu_point) {
		this.unu_point = unu_point;
	}

	public String getTotal_point() {
		return total_point;
	}

	public void setTotal_point(String total_point) {
		this.total_point = total_point;
	}

	public String getNow_grade() {
		return now_grade;
	}

	public void setNow_grade(String now_grade) {
		this.now_grade = now_grade;
	}

	public int getNow_discount() {
		return now_discount;
	}

	public void setNow_discount(int now_discount) {
		this.now_discount = now_discount;
	}

	public int getTotal_reser() {
		return total_reser;
	}

	public void setTotal_reser(int total_reser) {
		this.total_reser = total_reser;
	}

	public String getRemain_grade() {
		return remain_grade;
	}

	public void setRemain_grade(String remain_grade) {
		this.remain_grade = remain_grade;
	}

	
	
}
