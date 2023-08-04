<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.javachip.vo.CartVO" %>
	<script>
		function usePointFn() {
			// 최대치 설정 필요 (총 금액 + 사용 가능한 적립금)
			var point = $("#usePoint").val();
			if(point == "" || point < 1) {
				$("#discount").empty();
				$("#point").attr("value", 0)
			}else {
				$("#discount").text("-$"+point);
				$("#point").attr("value", point);
			}
		}
		
		
		function doCheckoutFn() {
			$("#cart").submit();
		}
	</script>
<!-- 메인 작성 영역 -->
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>장바구니</h2>
                        <div class="breadcrumb__option">
                            <a href="<%= request.getContextPath() %>/">홈</a>
                            <a href="main.do">마이페이지</a>
                            <span>장바구니</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shoping Cart Section Begin -->
    <form id="cart" method="post" action="cart.do">
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">상품</th>
                                    <th>가격</th>
                                    <th>수량</th>
                                    <th>총합</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="shoping__cart__item">
                                        <img src="<%= request.getContextPath() %>/resources/img/cart/cart-1.jpg" alt="">
                                        <h5>Vegetable’s Package</h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                        $55.00
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <input type="text" value="1">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="shoping__cart__total">
                                        $110.00
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <span class="icon_close"></span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="<%= request.getContextPath() %>/shop/grid.do" class="primary-btn cart-btn">계속 쇼핑하기</a>
                        <a href="javascript:location.reload()" class="primary-btn cart-btn cart-btn-right"><span class="icon_loading"></span>
                            장바구니 업데이트</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__continue">
                        <div class="shoping__discount">
                            <h5>적립금 사용</h5>
                            <span>회원님의 사용 가능한 적립금 : 100$</span><hr>
                            <input type="text" name="usePoint" id="usePoint"
                            	placeholder="사용할 적립금액을 입력해주세요" onchange="this.value=this.value.replace(/[^0-9]/g,'');">
                            <input type="hidden" name="point" id="point">
                            <button type="button" class="site-btn" onclick="usePointFn()">적용하기</button>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <h5>장바구니 총합</h5>
                        <ul>
                            <li>판매가 <span>$110</span></li>
                            <li>할인 
                            	<span id="discount">
                            	</span>
                            </li>
                            <li>총액 <span>$110</span></li>
                        </ul>
                        <a href="javascript:doCheckoutFn()" class="primary-btn" style="color:white;">구매하기</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    </form>
    <!-- Shoping Cart Section End -->
<!-- 메인 작성 영역 -->
<%@ include file="../include/footer.jsp" %>