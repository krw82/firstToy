<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
<div>
	<nav style="width:19%; float:left;">
    <h1>MBDTF</h1> <!-- h1태그 검색사이트가 좋아함. 문서상에 1개만 있는 것을 권장한다. -->
   <div class="list-group">
        <a  class="list-group-item list-group-item-action list-group-item-dark" href="chart?scale=60&coin=KRW-BTC" style=" background-color:#eee;">비트코인</a>
       <a  class="list-group-item list-group-item-action list-group-item-dark" href="chart?scale=60&coin=KRW-ETH" style=" background-color:#eee;">이더리움</a>
       <a  class="list-group-item list-group-item-action list-group-item-dark" href="chart?scale=60&coin=KRW-XRP" style=" background-color:#eee;">리플</a>
       <a  class="list-group-item list-group-item-action list-group-item-dark" href="board" style=" background-color:#eee;">게시판</a>
       
    </div>
    
    <p style="width:30%; margin-left: 20px; float:left;">${IDD}</p>
    <c:choose>
    <c:when test="${IDD eq '로그인해주세요'}">
    	<a href="login"><input type="button" value="로그인" style="width:50%; float:left; margin-left: 50px;" > </a>
    </c:when>
	<c:otherwise>
	<a href="logout"><input type="button" value="로그아웃" style="width:50%; float:left; margin-left: 50px;" > </a>
	</c:otherwise>
	</c:choose>
     
</nav>
</div>
<style>
    nav{ 
        width:200px; 
        background-color:#eee; 
        border-right:1px solid #ddd;
        /* height:100% 그냥 적용 안됨. 부모개념이 있어야 채워질 수 있음 */

        position:fixed;  /*공중에 떠서 공간을 차지하지 않음*/
        height:100% /*fixed를 해서 높이 100%가 가능해짐*/
    }
    h1{ font-size:18px;  padding:20px; }
  
</style>
</body>
</html>