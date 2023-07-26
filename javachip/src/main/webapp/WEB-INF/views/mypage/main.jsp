<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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