<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="<%=request.getContextPath() %>/resources/js/notice.js"></script>

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>공지사항 </h2>
						<div class="breadcrumb__option">
							<a href="<%= request.getContextPath() %>/">Home</a>
							<a href="#">고객센터</a>
							<span>공지사항</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="board-box spad">
		<div class="container">
			<div class="write-form">
				<form action="noticeModify.do" method="post">
					<div class="d-flex flex-column bd-highlight mb-3">
						<div class="p-2 bd-highlight">
							<h4><b> 글 수정</b></h4>
						</div>
						<div class="p-2 bd-highlight">
							<p>제목<p>
							<input type="hidden" name="nNo" id="nNo" value="${noticeVO.nNo}">
							<input type="hidden" name="uNo" id="uNo" value="${noticeVO.uNo}">
							<input type="text" name="nTitle" id="nTitle" class="form-control" aria-label="subject" placeholder="제목을 입력하세요." value="${noticeVO.nTitle}">
						</div>
						<div class="p-2 bd-highlight">
							<textarea class="form-control" name="nContents" id="nContents" rows="10">${noticeVO.nContents}</textarea>
						</div>
							<div class="p-2 bd-highlight" align="center">
								<button type="reset" class="btn btn-outline-secondary" style="margin-right:20px;" onclick="helpModifyResetFn()">취소하기</button>
								<button type="button" class="btn btn-dark" onclick="helpSubmitFn()">작성하기</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
<%@ include file="../include/footer.jsp" %>