<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>

<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/qna.css" type="text/css"/>

<script src="<%=request.getContextPath() %>/resources/js/qna.js"></script>
<script>
function qnaWriteFn() {

	var formData = $("#submitFrm").serialize();
	var qContents = $("#qContents").html();
	
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

function productFindFn() {
	var formData = $("#searchFrm").serialize();
	
	$.ajax({
		url:"productSearch.do",
		type:"get",
		data:formData,
		success:function(data) {
		var htmlStr = ""
		var list = data.list;
		var pm = data.pm;
			
		if(list != '') {
			for(let i=0; i < list.length ;i++) {
				htmlStr += "<tr>";
				htmlStr += "<td style='width : 15%'>" + (i + 1) + "</td>";
				htmlStr += "<td style='width : 15%'><div class='img pInfo'>상품 이미지</div></td>";
				htmlStr += "<td style='width : 20%; text-align: left'>" + list[i].pName + "</td>";
				htmlStr += "<td style='width : 25%;'>" + list[i].pType + "</td>";
				htmlStr += "<td style='width : 15%'><input name='pNoRadio' type='radio' value='" + list[i].pNo + "'></td>";
				htmlStr += "</tr>";
			}
		}else{
			htmlStr = "상품 정보가 없습니다.";
			
		}
			
			$("#pTable").html(htmlStr);
			
		
		},
		error:function() {
			
		alert("실패");
		}
		
	});
}

function qnaUploadFn() {
	var formData = $("#inputGroupFile02");
	
	if(formData.files.length == 0) {
		return;
	}
	
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
						<div class="input-group">
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
					
						<div class="input-group mb-1">
								<div class="custom-file">
								<form id="fileSubmitFrm" method="post" enctype="multipart/form-data">
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
								<select name="searchType">
									<option value="all">전체</option>
									<option value="name">상품명</option>
									<option value="type">종류</option>
								</select>
								<input type="text" name="SearchValue" class="form-control" placeholder="내용을 입력하세요" aria-label="Recipient's username" aria-describedby="button-addon2">
								<div class="input-group-append">
									<button type="button" class="btn btn-secondary mb-4" onclick="productFindFn()">검색하기</button>
								</div>
							</div>
						</form>
					</div>
					<div class="p-2 bd-highlight ">
					<table class="table table-hover pSelectTable">
						<thead>
							<tr>
								<th>번호</th>
								<th colspan="2" align="center">상품</th>
								<th align="center">종류</th>
								<th>선택</th>
							</tr>
						</thead>
						<tbody id="pTable">
						</tbody>
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