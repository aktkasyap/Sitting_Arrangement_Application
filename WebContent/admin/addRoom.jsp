<%@page import="com.ankit.utility.SittingUtility"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ankit.floor.FloorDao"%>
<%@page import="com.ankit.floor.FloorDto"%>
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

	function DoOnSubmit() {
		if ((document.getElementById("floor").value == "null")
				|| (document.getElementById("college").value == "null")
				|| (document.getElementById("rno").value == "null")
				|| (document.getElementById("cll1").disabled == false)
				|| (document.getElementById("cll2").disabled == false)
				|| (document.getElementById("cll3").disabled == false)
				|| (document.getElementById("cll4").disabled == false)
				|| (document.getElementById("cll5").disabled == false)) {
			document.getElementById("SubmitButton").disabled = true;
			alert("Please select all options...");
		} else {
			document.getElementById("SubmitButton").disabled = false;
		}

	}

	function DoOnResubmit() {
		if ((document.getElementById("floor").value != "null")
				&& (document.getElementById("college").value != "null")
				&& (document.getElementById("rno").value != "null")
				&& (document.getElementById("cll1").disabled == true)
				&& (document.getElementById("cll2").disabled == true)
				&& (document.getElementById("cll3").disabled == true)
				&& (document.getElementById("cll4").disabled == true)
				&& (document.getElementById("cll5").disabled == true)) {
			document.getElementById("SubmitButton").disabled = false;
		}
	}

	function checkCol1() {
		document.getElementById("cll1").disabled = true;
		document.getElementById("cll2").disabled = true;
		document.getElementById("cll3").disabled = true;
		document.getElementById("cll4").disabled = true;
		document.getElementById("cll5").disabled = true;
		document.getElementById("cll1").innerHTML = "";
		document.getElementById("cll2").innerHTML = "";
		document.getElementById("cll3").innerHTML = "";
		document.getElementById("cll4").innerHTML = "";
		document.getElementById("cll5").innerHTML = "";
		if ((document.getElementById("floor").value != "null")
				&& (document.getElementById("college").value != "null")
				&& (document.getElementById("rno").value != "null")
				&& (document.getElementById("cll1").disabled == true)
				&& (document.getElementById("cll2").disabled == true)
				&& (document.getElementById("cll3").disabled == true)
				&& (document.getElementById("cll4").disabled == true)
				&& (document.getElementById("cll5").disabled == true)) {
			document.getElementById("SubmitButton").disabled = false;
		}

	}

	function checkCol2() {
		var cl1 = document.getElementById("col1").value;
		if (cl1 == 0) {
			document.getElementById("cll1").disabled = false;
			document.getElementById("cll1").innerHTML = "Please fill this column first";
		}
		document.getElementById("cll2").disabled = true;
		document.getElementById("cll3").disabled = true;
		document.getElementById("cll4").disabled = true;
		document.getElementById("cll5").disabled = true;
		document.getElementById("cll2").innerHTML = "";
		document.getElementById("cll3").innerHTML = "";
		document.getElementById("cll4").innerHTML = "";
		document.getElementById("cll5").innerHTML = "";
		if ((document.getElementById("floor").value != "null")
				&& (document.getElementById("college").value != "null")
				&& (document.getElementById("rno").value != "null")
				&& (document.getElementById("cll1").disabled == true)
				&& (document.getElementById("cll2").disabled == true)
				&& (document.getElementById("cll3").disabled == true)
				&& (document.getElementById("cll4").disabled == true)
				&& (document.getElementById("cll5").disabled == true)) {
			document.getElementById("SubmitButton").disabled = false;
		}

	}

	function checkCol3() {
		var cl1 = document.getElementById("col1").value;
		var cl2 = document.getElementById("col2").value;
		if (cl1 == 0) {
			document.getElementById("cll1").disabled = false;
			document.getElementById("cll1").innerHTML = "Please fill this column first";
		}
		if (cl2 == 0) {
			document.getElementById("cll2").disabled = false;
			document.getElementById("cll2").innerHTML = "Please fill this column first";
		}
		document.getElementById("cll3").disabled = true;
		document.getElementById("cll4").disabled = true;
		document.getElementById("cll5").disabled = true;
		document.getElementById("cll3").innerHTML = "";
		document.getElementById("cll4").innerHTML = "";
		document.getElementById("cll5").innerHTML = "";
		if ((document.getElementById("floor").value != "null")
				&& (document.getElementById("college").value != "null")
				&& (document.getElementById("rno").value != "null")
				&& (document.getElementById("cll1").disabled == true)
				&& (document.getElementById("cll2").disabled == true)
				&& (document.getElementById("cll3").disabled == true)
				&& (document.getElementById("cll4").disabled == true)
				&& (document.getElementById("cll5").disabled == true)) {
			document.getElementById("SubmitButton").disabled = false;
		}

	}

	function checkCol4() {
		var cl1 = document.getElementById("col1").value;
		var cl2 = document.getElementById("col2").value;
		var cl3 = document.getElementById("col3").value;
		if (cl1 == 0) {
			document.getElementById("cll1").disabled = false;
			document.getElementById("cll1").innerHTML = "Please fill this column first";
		}
		if (cl2 == 0) {
			document.getElementById("cll2").disabled = false;
			document.getElementById("cll2").innerHTML = "Please fill this column first";
		}
		if (cl3 == 0) {
			document.getElementById("cll3").disabled = false;
			document.getElementById("cll3").innerHTML = "Please fill this column first";
		}
		document.getElementById("cll4").disabled = true;
		document.getElementById("cll5").disabled = true;
		document.getElementById("cll4").innerHTML = "";
		document.getElementById("cll5").innerHTML = "";
		if ((document.getElementById("floor").value != "null")
				&& (document.getElementById("college").value != "null")
				&& (document.getElementById("rno").value != "null")
				&& (document.getElementById("cll1").disabled == true)
				&& (document.getElementById("cll2").disabled == true)
				&& (document.getElementById("cll3").disabled == true)
				&& (document.getElementById("cll4").disabled == true)
				&& (document.getElementById("cll5").disabled == true)) {
			document.getElementById("SubmitButton").disabled = false;
		}

	}

	function checkCol5() {
		var cl1 = document.getElementById("col1").value;
		var cl2 = document.getElementById("col2").value;
		var cl3 = document.getElementById("col3").value;
		var cl4 = document.getElementById("col4").value;
		if (cl1 == 0) {
			document.getElementById("cll1").disabled = false;
			document.getElementById("cll1").innerHTML = "Please fill this column first";
		}
		if (cl2 == 0) {
			document.getElementById("cll2").disabled = false;
			document.getElementById("cll2").innerHTML = "Please fill this column first";
		}
		if (cl3 == 0) {
			document.getElementById("cll3").disabled = false;
			document.getElementById("cll3").innerHTML = "Please fill this column first";
		}
		if (cl4 == 0) {
			document.getElementById("cll4").disabled = false;
			document.getElementById("cll4").innerHTML = "Please fill this column first";
		}

		document.getElementById("cll5").disabled = true;
		document.getElementById("cll5").innerHTML = "";
		if ((document.getElementById("floor").value != "null")
				&& (document.getElementById("college").value != "null")
				&& (document.getElementById("rno").value != "null")
				&& (document.getElementById("cll1").disabled == true)
				&& (document.getElementById("cll2").disabled == true)
				&& (document.getElementById("cll3").disabled == true)
				&& (document.getElementById("cll4").disabled == true)
				&& (document.getElementById("cll5").disabled == true)) {
			document.getElementById("SubmitButton").disabled = false;
		}
	}

	function checkCol6() {
		var cl1 = document.getElementById("col1").value;
		var cl2 = document.getElementById("col2").value;
		var cl3 = document.getElementById("col3").value;
		var cl4 = document.getElementById("col4").value;
		var cl5 = document.getElementById("col5").value;
		if (cl1 == 0) {
			document.getElementById("cll1").disabled = false;
			document.getElementById("cll1").innerHTML = "Please fill this column first";
		}
		if (cl2 == 0) {
			document.getElementById("cll2").disabled = false;
			document.getElementById("cll2").innerHTML = "Please fill this column first";
		}
		if (cl3 == 0) {
			document.getElementById("cll3").disabled = false;
			document.getElementById("cll3").innerHTML = "Please fill this column first";
		}
		if (cl4 == 0) {
			document.getElementById("cll4").disabled = false;
			document.getElementById("cll4").innerHTML = "Please fill this column first";
		}
		if (cl5 == 0) {
			document.getElementById("cll5").disabled = false;
			document.getElementById("cll5").innerHTML = "Please fill this column first";
		}
		if ((document.getElementById("floor").value != "null")
				&& (document.getElementById("college").value != "null")
				&& (document.getElementById("rno").value != "null")
				&& (document.getElementById("cll1").disabled == true)
				&& (document.getElementById("cll2").disabled == true)
				&& (document.getElementById("cll3").disabled == true)
				&& (document.getElementById("cll4").disabled == true)
				&& (document.getElementById("cll5").disabled == true)) {
			document.getElementById("SubmitButton").disabled = false;
		}
	}
</script>



<meta charset="UTF-8">
<title>Add Room</title>
<link href="../css/style.css" type="text/css" rel="stylesheet">
</head>
<body>
	<%
		if (request.getMethod().equalsIgnoreCase("post")) {
	%>
	<jsp:useBean id="dto" class="com.ankit.room.RoomDto"></jsp:useBean>
	<jsp:setProperty property="*" name="dto" />
	<%
		if (new RoomDao().addRoom(dto)) {
				response.sendRedirect("manageRoom.jsp");
			} else {
				out.print("Failed");

			}
		}
	%>


	<%@ include file="../index/main_header.jsp"%>
	<%@ include file="admin_menu.jsp"%>
	<div style="width: 50%; margin-left: 25%; margin-top: 5%">
		<%
			String myfloor = request.getParameter("floor");
			String mycollege = request.getParameter("college");
			String myroom = request.getParameter("rno");
		%>
		<form action="addRoom.jsp" method="post" name="frm">
			<select onchange="showFloor()" class="field"
				onchange="DoOnResubmit()" id="floor" name="floor"
				required="required">
				<%
					ArrayList<String> al1 = SittingUtility.getAllFloors();

					if (myfloor != null) {
				%>
				<option value="<%=myfloor%>"><%=myfloor%></option>

				<%
					for (String fl : al1) {
							if (!(fl.equalsIgnoreCase(myfloor))) {
				%>
				<option value="<%=fl%>"><%=fl%></option>
				<%
					}
						}
					} else {
				%>
				<option value="null">---Select Floor---</option>
				<%
					for (String data : al1) {
				%>
				<option value="<%=data%>"><%=data%></option>
				<%
					}
					}
				%>
			</select> <select class="field" id="rno" name="rno" onchange="DoOnResubmit()"
				required="required">
				<option value="null">---Select Room No.---</option>
			</select> <select class="field" id="college" name="college"
				onchange="DoOnResubmit()" required="required">
				<%
					ArrayList<String> al = SittingUtility.getAllCollege();

					if (mycollege != null) {
				%>
				<option value="<%=mycollege%>"><%=mycollege%></option>

				<%
					for (String fl1 : al) {
							if (!(fl1.equalsIgnoreCase(mycollege))) {
				%>
				<option value="<%=fl1%>"><%=fl1%></option>
				<%
					}
						}
					} else {
				%>
				<option value="null">---Select college building---</option>
				<%
					for (String data1 : al) {
				%>
				<option value="<%=data1%>"><%=data1%></option>
				<%
					}
					}
				%>


			</select> <input class="field" type="text" required pattern="[1-9]\d*"
				onchange="this.setCustomValidity(validity.patternMismatch ? 'Please Enter Only positive non-zero digits' : '');"
				name="col1" id="col1" placeholder="Enter no. of desks in col1"
				required="required" onclick="checkCol1()"> <span
				style="color: red" id="cll1" disabled="disabled"></span> <input
				class="field" type="text" pattern="[1-9]\d*"
				onchange="this.setCustomValidity(validity.patternMismatch ? 'Please Enter Only positive non-zero digits' : '');"
				name="col2" id="col2" placeholder="Enter no. of desks in col2"
				onclick="checkCol2()"> <span style="color: red" id="cll2"
				disabled="disabled"></span> <input class="field" type="text"
				pattern="[1-9]\d*"
				onchange="this.setCustomValidity(validity.patternMismatch ? 'Please Enter Only positive non-zero digits' : '');"
				name="col3" id="col3" placeholder="Enter no. of desks in col3"
				onclick="checkCol3()"> <span style="color: red" id="cll3"
				disabled="disabled"></span> <input class="field" type="text"
				pattern="[1-9]\d*"
				onchange="this.setCustomValidity(validity.patternMismatch ? 'Please Enter Only positive non-zero digits' : '');"
				name="col4" id="col4" placeholder="Enter no. of desks in col4"
				onclick="checkCol4()"> <span style="color: red" id="cll4"
				disabled="disabled"></span> <input class="field" type="text"
				pattern="[1-9]\d*"
				onchange="this.setCustomValidity(validity.patternMismatch ? 'Please Enter Only positive non-zero digits' : '');"
				name="col5" id="col5" placeholder="Enter no. of desks in col5"
				onclick="checkCol5()"> <span style="color: red" id="cll5"
				disabled="disabled"></span> <input class="field" type="text"
				pattern="[1-9]\d*"
				onchange="this.setCustomValidity(validity.patternMismatch ? 'Please Enter Only positive non-zero digits' : '');"
				name="col6" id="col6" placeholder="Enter no. of desks in col6"
				onclick="checkCol6()"> <input class="field" type="submit"
				id="SubmitButton" onclick="DoOnSubmit()" value="Add Room">
		</form>
	</div>

</body>
</html>