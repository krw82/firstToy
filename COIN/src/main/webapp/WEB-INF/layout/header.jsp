<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<nav>
    <h1>프론트엔드 사전</h1> <!-- h1태그 검색사이트가 좋아함. 문서상에 1개만 있는 것을 권장한다. -->
    <ul class="menu">
        <li><a href="#html">HTML5</a></li>
        <li><a href="#css">CSS3</a></li>
        <li><a href="#js">Javascript</a></li>
        <li><a href="#react">Framework</a></li>
        <li><a href="#mobile">Mobile</a></li>
    </ul>
</nav>
<style>
    nav{ 
        width:200px; 
        background-color:#eee; 
        border-right:1px solid #ddd;
        /* height:100% 그냥 적용 안됨. 부모개념이 있어야 채워질 수 있음 */

        position:fixed; /*공중에 떠서 공간을 차지하지 않음*/
        height:100% /*fixed를 해서 높이 100%가 가능해짐*/
    }
    h1{ font-size:18px;  padding:20px; }
    .menu {}
    .menu li {}

    /*메뉴*/
    .menu li a {
        height:30px;
        line-height:30px;
        display:block;
        padding:0 20px;
        font-size:12px;
        color:#555;
    }
    .menu li a:hover { background-color:skyblue; color:white;}
</style>
</body>
</html>