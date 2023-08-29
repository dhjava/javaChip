<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<script>
	// 금액 ,+원
	function moneyFn(str) {
		return str.toString().replace(/\B(?=(\d{3})+(?!\d))/g,',')+"원";
	}
	
	function moneyToNum(str) {
		var newStr = str.toString().replace(',' ,'');
		return newStr.toString().replace('원' ,'');
	}
	
	$(document).ready(function() {
		$(".shoping__cart__price").each(function() {
			var price = $.trim($(this).text())
			$(this).text(moneyFn(price));
		});
	});
</script>
<!-- 메인 작성 영역 -->
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>구매내역 조회</h2>
                        <div class="breadcrumb__option">
                            <a href="<%= request.getContextPath() %>/">홈</a>
                            <a href="main.do">마이페이지</a>
                            <span>구매내역 조회</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">구매정보</th>
                                    <th>결제금액</th>
                                    <th>상세조회</th>
                                    <th>배송정보</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach items="${orderList}" var="list">
	                                <tr>
	                                    <td class="shoping__cart__item">
	                                        <h5><a href="hdetail.do?oNo=${list.oNo}">${list.oDate.substring(0,10)} 주문</a></h5>
	                                    </td>
	                                    <td class="shoping__cart__price">
	                                        ${list.oTotalPrice}
	                                    </td>
	                                    <td class="shoping__cart__quantity" style="width:8%;">
	                                    	<input type="button" class="btn" value="상세조회" onclick="location.href='hdetail.do?oNo=${list.oNo}'">
	                                    </td>
	                                    <td class="shoping__cart__quantity" style="width:8%;">
		                                    <c:choose>
			                                    <c:when test="${empty list.oTrackNo or list.oTrackNo eq ''}">
			                                    	<input type="button" class="btn" value="배송조회"
			                                    		onclick="alert('배송 준비 중입니다.')">
			                                    </c:when>
			                                    <c:otherwise>
			                                    	<input type="button" class="btn" value="배송조회"
			                                    		onclick="window.open('https://trace.cjlogistics.com/web/detail.jsp?slipno=${list.oTrackNo}')">
			                                    </c:otherwise>
		                                    </c:choose>
	                                    </td>
	                                </tr>
                            	</c:forEach>
                            </tbody>
                        </table>
                        <div class="product__pagination" style="text-align:center;">
                    	<c:if test="${pm.prev == true}">
	                        <a href="history.do?page=${pm.startPage-1}"><i class="fa fa-long-arrow-left"></i></a>
                    	</c:if>
                    	<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
	                        <a href="history.do?page=${i}">${i}</a>
                        </c:forEach>
                    	<c:if test="${pm.next == true}">
	                        <a href="history.do?page=${pm.endPage+1}"><i class="fa fa-long-arrow-right"></i></a>
                    	</c:if>
                    </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="javascript:history.back()" class="primary-btn cart-btn">돌아가기</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->
<!-- 메인 작성 영역 -->
<%@ include file="../include/footer.jsp" %>