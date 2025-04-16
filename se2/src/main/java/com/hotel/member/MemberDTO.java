package com.hotel.member;
import java.sql.*;
public class MemberDTO {

	private String id;
	private int idx;
	private String pwd;
	private String fname;
	private String lname;
	private String birth;
	private String email;
	private String tel;
	private String addr;
	private String grade;
	private Date join_date;
	private int point;
	private int money;
	private int discount;
	private int question;
	private String answer;
	
	public MemberDTO() {

	}

	public MemberDTO(String id, int idx, String pwd, String fname, String lname, String birth, String email, String tel,
			String addr, String grade, Date join_date, int point, int money, int discount, int question,
			String answer) {
		super();
		this.id = id;
		this.idx = idx;
		this.pwd = pwd;
		this.fname = fname;
		this.lname = lname;
		this.birth = birth;
		this.email = email;
		this.tel = tel;
		this.addr = addr;
		this.grade = grade;
		this.join_date = join_date;
		this.point = point;
		this.money = money;
		this.discount = discount;
		this.question = question;
		this.answer = answer;
	}



	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public Date getJoin_date() {
		return join_date;
	}

	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
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

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public int getQuestion() {
		return question;
	}

	public void setQuestion(int question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

}

