package com.hotel.seoul;

public class HotelPhotoDTO {

	private int pidx;
	private int pnum;
	private String pname;
	
	public HotelPhotoDTO() {
		
	}

	public HotelPhotoDTO(int pidx, int pnum, String pname) {
		super();
		this.pidx = pidx;
		this.pnum = pnum;
		this.pname = pname;
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

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}
}
