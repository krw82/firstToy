<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body style="background-color: #E4E4E4;">

<div style="margin-left:150px;">
<form action="/coin/UPDATE?BOARD_NUMBER=${model.BOARD_NUMBER}" method="post">

<table border="1" class="table table-hover">

	<colgroup> <col width="15%"> <col width="*"/> </colgroup> <caption>게시글 수정</caption>
	<tbody>


	<tr>
		<th scope="row">제목</th>
		<td><input type="text" id="TITLE" name="BOARD_TITLE" value="${model.BOARD_TITLE}" ></input></td>
	</tr>
	<tr>
		<td colspan="2">
		<textarea rows="20" cols="100" title="내용" id="CONTENTS" name="BOARD_CONTENT">${model.BOARD_CONTENT}</textarea>
	</tr>
	
</tbody>
</table>

<input type="submit" value="수정하기" style="float:right;" class="btn btn-light">
</form>
</div>

</body>
</html>