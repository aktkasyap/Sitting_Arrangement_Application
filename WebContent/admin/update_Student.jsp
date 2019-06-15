<%@page import="com.ankit.student.StudentDao"%>
<%@page import="com.ankit.student.StudentDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Student</title>
<link href="../css/style.css" type="text/css" rel="stylesheet">
</head>
<body>
	<%@ include file="../index/main_header.jsp"%>
	<%@ include file="admin_menu.jsp"%>
	<%
		String course = request.getParameter("course");
		String branch = request.getParameter("branch");
		String year = request.getParameter("year");
		String id = request.getParameter("id");
		String enroll = request.getParameter("enroll");
		String name = request.getParameter("name");
		StudentDto dto = new StudentDto();
		dto.setId(Integer.parseInt(id));
		dto.setEnroll(enroll);
		dto.setName(name);
		if (new StudentDao().updateStudent(dto, course, branch, year)) {
	%>
	<div style="width: 30%; margin-left: 30%; margin-top: 5%">
	<form action="manageStudent.jsp" method="post" id="frm">
		<input type="hidden" name="course" value="<%=course%>"> <input
			type="hidden" name="branch" value="<%=branch%>"> <input
			type="hidden" name="year" value="<%=year%>"> <input
			type="submit" value="View After Updation">
	</form>
	</div>
	<%
		} else {
			response.sendRedirect("admin/manageStudent.jsp?msg=RegistrationFailed");
		}
	%>

</body>
</html>