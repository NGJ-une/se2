package com.hotel.main;

public class RoomDTO {
	private String roomType;
	private int room_idx;
	private String imgName;
	private String roomPrice;
	private int roomMax;
	
	public RoomDTO() {
		
	}

	public RoomDTO(String roomType, int room_idx, String imgName, String roomPrice, int roomMax) {
		super();
		this.roomType = roomType;
		this.room_idx = room_idx;
		this.imgName = imgName;
		this.roomPrice = roomPrice;
		this.roomMax = roomMax;
	}

	public String getRoomType() {
		return roomType;
	}

	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}

	public int getRoom_idx() {
		return room_idx;
	}

	public void setRoom_idx(int room_idx) {
		this.room_idx = room_idx;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	public String getRoomPrice() {
		return roomPrice;
	}

	public void setRoomPrice(String roomPrice) {
		this.roomPrice = roomPrice;
	}

	public int getRoomMax() {
		return roomMax;
	}

	public void setRoomMax(int roomMax) {
		this.roomMax = roomMax;
	}
	
	
}
