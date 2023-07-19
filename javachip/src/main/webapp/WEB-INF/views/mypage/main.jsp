<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	background-color: rgba( 0, 0, 0, 0.7 );
	color: #ffffff;	
	border: 1px solid #dcdcdc;
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
.uName.mypage {
	font-weight : bold;
	font-size : 20px;
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
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- jc Begin -->
    <div class="jc__menu__overlay"></div>
    <div class="jc__menu__wrapper">
        <div class="jc__menu__logo">
            <a href="#"><img src="img/logo.png" alt=""></a>
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
                <img src="img/language.png" alt="">
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
                <li class="active"><a href="./index.html">Home</a></li>
                <li><a href="./shop-grid.html">Shop</a></li>
                <li><a href="#">Pages</a>
                    <ul class="header__menu__dropdown">
                        <li><a href="./shop-details.jsp">Shop Details</a></li>
                        <li><a href="./mypage-cart.jsp">Shoping Cart</a></li>
                        <li><a href="./checkout.html">Check Out</a></li>
                        <li><a href="./blog-details.html">Blog Details</a></li>
                    </ul>
                </li>
                <li><a href="./blog.html">Blog</a></li>
                <li><a href="./contact.html">Contact</a></li>
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

    <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__left">
                            <ul>
                                <li>5만원 이상 무료 배송</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__right">
                            <div class="header__top__right__social">
                                <a href="./member-login.jsp">로그인</a>
                                <a href="./member-join.jsp">회원가입</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="./index.html"><img src="img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <nav class="header__menu">
                        <ul>
                            <li class="active"><a href="./index.jsp">Home</a></li>
                            <li><a href="./shop-grid.jsp">쇼핑몰</a></li>
                            <li><a href="./mypage-main.jsp">마이페이지</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="./shop-details.jsp">주문내역</a></li>
                                    <li><a href="./mypage-main.jsp">회원정보수정</a></li>
                                    <li><a href="./mypage-main.jsp">적립금</a></li>
                                    <li><a href="./mypage-main.jsp">후기/QNA</a></li>
                                    <li><a href="./mypage-regular.jsp">정기배송</a></li>
                                </ul>
                            </li>
                            <li><a href="./mypage-main.jsp">고객센터</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="./help-notice.jsp">공지사항</a></li>
                                    <li><a href="./help-qna.jsp">Q&A</a></li>
                                    <li><a href="./help-faq.jsp">자주 묻는 질문</a></li>
                                </ul>
                            </li>
                            <li><a href="./mypage-main.jsp">회사 소개</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="./info-intro.jsp">회사 소개</a></li>
                                    <li><a href="./info-part.jsp">판매 분야</a></li>
                                    <li><a href="./info-contact.jsp">찾아오시는 길</a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="header__cart">
                        <ul>
                            <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                            <li><a href="./mypage-cart.jsp"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="jc__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
    <!-- Header Section End -->
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
						<h2>마이페이지</h2>
						<div class="breadcrumb__option">
							<a href="./index.html">Home</a>
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
				<input class="btn mModify mypage" type="button" onclick="location.href='#'" value="회원정보 수정">
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
    <!-- Footer Section Begin -->
    <footer class="footer spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer__about">
                        <div class="footer__about__logo">
                            <a href="./index.html"><img src="img/logo.png" alt=""></a>
                        </div>
                        <ul>
                            <li>주소 : 전북 전주시 덕진구 금암동 123-4</li>
                            <li>전화번호: 063-123-4567</li>
                            <li>Email: hello@colorlib.com</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
                    <div class="footer__widget">
                        <h6>공지사항</h6>
                        <ul>
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">About Our Shop</a></li>
                            <li><a href="#">Secure Shopping</a></li>
                            <li><a href="#">Delivery infomation</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Our Sitemap</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 offset-lg-1">
                    <div class="footer__widget">
                        <h6>계좌번호</h6>
                        <ul>
                            <li style="width:200px;">하나은행 123-456-7891011</li>
                            <li>예금주 : 자바칩</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="footer__copyright">
                        <div class="footer__copyright__text">
                        <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                			<span>상호 : 자바칩프라페 </span>
                			<span>대표자 : 자바칩</span>
                			<span>전화 : 063-123-4567</span>
                			<span>팩스 : 063-987-6543</span>
                			<span>개인정보관리책임자 : <a href="#">자바칩(javachip0703@gmail.com)</a></span><br>
                			<span>사업자등록 : 853-81-00169</span>
                			<span>통신판매업신고 : 2021-전북전주-00289  </span>
                			<span>주소 : 12345 전북 전주시 덕진구 금암동</span><br>
                			<span>Copyright ©  <strong>자바칩프라페</strong>. All rights reserved.</span>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
  						</div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.bundle.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>



</body>

</html>