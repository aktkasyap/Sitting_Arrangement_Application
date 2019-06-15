<%@page import="com.ankit.floor.FloorDao"%>
<%@page import="com.ankit.floor.FloorDto"%>
<%@page import="com.ankit.staff.StaffDao"%>
<%@page import="com.ankit.staff.StaffDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Floor</title>
<link href="../css/style.css" type="text/css" rel="stylesheet">

</head>
<body>
	<%@ include file="../index/main_header.jsp"%>
	<%@ include file="admin_menu.jsp"%>
	<div id="tables" style="width: 50%; margin-left: 25%; margin-top: 5%">
		<h1 style="text-align: center;">Manage Floor_Rooms</h1>
		<a style="margin-left: 45%;" href="addFloor.jsp">Add Floors</a>
		<table style="width: 100%">
			<tr>
				<th>S.No.</th>
				<th>Floor</th>
				<th>Room No.</th>
				<th>Update Operation</th>
				<th>Delete Operation</th>
			</tr>
			<%
				ArrayList<FloorDto> al = new FloorDao().getAllFloor();
				if (al != null) {
					int s = 0;
					for (FloorDto dto : al) {
			%>
			<tr>
				<td><%=++s%></td>
				<td><%=dto.getFloor()%></td>
				<td><%=dto.getRno()%></td>
				<td>
					<form action="updateFloor.jsp" method="post">
						<input type="hidden" name="fid" value="<%=dto.getFid()%>">
						<input type="submit" value="Update">
					</form>
				</td>
				<td>
					<form action="deleteFloor.jsp" method="post">
						<input type="hidden" name="fid" value="<%=dto.getFid()%>">
						<input type="submit" value="Delete">
					</form>
				</td>
			</tr>
			</tr>
			<%
				}
				} else {
					response.sendRedirect("addFloor.jsp");
				}
			%>
		</table>
	</div>
</body>
</html>