<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body style="background-color: #E4E4E4;">
<div style="margin-left:180px;">
<form action="memberCreate" method="post">
<table border="1"  class="table table-hover" >
	<caption>회원가입</caption>
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
<input  type="submit" value="회원가입" style="float:right;" class="btn btn-light">
</form>
</div>
</body>
</html>