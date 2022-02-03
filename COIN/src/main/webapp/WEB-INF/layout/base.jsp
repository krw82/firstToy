<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	



 <nav style="width: 20%; float: left;">
<tiles:insertAttribute name="header"/>
</nav> 



<div style="width: 80%; float: left; margin-left : 300px;">
<tiles:insertAttribute name="body" ignore="true"/> 
</div>

<%-- <footer style="width: 100%; float: left;">
 	<tiles:insertAttribute name="footer"/> 
 </footer>  --%>

</body>
</html>