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
	
</script>
</head>
<body style="background-color: #E4E4E4;">
<div style="margin-left:150px;">
<form action="/coin/create" method="post">

<table border="1" class="table table-hover">

	<colgroup> <col width="15%"> <col width="*"/> </colgroup> <caption>게시글 작성</caption>
	<tbody>


	<tr>
		<th scope="row">제목</th>
		<td><input type="text" id="TITLE" name="BOARD_TITLE" ></input></td>
	</tr>
	<tr>
		<td colspan="2">
		<textarea rows="20" cols="100" title="내용" id="CONTENTS" name="BOARD_CONTENT"></textarea>
	</tr>
	
</tbody>
</table>

<input type="submit" value="작성하기"  class="btn btn-light" style="float:right;">
</form>

</div>
</body>
</html>