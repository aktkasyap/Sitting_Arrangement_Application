package com.ankit.upload;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ankit.student.StudentDao;
import com.ankit.student.StudentDto;

import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

@MultipartConfig(maxFileSize = 7887888)
@WebServlet(name = "UploadData", urlPatterns = { "/UploadData" })
public class UploadData extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String course = request.getParameter("course");
		String branch = request.getParameter("branch");
		String year = request.getParameter("year");
		try {
			boolean flag = false;
			FileInputStream fs = (FileInputStream) request.getPart("template").getInputStream();
			Workbook wb = Workbook.getWorkbook(fs);
			Sheet sh = wb.getSheet(0);
			int totalNoOfRows = sh.getRows();
			int totalNoOfCols = sh.getColumns();
			for (int row = 3; row < totalNoOfRows; row++) {
				List info = new ArrayList();
				StudentDto dto = new StudentDto();
				for (int col = 1; col < totalNoOfCols; col++) {
					if (sh.getCell(col, row).getContents().length() != 0) {
						info.add(sh.getCell(col, row).getContents());

					}
				}
				// create dto and dao object and call addData method of dao
				dto.setEnroll(info.get(0) + "");
				dto.setName(info.get(1) + "");
				if (new StudentDao().addStudent(dto, course, branch, year)) {
					flag = true;
				}

			}
			if (flag) {
				response.sendRedirect("admin/manageStudent.jsp");
			}
		} catch (IOException | IndexOutOfBoundsException | ServletException | BiffException e) {
			System.out.println(e);
		}
	}
}
