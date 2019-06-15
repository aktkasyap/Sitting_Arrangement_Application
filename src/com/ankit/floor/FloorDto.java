package com.ankit.floor;

import java.io.Serializable;

public class FloorDto implements Serializable {
	public FloorDto() {
	}

	private int fid;
	private String floor, rno;

	public int getFid() {
		return fid;
	}

	public void setFid(int fid) {
		this.fid = fid;
	}

	public String getFloor() {
		return floor;
	}

	public void setFloor(String floor) {
		this.floor = floor;
	}

	public String getRno() {
		return rno;
	}

	public void setRno(String rno) {
		this.rno = rno;
	}

}
