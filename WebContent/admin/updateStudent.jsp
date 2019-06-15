<%@page import="com.ankit.student.StudentDto"%>
<%@page import="com.ankit.student.StudentDao"%>
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
		String sid = request.getParameter("id");
		if (sid != null) {
			int id = Integer.parseInt(sid);
			StudentDto dto = new StudentDao().getStudent(id, course, branch, year);
			if (dto != null) {
	%>
	<div style="width: 50%; margin-left: 25%; margin-top: 5%">
		<form action="update_Student.jsp" method="post">
			<input type="hidden" name="id" value="<%=dto.getId()%>"> <input
				type="hidden" name="course" value="<%=course%>"> <input
				type="hidden" name="branch" value="<%=branch%>"> <input
				type="hidden" name="year" value="<%=year%>"> <input
				type="text" class="field" name="enroll" value="<%=dto.getEnroll()%>"
				required="required"> <input type="text" name="name"
				class="field" value="<%=dto.getName()%>" required="required">
			<input type="submit" value="Update Student" id="SubmitButton"
				onclick="DoOnSubmit()">

		</form>
	</div>
	<%
		}
		}
	%>
</body>
</html>