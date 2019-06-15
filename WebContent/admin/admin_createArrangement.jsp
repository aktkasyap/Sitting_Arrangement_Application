<%@page import="com.ankit.utility.SittingUtility"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin_Create Arrangement</title>
<link href="../css/style.css" type="text/css" rel="stylesheet">

<script type="text/javascript">
	function showCount() {
		var course = document.getElementById("course").value;
		var year = document.getElementById("year").value;
		var branch = "";
		if (document.getElementById("CSE").checked) {
			if (branch === "")
				branch = branch + "CSE";
			else
				branch = branch + ",CSE";
		}
		if (document.getElementById("IT").checked) {
			if (branch === "")
				branch = branch + "IT";
			else
				branch = branch + ",IT";
		}
		if (document.getElementById("ME").checked) {
			if (branch === "")
				branch = branch + "ME";
			else
				branch = branch + ",ME";
		}
		if (document.getElementById("CE").checked) {
			if (branch === "")
				branch = branch + "CE";
			else
				branch = branch + ",CE";
		}
		if (course != null && year != null && !(branch === "")) {
			var counts = new XMLHttpRequest();
			counts.open("GET", "getCount.jsp?year=" + year + "&course="
					+ course + "&branch=" + branch, true);
			counts.send(null);
			counts.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					var data = counts.responseText;
					document.getElementById("getCount").innerHTML = data;
				}
				;
			}
		} else {
			document.getElementById("getCount").innerHTML = "Total no. of desk required : 0";
		}
	}

	function showDesk() {
		var college = document.getElementById("college").value;
		window.location.replace("admin_createArrangement.jsp?college="
				+ college);
	}
</script>

</head>
<body>
	<%@ include file="../index/main_header.jsp"%>
	<%@ include file="admin_menu.jsp"%>

	<jsp:useBean id="rdao" class="com.ankit.room.RoomDao"></jsp:useBean>

	<h1 align="center">Create Arrangement</h1>
	<form action="admin_createArrangement.jsp" method="post" name="frm">
		<div id="tables" style="width: 50%; margin-left: 25%;">
			<%
				String mycourse = request.getParameter("course");
				String myyear = request.getParameter("year");
				String mycollege = request.getParameter("college");
				/*String branches[] = request.getParameterValues("branch");
				String branch = "";
				if (branches != null) {
					for (String s : branches) {
						branch = branch + s + ",";
					}
				}*/
				String floors[] = request.getParameterValues("floor");
				String floor = "";
				if (floors != null) {
					for (String s : floors) {
						floor = floor + s + ",";
					}
				}
				String room_grounds[] = request.getParameterValues("room_ground");
				String room_ground = "";
				if (room_grounds != null) {
					for (String s : room_grounds) {
						room_ground = room_ground + s + ",";
					}
				}
				String room_firsts[] = request.getParameterValues("room_first");
				String room_first = "";
				if (room_firsts != null) {
					for (String s : room_firsts) {
						room_first = room_first + s + ",";
					}
				}
				String room_seconds[] = request.getParameterValues("room_second");
				String room_second = "";
				if (room_seconds != null) {
					for (String s : room_seconds) {
						room_second = room_second + s + ",";
					}
				}
				String room_thirds[] = request.getParameterValues("room_third");
				String room_third = "";
				if (room_thirds != null) {
					for (String s : room_thirds) {
						room_third = room_third + s + ",";
					}
				}
			%>
			<h2 align="center" style="color: red; font-weight: bold;">Select
				Students for Arrangement</h2>
			<select class="field" required="required" id="course" name="course"
				onchange="showCount()">
				<%
					ArrayList<String> al = SittingUtility.getAllCourse();

					if (mycourse != null) {
				%>
				<option value="<%=mycourse%>"><%=mycourse%></option>

				<%
					for (String fl1 : al) {
							if (!(fl1.equalsIgnoreCase(mycourse))) {
				%>
				<option value="<%=fl1%>"><%=fl1%></option>
				<%
					}
						}
					} else {
				%>
				<option value="null">---Select Course---</option>
				<%
					for (String data1 : al) {
				%>
				<option value="<%=data1%>"><%=data1%></option>
				<%
					}
					}
				%>
			</select> <select class="field" required="required" id="year" name="year"
				onchange="showCount()">

				<%
					ArrayList<String> al3 = SittingUtility.getAllYear();

					if (myyear != null) {
				%>
				<option value="<%=myyear%>"><%=myyear%></option>

				<%
					for (String fl1 : al3) {
							if (!(fl1.equalsIgnoreCase(myyear))) {
				%>
				<option value="<%=fl1%>"><%=fl1%></option>
				<%
					}
						}
					} else {
				%>
				<option value="null">---Select Year---</option>
				<%
					for (String data1 : al3) {
				%>
				<option value="<%=data1%>"><%=data1%></option>
				<%
					}
					}
				%>
			</select>

			<h3 align="center">Select Branch</h3>
			<table style="width: 100%">
				<tr>
					<th align="center">Set A</th>
					<th align="center">Set B</th>
				</tr>
				<tr>
					<td>
						<%
							ArrayList<String> al1 = SittingUtility.getAllBranch_A();
							for (String data1 : al1) {
						%> <input type="checkbox" name="branch" id="<%=data1%>"
						value="<%=data1%>" onclick="showCount()"><%=data1%><br>
						<%
							}
						%>
					</td>
					<td>
						<%
							ArrayList<String> al2 = SittingUtility.getAllBranch_B();
							for (String data1 : al2) {
						%> <input type="checkbox" name="branch" id="<%=data1%>"
						value="<%=data1%>" onclick="showCount()"><%=data1%><br>
						<%
							}
						%>
					</td>

				</tr>
			</table>

		</div>
		<br> <br>
		<div id="tables" style="width: 50%; margin-left: 25%;">
			<h2 align="center" style="color: red; font-weight: bold;">Select
				College, Floor & Rooms for Arrangement</h2>
			<select class="field" required="required" id="college" name="college"
				onchange="showDesk()">

				<%
					ArrayList<String> al16 = SittingUtility.getAllCollege();

					if (mycollege != null) {
				%>
				<option value="<%=mycollege%>"><%=mycollege%></option>

				<%
					for (String fl1 : al16) {
							if (!(fl1.equalsIgnoreCase(mycollege))) {
				%>
				<option value="<%=fl1%>"><%=fl1%></option>
				<%
					}
						}
					} else {
				%>
				<option value="null">---Select College---</option>
				<%
					for (String data1 : al16) {
				%>
				<option value="<%=data1%>"><%=data1%></option>
				<%
					}
					}
				%>
			</select>

			<h3 align="center">Select Floor & Rooms</h3>
			<span id="getCount" name="getCount" style="color: red;"></span><br>
			<table style="width: 100%">
				<tr>
					<th align="center">Floors</th>
					<th></th>
					<th align="center">Rooms</th>
					<th></th>
				</tr>
				<tr>
					<td><input type="checkbox" name="floor" value="Ground Floor">Ground
						Floor</td>
					<td>
						<%
							ArrayList<String> al4 = SittingUtility.getGroundRooms1();
							int desk = 0;
							for (String data1 : al4) {
								if (mycollege != null) {
									desk = rdao.getRoomDesks(mycollege, "Ground Floor", data1);
								}
						%> <input type="checkbox" name="room_ground" value='<%=data1%>'><%=data1%>,(<%=desk%>)<br>
						<%
							desk = 0;
							}
						%>
					</td>
					<td>
						<%
							ArrayList<String> al5 = SittingUtility.getGroundRooms2();
							int desk1 = 0;
							for (String data1 : al5) {
						%> <input type="checkbox" name="room_ground" value="<%=data1%>"><%=data1%>,(<%=desk1%>)<br>
						<%
							desk1 = 0;
							}
						%>
					</td>
					<td>
						<%
							ArrayList<String> al6 = SittingUtility.getGroundRooms3();
							int desk2 = 0;
							for (String data1 : al6) {
						%> <input type="checkbox" name="room_ground" value="<%=data1%>"><%=data1%>,(<%=desk2%>)<br>
						<%
							desk2 = 0;
							}
						%>
					</td>

				</tr>
				<tr>
					<td><input type="checkbox" name="floor" value="First Floor">First
						Floor</td>
					<td>
						<%
							ArrayList<String> al7 = SittingUtility.getFirstRooms1();
							for (String data1 : al7) {
								int desk3 = 0;
						%> <input type="checkbox" name="room_first" value="<%=data1%>"><%=data1%>,(<%=desk3%>)<br>
						<%
							desk3 = 0;
							}
						%>
					</td>
					<td>
						<%
							ArrayList<String> al8 = SittingUtility.getFirstRooms2();
							for (String data1 : al8) {
								int desk4 = 0;
						%> <input type="checkbox" name="room_first" value="<%=data1%>"><%=data1%>,(<%=desk4%>)<br>
						<%
							desk4 = 0;
							}
						%>
					</td>
					<td>
						<%
							ArrayList<String> al9 = SittingUtility.getFirstRooms3();
							for (String data1 : al9) {
								int desk5 = 0;
						%> <input type="checkbox" name="room_first" value="<%=data1%>"><%=data1%>,(<%=desk5%>)<br>
						<%
							desk5 = 0;
							}
						%>
					</td>

				</tr>
				<tr>
					<td><input type="checkbox" name="floor" value="Second Floor">Second
						Floor</td>
					<td>
						<%
							ArrayList<String> al10 = SittingUtility.getSecondRooms1();
							for (String data1 : al10) {
								int desk6 = 0;
						%> <input type="checkbox" name="room_second" value="<%=data1%>"><%=data1%>,(<%=desk6%>)<br>
						<%
							desk6 = 0;
							}
						%>
					</td>
					<td>
						<%
							ArrayList<String> al11 = SittingUtility.getSecondRooms2();
							for (String data1 : al11) {
								int desk7 = 0;
						%> <input type="checkbox" name="room_second" value="<%=data1%>"><%=data1%>,(<%=desk7%>)<br>
						<%
							desk7 = 0;
							}
						%>
					</td>
					<td>
						<%
							ArrayList<String> al12 = SittingUtility.getSecondRooms3();
							for (String data1 : al12) {
								int desk8 = 0;
						%> <input type="checkbox" name="room_second" value="<%=data1%>"><%=data1%>,(<%=desk8%>)<br>
						<%
							desk8 = 0;
							}
						%>
					</td>

				</tr>
				<tr>
					<td><input type="checkbox" name="floor" value="Third Floor">Third
						Floor</td>
					<td>
						<%
							ArrayList<String> al13 = SittingUtility.getThirdRooms1();
							for (String data1 : al13) {
								int desk9 = 0;
						%> <input type="checkbox" name="room_third" value="<%=data1%>"><%=data1%>,(<%=desk9%>)<br>
						<%
							desk9 = 0;
							}
						%>
					</td>
					<td>
						<%
							ArrayList<String> al14 = SittingUtility.getThirdRooms2();
							for (String data1 : al14) {
								int desk10 = 0;
						%> <input type="checkbox" name="room_third" value="<%=data1%>"><%=data1%>,(<%=desk10%>)<br>
						<%
							desk10 = 0;
							}
						%>
					</td>
					<td>
						<%
							ArrayList<String> al15 = SittingUtility.getThirdRooms3();
							for (String data1 : al15) {
								int desk11 = 0;
						%> <input type="checkbox" name="room_third" value="<%=data1%>"><%=data1%>,(<%=desk11%>)<br>
						<%
							desk11 = 0;
							}
						%>
					</td>

				</tr>

			</table>

		</div>
	</form>

</body>
</html>