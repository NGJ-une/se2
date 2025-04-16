package com.hotel.seoul;

public class HotelPhotoDTO {

	private int pidx;
	private int pnum;
	private String pname1;
	private String pname2;
	private String pname3;
	
	public HotelPhotoDTO() {
		
	}

	public HotelPhotoDTO(int pidx, int pnum, String pname1, String pname2, String pname3) {
		super();
		this.pidx = pidx;
		this.pnum = pnum;
		this.pname1 = pname1;
		this.pname2 = pname2;
		this.pname3 = pname3;
		
	}
	
	public HotelPhotoDTO(String pname1, String pname2, String pname3) {
		super();
		this.pname1 = pname1;
		this.pname2 = pname2;
		this.pname3 = pname3;
		
	}
	
	public int getPidx() {
		return pidx;
	}

	public void setPidx(int pidx) {
		this.pidx = pidx;
	}

	public int getPnum() {
		return pnum;
	}

	public void setPnum(int pnum) {
		this.pnum = pnum;
	}

	public String getPname1() {
		return pname1;
	}

	public void setPname1(String pname1) {
		this.pname1 = pname1;
	}

	public String getPname2() {
		return pname2;
	}

	public void setPname2(String pname2) {
		this.pname2 = pname2;
	}

	public String getPname3() {
		return pname3;
	}

	public void setPname3(String pname3) {
		this.pname3 = pname3;
	}

}