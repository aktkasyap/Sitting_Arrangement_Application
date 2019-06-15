<%@page import="com.ankit.utility.SittingUtility"%>
<%@page import="com.ankit.floor.FloorDto"%>
<%@page import="com.ankit.floor.FloorDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Floor</title>
<link href="../css/style.css" type="text/css" rel="stylesheet">
</head>
<body>
	<%
		String id = request.getParameter("fid");
		if (id != null) {
			int fid = Integer.parseInt(id);
			FloorDto dto = new FloorDao().getFloor(fid);
			if (dto != null) {
	%>


	<%@ include file="../index/main_header.jsp"%>
	<%@ include file="admin_menu.jsp"%>
	<div style="width: 50%; margin-left: 25%; margin-top: 5%">
		<form action="../UpdateFloor" method="post">
			<input type="hidden" name="fid" value="<%=fid%>"> <select
				class="field" name="floor" required="required">
				<option value="<%=dto.getFloor()%>"><%=dto.getFloor()%></option>
				<%
					for (String fl : SittingUtility.getAllFloors()) {
								if (!(dto.getFloor().equalsIgnoreCase(fl))) {
				%>
				<option value="<%=fl%>"><%=fl%></option>

				<%
					}
							}
				%>
			</select> <input class="field" type="text" value="<%=dto.getRno()%>"
				name="rno" placeholder="Enter Room no." required="required">
			<input class="field" type="submit" value="Update Floor">
		</form>
	</div>
	<%
		}
		}
	%>

</body>
</html>