<%@page import="com.ankit.student.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Student</title>
<link href="../css/style.css" type="text/css" rel="stylesheet">
</head>
<body>
	<%@ include file="../index/main_header.jsp"%>
	<%@ include file="admin_menu.jsp"%>
	<%
		String sid = request.getParameter("id");
		int id = Integer.parseInt(sid);
		String course = request.getParameter("course");
		String branch = request.getParameter("branch");
		String year = request.getParameter("year");
		if (new StudentDao().deleteStudent(id, course, branch, year)) {
	%>
	<div style="width: 30%; margin-left: 30%; margin-top: 5%">
		<form action="manageStudent.jsp" method="post" id="frm">
			<input type="hidden" name="course" value="<%=course%>"> <input
				type="hidden" name="branch" value="<%=branch%>"> <input
				type="hidden" name="year" value="<%=year%>"> <input
				type="submit" value="View After Deletion">
		</form>
	</div>
	<%
		}
	%>
</body>
</html>