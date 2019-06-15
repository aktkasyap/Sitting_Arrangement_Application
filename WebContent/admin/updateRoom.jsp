<%@page import="com.ankit.floor.FloorDao"%>
<%@page import="com.ankit.floor.FloorDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ankit.utility.SittingUtility"%>
<%@page import="com.ankit.room.RoomDto"%>
<%@page import="com.ankit.room.RoomDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript">
	function showFloor() {
		var floor = document.getElementById("floor").value;
		var room = new XMLHttpRequest();
		room.open("GET", "getRoom.jsp?floor=" + floor, true);
		room.send(null);
		room.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				var data = room.responseText;
				document.getElementById("rno").innerHTML = data;
			}
			;
		}
	}
</script>

<meta charset="UTF-8">
<title>Update Staff</title>
<link href="../css/style.css" type="text/css" rel="stylesheet">
</head>
<body>
	<%
		String id = request.getParameter("rid");
		if (id != null) {
			int rid = Integer.parseInt(id);
			RoomDto dto = new RoomDao().getRoom(rid);
			if (dto != null) {
	%>
	<%@ include file="../index/main_header.jsp"%>
	<%@ include file="admin_menu.jsp"%>
	<div style="width: 50%; margin-left: 25%; margin-top: 5%">
		<%
			String myfloor = request.getParameter("floor");
					String myrno = request.getParameter("rno");
		%>
		<form action="../UpdateRoom" method="post">
			<input type="hidden" name="rid" id="rid" value="<%=rid%>"> <select
				onchange="showFloor()" class="field" id="floor" name="floor"
				required="required">

				<%
					if (myfloor != null) {
				%>
				<option value="<%=myfloor%>"><%=myfloor%></option>
				<%
					} else {
				%>
				<option value="<%=dto.getFloor()%>"><%=dto.getFloor()%></option>

				<%
					}
							ArrayList<String> al1 = SittingUtility.getAllFloors();
							for (String fl : al1) {
								if (myfloor != null && (myfloor.equalsIgnoreCase(dto.getFloor()))
										&& !(fl.equalsIgnoreCase(dto.getFloor()))) {
				%>
				<option value="<%=fl%>"><%=fl%></option>
				<%
					}
								if (myfloor != null && !(myfloor.equalsIgnoreCase(dto.getFloor()))
										&& !(fl.equalsIgnoreCase(myfloor))) {
				%>
				<option value="<%=fl%>"><%=fl%></option>
				<%
					}
								if (myfloor == null && !(fl.equalsIgnoreCase(dto.getFloor()))) {
				%>
				<option value="<%=fl%>"><%=fl%></option>
				<%
					}
							}
				%>
			</select> <select class="field" id="rno" name="rno" required="required">
				<%
					if (myrno == null && myfloor != null) {
				%>
				<option value="<%=dto.getRno()%>"><%=dto.getRno()%></option>
				<%
					for (FloorDto dto1 : new FloorDao().getFloor_Room(myfloor)) {
									if (!((dto.getRno()).equalsIgnoreCase(dto1.getRno()))) {
				%>
				<option value="<%=dto1.getRno()%>"><%=dto1.getRno()%></option>
				<%
					}
								}
							}
				%>

			</select> <select class="field" name="college" required="required">
				<option value="<%=dto.getCollege()%>"><%=dto.getCollege()%></option>
				<%
					ArrayList<String> al = SittingUtility.getAllCollege();

							for (String fl1 : al) {
								if (!(fl1.equalsIgnoreCase(dto.getCollege()))) {
				%>
				<option value="<%=fl1%>"><%=fl1%></option>
				<%
					}
							}
				%>
			</select> <input class="field" type="number" value="<%=dto.getCol1()%>"
				name="col1" placeholder="Enter updated no. of desks in col1"
				required="required"> <input class="field" type="number"
				value="<%=dto.getCol2()%>" name="col2"
				placeholder="Enter updated no. of desks in col2"> <input
				class="field" type="number" value="<%=dto.getCol3()%>" name="col3"
				placeholder="Enter updated no. of desks in col3"> <input
				class="field" type="number" value="<%=dto.getCol4()%>" name="col4"
				placeholder="Enter updated no. of desks in col4"> <input
				class="field" type="number" value="<%=dto.getCol5()%>" name="col5"
				placeholder="Enter updated no. of desks in col5"> <input
				class="field" type="number" value="<%=dto.getCol6()%>" name="col6"
				placeholder="Enter updated no. of desks in col6"> <input
				class="field" type="submit" value="Update Room">
		</form>
	</div>
	<%
		}
		}
	%>
</body>
</html>