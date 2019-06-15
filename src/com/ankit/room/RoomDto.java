package com.ankit.room;

import java.io.Serializable;

public class RoomDto implements Serializable {
	private int rid, col1, col2, col3, col4, col5, col6, tot;
	private String college, floor, rno;

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public int getCol1() {
		return col1;
	}

	public void setCol1(int col1) {
		this.col1 = col1;
	}

	public int getCol2() {
		return col2;
	}

	public void setCol2(int col2) {
		this.col2 = col2;
	}

	public int getCol3() {
		return col3;
	}

	public void setCol3(int col3) {
		this.col3 = col3;
	}

	public int getCol4() {
		return col4;
	}

	public void setCol4(int col4) {
		this.col4 = col4;
	}

	public int getCol5() {
		return col5;
	}

	public void setCol5(int col5) {
		this.col5 = col5;
	}

	public int getCol6() {
		return col6;
	}

	public void setCol6(int col6) {
		this.col6 = col6;
	}

	public int getTot() {
		return tot;
	}

	public void setTot(int tot) {
		this.tot = tot;
	}

	public String getCollege() {
		return college;
	}

	public void setCollege(String college) {
		this.college = college;
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

	public RoomDto() {
	}
}
