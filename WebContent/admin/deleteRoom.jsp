<%@page import="com.ankit.room.RoomDao"%>
<%
String id = request.getParameter("rid");
if(id != null) {
	int rid = Integer.parseInt(id);
	new RoomDao().deleteRoom(rid);
	response.sendRedirect("manageRoom.jsp");
}else {
response.sendRedirect("manageRoom.jsp");
}
%>