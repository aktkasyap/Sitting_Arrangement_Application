package com.ankit.floor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.ankit.db.ArrangementDb;
import com.ankit.staff.StaffDto;

public class FloorDao {
		private Connection conn = null;
		private PreparedStatement ps = null;
		private ResultSet rs = null;

		public FloorDao() {
		}

		public boolean addFloor(FloorDto dto) {
			boolean flag = false;
			try {
				if (conn == null) {
					conn = ArrangementDb.getArrangementDb();
				}
				String sql = "insert into floor(floor,rno) values (?,?)";
				ps = conn.prepareStatement(sql);
				ps.setString(1, dto.getFloor());
				ps.setString(2, dto.getRno());
				if (ps.executeUpdate() > 0) {
					flag = true;
				}
			} catch (Exception e) {
				System.out.println("Exception in addFloor :" + e);
			} finally {
				ps = null;
				conn = null;
				return flag;
			}
		}

		public boolean updateFloor(FloorDto dto) {
			boolean flag = false;
			try {
				if (conn == null) {
					conn = ArrangementDb.getArrangementDb();
				}
				String sql = "update floor set floor=?,rno=? where fid=?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, dto.getFloor());
				ps.setString(2, dto.getRno());
				ps.setInt(3, dto.getFid());
				if (ps.executeUpdate() > 0) {
					flag = true;
				}
			} catch (Exception e) {
				System.out.println("Exception at updateFloor :" + e);
			} finally {
				ps = null;
				conn = null;
				return flag;
			}
		}

		public boolean deleteFloor(int fid) {
			boolean flag = false;
			if (conn == null) {
				conn = ArrangementDb.getArrangementDb();
			}
			try {
				String sql = "delete from floor where fid=?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, fid);
				if (ps.executeUpdate() > 0) {
					flag = true;
				}
			} catch (Exception e) {
				System.out.println("Exception at deleteFloor :" + e);
			} finally {
				ps = null;
				conn = null;
				return flag;
			}
		}

		public FloorDto getFloor(int fid) {
			FloorDto dto = null;
			if (conn == null) {
				conn = ArrangementDb.getArrangementDb();
			}
			try {
				String sql = "select * from floor where fid =?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, fid);
				rs = ps.executeQuery();
				if (rs.next()) {
					dto = new FloorDto();
					dto.setFid(rs.getInt("fid"));
					dto.setFloor(rs.getString("floor"));
					dto.setRno(rs.getString("rno"));
				}
			} catch (Exception e) {
				System.out.println("Exception at getFloor :" + e);
			} finally {
				rs = null;
				ps = null;
				conn = null;
				return dto;
			}
		}

		public ArrayList<FloorDto> getFloor_Room(String floor) {
			FloorDto dto = null;
			ArrayList<FloorDto>  list=new ArrayList<FloorDto>();
			if (conn == null) {
				conn = ArrangementDb.getArrangementDb();
			}
			try {
				String sql = "select * from floor where floor =?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, floor);
				rs = ps.executeQuery();
				while (rs.next()) {
					dto = new FloorDto();
					dto.setFid(rs.getInt("fid"));
					dto.setFloor(rs.getString("floor"));
					dto.setRno(rs.getString("rno"));
					list.add(dto);
				}
			} catch (Exception e) {
				System.out.println("Exception at getFloor_Room :" + e);
			} finally {
				rs = null;
				ps = null;
				conn = null;
				return list;
			}
		}		

		public ArrayList<FloorDto> getAllFloor() {
			ArrayList<FloorDto> al = new ArrayList<>();
			if (conn == null) {
				conn = ArrangementDb.getArrangementDb();
			}
			try {
				String sql = "select * from floor";
				ps = conn.prepareStatement(sql);
				rs = ps.executeQuery();
				while (rs.next()) {
					FloorDto dto = new FloorDto();
					dto.setFid(rs.getInt("fid"));
					dto.setFloor(rs.getString("floor"));
					dto.setRno(rs.getString("rno"));
					al.add(dto);
				}
			} catch (Exception e) {
				System.out.println("Exception at getAllFloor :" + e);
			} finally {
				rs = null;
				ps = null;
				conn = null;
				return al;
			}
		}

}
