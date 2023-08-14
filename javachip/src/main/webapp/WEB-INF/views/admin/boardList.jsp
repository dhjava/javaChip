<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<%@ page import ="com.javachip.vo.*" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% AdminPageMaker pm =  (AdminPageMaker)request.getAttribute("pm"); %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/admin.css" type="text/css"/>

<!-- 메인 작성 영역 -->

<script type="text/javascript">
$(function(){
	var chkObj = document.getElementsByName("RowCheck");
	var rowCnt = chkObj.length;
	
	$("input[name='allCheck']").click(function(){
		var chk_listArr = $("input[name='RowCheck']");
		for(var i = 0; i < chk_listArr.length; i++){
			chk_listArr[i].checked = this.checked;
		}
	});
	$("input[name='RowCheck']").click(function(){
		if($("input[name='RowCheck']:checked").length == rowCnt){
			$("input[name='allCheck']")[0].checked = true;
		}
		else{
			$("input[name='allCheck']")[0].checked = false;
		}
	});
});

function deleteValue(){
	var valueArr = new Array();
	var list = $("input[name='RowCheck']");
	for(var i = 0; i < list.length; i++){
		if(list[i].checked){
			valueArr.push(list[i].value);
		}
	}
	if(valueArr.length == 0){
		alert("선택된 글이 없습니다.");
	}
	else{

		if(confirm("정말 삭제하시겠습니까?")) {
			$.ajax({
				url : "boardDelete.do",
				type : "POST",
				traditional : true,
				data : {
					valueArr : valueArr
				},
				success : function(jdata){
					console.log(jdata);
					if(jdata = 1){
						alert("삭제성공");
						location.replace("/controller/admin/boardList.do")
					}
					else{
						alert("삭제실패");
					}
				}
			});
		} else {
			return false;
		}
	}
}

 </script>

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
		<div class="main admin" style="float:left; width:75%;">
				<h4><b>공지사항 관리</b></h4><br>
				<div class="search admin">
					<form class="d-flex justify-content-center" action="boardList.do" method="get">
	 				<div class="input-group mb-4">
						<select name="searchType">
							<option value="title" <c:if test="${param.searchType eq 'title'}">selected</c:if>>제목</option>
							<option value="content" <c:if test="${param.searchType eq 'content'}">selected</c:if>>내용</option>
							<option value="tnc" <c:if test="${param.searchType eq 'tnc'}">selected</c:if>>제목+내용</option>
						</select>
						<input type="text" name="SearchValue" class="form-control" placeholder="내용을 입력하세요" aria-label="Recipient's username" aria-describedby="button-addon2" value="${param.searchValue}">
						<div class="input-group-append">
						<button type="submit" class="btn btn-secondary mb-4">검색</button>
						</div>
					</div>
				</form>
				</div>
					<table border="1" class="tableAdmin admin">
						<tr>
							<th>
								<input type="checkbox" name="allCheck" id="allCheck" />
							</th>
							<th>번호</th><th>제목</th><th>작성일</th><th>삭제여부</th>
						</tr>
						<c:forEach items="${list }" var="Notice">
						<tr>
						<td>
							<input type="checkbox" name="RowCheck" th:value="${Notice.nNo}"
							class="RowCheck"
							data-nNo="${Notice.nNo }" value="${Notice.nNo }">
						</td>
						<td>${Notice.nNo }</td>
						<td><a href="<%=request.getContextPath() %>/help/noticeView.do?nNo=${Notice.nNo}">${Notice.nTitle }</a></td>
						<td>${Notice.nDate }</td>
						<td>
							<c:if test="${Notice.delYN eq 'Y' }">
								삭제 완료
							</c:if>
							<c:if test="${Notice.delYN eq 'N' }">
								삭제 가능
							</c:if>
						</td>
						</tr>
						</c:forEach>
					</table>
				<div class="admin_pagination" style="text-align:center;">
<%
String param = "searchType="+pm.getAdminSearchVO().getSearchType()+"&SearchValue="+pm.encoding2(pm.getAdminSearchVO().getSearchValue());
if (pm.isPrev()){ %>
<a href="<%=request.getContextPath()%>/admin/boardList.do?page=<%=pm.getStartPage()-1%>&<%=param%>">◀</a></td>
<%
}
%>

<% 
for(int i = pm.getStartPage() ; i<=pm.getEndPage(); i++) 
{
%>
<a href="<%=request.getContextPath()%>/admin/boardList.do?page=<%=i%>&<%=param%>"><%=i %></a>
<%	
}
%>

<%if(pm.isNext() && pm.getEndPage() > 0 ){ %>
<a href="<%=request.getContextPath()%>/admin/boardList.do?page=<%=pm.getEndPage()+1%>&<%=param%>">▶</a>
<%
}
%>
</div>
<br>
<!-- <input type="button" value="선택 삭제"> -->
<div class="delBtn">
	<button type="submit" class="selectDelete_btn" onclick="deleteValue();">선택 삭제</button>
</div>
<br>
</div> 
	</div>
	</div>
	</section>
	<!-- Section End -->
<%@ include file="../include/footer.jsp" %>