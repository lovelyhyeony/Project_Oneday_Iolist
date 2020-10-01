<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        document.querySelectorAll(".tr_index").forEach(function (pname) {
          pname.addEventListener("click", function () {
            let seq = pname.getAttribute("data-seq");
            document.location.href = "/iolist/detail?seq=" + seq;
          });
        });
      });
    </script>
    <link
      rel="stylesheet"
      href="${rootPath}/static/css/iolist-list.css?ver=2020-10-01-003"
    />
  </head>
  <body>
    <table id="iolist-list">
      <tr>
        <th>NO</th>
        <th>일자</th>
        <th>시각</th>
        <th>상품명</th>
        <th>매입단가</th>
        <th>매출단가</th>
        <th>수량</th>
        <th>매입합계</th>
        <th>판매합계</th>
      </tr>
      <c:choose>
        <c:when test="${empty IOLIST}">
          <tr>
            <td colspan="9">데이터가 없음</td>
          </tr>
        </c:when>
        <c:otherwise>
          <c:forEach items="${IOLIST}" var="ioVO" varStatus="index">
            <tr class="tr_index" data-seq="${ioVO.seq}">
              <td>${index.count}</td>
              <td>${ioVO.io_date}</td>
              <td>${ioVO.io_time}</td>
              <td>${ioVO.io_pname}</td>
              <td>${ioVO.io_iprice}</td>
              <td>${ioVO.io_oprice}</td>
              <td>${ioVO.io_quan}</td>
              <td>${ioVO.io_iprice_multi}</td>
              <td>${ioVO.io_oprice_multi}</td>
            </tr>
          </c:forEach>
          <tr>
          	<td colspan="7">합계</td>
          	<td>${ioVo.io_iprice_total}</td>
          	<td>${ioVo.io_oprice_total}</td>
          </tr>
        </c:otherwise>
      </c:choose>
    </table>
    <div id="iolist-link-box">
      <a href="${rootPath}/write">새로작성</a>
    </div>
  </body>
</html>
