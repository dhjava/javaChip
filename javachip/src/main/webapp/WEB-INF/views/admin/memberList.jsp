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
                            	<span>회원관리</span>
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
				<li><a href="<%=request.getContextPath() %>/admin/memberList.do">회원조회</a></li>
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
				<h4><b>회원 리스트</b></h4><br>
				<div>
					<select>
						<option>전체</option>
						<option>일반</option>
						<option>사업자</option>
					</select>
				</div>
				<div class="search admin">
					<select>
						<option>아이디+이름</option>
						<option>아이디</option>
						<option>이름</option>
					</select>
					<input type="text"><input type="button" value="검색">
				</div>
				<table border="1" class="tableAdmin admin">
					<tr>
						<th><input type="checkbox"></th><th>번호</th><th>제목</th><th>아이디</th><th>등급</th><th>누적 경고</th><th>상태</th><th>상세</th>
					</tr>
					<tr>
						<td class="ctd"><input type="checkbox" ></td>
						<td>1</td>
						<td class="ctd">일반</td>
						<td>hong12</td>
						<td>5</td>
						<td>0</td>
						<td>활동</td>
						<td class="ctd"><a href="<%=request.getContextPath() %>/admin/memberDetail.do">
						<input type="button" value="상세" onclick="openMemberDetail()"></a>
						</td>
					</tr>
					<tr>
						<td class="ctd"><input type="checkbox" ></td>
						<td>2</td>
						<td class="ctd">일반</td>
						<td>gill12</td>
						<td>5</td>
						<td>0</td>
						<td>활동</td>
						<td class="ctd"><a href="<%=request.getContextPath() %>/admin/memberDetail.do">
						<input type="button" value="상세" onclick="openMemberDetail()"></a>
					</tr>
					<tr>
						<td class="ctd"><input type="checkbox" ></td>
						<td>3</td>
						<td class="ctd">일반</td>
						<td>dong12</td>
						<td>5</td>
						<td>0</td>
						<td>활동</td>
						<td class="ctd"><a href="<%=request.getContextPath() %>/admin/memberDetail.do">
						<input type="button" value="상세" onclick="openMemberDetail()"></a>
						</td>
					</tr>
					<tr>
						<td class="ctd"><input type="checkbox" ></td>
						<td>4</td>
						<td class="ctd">일반</td>
						<td>hong22</td
						><td>5</td>
						<td>0</td>
						<td>활동</td>
						<td class="ctd"><a href="<%=request.getContextPath() %>/admin/memberDetail.do">
						<input type="button" value="상세" onclick="openMemberDetail()"></a>
						</td>
					</tr>
				</table>
		</div>
	</section>
	<!-- Section End -->
<%@ include file="../include/footer.jsp" %>