<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<script>
/* help */

// help notice write submit

var checkTitleFlag = false;
var checkContentsFlag = false;
var submitFlag = false;

// help write submit
function helpSubmitFn() {
	
	// Notice 제목이 입력되지 않았을 때
	if($("#nTitle").val() == "") {
			checkTitleFlag = false;
			alert("제목을 입력해주세요.");
			$("#nTitle").focus();
			
			return;
		}else
	// Notice 내용이 입력되지 않았을 때
	if($("#nContents").val() == "") {
			checkContentsFlag = false;
			alert("내용을 입력해주세요.");
			$("#nContents").focus();
			
			return;
		}else
	// Notice 제목과 내용이 있을경우
	{
		checkTitleFlag = true;
		checkContentsFlag = true;
	}
	
	// Flag확인하고 submit
	if(checkTitleFlag && checkContentsFlag){
		submitFlag = true;
	}
	
	if(submitFlag) {
//		$("form").submit();
		alert("제출");
	}
}
</script>
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>공지사항 글 쓰기</h2>
						<div class="breadcrumb__option">
							<a href="<%= request.getContextPath() %>/">Home</a>
							<a href="#">고객센터</a>
							<span>공지사항 글 쓰기</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="board-box spad">
		<div class="container">
			<div class="write-form">
				<form action="write.do" method="post">
					<div class="d-flex flex-column bd-highlight mb-3">
						<div class="p-2 bd-highlight">
							<h4><b>공지사항 글쓰기</b></h4>
						</div>
						<div class="p-2 bd-highlight">
							<p>제목<p>
							<input type="text" name="nTitle" id="nTitle" class="form-control" aria-label="subject" placeholder="제목을 입력하세요.">
						</div>
						<div class="p-2 bd-highlight">
							<textarea class="form-control" name="nContents" id="nContents" rows="10"></textarea>
						</div>
							<div class="p-2 bd-highlight" align="center">
								<button type="reset" class="btn btn-outline-secondary" style="margin-right:20px;">취소하기</button>
								<button type="button" class="btn btn-dark" onclick="helpSubmitFn()">작성하기</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
<%@ include file="../include/footer.jsp" %>