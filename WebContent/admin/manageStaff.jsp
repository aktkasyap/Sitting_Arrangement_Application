<%@page import="com.ankit.staff.StaffDao"%>
<%@page import="com.ankit.staff.StaffDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Staff</title>
<link href="../css/style.css" type="text/css" rel="stylesheet">
</head>
<body>
	<%@ include file="../index/main_header.jsp"%>
	<%@ include file="admin_menu.jsp"%>
	<div id="tables" style="width: 97%; margin-top: 5%">
		<h1 style="text-align: center;">Manage Staffs</h1>
		<a style="margin-left: 45%;" href="addStaff.jsp">Add Staff</a>
		<table style="width: 100%">
			<tr>
				<th>S.No.</th>
				<th>Name</th>
				<th>Branch</th>
				<th>User Name</th>
				<th>Password</th>
				<th>Email</th>
				<th>Update Operation</th>
				<th>Delete Operation</th>
			</tr>
			<%
				ArrayList<StaffDto> al = new StaffDao().getAllStaff();
				if (al != null) {
					int s = 0;
					for (StaffDto dto : al) {
			%>
			<tr>
				<td><%=++s%></td>
				<td><%=dto.getName()%></td>
				<td><%=dto.getBranch()%></td>
				<td><%=dto.getUname()%></td>
				<td><%=dto.getPwd()%></td>
				<td><%=dto.getEmail()%></td>
				<td>
					<form action="updateStaff.jsp" method="post">
						<input type="hidden" name="id" value="<%=dto.getId()%>"> <input
							type="submit" value="Update">
					</form>
				</td>
				<td>
					<form action="deleteStaff.jsp" method="post">
						<input type="hidden" name="id" value="<%=dto.getId()%>"> <input
							type="submit" value="Delete">
					</form>
				</td>
			</tr>
			<%
				}
				} else {
					response.sendRedirect("addStaff.jsp");
				}
			%>
		</table>
	</div>
</body>
</html>