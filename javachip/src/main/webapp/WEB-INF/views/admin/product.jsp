<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/admin.css" type="text/css"/>
<!-- 메인 작성 영역 -->

</head>
<body>
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>관리자 페이지</h2>
                        <div class="breadcrumb__option">
                            <a href="<%= request.getContextPath() %>/">Home</a>
                            	<span>상품상세관리</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<!-- Breadcrumb Section End -->
	<!-- section -->
	<section class="spad frame admin">
	
		<div class="side admin">
			<div class="blog__sidebar__item">
				<h4>상품관리</h4>
				<ul>
				<li><a href="<%=request.getContextPath() %>/admin/productList.do">상품 목록 조회</a></li>
				</ul>
			</div>
			<div class="blog__sidebar__item">
				<h4>회원관리</h4>
				<ul>
				<li>
					<a href="<%=request.getContextPath() %>/admin/memberList.do">일반회원조회</a><br>
					<a href="<%=request.getContextPath() %>/admin/bizmemberList.do">관리자회원조회</a><br>
					<a href="<%=request.getContextPath() %>/admin/blackList.do">블랙리스트조회</a>
				</li>
				</ul>
			</div>	
			<div class="blog__sidebar__item">	
				<h4>주문관리</h4>
				<ul>
				<li><a href="<%=request.getContextPath() %>/admin/deliveryList.do">주문 목록 조회</a></li>
				</ul>
			</div>	
			<div class="blog__sidebar__item">	
				<h4>게시글관리</h4>
				<ul>
				<li><a href="<%=request.getContextPath() %>/admin/boardList.do">공지사항 관리</a></li>
				<li><a href="<%=request.getContextPath() %>/admin/qnaList.do">QnA 목록 조회</a></li>
				</ul>
			</div>	
		</div>
		<div class="main admin">
				<div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large"
                                src="img/product/details/board-box-1.jpg" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                <form class="product__input">
                    <div class="product__details__text">
                    	상품구분 :<br>
                    	<select class="custom-select" id="pType" name="pType">
						  <option selected>선택해주세요.</option>
						  <option value="원두">원두</option>
						  <option value="생두">생두</option>
						  <option value="드립백">드립백</option>
						  <option value="캡슐">캡슐</option>
						  <option value="도매">도매</option>
						  <option value="커피용품">커피용품</option>
						  <option value="정기배송">정기배송</option>
						</select><br><br><br>
                        상품명 :<br><input class="form-control"  type="text" id="pName" name="pName" placeholder="상품명" ><br>
                        가격 :<br><input class="form-control"  type="text" id="pPrice" name="pPrice" placeholder="개당 가격"><br>
                        상품설명 :<br><textarea class="form-control" rows="4" id="" name="" placeholder="상품설명"></textarea><br>
                        입고수 :<br><input class="form-control"  type="text" id="pInput" name="pInput" placeholder="입고 수량"><br>
                        사진 첨부 :<br>
                        <div class="input-group mb-3">
						  <div class="custom-file">
						    <input type="file" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01">
						    <label class="custom-file-label" for="inputGroupFile01">파일을 선택하세요</label>
						  </div>
						</div>
						<br>
						<button type="submit" class="btn btn-dark">등록하기</button>
                    	</div>
                    </form>
                </div>
            </div>
        </div>
	</section>
	<!-- Section End -->
<%@ include file="../include/footer.jsp" %>