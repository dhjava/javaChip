<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.javachip.vo.CartVO" %>
<%
	// List<CartVO> cartList = (List<CartVO>) request.getAttribute("cartList");
	// int totalPrice = (int) request.getAttribute("totalPrice");
	// int point = (int) request.getAttribute("point");
%>
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
	              // 결제 내용 DB로 보내기 (order_테이블, 기존 장바구니는 cStatus 'O'로 변경)
	              alert("결제 성공");
	              $("#checkoutFrm").submit();
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
				$("#usePoint").attr("value", 0);
				$("#discount").empty();
				$("#point").attr("value", 0);
			}else {
				$("#discount").text("-"+point+"원");
				$("#point").attr("value", point);
			}
		}
	</script>
	
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>주문하기</h2>
                        <div class="breadcrumb__option">
                            <a href="<%= request.getContextPath() %>/">Home</a>
                            <span>주문하기</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
                <h4>배송 정보 입력</h4>
                <form name="checkoutFrm" id="checkoutFrm" method="post" action="checkout.do">
                    <div class="row">
                    	<div class="col-lg-7">
                    	<p>&nbsp;&nbsp;&nbsp;&nbsp;주문자 정보와 동일 &nbsp;&nbsp;<input type="checkbox"></p>
	                    	<div class="col-lg-10 col-md-6">
	                            <div class="row">
	                                <div class="col-lg-6">
	                                    <div class="checkout__input">
	                                        <p>성명<span>*</span></p>
	                                        <input type="text" name="oName" id="oName">
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="checkout__input">
	                                <p>주소<span>*</span></p>
	                                <input type="text" id="oAdd1" placeholder="우편번호" class="checkout__input__add" style="width:150px;">
	                                <button type="button" class="btn btn-outline-primary">우편번호</button>
	                                <input type="text" id="oAdd2" placeholder="주소" class="checkout__input__add">
	                                <input type="text" id="oAdd3" placeholder="나머지 주소" class="checkout__input__add">
	                            </div>
	                            <div class="row">
	                                <div class="col-lg-6">
	                                    <div class="checkout__input">
	                                        <p>전화번호<span>*</span></p>
	                                        <input type="text" name="oPhone" id="oPhone">
	                                    </div>
	                                </div>
	                                <div class="col-lg-6">
	                                    <div class="checkout__input">
	                                        <p>이메일<span>*</span></p>
	                                        <input type="text" name="oMail" id="oMail">
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="checkout__input">
	                                <p>배송 시 전달사항</p>
	                                <input type="text"
	                                    placeholder="전달사항을 입력해주세요. (선택사항)">
	                            </div>
	                        </div>
                    	</div>
                        <div class="col-lg-5 col-md-6">
                    		<!-- 마일리지 시작 -->
		                    <div class="shoping__continue">
		                        <div class="shoping__discount"  style="margin:45px 0;">
		                            <h5>적립금 사용</h5>
		                            <span>회원님의 사용 가능한 적립금 : 100$</span><hr>
		                            <input type="text" name="usePoint" id="usePoint"
		                            	placeholder="사용할 적립금액을 입력해주세요" onchange="this.value=this.value.replace(/[^0-9]/g,'');">
		                            <input type="hidden" name="point" id="point">
		                            <button type="button" class="site-btn" onclick="usePointFn()">적용하기</button>
		                        </div>
		                    </div>
                    		<!-- 마일리지 끝 -->
                            <div class="checkout__order">
                                <h4>주문 명세서</h4>
                                <div class="checkout__order__products">제품 <span>가격</span></div>
                                <ul>
                                    <li>네스카페 돌체 구스토 <span>120000원</span></li>
                                    <li>할인 <span id="discount" style="color:#DD2222;"></span></li>
                                </ul>
                                <div class="checkout__order__total">
                                	총 가격 <span id="total">120000원</span>
                                </div>
                                <button class="site-btn">주문하기</button>
                                <!-- <button type="button" class="site-btn" onclick="">주문하기</button> -->
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->
<%@ include file="../include/footer.jsp" %>