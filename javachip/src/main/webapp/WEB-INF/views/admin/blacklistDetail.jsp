<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/admin.css" type="text/css"/>
<!-- 메인 작성 영역 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	function AlertUser()
	{
		$.ajax
		({
			url : "AlertUser.do",
			type : "POST",
			data: "uNo="+$("#uNo").text(),
			success : function(data)
			{
				
				if(data > 0)
				{
					alert("신고횟수 1회 추가되었습니다.");
				}
				else
				{
					alert("업데이트 실패")
				}
			},
			error : function(data)
			{
				alert("그냥 실패!");
			}
		});
	}
	
	function StopUser(){
		$.ajax
		({
			url : "StopUser.do",
			type : "POST",
			data: "uNo="+$("#uNo").text(),
			success : function(data)
			{
				
				if(data > 0)
				{
					alert("해당 유저가 정지되었습니다.");
				}
				else
				{
					alert("업데이트 실패")
				}
			},
			error : function(data)
			{
				alert("그냥 실패!");
			}
		});
	}
	
	function NonStopUser(){
		$.ajax
		({
			url : "NonStopUser.do",
			type : "POST",
			data: "uNo="+$("#uNo").text(),
			success : function(data)
			{
				
				if(data > 0)
				{
					alert("해당 유저가 정지 해제 되었습니다.");
				}
				else
				{
					alert("업데이트 실패")
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
                            	<span>회원상세관리</span>
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
		<br>
				<h4><b>블랙리스트 정보</b></h4>
				<br>
				<button class="btn btn-dark" onclick="AlertUser()">경고</button>&nbsp;
				<button class="btn btn-dark" onclick="StopUser()">정지</button>&nbsp;
				<button class="btn btn-dark" onclick="NonStopUser()">정지해제</button>&nbsp;
				<br>
				<br>
	<input type="hidden" value="${vo.uNo }">
	<table border="1" style="width:99%;">
		<tr>
			<th>
				아이디
			</th>
			<td>
				${vo.uId}
			</td>
			<th>
				이름
			</th>
			<td>
				${vo.uName}
			</td>
		</tr>
		<tr>
			<th>
				회원 유형
			</th>
			<td>
				${vo.uStatus }
			</td>
			<th>
				유저번호
			</th>
			<td id="uNo">
				${vo.uNo }
			</td>
		</tr>
		<tr>
			<th>
				주소
			</th>
			<td colspan="3">
				${vo.uAdd1 }
				${vo.uAdd2 }
				${vo.uAdd3 }
			</td>
		</tr>
		<tr>	
			<th>
				탈퇴여부
			</th>
			<td>
				${vo.uRetire }
			</td>
			<th>
				누적 경고
			</th>
			<td>
				${vo.uStatus }
			</td>
		</tr>
	</table>
	<br>
	환불 리스트
	<table border="1" style="width:99%;">
		<tr>
			<th>
				번호
			</th>
			<th>
				상품 이름
			</th>
			<th>
				구매 날짜
			</th>
			<th>
				환불 날짜
			</th>
			<th>
				환불 상태
			</th>
			<th>
				환불 사유
			</th>
		</tr>
		<tr>
			<td>
				1
			</td>
			<td>
				커피1
			</td>
			<td>
				2023-02-22
			</td>
			<td>
				2023-02-25
			</td>
			<td>
				환불 완료
			</td>
			<td>
				잘못된 상품
			</td>
		</tr>
		<tr>
			<td>
				2
			</td>
			<td>
				커피2
			</td>
			<td>
				2023-03-22
			</td>
			<td>
				2023-03-22
			</td>
			<td>
				환불 완료
			</td>
			<td>
				상품 변경
			</td>
		</tr>
		<tr>
			<td colspan="6"><div class="admin_pagination" style="text-align:center;">
			◀ 1 2 3 4 5 6 7 8 9 10 ▶</div></td>
		</tr>
	</table>
	<br>
		</div>
	</section>
	<!-- Section End -->
<%@ include file="../include/footer.jsp" %>