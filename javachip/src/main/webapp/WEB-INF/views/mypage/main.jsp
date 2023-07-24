<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>JavaChip | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/table.css" type="text/css">
    <link rel="stylesheet" href="css/bootstrap.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">

<style>
@font-face {
	font-family: 'Material Icons';
	font-style: normal;
	font-weight: 400;
	src: url(path/to/MaterialIcons-Regular.eot); /* For IE6-8 */
	src: local('Material Icons'),
		local('MaterialIcons-Regular'),
		url(path/to/MaterialIcons-Regular.woff2) format('woff2'),
		url(path/to/MaterialIcons-Regular.woff) format('woff'),
		url(path/to/MaterialIcons-Regular.ttf) format('truetype');
}

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
/* 마이페이지 전체크기 */
.frame.mypage {
	overflow : hidden;
	margin: 0 auto;
	width: 1000px;
}
/* 마이페이지 메인 */
.main.mypage{
	width: 750px;
	float: left;
	padding: 0px 0px 60px;
	
	border: 1px solid #dcdcdc;
}
/* 마이페이지 프로필 */
.profile.mypage {
	width: 750px;
	padding: 30px 30px 30px;
/* 	background-color: rgba( 0, 0, 0, 0.2 ); */
	border-bottom: 1px solid #dcdcdc;
}
/* 프로필 내용 */
div.profile.mypage {
	display: flex;
	justify-content: space-between;
	align-items : center;
	
}
.mypage td {
	text-align: right; 
}

/* 마이페이지 사이드 */
.side.mypage {
	float: left;
	width: 250px;
	
	padding: 10px;
	color: #000000;
}
/* 마이페이지 주요기능버튼 세트 */
.btn.inform.mypage {
	width: 750px;
	float: left;
	display: flex;
	padding: 30px 0px 30px;
	justify-content:space-around;
}
/* 마이페이지 주요기능버튼 각각 */
.btn.inform.mypage > div{
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

/* 마이페이지 개인정보 수정 버튼 */
.btn.mModify.mypage {
	width: 150px;
	height: 40px;
	
	font-weight: bold;
	border-radius: 20px;
	border: 2px solid #7fad39;
	background-color: transparent;
}
/* 마이페이지 개인정보 간략 */
.minInfo.mypage {
	background-color: #ffffff;
	padding: 10px;
	border-left: 1px solid #dcdcdc;
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
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- jc Begin -->
    <div class="jc__menu__overlay"></div>
    <div class="jc__menu__wrapper">
        <div class="jc__menu__logo">
            <a href="#"><img src="<%= request.getContextPath() %>/resources/img/logo.png" alt=""></a>
        </div>
        <div class="jc__menu__cart">
            <ul>
                <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
            </ul>
            <div class="header__cart__price">item: <span>$150.00</span></div>
        </div>
        <div class="jc__menu__widget">
            <div class="header__top__right__language">
                <img src="<%= request.getContextPath() %>/resources/img/language.png" alt="">
                <div>English</div>
                <span class="arrow_carrot-down"></span>
                <ul>
                    <li><a href="#">Spanis</a></li>
                    <li><a href="#">English</a></li>
                </ul>
            </div>
            <div class="header__top__right__auth">
                <a href="#"><i class="fa fa-user"></i> Login</a>
            </div>
        </div>
        <!-- 모바일 메뉴 -->
        <nav class="jc__menu__nav mobile-menu">
            <ul>
                <li class="active"><a href="<%= request.getContextPath() %>/">Home</a></li>
                <li><a href="<%= request.getContextPath() %>/shop/grid.do">Shop</a></li>
                <li><a href="#">Pages</a>
                    <ul class="header__menu__dropdown">
                        <li><a href="<%= request.getContextPath() %>/shop/details.do">Shop Details</a></li>
                        <li><a href="cart.do">Shoping Cart</a></li>
                        <li><a href="<%= request.getContextPath() %>/shop/checkout.do">Check Out</a></li>
                        <li><a href="#">Blog Details</a></li>
                    </ul>
                </li>
                <li><a href="#">Blog</a></li>
                <li><a href="<%= request.getContextPath() %>/info/contact.do">Contact</a></li>
            </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="header__top__right__social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
            <a href="#"><i class="fa fa-pinterest-p"></i></a>
        </div>
        <!-- 모바일 메뉴 end -->
        <div class="jc__menu__contact">
            <ul>
                <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                <li>Free Shipping for all Order of $99</li>
            </ul>
        </div>
    </div>
    <!-- jc End -->
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>마이페이지</h2>
						<div class="breadcrumb__option">
							<a href="<%= request.getContextPath() %>/">Home</a>
							<span>마이페이지</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

<section class="spad mypage">
<div class="frame mypage">
	<div class="side mypage">
		<div class="blog__sidebar__item">
			<h4>쇼핑정보</h4>
			<ul>
			<li>주문목록/배송조회</li>
			<li>취소/반품/교환 내역</li>
			<li>찜 리스트</li>
			</ul>
		</div>
		<div class="blog__sidebar__item">
			<h4>혜택관리</h4>
			<ul>
			<li>포인트</li>
			</ul>
		</div>	
		<div class="blog__sidebar__item">		
			<h4>회원정보</h4>
			<ul>
			<li>회원정보 수정</li>
			<li>회원 탈퇴</li>
			<li>배송지 관리</li>
			</ul>
		</div>
		<div class="blog__sidebar__item">	
			<h4>나의 게시글</h4>
			<ul>
			<li>상품문의</li>
			<li>상품후기</li>
			</ul>
		</div>	

	</div>
	<div class="main mypage">
		<div class="profile mypage">
			<div class="uName mypage">
				홍길동 님
			</div>
			<div>
				<input class="btn mModify mypage" type="button" onclick="location.href='myinfo.do'" value="회원정보 수정">
			</div>
			<div>
				<table style="width:200px">
					<tr>
						<th>
							포인트
						</th>
						<td>
							0 P
						</td>
					</tr>
					<tr>
						<th>
							찜 리스트
						</th>
						<td>
							1 건
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="btn inform mypage">
			<div>
				주문/배송<br>
				<div class= "iCircle">
					<i class="material-icons">&#xf1cc;</i>
				</div>
			</div>
			<div>
				정기배송
				<div class= "iCircle">
					<i class="material-icons">&#xe558;</i>
				</div>
			</div>
			<div>
				나의 게시글
				<div class= "iCircle">
					<i class="material-icons">&#xf1c3;</i>
				</div>
			</div>
		</div>
	</div>
</div>
</section>
<%@ include file="../include/footer.jsp" %>