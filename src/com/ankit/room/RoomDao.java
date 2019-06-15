package com.ankit.room;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.ankit.db.ArrangementDb;
import com.ankit.staff.StaffDto;

public class RoomDao {
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	public RoomDao() {
	}

	public boolean addRoom(RoomDto dto) {
		boolean flag = false;
		try {
			if (conn == null) {
				conn = ArrangementDb.getArrangementDb();
			}
			String sql = "insert into room(college,floor,rno,col1,col2,col3,col4,col5,col6,tot) values (?,?,?,?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getCollege());
			ps.setString(2, dto.getFloor());
			ps.setString(3, dto.getRno());
			ps.setInt(4, dto.getCol1());
			ps.setInt(5, dto.getCol2());
			ps.setInt(6, dto.getCol3());
			ps.setInt(7, dto.getCol4());
			ps.setInt(8, dto.getCol5());
			ps.setInt(9, dto.getCol6());
			ps.setInt(10,
					(dto.getCol1() + dto.getCol2() + dto.getCol3() + dto.getCol4() + dto.getCol5() + dto.getCol6()));
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("Exception in addRoom :" + e);
		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	public boolean updateRoom(RoomDto dto) {
		boolean flag = false;
		try {
			if (conn == null) {
				conn = ArrangementDb.getArrangementDb();
			}
			String sql = "update room set college=?,floor=?,rno=?,col1=?,col2=?,col3=?,col4=?,col5=?,col6=?,tot=? where rid=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getCollege());
			ps.setString(2, dto.getFloor());
			ps.setString(3, dto.getRno());
			ps.setInt(4, dto.getCol1());
			ps.setInt(5, dto.getCol2());
			ps.setInt(6, dto.getCol3());
			ps.setInt(7, dto.getCol4());
			ps.setInt(8, dto.getCol5());
			ps.setInt(9, dto.getCol6());
			ps.setInt(10,
					(dto.getCol1() + dto.getCol2() + dto.getCol3() + dto.getCol4() + dto.getCol5() + dto.getCol6()));
			ps.setInt(11, dto.getRid());
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("Exception at updateRoom :" + e);
		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	public boolean deleteRoom(int rid) {
		boolean flag = false;
		if (conn == null) {
			conn = ArrangementDb.getArrangementDb();
		}
		try {
			String sql = "delete from room where rid=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, rid);
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("Exception at deleteRoom :" + e);
		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	public RoomDto getRoom(int rid) {
		RoomDto dto = null;
		if (conn == null) {
			conn = ArrangementDb.getArrangementDb();
		}
		try {
			String sql = "select * from room where rid =?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, rid);
			rs = ps.executeQuery();
			if (rs.next()) {
				dto = new RoomDto();
				dto.setRid(rs.getInt("rid"));
				dto.setCollege(rs.getString("college"));
				dto.setFloor(rs.getString("floor"));
				dto.setRno(rs.getString("rno"));
				dto.setCol1(rs.getInt("col1"));
				dto.setCol2(rs.getInt("col2"));
				dto.setCol3(rs.getInt("col3"));
				dto.setCol4(rs.getInt("col4"));
				dto.setCol5(rs.getInt("col5"));
				dto.setCol6(rs.getInt("col6"));
				dto.setTot(rs.getInt("tot"));

			}
		} catch (Exception e) {
			System.out.println("Exception at getRoom :" + e);
		} finally {
			rs = null;
			ps = null;
			conn = null;
			return dto;
		}
	}

	public ArrayList<RoomDto> getAllRoom() {
		ArrayList<RoomDto> al = new ArrayList<>();
		if (conn == null) {
			conn = ArrangementDb.getArrangementDb();
		}
		try {
			String sql = "select * from room";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				RoomDto dto = new RoomDto();
				dto.setRid(rs.getInt("rid"));
				dto.setCollege(rs.getString("college"));
				dto.setFloor(rs.getString("floor"));
				dto.setRno(rs.getString("rno"));
				dto.setCol1(rs.getInt("col1"));
				dto.setCol2(rs.getInt("col2"));
				dto.setCol3(rs.getInt("col3"));
				dto.setCol4(rs.getInt("col4"));
				dto.setCol5(rs.getInt("col5"));
				dto.setCol6(rs.getInt("col6"));
				dto.setTot(rs.getInt("tot"));

				al.add(dto);
			}
		} catch (Exception e) {
			System.out.println("Exception at getAllRoom :" + e);
		} finally {
			rs = null;
			ps = null;
			conn = null;
			return al;
		}
	}

	public int getRoomDesks(String college, String floor, String rno) {
		int total = 0;
		if (conn == null) {
			conn = ArrangementDb.getArrangementDb();
		}
		try {
			String sql = "select * from room where college=? and floor=? and rno=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, college);
			ps.setString(2, floor);
			ps.setString(3, rno);
			rs = ps.executeQuery();
			if (rs.next()) {
				RoomDto dto = new RoomDto();
				total = rs.getInt("tot");
			}
		} catch (Exception e) {
			System.out.println("Exception at getRoomDesks :" + e);
		} finally {
			rs = null;
			ps = null;
			conn = null;
			return total;
		}
	}

}
