<%
Integer id=(Integer)session.getAttribute("id");
if(id==null){
	response.sendRedirect("../index/login.jsp");
}
%>

<ul>
<li><a href="staff.jsp">Home</a></li>
<li><a href="staff_viewArrangement.jsp">Sitting Arrangements</a></li>
<li><a href="staff_createArrangement.jsp">Create Arrangements</a></li>
<li><a href="staff_manageStudent.jsp">Manage Students</a></li>
<li style="float: right"><a href="staff_signOut.jsp">Sign out</a></li>
</ul>