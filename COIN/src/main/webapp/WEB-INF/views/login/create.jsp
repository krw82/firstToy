<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<form action="memberCreate" method="post">
<table border="1">
	<tr>
		<td>이름</td>
		<td><input type="text" name="NAME"></td>
	</tr>
	<tr>
		<td>아이디</td>
		<td><input type="text" name="ID"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="PASSWORD"></td>
	</tr>
	<tr>
		<td>비밀번호 확인</td>
		<td><input type="password"></td>
	</tr>
	<tr>
		<td>선호하는 자산</td>
		<td><select name="MONEY">
			<option value="부동산">부동산</option>
			<option value="주식">주식</option>
			<option value="코인">코인</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>E-Mail</td>
		<td><input type="text" name="EMAIL"></td>
	</tr>
	

</table>
<input  type="submit" value="전송">
</form>
</body>
</html>