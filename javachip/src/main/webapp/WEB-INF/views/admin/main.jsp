<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<!-- 메인 작성 영역 -->
<style>
.material-icons {
	font-family: 'Material Icons';
	font-weight: normal;
	font-style: normal;
	font-size: 35px;  /* Preferred icon size */
	display: inline-block;
	line-height: 1;
	text-transform: none;
	letter-spacing: normal;
	word-wrap: normal;
	white-space: nowrap;
	direction: ltr;
	
	/* Support for all WebKit browsers. */
	-webkit-font-smoothing: antialiased;
	
	/* Support for Safari and Chrome. */
	text-rendering: optimizeLegibility;
	
	/* Support for Firefox. */
	-moz-osx-font-smoothing: grayscale;
	
	/* Support for IE. */
font-feature-settings: 'liga';
}
</style>
<style>
div {
	display: block;
}
/* 관리자 전체크기 */
.frame.admin {
	overflow : hidden;
	margin: 0 auto;
	width: 1000px;
}
/* 관리자 메인 */
.main.admin{
	width: 750px;
	float: left;
	padding: 0px 0px 60px;
	
	border: 1px solid #dcdcdc;
}
/* 관리자 프로필 */
.profile.admin {
	width: 750px;
	padding: 30px 30px 30px;
	
	background-color: rgba( 0, 0, 0, 0.7 );
	color: #ffffff;	
	border: 1px solid #dcdcdc;
}
/* 프로필 내용 */
div.profile.admin {
	display: flex;
	justify-content: space-between;
	align-items : center;
	
}
.admin td {
	text-align: right; 
}
.uName.admin {
	font-weight : bold;
	font-size : 20px;
}

/* 관리자 사이드 */
.side.admin {
	float: left;
	width: 250px;
	
	padding: 10px;
	color: #000000;
}
/* 관리자 주요기능버튼 세트 */
.btn.inform.admin {
	width: 750px;
	float: left;
	display: flex;
	padding: 30px 0px 30px;
	justify-content:space-around;
}
/* 관리자 주요기능버튼 각각 */
.btn.inform.admin > div{
	display: flex;
	flex-direction:column;
	width: 200px;
	height: 200px;
	padding: 50px 0px 40px;
	
	text-align: center;
	font-size: 20px;
	border: 2px solid #dcdcdc;
	color: #000000;
	font-weight: bold;
	border-radius: 10px;
	/* div 안 중앙 정렬 */
	display : flex;
	
	justify-content: space-between;
	
	align-items : center;
	
	
}

/* 관리자 개인정보 수정 버튼 */
.btn.mModify.admin {
	width: 150px;
	height: 40px;
	
	font-weight: bold;
	border-radius: 20px;
	border: 2px solid #7fad39;
	background-color: transparent;
	color: #ffffff;
}

.iCircle {
	width : 60px;
	height : 60px;
	border-radius: 50%;
	background-color: tomato;
	
	/* div 안 중앙 정렬 */
	display : flex;
	justify-content : center;
	align-items : center;
	
}
</style>
</head>
<body>
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>관리자</h2>
						<div class="breadcrumb__option">
							<a href="/index.do">Home</a>
							<span>관리자</span>
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
			<div class="profile admin">
				<div class="uName admin">
					[관리자] 홍길동 님
				</div>
				<div>
					<input class="btn mModify admin" type="button" onclick="location.href='#'" value="회원정보 수정">
				</div>
			</div>
				<h4><b>상품관리</b></h4><br>
				<table border="1" class="tableAdmin admin">
					<tr>
						<th>번호</th><th>상품명</th><th>재고수</th><th>상품상태</th>
					</tr>
					<tr>
						<td>1</td><td>커피1</td><td>0</td><td>매진</td>
					</tr>
					<tr>
						<td>2</td><td>커피1</td><td>0</td><td>매진</td>
					</tr>
					<tr>
						<td>3</td><td>커피1</td><td>0</td><td>매진</td>
					</tr>
				</table>
				<h4><b>QnA 답변대기</b></h4><br>
				<table border="1" class="tableAdmin admin">
					<tr>
						<th>번호</th><th>제목</th><th>아이디</th><th>작성일</th>
					</tr>
					<tr>
						<td>1</td><td><a href="#">커피1 질문입니다.</a></td><td>hong12</td><td>2023-07-11</td>
					</tr>
				</table>
				<h4><b>공지사항</b></h4><br>
				<table border="1" class="tableAdmin admin">
					<tr>
						<th><input type="checkbox"></th><th>번호</th><th>제목</th><th>작성일</th>
					</tr>
					<tr>
						<td><input type="checkbox"></td><td>1</td><td><a href="#">공지사항입니다.</a></td><td>2023-07-11</td>
					</tr>
					<tr>
						<td><input type="checkbox"></td><td>1</td><td><a href="#">공지사항입니다.</a></td><td>2023-07-11</td>
					</tr>
					<tr>
						<td><input type="checkbox"></td><td>1</td><td><a href="#">공지사항입니다.</a></td><td>2023-07-11</td>
					</tr>
					<tr>
				</table>
		</div>
	</div>
	</section>
	<!-- Section End -->
<%@ include file="../include/footer.jsp" %>