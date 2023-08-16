<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>

<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/qna.css" type="text/css"/>

<script src="<%=request.getContextPath() %>/resources/js/qna.js"></script>

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>글 쓰기</h2>
						<div class="breadcrumb__option">
							<a href="<%= request.getContextPath() %>/">Home</a>
							<a href="#">고객센터</a>
							<span>QnA 글 쓰기</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="board-box spad">
		<div class="container">
			<div class="write-form">
				<form id="submitFrm" action="qnaAnswer.do" method="post">
					<div class="d-flex flex-column bd-highlight mb-3">
						<div class="p-2 bd-highlight">
							<h4>Qna 답변</h4>
						</div>
						<div class="p-2 bd-highlight">
							<p>제목<p>
							<input type="text" name="qTitle" id="qTitle" class="form-control" aria-label="subject" placeholder="제목을 입력하세요." value="Re: ${prevQnaVO.qTitle}">
						</div>
						<table class="table" style="margin-top:40px; margin-bottom:50px; font-size:11pt; text-align:left">
							<tr>
								<td style="width:12%">제목</td>
								<td colspan="2">
									${prevQnaVO.qTitle}
									<input type="hidden" name="qlevel" id="qlevel" value="${prevQnaVO.qlevel}">
									<input type="hidden" name="originqno" id="originqno" value="${prevQnaVO.originqno}">
									<input type="hidden" name="qType" id="qType" value="${prevQnaVO.qType}">
									<input type="hidden" name="secretCheck" id="secretCheck" value="${prevQnaVO.secretYN}">
								</td>
							</tr>
							<tr>
								<td>작성자</td>
								<td colspan="2">${prevQnaVO.uName}</td>
							</tr>
						<c:if test="${prevQnaVO.qType eq 'P'}">
							<tr style="height:120px;">
								<td style="vertical-align:middle;">문의 상품</td>
								<td style="vertical-align:middle; text-align:center; width:20%">(사진)</td>
								<td>${prevQnaVO.pNo}</td>
							</tr>
						</c:if>
							<tr style="font-color:gray; font-size:10pt;">
								<td colspan="2">작성일  ${prevQnaVO.qDate}</td>
							</tr>
							<tr>
								<td colspan="3" style="white-space:pre-line;">${prevQnaVO.qContents}</td>
							</tr>
						</table>
					</div>
					<div class="p-2 bd-highlight" style="text-align:right">
						<p>비밀글  <input type="checkbox" value="${prevQnaVO.secretYN}" <c:if test="${prevQnaVO.secretYN eq 'Y'}">checked</c:if> disabled /></p>
					</div>
					<div class="p-2 bd-highlight">
						<textarea class="form-control" name="qContents" id="qContents" rows="10"></textarea>
					</div>
					<div class="p-2 bd-highlight">
						<div class="input-group mb-1">
							<div class="custom-file">
								<input type="file" class="custom-file-input" id="inputGroupFile02">
								<label class="custom-file-label" for="inputGroupFile02" aria-describedby="inputGroupFileAddon02">Choose file</label>
							</div>
						</div>
					</div>
					<div class="p-2 bd-highlight" align="center">
						<button type="button" class="btn btn-outline-secondary" style="margin-right:20px;" onclick="helpResetFn">취소하기</button>
						<button type="button" class="btn btn-dark" onclick="qnaSubmitFn();">작성하기</button>
					</div>
				</form>
			</div>
		</div>
	</section>
<%@ include file="../include/footer.jsp" %>