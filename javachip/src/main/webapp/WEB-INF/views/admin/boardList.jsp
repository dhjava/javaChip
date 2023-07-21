<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!-- 메인 작성 영역 -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/admin.css" type="text/css"/>
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
		</div>
		<div class="main admin">
				<h4><b>공지사항 관리</b></h4><br>
				<div class="search admin">
					<select>
						<option>제목</option>
						<option>아이디</option>
						<option>제목+아이디</option>
					</select>
					<input type="text"><input type="button" value="검색">
				</div>
				<table border="1" class="tableAdmin admin">
					<tr>
						<th><input type="checkbox"></th><th>번호</th><th>제목</th><th>작성일</th>
					</tr>
					<tr>
						<td><input type="checkbox"></td><td>1</td><td><a href="#">공지사항입니다.</a></td><td>2023-07-11</td>
					</tr>
					<tr>
				</table>
				<div class="admin_pagination">◀ 1 2 3 4 5 6 7 8 9 10 ▶</div>
				<input type="button" value="선택 삭제">
		</div>
	</div>
	</section>
	<!-- Section End -->
<%@ include file="../include/footer.jsp" %>