<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>나의 홈페이지</title>
<link rel="stylesheet" href="${rootPath}/static/css/iolist-list.css?ver=2020-09-30-001">
<script>
document.addEventListener("DOMContentLoaded", function(){
	document.querySelector("td.iolist-pname").addEventListener("click", function(){
		let seq = document.querySelector("td.iolist-pname").getAttribute("seq");
		document.location.href = `${rootPath}/books/detail/${seq}`
	});
});
</script>
</head>
<body>
<table id="iolist-list">
	<tr>
		<th>NO</th>
		<th>도서명</th>
		<th>출판사</th>
		<th>저자</th>
		<th>가격</th>
		<th>구입일</th>
	</tr>
	<c:choose>
		<c:when test="${empty IOLIST}">
			<tr>
				<td colspan="7">데이터가 없음</td>
			</tr>			
		</c:when>
		<c:otherwise>
		<% //for(IOVO ioVo : IOLIST) %>
			<c:forEach items="${IOLIST}" var="ioVO" varStatus="index">
				<tr>
					<td>${index.count}</td>
					<td class="iolist-pname" data-seq="${ioVO.seq}">${ioVO.io_pname}</td>
					<td>${ioVO.io_price}</td>
					<td>${ioVO.io_price}</td>
					<td>${ioVO.io_quan}</td>
					<td>${ioVO.io_price * ioVO.io_quan}</td>
					<td>${ioVO.io_total}</td>
				</tr>
			</c:forEach>
		</c:otherwise>	
	</c:choose>
</table>
<div id="iolist-link-box">
	<a href="${rootPath}/write">새로작성</a>
</div>
</body>
</html>