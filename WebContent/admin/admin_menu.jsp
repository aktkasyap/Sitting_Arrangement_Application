<%
String str=(String)session.getAttribute("admin");
if(str==null){
	response.sendRedirect("../index/login.jsp");
}
%>


<ul>
<li><a href="admin.jsp">Home</a></li>
<li><a href="admin_createArrangement.jsp">Create Arrangements</a></li>
<li><a href="admin_viewArrangement.jsp">Sitting Arrangements</a></li>
<li><a href="manageStudent.jsp">Manage Student</a></li>
<li><a href="manageStaff.jsp">Manage Staff</a></li>
<li><a href="manageRoom.jsp">Manage Room</a></li>
<li><a href="manageFloor.jsp">Manage Floor</a></li>
<li><a href="downloadTemplate.jsp">Download Template</a></li>
<li style="float: right"><a href="admin_signOut.jsp">Sign out</a></li>
</ul>