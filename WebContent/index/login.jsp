<%@page import="com.ankit.staff.StaffDao"%>
<%@page import="com.ankit.staff.StaffDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Login in</title>
<link href="../css/style.css" type="text/css" rel="stylesheet">
</head>
<body>

	<%
		if (request.getMethod().equalsIgnoreCase("post")) {
			String uname = request.getParameter("uname");
			String pwd = request.getParameter("pwd");
			String user = request.getParameter("user");
			if (user != null && "admin".equalsIgnoreCase(user)) {
				if (uname.equals("admin") && pwd.equals("admin")) {
					String s = "admin";
					session.setAttribute("admin", s);
					response.sendRedirect("../admin/admin.jsp");
				} else {
					out.print("<script type='text/javascript'>alert('Please Enter valid login details');</script>");
				}
			} else if (user != null && "staff".equalsIgnoreCase(user)) {
				StaffDto dto = new StaffDao().staffLogin(uname, pwd);

				if (dto != null) {
					session.setAttribute("id", dto.getId());
					response.sendRedirect("../staff/staff.jsp");
				} else {
					out.print("<script type='text/javascript'>alert('Please Enter valid login details');</script>");
				}
			} else {
				out.print("<script type='text/javascript'>alert('Please Enter valid login details');</script>");
			}
		}
	%>


	<%@ include file="main_header.jsp"%>
	<%@ include file="main_menu.jsp"%>
	<div style="width: 30%; margin-left: 30%; margin-top: 5%">
		<form action="login.jsp" method="post">
			<h2 style="font-size: 20px; color: red" align="center">Login</h2>
			<div>
				<input style="margin-left: 30%;" type="radio" name="user"
					checked="checked" value="admin">Admin <input type="radio"
					name="user" value="staff"> Staff
			</div>
			<input class="field" type="text" name="uname"
				placeholder="Enter username" required="required"
				autofocus="autofocus"> <input class="field" type="password"
				name="pwd" placeholder="Enter password" required="required">
			<input type="submit" value="signin">
		</form>
		<a href="forgetPassword.jsp">Forget Password</a>
	</div>
</body>
</html>