<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${rootPath}/static/css/iolist-detail.css?ver=2020-10-04-11">
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