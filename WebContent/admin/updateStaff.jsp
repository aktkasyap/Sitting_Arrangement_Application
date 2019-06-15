<%@page import="java.util.ArrayList"%>
<%@page import="com.ankit.utility.SittingUtility"%>
<%@page import="com.ankit.staff.StaffDto"%>
<%@page import="com.ankit.staff.StaffDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Staff</title>
<link href="../css/style.css" type="text/css" rel="stylesheet">
</head>
<body>
	<%
		String bid = request.getParameter("id");
		if (bid != null) {
			int id = Integer.parseInt(bid);
			StaffDto dto = new StaffDao().getStaff(id);
			if (dto != null) {
	%>


	<%@ include file="../index/main_header.jsp"%>
	<%@ include file="admin_menu.jsp"%>
	<div style="width: 50%; margin-left: 25%; margin-top: 5%">
		<%
			String mybranch = request.getParameter("branch");
		%>
		<form action="../UpdateStaff" method="post">
			<input type="hidden" name="id" value="<%=id%>"> <input
				class="field" type="text" value="<%=dto.getName()%>" name="name"
				placeholder="Enter updated staff name" required="required"
				autofocus="autofocus" required pattern="[A-z|\s]*"
				onchange="this.setCustomValidity(validity.patternMismatch ? 'Please Enter Only Alphabets for Staff Name' : '');">
			<select class="field" required="required" id="branch" name="branch">
				<option value="<%=dto.getBranch()%>"><%=dto.getBranch()%></option>
				<%
					ArrayList<String> al = SittingUtility.getAllBranch();

							for (String fl1 : al) {
								if (!(fl1.equalsIgnoreCase(dto.getBranch()))) {
				%>
				<option value="<%=fl1%>"><%=fl1%></option>
				<%
					}
							}
				%>
			</select> <input class="field" type="text" value="<%=dto.getUname()%>"
				name="uname" placeholder="Enter updated uname" required="required">
			<input class="field" type="password" value="<%=dto.getPwd()%>"
				name="pwd" placeholder="Enter updated pwd" required="required">
			<input class="field" type="email" name="email"
				value="<%=dto.getEmail()%>" placeholder="Enter updated Email"
				required="required"> <input class="field" type="submit"
				value="Update Staff">
		</form>
	</div>
	<%
		}
		}
	%>
</body>
</html>