package com.ankit.student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.ankit.db.ArrangementDb;
import com.ankit.floor.FloorDto;

public class StudentDao {
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	public StudentDao() {
	}

	public boolean addStudent(StudentDto dto, String course, String branch, String year) {
		boolean flag = false;
		String choice = "";
		if (course != null && branch != null && year != null) {
			choice = course + "_" + branch + "_" + year;
		}
		try {
			if (conn == null) {
				conn = ArrangementDb.getArrangementDb();
			}
			switch (choice) {
			case "BE_CSE_FIRST":
				String sql1 = "insert into BE_CSE_FIRST(enroll,name) values (?,?)";
				ps = conn.prepareStatement(sql1);
				break;
			case "BE_CSE_SECOND":
				String sql2 = "insert into BE_CSE_SECOND(enroll,name) values (?,?)";
				ps = conn.prepareStatement(sql2);
				break;
			case "BE_CSE_THIRD":
				String sql3 = "insert into BE_CSE_THIRD(enroll,name) values (?,?)";
				ps = conn.prepareStatement(sql3);
				break;
			case "BE_CSE_FOURTH":
				String sql4 = "insert into BE_CSE_FOURTH(enroll,name) values (?,?)";
				ps = conn.prepareStatement(sql4);
				break;
			case "BE_ME_FIRST":
				String sql5 = "insert into BE_ME_FIRST(enroll,name) values (?,?)";
				ps = conn.prepareStatement(sql5);
				break;
			case "BE_ME_SECOND":
				String sql6 = "insert into BE_ME_SECOND(enroll,name) values (?,?)";
				ps = conn.prepareStatement(sql6);

				break;
			case "BE_ME_THIRD":
				String sql7 = "insert into BE_ME_THIRD(enroll,name) values (?,?)";
				ps = conn.prepareStatement(sql7);
				break;
			case "BE_ME_FOURTH":
				String sql8 = "insert into BE_ME_FOURTH(enroll,name) values (?,?)";
				ps = conn.prepareStatement(sql8);
				break;
			default:
				System.out.println("Invalid Choice");
				break;
			}
			ps.setString(1, dto.getEnroll());
			ps.setString(2, dto.getName());
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("Exception in addStudent :" + e);
		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	public boolean updateStudent(StudentDto dto, String course, String branch, String year) {
		boolean flag = false;
		String choice = "";
		if (course != null && branch != null && year != null) {
		}
		if (course != null && branch != null && year != null) {
			choice = course + "_" + branch + "_" + year;
		}
		try {
			if (conn == null) {
				conn = ArrangementDb.getArrangementDb();
			}
			switch (choice) {
			case "BE_CSE_FIRST":
				String sql1 = "update BE_CSE_FIRST set enroll=?,name=? where id=?";
				ps = conn.prepareStatement(sql1);
				break;
			case "BE_CSE_SECOND":
				String sql2 = "insert into BE_CSE_SECOND set enroll=?,name=? where id=?";
				ps = conn.prepareStatement(sql2);
				break;
			case "BE_CSE_THIRD":
				String sql3 = "insert into BE_CSE_THIRD set enroll=?,name=? where id=?";
				ps = conn.prepareStatement(sql3);
				break;
			case "BE_CSE_FOURTH":
				String sql4 = "insert into BE_CSE_FOURTH set enroll=?,name=? where id=?";
				ps = conn.prepareStatement(sql4);
				break;
			case "BE_ME_FIRST":
				String sql5 = "insert into BE_ME_FIRST set enroll=?,name=? where id=?";
				ps = conn.prepareStatement(sql5);
				break;
			case "BE_ME_SECOND":
				String sql6 = "insert into BE_ME_SECOND set enroll=?,name=? where id=?";
				ps = conn.prepareStatement(sql6);

				break;
			case "BE_ME_THIRD":
				String sql7 = "insert into BE_ME_THIRD set enroll=?,name=? where id=?";
				ps = conn.prepareStatement(sql7);
				break;
			case "BE_ME_FOURTH":
				String sql8 = "insert into BE_ME_FOURTH set enroll=?,name=? where id=?";
				ps = conn.prepareStatement(sql8);
				break;
			default:
				System.out.println("Invalid Choice");
				break;
			}
			ps.setString(1, dto.getEnroll());
			ps.setString(2, dto.getName());
			ps.setInt(3, dto.getId());
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("Exception in updateStudent :" + e);
		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	public ArrayList<StudentDto> getAllStudent(String course, String branch, String year) {
		ArrayList<StudentDto> al = new ArrayList<>();
		String choice = "";
		if (course != null && branch != null && year != null) {
			choice = course + "_" + branch + "_" + year;
		}
		if (conn == null) {
			conn = ArrangementDb.getArrangementDb();
		}
		try {
			switch (choice) {
			case "BE_CSE_FIRST":
				String sql1 = "select * from BE_CSE_FIRST";
				ps = conn.prepareStatement(sql1);
				break;
			case "BE_CSE_SECOND":
				String sql2 = "select * from BE_CSE_SECOND";
				ps = conn.prepareStatement(sql2);
				break;
			case "BE_CSE_THIRD":
				String sql3 = "select * from BE_CSE_THIRD";
				ps = conn.prepareStatement(sql3);
				break;
			case "BE_CSE_FOURTH":
				String sql4 = "select * from BE_CSE_FOURTH";
				ps = conn.prepareStatement(sql4);
				break;
			case "BE_ME_FIRST":
				String sql5 = "select * from BE_ME_FIRST";
				ps = conn.prepareStatement(sql5);
				break;
			case "BE_ME_SECOND":
				String sql6 = "select * from BE_ME_SECOND";
				ps = conn.prepareStatement(sql6);

				break;
			case "BE_ME_THIRD":
				String sql7 = "select * from BE_ME_THIRD";
				ps = conn.prepareStatement(sql7);
				break;
			case "BE_ME_FOURTH":
				String sql8 = "select * from BE_ME_FOURTH";
				ps = conn.prepareStatement(sql8);
				break;
			default:
				System.out.println("Invalid Choice");
				break;
			}
			rs = ps.executeQuery();
			while (rs.next()) {
				StudentDto dto = new StudentDto();
				dto.setId(rs.getInt("id"));
				dto.setEnroll(rs.getString("enroll"));
				dto.setName(rs.getString("name"));
				al.add(dto);
			}
		} catch (Exception e) {
			System.out.println("Exception at getAllStudent :" + e);
		} finally {
			rs = null;
			ps = null;
			conn = null;
			return al;
		}
	}

	public StudentDto getStudent(int id, String course, String branch, String year) {
		StudentDto dto = null;
		String choice = "";
		if (course != null && branch != null && year != null) {
		}
		if (course != null && branch != null && year != null) {
			choice = course + "_" + branch + "_" + year;
		}
		if (conn == null) {
			conn = ArrangementDb.getArrangementDb();
		}
		try {
			switch (choice) {
			case "BE_CSE_FIRST":
				String sql1 = "select * from BE_CSE_FIRST where id=?";
				ps = conn.prepareStatement(sql1);
				break;
			case "BE_CSE_SECOND":
				String sql2 = "select * from BE_CSE_SECOND where id=?";
				ps = conn.prepareStatement(sql2);
				break;
			case "BE_CSE_THIRD":
				String sql3 = "select * from BE_CSE_THIRD where id=?";
				ps = conn.prepareStatement(sql3);
				break;
			case "BE_CSE_FOURTH":
				String sql4 = "select * from BE_CSE_FOURTH where id=?";
				ps = conn.prepareStatement(sql4);
				break;
			case "BE_ME_FIRST":
				String sql5 = "select * from BE_ME_FIRST where id=?";
				ps = conn.prepareStatement(sql5);
				break;
			case "BE_ME_SECOND":
				String sql6 = "select * from BE_ME_SECOND where id=?";
				ps = conn.prepareStatement(sql6);

				break;
			case "BE_ME_THIRD":
				String sql7 = "select * from BE_ME_THIRD where id=?";
				ps = conn.prepareStatement(sql7);
				break;
			case "BE_ME_FOURTH":
				String sql8 = "select * from BE_ME_FOURTH where id=?";
				ps = conn.prepareStatement(sql8);
				break;
			default:
				System.out.println("Invalid Choice");
				break;
			}
			ps.setInt(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				dto = new StudentDto();
				dto.setId(rs.getInt("id"));
				dto.setEnroll(rs.getString("enroll"));
				dto.setName(rs.getString("name"));
			}
		} catch (Exception e) {
			System.out.println("Exception at getStudent :" + e);
		} finally {
			rs = null;
			ps = null;
			conn = null;
			return dto;
		}
	}

	public boolean deleteAllStudent(String course, String branch, String year) {
		boolean flag = false;
		String choice = "";
		if (course != null && branch != null && year != null) {
			choice = course + "_" + branch + "_" + year;
		}
		try {
			if (conn == null) {
				conn = ArrangementDb.getArrangementDb();
			}
			switch (choice) {
			case "BE_CSE_FIRST":
				String sql1 = "delete from BE_CSE_FIRST";
				ps = conn.prepareStatement(sql1);
				break;
			case "BE_CSE_SECOND":
				String sql2 = "delete from BE_CSE_SECOND";
				ps = conn.prepareStatement(sql2);
				break;
			case "BE_CSE_THIRD":
				String sql3 = "delete from BE_CSE_THIRD";
				ps = conn.prepareStatement(sql3);
				break;
			case "BE_CSE_FOURTH":
				String sql4 = "delete from BE_CSE_FOURTH";
				ps = conn.prepareStatement(sql4);
				break;
			case "BE_ME_FIRST":
				String sql5 = "delete from BE_ME-FIRST";
				ps = conn.prepareStatement(sql5);
				break;
			case "BE_ME_SECOND":
				String sql6 = "delete from BE_ME-SECOND";
				ps = conn.prepareStatement(sql6);

				break;
			case "BE_ME_THIRD":
				String sql7 = "delete from BE_ME-THIRD";
				ps = conn.prepareStatement(sql7);
				break;
			case "BE_ME_FOURTH":
				String sql8 = "delete from BE_ME_FOURTH";
				ps = conn.prepareStatement(sql8);
				break;
			default:
				System.out.println("Invalid Choice");
				break;
			}
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("Exception in deleteAllStudent :" + e);
		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	public boolean deleteStudent(int id, String course, String branch, String year) {
		boolean flag = false;
		String choice = "";
		if (course != null && branch != null && year != null) {
			choice = course + "_" + branch + "_" + year;
		}
		try {
			if (conn == null) {
				conn = ArrangementDb.getArrangementDb();
			}
			switch (choice) {
			case "BE_CSE_FIRST":
				String sql1 = "delete from BE_CSE_FIRST where id=?";
				ps = conn.prepareStatement(sql1);
				break;
			case "BE_CSE_SECOND":
				String sql2 = "delete from BE_CSE_SECOND where id=?";
				ps = conn.prepareStatement(sql2);
				break;
			case "BE_CSE_THIRD":
				String sql3 = "delete from BE_CSE_THIRD where id=?";
				ps = conn.prepareStatement(sql3);
				break;
			case "BE_CSE_FOURTH":
				String sql4 = "delete from BE_CSE_FOURTH where id=?";
				ps = conn.prepareStatement(sql4);
				break;
			case "BE_ME_FIRST":
				String sql5 = "delete from BE_ME-FIRST where id=?";
				ps = conn.prepareStatement(sql5);
				break;
			case "BE_ME_SECOND":
				String sql6 = "delete from BE_ME-SECOND where id=?";
				ps = conn.prepareStatement(sql6);

				break;
			case "BE_ME_THIRD":
				String sql7 = "delete from BE_ME-THIRD where id=?";
				ps = conn.prepareStatement(sql7);
				break;
			case "BE_ME_FOURTH":
				String sql8 = "delete from BE_ME_FOURTH where id=?";
				ps = conn.prepareStatement(sql8);
				break;
			default:
				System.out.println("Invalid Choice");
				break;
			}
			ps.setInt(1, id);
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("Exception in deleteStudent :" + e);
		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	public int getAllStudentCount(String course, String branch, String year) {
		int count = 0;
		String choice = "";
		if (course != null && branch != null && year != null) {
			choice = course + "_" + branch + "_" + year;
		}
		if (conn == null) {
			conn = ArrangementDb.getArrangementDb();
		}
		try {
			switch (choice) {
			case "BE_CSE_FIRST":
				String sql1 = "select * from BE_CSE_FIRST";
				ps = conn.prepareStatement(sql1);
				break;
			case "BE_CSE_SECOND":
				String sql2 = "select * from BE_CSE_SECOND";
				ps = conn.prepareStatement(sql2);
				break;
			case "BE_CSE_THIRD":
				String sql3 = "select * from BE_CSE_THIRD";
				ps = conn.prepareStatement(sql3);
				break;
			case "BE_CSE_FOURTH":
				String sql4 = "select * from BE_CSE_FOURTH";
				ps = conn.prepareStatement(sql4);
				break;
			case "BE_ME_FIRST":
				String sql5 = "select * from BE_ME_FIRST";
				ps = conn.prepareStatement(sql5);
				break;
			case "BE_ME_SECOND":
				String sql6 = "select * from BE_ME_SECOND";
				ps = conn.prepareStatement(sql6);

				break;
			case "BE_ME_THIRD":
				String sql7 = "select * from BE_ME_THIRD";
				ps = conn.prepareStatement(sql7);
				break;
			case "BE_ME_FOURTH":
				String sql8 = "select * from BE_ME_FOURTH";
				ps = conn.prepareStatement(sql8);
				break;
			default:
				System.out.println("Invalid Choice");
				conn = null;
				return count;
			}
			rs = ps.executeQuery();
			while (rs.next()) {
				++count;
			}
		} catch (Exception e) {
			System.out.println("Exception at getAllStudentCount :" + e);
		} finally {
			rs = null;
			ps = null;
			conn = null;
			return count;
		}
	}

}
