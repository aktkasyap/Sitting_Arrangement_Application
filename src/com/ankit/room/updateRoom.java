package com.ankit.room;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ankit.floor.FloorDao;

@WebServlet(name = "UpdateRoom", urlPatterns = { "/UpdateRoom" })
public class updateRoom extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String rid = req.getParameter("rid");
		String col1 = req.getParameter("col1");
		String col2 = req.getParameter("col2");
		String col3 = req.getParameter("col3");
		String col4 = req.getParameter("col4");
		String col5 = req.getParameter("col5");
		String col6 = req.getParameter("col6");
		String floor = req.getParameter("floor");
		String college = req.getParameter("college");
		String rno = req.getParameter("rno");
		RoomDto dto = new RoomDto();
		dto.setFloor(floor);
		dto.setCollege("college");
		dto.setRno(rno);
		dto.setRid(Integer.parseInt(rid));
		dto.setCol1(Integer.parseInt(col1));
		dto.setCol2(Integer.parseInt(col2));
		dto.setCol3(Integer.parseInt(col3));
		dto.setCol4(Integer.parseInt(col4));
		dto.setCol5(Integer.parseInt(col5));
		dto.setCol6(Integer.parseInt(col6));
		if (new RoomDao().updateRoom(dto)) {
			resp.sendRedirect("admin/manageRoom.jsp");
		} else {
			resp.sendRedirect("admin/manageRoom.jsp?msg=Registration Failed");
		}
	}
}
