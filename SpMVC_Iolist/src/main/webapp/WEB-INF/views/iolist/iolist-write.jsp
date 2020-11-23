<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<link rel="stylesheet"
	href="${rootPath}/static/css/iolist-write.css?ver=2020-11-24-54dsf45" />
<script>
	document.addEventListener("DOMContentLoaded", function() {
		document.querySelector("#btn-save").addEventListener("click",
				function() {
					let save = document.querySelector("#io_pname");
					let save_value = save.value;
					if (save_value === "") {
						alert("상품명을 입력해주세요 :)");
						save.focus();
						return false;
					}
					if (confirm("저장할까요?")) {
						document.querySelector("form").submit();
					}
				});
	});
</script>
<form:form id="iolist" modelAttribute="iolistVO">
	<fieldset>
		<legend>매입 매출 입력</legend>
		<div>
			<label for="io_pname">상품명</label>
			<form:input id="io_pname" path="io_pname" placeholder="상품명" />
		</div>

		<div>
			<label for="io_input">구분</label>
			<form:select path="io_input">
				<option selected="매입" value="0">매입</option>
				<option value="1">매출</option>
			</form:select>
		</div>

		<div>
			<label for="io_price">단가</label>
			<form:input type="number" path="io_price" placeholder="단가" />
		</div>

		<div>
			<label for="io_quan">수량</label>
			<form:input type="number" path="io_quan" placeholder="수량" />
		</div>

		<div class="button-box">
			<c:choose>
				<c:when test="${LOCATION == 'UPDATE'}">
					<input name="seq" type="hidden" value="${iolistVO.seq}"/>
					<input name="io_date" type="hidden" value="${iolistVO.io_date}"/>
					<input name="io_time" type="hidden" value="${iolistVO.io_time}"/>
					<button id="btn-save" type="button">UPDATE</button>					
				</c:when>
				<c:otherwise>
					<button id="btn-save" type="button">SAVE</button>
				</c:otherwise>
			</c:choose>
		</div>
	</fieldset>
</form:form>