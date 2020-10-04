<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>IOLIST</title>
<link rel="stylesheet"
	href="${rootPath}/static/css/index.css?ver=2020-10-04-456" />
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function() {
		$(window).scroll(function() {
			let headerHeight = $("header").height();
			let windowTop = $(window).scrollTop();
			if (windowTop > headerHeight) {
				$("#main-nav").css("position", "fixed");
				$("#main-nav").css("top", "0");
			} else {
				$("#main-nav").css("position", "relative");
			}
			console.log(headerHeight, windowTop);
		});
	});
</script>
</head>
<body>
	<header></header>
	<nav id="main-nav">
		<ul>
			<li>상품 검색</li>
			<li>회원가입</li>
			<li>로그인</li>
		</ul>
	</nav>
	<section id="main-section">
		<c:choose>
			<c:when test="${BODY == 'IOLIST-WRITE'}">
				<%@ include file="/WEB-INF/views/iolist/iolist-write.jsp" %>
			</c:when>
			<c:when test="${BODY == 'IOLIST-DETAIL'}">
				<%@ include file="/WEB-INF/views/iolist/iolist-detail.jsp" %>
			</c:when>
			<c:otherwise> 
				<%@ include file="/WEB-INF/views/iolist/iolist-list.jsp" %>
			</c:otherwise>
		</c:choose>
	</section>
	<footer>
		<address>CopyRight &copy; lovelyhyeony</address>
	</footer>
</body>
</html>