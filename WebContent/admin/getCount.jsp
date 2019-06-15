
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ankit.student.StudentDao"%>
<%@page import="java.util.Arrays"%>
<%
	String course = request.getParameter("course");
	String year = request.getParameter("year");
	String branch = request.getParameter("branch");

	List<String> al = Arrays.asList(branch.split(","));
	int count = 0;
	if (al != null) {
		for (String branches : al) {
			count += new StudentDao().getAllStudentCount(course, branches, year);
		}
	}
	count = count * 2;
	out.print("Total no. of desk required : " + count);
%>