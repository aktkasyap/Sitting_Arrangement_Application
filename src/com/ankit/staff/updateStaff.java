package com.ankit.staff;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ankit.floor.FloorDao;

@WebServlet(name = "UpdateStaff", urlPatterns = { "/UpdateStaff" })
public class updateStaff extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String branch = req.getParameter("branch");
		String uname = req.getParameter("uname");
		String pwd = req.getParameter("pwd");
		String email = req.getParameter("email");
		StaffDto dto = new StaffDto();
		dto.setId(Integer.parseInt(id));
		dto.setName(name);
		dto.setUname(uname);
		dto.setBranch(branch);
		dto.setPwd(pwd);
		dto.setEmail(email);
		if (new StaffDao().updateStaff(dto)) {
			resp.sendRedirect("admin/manageStaff.jsp");
		} else {
			resp.sendRedirect("admin/manageStaff.jsp?msg=Registration Failed");
		}
	}
}
