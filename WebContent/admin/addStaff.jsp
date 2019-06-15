<%@page import="com.ankit.utility.SittingUtility"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ankit.staff.StaffDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function DoOnSubmit() {
		if (document.getElementById("branch").value == "null") {
			document.getElementById("SubmitButton").disabled = true;
			alert("Please select all options...");
		} else {
			document.getElementById("SubmitButton").disabled = false;
		}

	}

	function DoOnResubmit() {
		if (document.getElementById("branch").value != "null") {
			document.getElementById("SubmitButton").disabled = false;
		}
	}
</script>

<meta charset="UTF-8">
<title>Add Staff</title>
<link href="../css/style.css" type="text/css" rel="stylesheet">
</head>
<body>
	<%
		if (request.getMethod().equalsIgnoreCase("post")) {
	%>
	<jsp:useBean id="dto" class="com.ankit.staff.StaffDto"></jsp:useBean>
	<!-- use bean/action tag of JSP to set all the requests -->
	<jsp:setProperty property="*" name="dto" />
	<!-- class specifies the class of which we need object-->
	<!-- dto is the reference where the object is to be stored; * set all the parameters -->
	<%
		if (new StaffDao().addStaff(dto)) {
				response.sendRedirect("manageStaff.jsp");
			} else {
				out.print("Failed");

			}
		}
	%>



	<%@ include file="../index/main_header.jsp"%>
	<%@ include file="admin_menu.jsp"%>
	<div style="width: 50%; margin-left: 25%; margin-top: 5%">
		<%
			String mybranch = request.getParameter("branch");
		%>
		<form action="addStaff.jsp" method="post">
			<input class="field" type="text" name="name"
				placeholder="Enter staff name" required="required"
				autofocus="autofocus required pattern="[A-z|\s]*"
				onchange="this.setCustomValidity(validity.patternMismatch ? 'Please Enter Only Alphabets for Staff Name' : '');"">
			<select class="field" required="required" id="branch" name="branch"
				onchange="DoOnResubmit()">
				<%
					ArrayList<String> al = SittingUtility.getAllBranch();

					if (mybranch != null) {
				%>
				<option value="<%=mybranch%>"><%=mybranch%></option>

				<%
					for (String fl1 : al) {
							if (!(fl1.equalsIgnoreCase(mybranch))) {
				%>
				<option value="<%=fl1%>"><%=fl1%></option>
				<%
					}
						}
					} else {
				%>
				<option value="null">---Select Branch---</option>
				<%
					for (String data1 : al) {
				%>
				<option value="<%=data1%>"><%=data1%></option>
				<%
					}
					}
				%>
			</select> <input class="field" type="text" name="uname"
				placeholder="Enter  uname" required="required"> <input
				class="field" type="password" name="pwd" placeholder="Enter pwd"
				required="required"> <input class="field" type="email" name="email"
				placeholder="Enter Email" required="required"> <input class="field" type="submit"
				id="SubmitButton" onclick="DoOnSubmit()" value="Add Staff">
		</form>
	</div>
</body>
</html>