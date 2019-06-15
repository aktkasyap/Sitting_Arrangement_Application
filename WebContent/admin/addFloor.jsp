<%@page import="com.ankit.utility.SittingUtility"%>
<%@page import="com.ankit.floor.FloorDao"%>
<%@page import="com.ankit.floor.FloorDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Add Floor</title>
<link href="../css/style.css" type="text/css" rel="stylesheet">

<script type="text/javascript">
	function DoOnSubmit() {
		if (document.getElementById("floor").value == "null") {
			document.getElementById("SubmitButton").disabled = true;
		alert("Please choose a floor...");
		}
		else {
			document.getElementById("SubmitButton").disabled = false;
		}

	}
	</script>


</head>
<body>
	<%
		if (request.getMethod().equalsIgnoreCase("post")) {
	%>
	<jsp:useBean id="dto" class="com.ankit.floor.FloorDto"></jsp:useBean>
	<!-- use bean/action tag of JSP to set all the requests -->
	<jsp:setProperty property="*" name="dto" />
	<!-- class specifies the class of which we need object-->
	<!-- dto is the reference where the object is to be stored; * set all the parameters -->
	<%
		if (new FloorDao().addFloor(dto)) {
				response.sendRedirect("manageFloor.jsp");
			} else {
				out.print("Failed");

			}
		}
	%>


	<%@ include file="../index/main_header.jsp"%>
	<%@ include file="admin_menu.jsp"%>
	<div style="width: 50%; margin-left: 25%; margin-top: 5%">
		<form action="addFloor.jsp" method="post" >
			<select class="field" name="floor" id="floor" onclick="DoOnSubmit()" required="required">
				<option value="null">---Select Floor---</option>
				<%
					for (String fl : SittingUtility.getAllFloors()) {
				%>
				<option value="<%=fl%>"><%=fl%></option>

				<%
					}
				%>

			</select> <input onchange="checkFloor()" class="field" type="text" name="rno"
				placeholder="Enter Room no." required="required"> 
				<input class="field" id="SubmitButton"  type="submit" onclick="DoOnSubmit()" value="Add Floor">
		</form>
	</div>

</body>



</html>