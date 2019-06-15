<%@page import="java.util.ArrayList"%>
<%@page import="com.ankit.room.RoomDao"%>
<%@page import="com.ankit.room.RoomDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Room</title>
<link href="../css/style.css" type="text/css" rel="stylesheet">
</head>
<body>
	<%@ include file="../index/main_header.jsp"%>
	<%@ include file="admin_menu.jsp"%>
	<div id="tables" style="width: 97%; margin-top: 5%">
		<h1 style="text-align: center;">Manage Rooms</h1>
		<a style="margin-left: 45%;" href="addRoom.jsp">Add Rooms</a>
		<table style="width: 100%">
			<tr>
				<th>S.No.</th>
				<th>College Building</th>
				<th>Floor</th>
				<th>Room No.</th>
				<th>Desks(col1)</th>
				<th>col2</th>
				<th>col3</th>
				<th>col4</th>
				<th>col5</th>
				<th>col6</th>
				<th>Total Desks</th>
				<th>Update Operation</th>
				<th>Delete Operation</th>

			</tr>
			<%
				ArrayList<RoomDto> al = new RoomDao().getAllRoom();
				if (al != null) {
					int s = 0;
					for (RoomDto dto : al) {
			%>
			<tr>
				<td><%=++s%></td>
				<td><%=dto.getCollege()%></td>
				<td><%=dto.getFloor()%></td>
				<td><%=dto.getRno()%></td>
				<td><%=dto.getCol1()%></td>
				<td><%=dto.getCol2()%></td>
				<td><%=dto.getCol3()%></td>
				<td><%=dto.getCol4()%></td>
				<td><%=dto.getCol5()%></td>
				<td><%=dto.getCol6()%></td>
				<td><%=dto.getTot()%></td>
				<td>
					<form action="updateRoom.jsp" method="post">
						<input type="hidden" name="rid" value="<%=dto.getRid()%>">
						<input type="hidden" name="floor" value="<%=dto.getFloor()%>">
						<input type="submit" value="Update">
					</form>
				</td>
				<td>
					<form action="deleteRoom.jsp" method="post">
						<input type="hidden" name="rid" value="<%=dto.getRid()%>">
						<input type="submit" value="Delete">
					</form>
				</td>
			</tr>
			<%
				}
				} else {
					response.sendRedirect("addRoom.jsp");
				}
			%>
		</table>
	</div>
</body>
</html>