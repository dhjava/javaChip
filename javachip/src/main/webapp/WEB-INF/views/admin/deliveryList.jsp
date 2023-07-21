<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/admin.css" type="text/css"/>
<!-- 메인 작성 영역 -->
<script>
function openMemberDetail() {
	window.open(
		"admin-memberDetail.jsp",
		"회원관리",
		"width=500, height=300, top=50, left=50, scrollbars=yes"
	);
}
</script>
</head>
<body>
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>회원관리</h2>
						<div class="breadcrumb__option">
							<a href="./index.do">Home</a>
							<a href="./index.do">관리자 페이지</a>
							<span>게시글 관리</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->
	<!-- section -->
	<section class="spad admin">
	<div class="frame admin">
		<div class="side admin">
			<div class="blog__sidebar__item">
				<h4>상품관리</h4>
				<ul>
				<li>상품 목록 조회</li>
				</ul>
			</div>
			<div class="blog__sidebar__item">
				<h4>회원관리</h4>
				<ul>
				<li>회원조회</li>
				<li>적립금 관리</li>
				</ul>
			</div>	
			<div class="blog__sidebar__item">	
				<h4>주문관리</h4>
				<ul>
				<li>주문 목록 조회</li>
				</ul>
			</div>	
			<div class="blog__sidebar__item">	
				<h4>게시글관리</h4>
				<ul>
				<li>공지사항 관리</li>
				<li>QnA 목록 조회</li>
				</ul>
			</div>	
		</div>
		<div class="main admin">
				<h4><b>상품 목록 조회</b></h4><br>
				<div>
					<select>
						<option>전체</option>
						<option>배송대기</option>
						<option>배송완료</option>
					</select>
				</div>
				<div class="search admin">
					<select>
						<option>구매자 아이디</option>
						<option>상품평</option>
					</select>
					<input type="text"><input type="button" value="검색">
				</div>
				<table border="1" class="tableAdmin qna admin">
					<tr>
						<th><input type="checkbox"></th><th>번호</th><th>상품명</th><th>구매자 아이디</th><th>총 가격</th><th>총 구매수</th><th>주문날짜</th><th>상태</th>
					</tr>
					<tr>
						<td><input type="checkbox"></td><td>1</td><td>커피1</td><td>hong12</td><td>000원</td><td>2</td><td>2023-07-21</td><td>배송완료</td>
					</tr>
					<tr>
						<td><input type="checkbox"></td><td>2</td><td>커피1</td><td>hong12</td><td>000원</td><td>2</td><td>2023-07-21</td><td>배송완료</td>
					</tr>
					<tr>
						<td><input type="checkbox"></td><td>3</td><td>커피1</td><td>hong12</td><td>000원</td><td>2</td><td>2023-07-21</td><td>배송완료</td>
					</tr>
					<tr>
						<td><input type="checkbox"></td><td>4</td><td>커피1</td><td>hong12</td><td>000원</td><td>2</td><td>2023-07-21</td><td>배송완료</td>
					</tr>
				</table>
				<div class="admin_pagination">◀ 1 2 3 4 5 6 7 8 9 10 ▶</div>
				<input type="button" value="선택 삭제">
		</div>
	</div>
	</section>
	<!-- Section End -->
<%@ include file="../include/footer.jsp" %>