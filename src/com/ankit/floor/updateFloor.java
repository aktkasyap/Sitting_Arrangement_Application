package com.ankit.floor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ankit.student.StudentDao;

@WebServlet(name = "UpdateFloor", urlPatterns = { "/UpdateFloor" })
public class updateFloor extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fid = req.getParameter("fid");
		String floor = req.getParameter("floor");
		String rno = req.getParameter("rno");
		FloorDto dto = new FloorDto();
		dto.setFid(Integer.parseInt(fid));
		dto.setFloor(floor);
		dto.setRno(rno);
		if (new FloorDao().updateFloor(dto)) {
			resp.sendRedirect("admin/manageFloor.jsp");
		} else {
			resp.sendRedirect("admin/manageFloor.jsp?msg=Registration Failed");
		}
	}
}
