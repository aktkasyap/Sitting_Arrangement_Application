<%@page import="com.ankit.staff.StaffDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Forget Password</title>
<link href="../css/style.css" type="text/css" rel="stylesheet">
</head>
<body>
	<%@ include file="main_header.jsp"%>
	<%@ include file="main_menu.jsp"%>
	<%
		if (request.getMethod().equalsIgnoreCase("post")) {
			String email = request.getParameter("email");
			StaffDao dao = new StaffDao();
			if (email != null) {
				int otp = dao.sendOtp(email);
				if (otp == 0) {
					out.print("<script> alert('There are some Server problems...')</script>");
				} else if (otp == 1) {
					out.print("<script> alert('Please give a valid email address')</script>");
				} else {
					session.setAttribute("otp", otp);
					session.setAttribute("email", email);
					response.sendRedirect("otpMatch.jsp");
				}
			}
		}
	%>

	<div style="width: 50%; margin-left: 25%; margin-top: 5%;"
		class="container">
		<div style="text-align: center; font-weight: bold; font-size: 20px;">Forgot
			Password</div>
		<form action="forgetPassword.jsp" method="post">

			<input type="text" name="email" class="field"
				placeholder="Enter email id" autofocus required="required">

			<center>
				<input type="submit" class="field" value="Submit">
			</center>

		</form>
	</div>

</body>
</html>