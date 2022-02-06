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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript"> 
	function check_button(URL){
		var number=${model.BOARD_NUMBER};
		var iid='${model.ID}';
		
			  
			 $.ajax({
			        type : "GET",
			        url :'<c:url value="/IDCHECK/ajax"/>',
			        data : {BOARD_NUMBER :number  , ID : iid },
			        async : false,
			        success : function(data){
			        	if(data.ID_CHECK==1){
			        		location.href=URL+"?BOARD_NUMBER=${model.BOARD_NUMBER}";
			        		
			        	}
			        	else{
			        		alert('본인 게시물이 아닙니다');
			        	}
			        	
			        	 
			        			
			        },
			        
			    error: function(data){
			        alert("에러가 발생했습니다.");
			        
			    }
			    
			     });  
	
	} 
	

</script>
</head>
<body style="background-color: #E4E4E4;">
<div style="margin-left:180px;">
	<table border="1" class="table table-hover"  >
		<colgroup>
			<col width="15%">
			<col width="35%"/> 
			<col width="15%"/> 
			<col width="35%"/>
		</colgroup>
		<caption>게시글 상세</caption>
		<tbody>
			<tr>
				<th scope="row">글번호</th>
				<td>${model.BOARD_NUMBER}</td>
				<th scope="row">조회수</th>
				<td>${model.BOARD_COUNT}</td>
			</tr>
			<tr>
				<th scope="row">작성자</th>
				<td>${model.ID}
				<th scope="row">작성시간</th>
				<td>${model.BOARD_DATE}</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td colspan="3">${model.BOARD_TITLE}</td>
			</tr>
			<tr>
				<td colspan="4">${model.BOARD_CONTENT}</td>
			</tr>
			
		</tbody>
	</table>
	<a href="board"><input type="button" value="목록으로"   class="btn btn-light"> </a> 
	<input type="button" value="수정하기" onclick="check_button('UPDATE');"  class="btn btn-light"> 
	 <input type="button" value="삭제하기" onclick="check_button('DELETE');"  class="btn btn-light"> 
	
</div>

</body>
</html>