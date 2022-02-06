<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="http://code.jquery.com/jquery-1.4.4.min.js"></script>

<script type="text/javascript">

function create(){
	  location.href = "memberCreate";
}

 var bool=false;
	function login(){
		 var id = document.getElementById( 'ID' ).value;
		 var password = document.getElementById( 'PASSWORD' ).value;
		 
		 if(id==""||password==""){
			 alert('필수 입력란이 비어있습니다.');
			 return false;
		 }else{
			 
			 $.ajax({
			        type : "GET",
			        url :'<c:url value="/loginAJ"/>',
			        data : {ID :id, PASSWORD : password},
			        async : false,
			        success : function(data){
			        	
			        	 
			        		if(data.login_check==1){
			        			bool=true;
			        		}
			        		else{
			        			bool=false;
			        			alert('로그인에 실패하였습니다.')
			        		}
			        			
			        },
			    error: function(data){
			        alert("에러가 발생했습니다.");
			        
			    }
			    
			     }); 
			 
			
			
		 }
		 
		return bool;
		
	
	}
	

</script>
</head>
<body style="background-color: #E4E4E4;">
<div style="margin-top:350px; margin-left : 600px;">
<form action="login/success" onsubmit="return login();" method="POST" >

<table board="1">
	<tr>
		<td>아이디</td>
		<td><input type="text" name="ID" id="ID" style="width:200px;"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="PASSWORD" id="PASSWORD" style="width:200px;"></td>
	</tr>
</table>

<input type="submit" style="width :15%; float : left;" value="로그인">
</form>
<input type="button" onclick="create();" value="회원가입"  style="width :15%; float : left;">

</div>

</body>
</html>