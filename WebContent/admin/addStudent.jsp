<%@page import="com.ankit.utility.SittingUtility"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">

function DoOnSubmit() {
	if ((document.getElementById("course").value == "null") || (document.getElementById("branch").value == "null") || (document.getElementById("year").value == "null")) {
		document.getElementById("SubmitButton").disabled = true;
	alert("Please select all options...");
	}
	else {
		document.getElementById("SubmitButton").disabled = false;
	}

}

function DoOnResubmit() {
	if ((document.getElementById("course").value != "null") && (document.getElementById("branch").value != "null") && (document.getElementById("year").value != "null")) {
		document.getElementById("SubmitButton").disabled = false;
	}
}
	

	function fileValidation() {
		var fileInput = document.getElementById('template');
		var filePath = fileInput.value;
		var allowedExtensions = /(\.xlsx|\.xls)$/i;
		if (!allowedExtensions.exec(filePath)) {
			alert('Please upload file having extensions .xls only.');
			fileInput.value = '';
			return false;
		} else {
			if (fileInput.files && fileInput.files[0]) {
				var reader = new FileReader();
				reader.readAsDataURL(fileInput.files[0]);
			}
		}
	}
</script>

<meta charset="UTF-8">
<title>Add Students</title>
<link href="../css/style.css" type="text/css" rel="stylesheet">
</head>
<body>
	<%@ include file="../index/main_header.jsp"%>
	<%@ include file="admin_menu.jsp"%>
	<div style="width: 50%; margin-left: 25%; margin-top: 5%">
		<%
			String mybranch = request.getParameter("branch");
			String myyear = request.getParameter("year");
			String mycourse = request.getParameter("course");
		%>
		<h1 style="text-align: center;">Add Students</h1>

		<form action="../UploadData" method="post" name="frm" enctype="multipart/form-data">

		<select class="field" required="required" id="course" name="course" onchange="DoOnResubmit()">
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
			</select>

			<select class="field" required="required" id="branch" name="branch" onchange="DoOnResubmit()">
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
			</select> <select class="field" required="required" id="year" name="year" onchange="DoOnResubmit()">
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

			</select> <input class="field" id="template" type="file" name="template"
				required="required" onchange="fileValidation()" />
			<input class="field" type="submit" id="SubmitButton"
				onclick="DoOnSubmit()" value="Add Student">
		</form>
	</div>
</body>
</html>