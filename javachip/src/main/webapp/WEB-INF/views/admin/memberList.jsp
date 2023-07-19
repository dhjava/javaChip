<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
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

.admin td:not(.ctd) {
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
/* 관리자 멤버관리 section */
.section.member.admin {
	width: 750px;
	float: left;
	padding: 30px 0px 30px;
	justify-content:space-around;
}

.section.member.admin > table {
	width:100%;
}

.section.member.admin th {
	text-align: center;
	background-color: #d2d2d2;
}

.ctd {
	text-align: center
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
        <!-- Hero Section Begin -->
    <section class="hero hero-normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>상품목록</span>
                        </div>
                        <ul>
                            <li><a href="#">원두</a></li>
                            <li><a href="#">생두</a></li>
                            <li><a href="#">드립백</a></li>
                            <li><a href="#">캡슐</a></li>
                            <li><a href="#">도매</a></li>
                            <li><a href="#">커피용품</a></li>
                            <li><a href="#">정기배송</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="#">
                                <div class="hero__search__categories">
                                    모든 항목
                                    <span class="arrow_carrot-down"></span>
                                </div>
                                <input type="text" placeholder="무엇이 필요하신가요?">
                                <button type="submit" class="site-btn">검색</button>
                            </form>
                        </div>
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>063) 123 - 4567</h5>
                                <span>운영시간 09:00 ~ 18:00</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->
    
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>회원관리</h2>
						<div class="breadcrumb__option">
							<a href="./index.jsp">Home</a>
							<a href="./index.jsp">관리자 페이지</a>
							<span>회원관리</span>
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
			</div>	
			<div class="blog__sidebar__item">	
				<h4>게시글관리</h4>
			</div>	
	
		</div>
		<div class="main admin">
			
			<div class="section member admin">
				회원 리스트<br>
				
				<table border="1">
					<tr>
						<th><input type="checkbox"></th><th>번호</th><th>유형</th><th>회원 아이디</th><th>등급</th><th>누적 경고</th><th>상태</th><th>상세</th>
					</tr>
					<tr>
						<td class="ctd"><input type="checkbox" ></td><td>1</td><td class="ctd">일반</td><td>hong12</td><td>5</td><td>0</td><td>활동</td><td class="ctd"><input type="button" value="상세" onclick="openMemberDetail()"></td>
					</tr>
					<tr>
						<td class="ctd"><input type="checkbox" ></td><td>2</td><td class="ctd">일반</td><td>gill12</td><td>5</td><td>0</td><td>활동</td><td class="ctd"><input type="button" value="상세" onclick="openMemberDetail()"></td>
					</tr>
					<tr>
						<td class="ctd"><input type="checkbox" ></td><td>3</td><td class="ctd">일반</td><td>dong12</td><td>5</td><td>0</td><td>활동</td><td class="ctd"><input type="button" value="상세" onclick="openMemberDetail()"></td>
					</tr>
					<tr>
						<td class="ctd"><input type="checkbox" ></td><td>4</td><td class="ctd">일반</td><td>hong22</td><td>5</td><td>0</td><td>활동</td><td class="ctd"><input type="button" value="상세" onclick="openMemberDetail()"></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	</section>
	<!-- Section End -->
<%@ include file="../include/footer.jsp" %>