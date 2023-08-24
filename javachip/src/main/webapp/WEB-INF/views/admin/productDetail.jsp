<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/admin.css" type="text/css"/>
<!-- 메인 작성 영역 -->
<script>


	function productDelete(){
		
		var pNo = $("#pNo").text();
		
		$.ajax({
			url : "productDelete.do",
			type : "POST",
			data : { pNo: pNo },
			success : function(data)
			{
				
				if(data > 0)
				{
					alert("상품삭제가 완료되었습니다.");
				}
				else
				{
					alert("상품삭제 실패")
				}
			},
			error : function(data)
			{
				alert("그냥 실패!");
			}
		});
	}
</script>
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
                            <c:if test="${not empty pavo}">
							<img src="<%=request.getContextPath()%>/resources/upload/${pavo.aChangeName}">
							</c:if>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                <form class="product__input">
                    <div class="product__details__text">
                    	<div id="pNo" name="pNo">
                    	${vo.pNo }
                    	</div><br><br>
                    	상품구분 :<br>
                    	${vo.pType }<br><br>
                        상품명 :<br><br>
           ${vo.pName }<br><br>
                        가격 :<br>${vo.pPrice }<br><br>
                        상품설명 :<br>${vo.pNote }<br><br>
                        입고수 :<br>${vo.pInput }<br><br>
                        
                    	</div>
                    </form>
                    <button type="submit" class="btn btn-dark" onclick="productDelete();">삭제하기</button>
                    <button type="submit" class="btn btn-dark" onclick="productUpdate();">수정하기</button>
                </div>
            </div>
        </div>
	</section>
	<!-- Section End -->
<%@ include file="../include/footer.jsp" %>