<%@page import="org.apache.tomcat.util.http.fileupload.RequestContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>

<script src="<%=request.getContextPath() %>/resources/js/qna.js"></script>
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
					<td colspan="2">
					<c:if test="${qnaVO.qlevel > 0}">
						Re:
					</c:if>
					${qnaVO.qTitle}
					<c:if test="${qnaVO.secretYN eq 'Y'}">
						<img style="display: inline-block;vertical-align:baseline" alt="비밀글" src="<%= request.getContextPath() %>/resources/img/board/lock_FILL1_wght400_GRAD0_opsz20.png">
					</c:if>
					</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td colspan="2">
						<c:if test="${qna.uStatus eq 'A'}">	
						관리자
						</c:if>
						<c:if test="${qna.uStatus ne 'A'}">	
						${qna.uName}
						</c:if>
					</td>
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
				<c:if test="${qnaVO.qlevel > 0}">	
				<tr>
					<td style="width:12%">제목</td>
					<td>
						<c:if test="${qna.qlevel > 0}">
							&nbsp;&nbsp;⮡ &nbsp;Re:
						</c:if>
						${originQnaVO.qTitle}
						<c:if test="${originQnaVO.secretYN eq 'Y'}">
							<img style="display: inline-block;vertical-align:baseline" alt="비밀글" src="<%= request.getContextPath() %>/resources/img/board/lock_FILL1_wght400_GRAD0_opsz20.png">
						</c:if></td>
				</tr>	
				<tr>
					<td colspan="3" style="white-space:pre-line; height:200px;">${originQnaVO.qContents}</td>
				</tr>	
				<tr>	
					<td colspan="2">[답변]</td>
				</tr>
				</c:if>
				<tr style="">
					<td colspan="3" style="white-space:pre-line; height:200px;">${qnaVO.qContents}</td>
				</tr>
				<tr>
					<td colspan="3">
						<button type="button" class="btn btn-secondary" style="margin-right:15px;" onclick="location.href='qna.do'">목록으로</button>	
						<button type="button" class="btn btn-secondary" style="margin-right:15px;" onclick="location.href='qnaAnswer.do?qNo=${qnaVO.qNo}'">답변하기</button>
						<button type="button" class="btn btn-outline-danger" onclick="qnaDelFn();">삭제하기</button>
						<form name="delFrm" method="post" action="qnaDelete.do">
							<input type="hidden" name="qNo" value="${qnaVO.qNo}">
							<input type="hidden" name="loginUno" value="${login.uNo}">
						</form>
					</td>
				</tr>
			</table>
			
			<table class="table table-striped" style="margin-top:50px;table-layout:fixed;">
			<c:forEach var="nearQna" items="${nearQnaList}">
			<c:if test="${nearQna.qNo > qnaVO.qNo}">
				<tr>
					<th scope="row" style="width:12%">▲다음글</th>
					<td>
						<span class="boardElipsis" style="display: inline-block; max-width:470px;">
							<a href="qnaView.do?qNo=${nearQna.qNo}">
							<c:if test="${nearQna.qlevel > 0}">
								&nbsp;&nbsp;⮡ &nbsp;
							</c:if>
							${nearQna.qTitle}
							</a>
						</span>	
						<c:if test="${nearQna.secretYN eq 'Y'}">
							<img style="display: inline-block;vertical-align:baseline" alt="비밀글" src="<%= request.getContextPath() %>/resources/img/board/lock_FILL1_wght400_GRAD0_opsz20.png">
						</c:if>
					</td>
				</tr>
			</c:if>
			<c:if test="${nearQna.qNo < qnaVO.qNo}">
				<tr>
					<th scope="row" style="width:12%">▼이전글</th>
					<td>
						<span class="boardElipsis" style="display: inline-block; max-width:470px;">
							<a href="qnaView.do?qNo=${nearQna.qNo}">
								<c:if test="${nearQna.qlevel > 0}">
									&nbsp;&nbsp;⮡ &nbsp;
								</c:if>
								${nearQna.qTitle}
							</a>
						</span>
						<c:if test="${nearQna.secretYN eq 'Y'}">
							<img style="display: inline-block;vertical-align:baseline" alt="비밀글" src="<%= request.getContextPath() %>/resources/img/board/lock_FILL1_wght400_GRAD0_opsz20.png">
						</c:if>
					</td>
				</tr>
			</c:if>
			</c:forEach>
			</table>
			
		</div>
	</section>
<%@ include file="../include/footer.jsp" %>