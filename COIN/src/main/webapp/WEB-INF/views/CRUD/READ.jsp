<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
<script type="text/javascript"> 

function check_butto(){
	
			 $.ajax({
			        type : "GET",
			        url :'<c:url value="IDCHECK/ajax"/>',
			        data : {CREATE : 't' },
			        async : false,
			        success : function(data){
			        	
			        	if(data.ID_CHECK==1){
			        		location.href = "/coin/create";
			        	
			        	}
			        	else{
			        		alert('로그인 후 이용 가능합니다.')
			        		
			        		location.href="/coin/board"; 
			        	
			        	}
			        			
			        },
			        
			    error: function(data){
			        alert("에러가 발생했습니다.");
			        
			    }
			    
			     });
			
			 
	} 
</script>

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
		        <tr onclick="location.href='READ?BOARD_NUMBER=${list.BOARD_NUMBER}'">
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
<input type="button" value="글작성" onclick="check_butto()">
</body>
</html>