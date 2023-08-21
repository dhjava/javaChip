<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>

<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/qna.css" type="text/css"/>

<script src="<%=request.getContextPath() %>/resources/js/qna.js"></script>
<script>
function qnaWriteFn() {

	var formData = $("#submitFrm").serialize();
	var qContents =  $("#qContents").html();
	
	$.ajax({
		url:"qnaWrite.do",
		type:"post",
		data:formData+"&qContents=" + qContents,
		dataType:"json",
		success:function(data) {
			alert(data.result);
			location.replace(data.path);
		},
		error:function() {
			
			alert('게시글 등록에 실패하였습니다.');
			var url = "qna.do";
			location.replace(url);
		}
	});
	
}
	

</script>
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
				<div class="d-flex flex-column bd-highlight mb-3">
				<form id="submitFrm" method="post">
						<div class="p-2 bd-highlight">
							<h4><b>Qna 글쓰기</b></h4>
						</div>
						<div class="p-2 bd-highlight">
							<p>구분<p>
							<select name="qType" id="qType" class="board-type" onchange="selectQTypeFn();">
								<option value="N"
								<c:if test="${ qType eq 'N'}"> selected</c:if>
								>일반 Q&amp;A</option>
								
								<option value="P"
								<c:if test="${ qType eq 'P'}"> selected</c:if>
								>상품 Q&amp;A
								
								</option>
							</select>
						</div>
						<div class="p-2 bd-highlight" id="addQnaSelect">
						</div>
						<div class="p-2 bd-highlight" id="pInfo">
						</div>
					<div class="p-2 bd-highlight">
						<p>제목<p>
						<input type="text" name="qTitle" id="qTitle" class="form-control" aria-label="subject" placeholder="제목을 입력하세요.">
					</div>
					<div class="p-2 bd-highlight" style="text-align:right">
						<p>비밀글  <input type="checkbox" name="secretCheck" id="secretCheck" value="Y"/> </p>
					</div>
					<div class="p-2 bd-highlight">
						<div class="form-control textbox" id="qContents" contentEditable="true">
						</div>
					</div>
				</form>
					<div class="p-2 bd-highlight">
						<div class="input-group mb-1">
								<div class="custom-file">
								<form action="fileupload.do" method="post" enctype="multipart/form-data">
									<input type="file" class="custom-file-input" id="inputGroupFile02">
									<label class="custom-file-label" for="inputGroupFile02" aria-describedby="inputGroupFileAddon02">Choose file</label>
								</form>
								</div>
						</div>
					</div>
					<div class="p-2 bd-highlight" align="center">
						<button type="button" class="btn btn-outline-secondary" style="margin-right:20px;" onclick="helpResetFn">취소하기</button>
						<button type="button" class="btn btn-dark" onclick="qnaSubmitFn();">작성하기</button>
					</div>
				</div>	
			</div>
		</div>
		<div id="pSelectContainer" class="modalHidden">
			<div class="pSelectBox">
				<div class="p-2 bd-highlight">
					<h4><b>상품 목록</b></h4>
				</div>
				<div class="pSelectContent">
					<div class="board-search" style="width:70%; float: left">
						<form id="searchFrm" class="d-flex justify-content-center">
			 				<div class="input-group">
								<select>
									<option value="title">카테고리</option>
									<option value="bean">원두</option>
									<option value="gift-set">상품</option>
								</select>
								<input type="text" class="form-control" placeholder="내용을 입력하세요" aria-label="Recipient's username" aria-describedby="button-addon2">
								<div class="input-group-append">
									<button type="submit" class="btn btn-secondary mb-4">검색하기</button>
								</div>
							</div>
						</form>
					</div>
					<div class="p-2 bd-highlight ">
					<table class="table table-hover pSelectTable">
						<tr>
							<th>번호</th>
							<th colspan="2" align="center">상품</th>
							<th>선택</th>
						</tr>
						<tr>
							<td style="width : 15%">1</td>
							<td style="width : 15%"><div class="img pInfo">상품 이미지</div></td>
							<td style="width : 40%; text-align: left">커피 1</td>
							<td style="width : 20%"><input name="pNoRadio" type="radio" value="1"></td>
						</tr>
						<tr>
							<td style="width : 10%">2</td>
							<td style="width : 15%"><div class="img pInfo">상품 이미지</div></td>
							<td style="width : 45%; text-align: left">커피 2</td>
							<td style="width : 20%"><input name="pNoRadio" type="radio" value="2"></td>
						</tr>
						<tr>
							<td style="width : 10%">3</td>
							<td style="width : 15%"><div class="img pInfo">상품 이미지</div></td>
							<td style="width : 45%; text-align: left">커피 3</td>
							<td style="width : 20%"><input name="pNoRadio" type="radio" value="3"></td>
						</tr>
						<tr>
							<td style="width : 10%">4</td>
							<td style="width : 15%"><div class="img pInfo">상품 이미지</div></td>
							<td style="width : 45%; text-align: left">커피 4</td>
							<td style="width : 20%"><input name="pNoRadio" type="radio" value="4"></td>
						</tr>
						<tr>
							<td style="width : 10%">5</td>
							<td style="width : 15%"><div class="img pInfo">상품 이미지</div></td>
							<td style="width : 45%; text-align: left">커피 5</td>
							<td style="width : 20%"><input name="pNoRadio" type="radio" value="5"></td>
						</tr>
					</table>
					</div>
				</div>
				<div style="text-align:center;">
					◀ 1 2 3 4 5 6 7 8 9 10 ▶
				</div><br>
				<div class="p-2 bd-highlight" align="center">
					<button class="btn btn-dark" type="button" style="margin-right:20px;" onclick="sendPnoFn();">등록</button>
					<button class="btn btn-outline-secondary" type="button" onclick="closeSelectBoxFn();">취소</button>
				</div>
			</div>
		</div>
	</section>
<%@ include file="../include/footer.jsp" %>