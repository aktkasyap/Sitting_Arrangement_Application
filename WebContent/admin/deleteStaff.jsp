<%@page import="com.ankit.staff.StaffDao"%>
<%
String sid = request.getParameter("id");
if(sid != null) {
	int id = Integer.parseInt(sid);
	new StaffDao().deleteStaff(id);
	response.sendRedirect("manageStaff.jsp");
}else {
response.sendRedirect("manageStaff.jsp");
}
%>