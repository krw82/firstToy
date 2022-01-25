<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



</head>
<body>
<table border="1" style="width:1500px">

<colgroup> <col width="5%"/> <col width="*"/> <col width="10%"/> <col width="10%"/> <col width="10%"/><col width="10%"/></colgroup>


		<thead>
			<tr>
				<th>NO</th>
				<th>제목</th>
				<th>닉네임</th>
				<th>등록일</th>
				<th>조회</th>
				<th>추천</th>
		</thead>
		<tbody>
		<c:choose>
	<c:when test="${fn:length(list)>0 }">
 		 	<c:forEach var="list" items="${list}" varStatus="status">
		        <tr >
		 		  <td>${list.BOARD_NUMBER}</td>
		          <td>${list.BOARD_TITLE}</td>
		          <td>${list.ID}</td>
		          <td>${list.BOARD_DATE}</td>
		          <td>${list.BOARD_COUNT}</td>
		          <td>${list.BOARD_GOOD} - ${list.BOARD_BAD}</td>
		        </tr>
		        
	        </c:forEach>
	    </c:when>
	     <c:otherwise>
		 조회된결과 없음
		 </c:otherwise>
	
	</c:choose>
		
		</tbody>
</table>
<a href="/coin/create"><input type="button" value="글작성"></a>
</body>
</html>