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
                            	<span>공지사항관리</span>
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
				<li><a href="<%=request.getContextPath() %>/admin/productList.do">상품 목록 조회</a></li>
				</ul>
			</div>
			<div class="blog__sidebar__item">
				<h4>회원관리</h4>
				<ul>
				<li><a href="<%=request.getContextPath() %>/admin/memberList.do">일반회원조회</a>
					<a href="<%=request.getContextPath() %>/admin/bizmemberList.do">관리자회원조회</a>
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
		<div class="main admin" style="float:left; width:75%;">
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
							<td><input type="checkbox"></td><td>1</td><td><a href="<%=request.getContextPath()%>/help/notice.do">공지사항입니다.</a></td><td>2023-07-11</td>
						</tr>
						<tr>
							<td><input type="checkbox"></td><td>1</td><td><a href="<%=request.getContextPath()%>/help/notice.do">공지사항입니다.</a></td><td>2023-07-11</td>
						</tr>
						<tr>
							<td><input type="checkbox"></td><td>1</td><td><a href="<%=request.getContextPath()%>/help/notice.do">공지사항입니다.</a></td><td>2023-07-11</td>
						</tr>
						<tr>
							<td><input type="checkbox"></td><td>1</td><td><a href="<%=request.getContextPath()%>/help/notice.do">공지사항입니다.</a></td><td>2023-07-11</td>
						</tr>
					</table>
				<div class="admin_pagination" style="text-align:center;">◀ 1 2 3 4 5 6 7 8 9 10 ▶</div>
				<input type="button" value="선택 삭제">
		</div>
	</div>
	</section>
	<!-- Section End -->
<%@ include file="../include/footer.jsp" %>