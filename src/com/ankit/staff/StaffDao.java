package com.ankit.staff;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.ankit.db.ArrangementDb;
import com.ankit.utility.SittingUtility;

public class StaffDao {
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	public StaffDao() {
	}

	public boolean addStaff(StaffDto dto) {
		boolean flag = false;
		try {
			if (conn == null) {
				conn = ArrangementDb.getArrangementDb();
			}
			String sql = "insert into staff(name,branch,uname,pwd,email) values (?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getBranch());
			ps.setString(3, dto.getUname());
			ps.setString(4, dto.getPwd());
			ps.setString(5, dto.getEmail());
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("Exception in addStaff :" + e);
		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	public boolean updateStaff(StaffDto dto) {
		boolean flag = false;
		try {
			if (conn == null) {
				conn = ArrangementDb.getArrangementDb();
			}
			String sql = "update staff set name=?,branch=?,uname=?,pwd=?,email=? where id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getBranch());
			ps.setString(3, dto.getUname());
			ps.setString(4, dto.getPwd());
			ps.setString(5, dto.getEmail());
			ps.setInt(6, dto.getId());
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("Exception at updateStaff :" + e);
		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	public boolean deleteStaff(int id) {
		boolean flag = false;
		if (conn == null) {
			conn = ArrangementDb.getArrangementDb();
		}
		try {
			String sql = "delete from staff where id=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("Exception at deleteStaff :" + e);
		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	public StaffDto getStaff(int id) {
		StaffDto dto = null;
		if (conn == null) {
			conn = ArrangementDb.getArrangementDb();
		}
		try {
			String sql = "select * from staff where id =?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				dto = new StaffDto();
				dto.setId(rs.getInt("id"));
				dto.setName(rs.getString("name"));
				dto.setBranch(rs.getString("branch"));
				dto.setUname(rs.getString("uname"));
				dto.setPwd(rs.getString("pwd"));
				dto.setEmail(rs.getString("email"));
			}
		} catch (Exception e) {
			System.out.println("Exception at getStaff :" + e);
		} finally {
			rs = null;
			ps = null;
			conn = null;
			return dto;
		}
	}

	public StaffDto staffLogin(String uname, String pwd) {
		StaffDto dto = null;
		if (conn == null) {
			conn = ArrangementDb.getArrangementDb();
		}
		try {
			String sql = "select * from staff where uname=? and pwd=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, uname);
			ps.setString(2, pwd);
			rs = ps.executeQuery();
			if (rs.next()) {
				dto = new StaffDto();
				dto.setId(rs.getInt("id"));
				dto.setName(rs.getString("name"));
				dto.setBranch(rs.getString("branch"));
				dto.setUname(rs.getString("uname"));
				dto.setPwd(rs.getString("pwd"));
				dto.setEmail(rs.getString("email"));
			}
		} catch (Exception e) {
			System.out.println("Exception at staffLogin :" + e);
		} finally {
			rs = null;
			ps = null;
			conn = null;
			return dto;
		}
	}

	public ArrayList<StaffDto> getAllStaff() {
		ArrayList<StaffDto> al = new ArrayList<>();
		if (conn == null) {
			conn = ArrangementDb.getArrangementDb();
		}
		try {
			String sql = "select * from staff";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				StaffDto dto = new StaffDto();
				dto.setId(rs.getInt("id"));
				dto.setName(rs.getString("name"));
				dto.setBranch(rs.getString("branch"));
				dto.setUname(rs.getString("uname"));
				dto.setPwd(rs.getString("pwd"));
				dto.setEmail(rs.getString("email"));
				al.add(dto);
			}
		} catch (Exception e) {
			System.out.println("Exception at getAllStaff :" + e);
		} finally {
			rs = null;
			ps = null;
			conn = null;
			return al;
		}
	}

	public int sendOtp(String email) {
		int otp = 0;
		try {
			if (conn == null) {
				conn = ArrangementDb.getArrangementDb();
			}
			ps = conn.prepareStatement("Select * from staff where email=?");
			ps.setString(1, email);
			rs = ps.executeQuery();
			if (rs.next()) {
				otp = SittingUtility.getRandom();
				if (!new SittingUtility().sendMail("" + otp, email)) {
					otp = 0;
				}
			} else {
				otp = 1;
			}
		} catch (Exception e) {
			System.out.println("Exception at sendOtp : " + e);
		} finally {
			rs = null;
			ps = null;
			conn = null;
			return otp;
		}
	}

	public boolean changePassword(String email, String password) {
		boolean flag = true;
		try {
			if (conn == null) {
				conn = ArrangementDb.getArrangementDb();
			}
			String query = "update staff set pwd=? where email=?";
			ps = conn.prepareStatement(query);
			ps.setString(1, password);
			ps.setString(2, email);
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("Exception in changePassword : " + e.getMessage());
		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

}
