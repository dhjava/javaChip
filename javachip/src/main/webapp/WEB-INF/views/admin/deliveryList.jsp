<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<%@ page import ="com.javachip.vo.*" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% AdminPageMaker pm =  (AdminPageMaker)request.getAttribute("pm"); %>
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
                            	<span>주문관리</span>
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
				<h4><b>주문 목록 조회</b></h4><br>
				<div class="search admin">
					<form class="d-flex justify-content-center" action="deliveryList.do" method="get">
	 				<div class="input-group mb-4">
						<select name="searchType">
							<option value="uId" <c:if test="${param.searchType eq 'uId'}">selected</c:if>>회원아이디</option>
						</select>
						<input type="text" name="SearchValue" class="form-control" placeholder="내용을 입력하세요" aria-label="Recipient's username" aria-describedby="button-addon2" value="${param.searchValue}">
						<div class="input-group-append">
						<button type="submit" class="btn btn-secondary mb-4">검색</button>
						</div>
					</div>
				</form>
				</div>
				<table border="1" class="tableAdmin qna admin">
					<tr>
						<th>번호</th><th>상품명</th><th>구매자 아이디</th><th>총 가격</th><th>상태</th>
					</tr>
					<c:forEach items="${list }" var="Order">
					<tr>
						<td>
							${Order.oNo }
						</td>
						<td>
							${Order.pName }
						</td>
						<td>
							${Order.uId }
						</td>
						<td>
							${Order.oTotalPrice }
						</td>
						<td>
							<c:if test="${Order.oStatus eq 'd' }">
								배송완료
							</c:if>
							<c:if test="${Order.oStatus eq 'Y' }">
								배송대기
							</c:if>
						</td>
					</tr>
					</c:forEach>	
				</table>
				<div class="admin_pagination" style="text-align:center;">
<%
String param = "searchType="+pm.getAdminSearchVO().getSearchType()+"&SearchValue="+pm.encoding2(pm.getAdminSearchVO().getSearchValue());
if (pm.isPrev()){ %>
<a href="<%=request.getContextPath()%>/admin/deliveryList.do?page=<%=pm.getStartPage()-1%>&<%=param%>">◀</a></td>
<%
}
%>

<% 
for(int i = pm.getStartPage() ; i<=pm.getEndPage(); i++) 
{
%>
<a href="<%=request.getContextPath()%>/admin/deliveryList.do?page=<%=i%>&<%=param%>"><%=i %></a>
<%	
}
%>

<%if(pm.isNext() && pm.getEndPage() > 0 ){ %>
<a href="<%=request.getContextPath()%>/admin/deliveryList.do?page=<%=pm.getEndPage()+1%>&<%=param%>">▶</a>
<%
}
%>
</div>

		</div>
	</div>
	</section>
	<!-- Section End -->
<%@ include file="../include/footer.jsp" %>