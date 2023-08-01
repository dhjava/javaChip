<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>공지사항</h2>
						<div class="breadcrumb__option">
							<a href="<%= request.getContextPath() %>/">Home</a>
							<a href="#">고객센터</a>
							<a href="/notice.do">공지사항</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="board-box spad">
		<div class="container">
			<div class="board-wButton" style="margin-bottom:20px;">
				<button type="button" class="btn btn-outline-secondary" style="margin-right:20px;" onclick="location.href='<%= request.getContextPath() %>/help/noticeWrite.do'">글 쓰기</button>
			</div>
			<table class ="table table-hover">
				<tr>
					<td scope="col" style="width:10%">번호</td>
					<td scope="col" style="width:56%">제목</td>
					<td scope="col" style="width:17%">이름</td>
					<td scope="col" style="width:17%">날짜</td>
				</tr>
				<fmt:formatDate value="<%=new java.util.Date()%>" type="DATE" pattern="yyyy.MM.dd" var="nowDate"/>

				<c:forEach items="${list}" var="notice" varStatus="status">
				<fmt:parseDate value="${notice.nDate}" pattern="yyyy-MM-dd HH:mm:ss" var="dateStr"/>
 				<fmt:formatDate value="${dateStr}" pattern="yyyy.MM.dd" var="boardDate"/>
				<fmt:formatDate value="${dateStr}" pattern="HH:mm" var="boardDateTime"/>
				
				<tr>
					<td scope="row">${status.count}</td>
					<td><a href="noticeView.do?nNo=${notice.nNo}">${notice.nTitle}</a></td>
					<td>${notice.uName}</td>
					<td>
						<c:choose>
						<c:when test="${boardDate eq nowDate}">
							${boardDateTime}
						</c:when>
						<c:otherwise>
							${boardDate}
						</c:otherwise>
						</c:choose>
					</td>
				</tr>
				</c:forEach>
			</table>
			<div style="text-align:center;">
				◀ 1 2 3 4 5 6 7 8 9 10 ▶
			</div><br>
			<div class="board-search" style="width:40%; margin:0 auto;">
				<form class="d-flex justify-content-center">
	 				<div class="input-group mb-4">
						<select>
						<option value="title">제목</option>
						<option value="content">내용</option>
						<option value="tnc">제목+내용</option>
						</select>
						<input type="text" class="form-control" placeholder="내용을 입력하세요" aria-label="Recipient's username" aria-describedby="button-addon2">
						<div class="input-group-append">
						<button type="submit" class="btn btn-secondary mb-4">검색하기</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
<%@ include file="../include/footer.jsp" %>