package com.hotel.member;

public class RegisterDTO {
	private int midx;
	private String mid;
	private String mfname;
	private String mlname;
	
	public RegisterDTO() {
		// TODO Auto-generated constructor stub
	}

	public RegisterDTO(int midx, String mid, String mfname, String mlname) {
		super();
		this.midx = midx;
		this.mid = mid;
		this.mfname = mfname;
		this.mlname = mlname;
	}

	public int getMidx() {
		return midx;
	}

	public void setMidx(int midx) {
		this.midx = midx;
	}

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
	
}
