<%@page import="com.ankit.floor.FloorDao"%>
<%
String id = request.getParameter("fid");
if(id != null) {
	int fid = Integer.parseInt(id);
	new FloorDao().deleteFloor(fid);
	response.sendRedirect("manageFloor.jsp");
}else {
response.sendRedirect("manageFloor.jsp");
}
%>