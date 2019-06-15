<%@page import="com.ankit.floor.FloorDao"%>
<%@page import="com.ankit.floor.FloorDto"%>
<%@page import="java.util.ArrayList"%>
<%
	String floor = request.getParameter("floor");
	if (floor != null && !floor.equalsIgnoreCase("null")) {
		ArrayList<FloorDto> al = new FloorDao().getFloor_Room(floor);
		if (al != null) {
			out.println("<option value = 'null'>---Select Room No.---</option>");
			for (FloorDto dto : al) {
				out.println("<option value=" + dto.getRno() + ">" + dto.getRno() + "</option>");
			}
		}
	}else{
		out.println("<option value = 'null'>---Select Room No.---</option>");
	}
%>