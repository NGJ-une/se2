package com.hotel.reser;

public class RoomDTO {
	private String type;
	private int idx;
	private String imgName;
	private int price;
	private int capacity;
	
	public RoomDTO() {
		
	}

	public RoomDTO(String type, int idx, String imgName, int price, int capacity) {
		super();
		this.type = type;
		this.idx = idx;
		this.imgName = imgName;
		this.price = price;
		this.capacity = capacity;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	
	
}
