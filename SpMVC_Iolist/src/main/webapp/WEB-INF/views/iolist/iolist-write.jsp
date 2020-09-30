<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${rootPath}/static/css/iolist-write.css?ver=2020-09-30-002" />
<script>
document.addEventListener("DOMContentLoaded", function(){
	document.querySelector("#btn-save").addEventListener("click", function(){
		let save = document.querySelector("#io_pname");
		let save_value = save.value;
		if(save_value === "") {
			alert("상품명을 입력해주세요 :)");
			save.focus();
			return false;
		}
		if(confirm("저장할까요?")) {
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
			<form:input path="io_input" placeholder="구분" />
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
			<button id="btn-save" type="button">저장</button>
		</div>
	</fieldset>
</form:form>