<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<%@ page import ="com.javachip.vo.*" %> 
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/admin.css" type="text/css"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% AdminPageMaker pm =  (AdminPageMaker)request.getAttribute("pm"); %>
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
				<form action="memberList.do" method="post">
				<div>
					<select name="AdminSearchUserType">
						<option value="N" 
						<c:if test="${param.AdminSearchUserType eq 'N'}">selected</c:if>>일반</option>
						<option value="B" 
						<c:if test="${param.AdminSearchUserType eq 'B'}">selected</c:if>>사업자</option>
					</select>
					<button>검색</button>
				</div>
				</form>
				<form action="memberList.do" method="post">
				<div class="search admin">
					<select name="AdminSearchId">
						<option value="uId"
						<c:if test="${param.AdminSearchId eq 'uId'}">selected</c:if>>아이디</option>
						<option value="uName"
						<c:if test="${param.AdminSearchId eq 'uName'}">selected</c:if>>이름</option>
					</select>
					<input type="text" name="AdminSearchIdValue" value="${param.AdminSearchIdValue}">
					<button>검색</button>
				</div>
				</form>
				<table border="1" class="tableAdmin admin">
					<tr>
						<th>번호</th><th>아이디</th><th>이름</th><th>가입일</th><th>누적 경고</th><th>상세</th>
					</tr>
					<c:forEach items="${list }" var="User">
					<tr>
						<td>${User.uNo }</td>
						<td>${User.uId }</td>
						<td>${User.uName }</td>
						<td>${User.uJoin }</td>
						<td>${User.uAlertNum }</td>
						<td class="ctd"><a href="<%=request.getContextPath() %>/admin/memberDetail.do?uNo=${User.uNo}">
						<input type="button" value="상세" onclick="openMemberDetail()"></a>
						</td>
					</tr>
					</c:forEach>
				</table>
<%-- 				<div class="admin_pagination" style="text-align:center;">
				
<% String param ="AdminSearchUserType="+pm.getAdminSearchVO().getAdminSearchUserType()+"&keyword="+pm.encoding(pm.getScri().getKeyword());
if (pm.isPrev()){ %>
<a href="<%=request.getContextPath()%>/board/boardList.do?page=<%=pm.getStartPage()-1%>&<%=param%>">◀</a></td>
<%
}
%>

<% 
for(int i = pm.getStartPage();i<=pm.getEndPage();i++) {
%>
<a href="<%=request.getContextPath()%>/board/boardList.do?page=<%=i%>&<%=param%>"><%=i %></a>
<%	
}
%>

<%if(pm.isNext()&&pm.getEndPage()>0 ){ %>
<a href="<%=request.getContextPath()%>/board/boardList.do?page=<%=pm.getEndPage()+1%>&<%=param%>">▶</a>
<% } %>
</div> --%>
		</div>
	</section>
	<!-- Section End -->
<%@ include file="../include/footer.jsp" %>