<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Download Template</title>
<link href="../css/style.css" type="text/css" rel="stylesheet">
</head>
<body>
		
	<%@ include file="../index/main_header.jsp"%>
	<%@ include file="admin_menu.jsp"%>
	
	<div style="width: 30%; margin-left: 30%; margin-top: 5%">
	<form action="downloadTemplate.jsp" method="post">
	<a style="margin-left: 25%" href="../template/sample.xls" download>Download Template</a>
	</form>
	</div>
</body>
</html>