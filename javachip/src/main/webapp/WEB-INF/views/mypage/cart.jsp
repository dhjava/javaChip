<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
	<!-- 아임포트 결제 -->
	<script src="<%=request.getContextPath() %>/resources/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	<script>
		var IMP = window.IMP;
		IMP.init("imp06473501"); // 예: imp00000000
		
	    function requestPay() {
	      // IMP.request_pay(param, callback) 결제창 호출
	      IMP.request_pay({ // param
	          pg: "html5_inicis",
	          pay_method: "card",
	          merchant_uid: "javachip_"+new Date().getTime(),
	          name: "자바칩 프라페",
	          amount: 1,
	          buyer_email: "gildong@gmail.com",
	          buyer_name: "홍길동",
	          buyer_tel: "010-1234-1234",
	          buyer_addr: "전주시 덕진구 금암동",
	          buyer_postcode: "12345"
	      }, function (rsp) { // callback
	          if (rsp.success) {
	              // 결제 성공 시 로직
	              // 결제 내용 DB로 보내기 (pNo, uNo, cCount)
	              alert("결제 성공");
	              $("#cart").submit();
	          } else {
	              // 결제 실패 시 로직
	              alert("결제 실패. 잠시 후 다시 시도해주세요");
	          }
	      });
	    }
		
		function usePointFn() {
			// 최대치 설정 필요 (총 금액 + 사용 가능한 적립금)
			var point = $("#usePoint").val();
			if(point == "" || point < 1) {
				$("#discount").empty();
			}else {
				$("#discount").text("-$"+point);
			}
		}
	</script>
<!-- 메인 작성 영역 -->
    <form id="cart" method="post" action="cart.do">
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
                        <a href="#" class="primary-btn cart-btn">계속 쇼핑하기</a>
                        <a href="#" class="primary-btn cart-btn cart-btn-right"><span class="icon_loading"></span>
                            장바구니 업데이트</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__continue">
                        <div class="shoping__discount">
                            <h5>적립금 사용</h5>
                            <span>회원님의 사용 가능한 적립금 : 100$</span><hr>
                            <input type="number" name="usePoint" id="usePoint" placeholder="사용할 적립금액을 입력해주세요">
                            <button type="button" class="site-btn" onclick="usePointFn()">적용하기</button>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <h5>장바구니 총합</h5>
                        <ul>
                            <li>판매가 <span>$110</span></li>
                            <li>할인 <span id="discount">-$54.98</span></li>
                            <li>총액 <span>$400</span></li>
                        </ul>
                        <a href="javascript:requestPay()" class="primary-btn" style="color:white;">결제하기</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    </form>
    <!-- Shoping Cart Section End -->
<!-- 메인 작성 영역 -->
<%@ include file="../include/footer.jsp" %>