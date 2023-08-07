<%@page import="org.apache.tomcat.util.http.fileupload.RequestContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<script>
	function qnaDelFn() {
		document.delFrm.submit();
	}
</script>
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
							<span>QnA</span>
						</div>
					</div>
				</div>
		</div>
	</div>
</section>
	<section class="board-box spad">
		<div class="container">
			<h4>QnA 글 보기</h4>
			<table class="table" style="margin-top:40px; margin-bottom:50px; font-size:11pt;">
				<tr>
					<td style="width:12%">제목</td>
					<td colspan="2">${qnaVO.qTitle}</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td colspan="2">${qnaVO.uName}</td>
				</tr>
				<c:if test="${qnaVo.qType eq 'P'}">
				<tr style="height:120px;">
					<td style="vertical-align:middle;">문의 상품</td>
					<td style="vertical-align:middle; text-align:center; width:20%">(사진)</td>
					<td>${qnaVO.pNo}</td>
				</tr>
				</c:if>
				<tr style="font-color:gray; font-size:10pt;">
					<td colspan="2">작성일  ${qnaVO.qDate}</td>
				</tr>
				<tr>
					<td colspan="3" style="white-space:pre-line;">${qnaVO.qContents}</td>
				</tr>
				<tr>
					<td colspan="3"><button type="button" class="btn btn-secondary" style="margin-right:15px;" onclick="location.href='qna.do'">목록으로</button>
						<button type="button" class="btn btn-outline-danger" onclick="qnaDelFn();">삭제하기</button>
						<form name="delFrm" method="post" action="noticeDelete.do">
							<input type="hidden" name="qNo" value="">
						</form>
					</td>
				</tr>
			</table>
			<table class="table table-striped" style="margin-top:50px;">
				<c:forEach var="nearQna" items="${nearQnaList}">
				<c:if test="${nearQna.qNo > qnaVO.qNo}">
					<tr>
						<th scope="row" style="width:12%">▲다음글</th>
						<td><a href="qnaView.do?qNo=${nearQna.qNo}">${nearQna.qTitle}</a></td>
					</tr>
				</c:if>
				<c:if test="${nearQna.qNo < qnaVO.qNo}">
					<tr>
						<th scope="row">▼이전글</th>
						<td><a href="qnaView.do?qNo=${nearQna.qNo}">${nearQna.qTitle}</a></td>
					</tr>
				</c:if>
				</c:forEach>
			</table>
		</div>
	</section>
<%@ include file="../include/footer.jsp" %>