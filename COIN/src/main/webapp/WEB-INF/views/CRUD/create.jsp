<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="create" method="post">
<table border="1">

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

<input type="submit" value="작성하기">
</form>


</body>
</html>