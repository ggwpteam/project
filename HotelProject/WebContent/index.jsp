<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp" %>


	<h2 align="center" style="margin-top:200px;">안녕하세요, MVC입니다.TEST2</h2>	
	<h1>TEST_minbyoungjun</h1>
	<h1>TEST_HEOJUN</h1>
	<h5>test shinyoonji</h5>
	<h1>테스트_허준</h1>
	
	<li class="board"><a href="<%=request.getContextPath()%>/views/room/roomList">객실안내</a></li>
	<li class="board"><a href="<%=request.getContextPath()%>/views/common/bar">bar</a></li>
	<li class="mypage"><a href="<%=request.getContextPath()%>/mypage/main">마이페이지</a></li>

<%@include file="/WEB-INF/views/common/footer.jsp" %>

