<%@page import="com.ankit.utility.SittingUtility"%>
<%@page import="com.ankit.student.StudentDao"%>
<%@page import="com.ankit.student.StudentDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function DoOnSubmit() {
		if ((document.getElementById("course").value == "null")
				|| (document.getElementById("branch").value == "null")
				|| (document.getElementById("year").value == "null")) {
			document.getElementById("SubmitButton").disabled = true;
			alert("Please select all options...");
		} else {
			document.getElementById("SubmitButton").disabled = false;
		}

	}

	function DoOnResubmit() {
		if ((document.getElementById("course").value != "null")
				&& (document.getElementById("branch").value != "null")
				&& (document.getElementById("year").value != "null")) {
			document.getElementById("SubmitButton").disabled = false;
		}
	}
</script>
<meta charset="UTF-8">
<title>Manage Student</title>
<link href="../css/style.css" type="text/css" rel="stylesheet">
</head>
<body>
	<%@ include file="../index/main_header.jsp"%>
	<%@ include file="admin_menu.jsp"%>
	<div id="tables" style="width: 50%; margin-left: 25%; margin-top: 5%">
		<%
			String mybranch = request.getParameter("branch");
			String myyear = request.getParameter("year");
			String mycourse = request.getParameter("course");
		%>
		<h1 style="text-align: center;">Manage Students</h1>
		<table style="width: 100%">
			<tr>
				<td>
					<form action="addStudent.jsp">
						<input type="submit" value="Add Students">
					</form>
				</td>
				<td>
					<form action="deleteAllStudent.jsp" method="post">
						<input type="submit" value="Delete All Students">
					</form>
				</td>
			</tr>
		</table>
		<form action="manageStudent.jsp" method="post" name="frm">
			<select class="field" required="required" id="course" name="course"
				onchange="DoOnResubmit()">
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
			</select> <select class="field" required="required" id="branch" name="branch"
				onchange="DoOnResubmit()">
				<%
					ArrayList<String> al2 = SittingUtility.getAllBranch();

					if (mybranch != null) {
				%>
				<option value="<%=mybranch%>"><%=mybranch%></option>

				<%
					for (String fl1 : al2) {
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
					for (String data1 : al2) {
				%>
				<option value="<%=data1%>"><%=data1%></option>
				<%
					}
					}
				%>
			</select> <select class="field" required="required" id="year" name="year"
				onchange="DoOnResubmit()">
				<%
					ArrayList<String> al1 = SittingUtility.getAllYear();

					if (myyear != null) {
				%>
				<option value="<%=myyear%>"><%=myyear%></option>

				<%
					for (String fl1 : al1) {
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
					for (String data1 : al1) {
				%>
				<option value="<%=data1%>"><%=data1%></option>
				<%
					}
					}
				%>

			</select> <input class="field" type="submit" id="SubmitButton"
				onclick="DoOnSubmit()" value="View Students">
		</form>
		<table style="width: 100%">
			<%
				if (mybranch != null && mycourse != null && myyear != null) {
			%>
			<tr>
				<th>S.No.</th>
				<th>Enrollment No.</th>
				<th>Name</th>
				<th>Update Operation</th>
				<th>Delete Operation</th>
			</tr>
			<%
				ArrayList<StudentDto> al3 = new StudentDao().getAllStudent(mycourse, mybranch, myyear);
					if (al3 != null) {
						int s = 0;
						for (StudentDto dto : al3) {
			%>
			<tr>
				<td><%=++s%></td>
				<td><%=dto.getEnroll()%></td>
				<td><%=dto.getName()%></td>
				<td>
					<form action="updateStudent.jsp" method="post">
						<input type="hidden" name="id" value="<%=dto.getId()%>"> <input
							type="hidden" name="course" value="<%=mycourse%>"> <input
							type="hidden" name="branch" value="<%=mybranch%>"> <input
							type="hidden" name="year" value="<%=myyear%>"> <input
							type="submit" value="Update">
					</form>
				</td>
				<td>
					<form action="deleteStudent.jsp" method="post">
						<input type="hidden" name="id" value="<%=dto.getId()%>"> <input
							type="hidden" name="course" value="<%=mycourse%>"> <input
							type="hidden" name="branch" value="<%=mybranch%>"> <input
							type="hidden" name="year" value="<%=myyear%>"> <input
							type="submit" value="Delete">
					</form>
				</td>
			</tr>
			<%
				}
					} else {
						response.sendRedirect("addStudent.jsp");
					}
				}
			%>
		</table>
	</div>
</body>
</html>