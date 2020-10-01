<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<style>
form#detail-form {
	width: 500px;
	padding: 40px;
	margin: 0 auto;
}

form#detail-form fieldset {
	border: 2px solid #bcaaa4;
	border-radius: 4px;
	padding: 1rem;
}

form#detail-form fieldset legend {
	color: #795548;
	font-weight: bold;
	text-align: center;
}

form#detail-form fieldset table#detail-table {
	margin: 0 auto;
	width: 100%;
}

form#detail-form fieldset table#detail-table tr td:first-child {
	font-weight: bold;
	text-align: left;
}

form#detail-form fieldset table#detail-table tr td:nth-child(2) {
	text-align: left;
}

form#detail-form div {
	text-align: center;
}

form#detail-form div a {
	background-color: #795548;
	color: white;
	padding: 10px;
	border: 2px solid transparent;
	border-radius: 4px;
	text-decoration: none;
}

form#detail-form div a:hover {
	background-color: white;
	color: #795548;
	border: 2px solid #795548;
	transition: 0.5s;
}
</style>
<form id="detail-form">
	<fieldset>
		<legend>DETAIL</legend>
		<table id="detail-table">
			<tr>
				<td>상품명</td>
				<td>${ioVO.io_pname}</td>
			</tr>
			<tr>
				<td>매입단가</td>
				<td>${ioVO.io_iprice}</td>
			</tr>
			<tr>
				<td>판매단가</td>
				<td>${ioVO.io_oprice}</td>
			</tr>
			<tr>
				<td>단가</td>
				<td>${ioVO.io_price}</td>
			</tr>
			<tr>
				<td>수량</td>
				<td>${ioVO.io_quan}</td>
			</tr>
		</table>
	</fieldset>
	<br/>
	<div>
		<a href="${rootPath}/update?seq=${ioVO.seq}">수정</a>
		<a href="${rootPath}/delete?seq=${ioVO.seq}">삭제</a>
	</div>
</form>