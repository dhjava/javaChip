<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.javachip.vo.CartVO" %>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	<script>
		// 금액 ,+원
		function moneyFn(str) {
			return str.toString().replace(/\B(?=(\d{3})+(?!\d))/g,',')+"원"
		}
		
		function moneyToNum(str) {
			var newStr = str.toString().replace(',' ,'');
			return newStr.toString().replace('원' ,'');
		}
		
		var sum = 0;
		$(document).ready(function() {
			$("#point").attr("value", "0");
			$(".calPrice").each(function(i, e) {
				sum += parseInt($(e).text());
			});
			
			$(".calPrice").each(function() {
				$(this).text(moneyFn($(this).text()));
			});
			$("#getTotal").text(moneyFn(sum));
			
		});
		
	    function usePointFn() {
			// 최대치 설정 필요 (총 금액 + 사용 가능한 적립금)
			var point = $("#usePoint").val();
			var maxPoint = parseInt($("#maxPoint").val());
			console.log(point);
			console.log(maxPoint);
			console.log(sum);
			var price = sum;
			if(point == "" || point < 1) {
				$("#usePoint").attr("value", 0);
				$("#discount").empty();
				$("#point").attr("value", 0);
				price = sum;
			}else if(point > maxPoint) {
				alert("사용 가능한 포인트를 초과하였습니다.");
				$("#usePoint").attr("value", maxPoint);
				$("#discount").text("-"+moneyFn(maxPoint));
				$("#point").attr("value", maxPoint);
				price = parseInt(sum)-maxPoint;
			}else if(point > parseInt(sum)) {
				alert("결제하려는 금액보다 더 많은 포인트를 사용하실 수 없습니다.");
				$("#usePoint").attr("value", sum);
				$("#discount").text("-"+moneyFn(sum));
				$("#point").attr("value", sum);
				price = 0;
			}else {
				$("#discount").text("-"+moneyFn(point));
				$("#point").attr("value", point);
				price = parseInt(sum)-point;
			}
			$("#getTotal").text(moneyFn(price));
		}
	    
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
	              $("#usePoint").attr("disabled","disabled");
	              $("#total").attr("value",$("#getTotal").text());
	              $("#checkoutFrm").submit();
	          } else {
	              // 결제 실패 시 로직
	              alert("결제 실패. 잠시 후 다시 시도해주세요");
	              $("#usePoint").attr("disabled","disabled");
	              $("#total").attr("value",$("#getTotal").text());
	              $("#checkoutFrm").submit();
	          }
	      });
	    }
		
	    function addressPopup(){
            var url = "addressPopup.do";
            var name = "배송지 관리";
            var option = "width = 1000, height = 850, top = 100, left = 200, location = no"
            window.open(url, name, option);
        }
	    
	    
	    $(document).ready(function() {
        $("#sort").change(function() {
            var selectedValue = $(this).val();

            // 여기에 선택된 값에 따라서 input 요소들의 값을 채우는 로직을 추가합니다.
            if (selectedValue === "main") {
                // 기본 배송지에 대한 처리
                $("#oName").val("${addvo.aName}");
                $("#oAdd1").val("${addvo.addr1}");
                $("#oAdd2").val("${addvo.addr2}");
                $("#oAdd3").val("${addvo.addr3}");
                $("#oPhone").val("${addvo.aPhone}");
                $("#oMail").val("${addvo.aMail}");
            } else if (selectedValue === "sub1") {
                // 추가 배송지1에 대한 처리
                // 다른 값들을 필요에 따라 변경
            }
        });
    });
	    
	    /* $(document).ready(function() {
	        $("#sort").change(function() {
	            var selectedValue = $(this).val();

	            // 주소 목록을 받아온다고 가정
	            var addvoList = [
	                { aName: "Name1", addr1: "Addr1_1", addr2: "Addr2_1", addr3: "Addr3_1", aPhone: "Phone1", aMail: "Mail1" },
	                { aName: "Name2", addr1: "Addr1_2", addr2: "Addr2_2", addr3: "Addr3_2", aPhone: "Phone2", aMail: "Mail2" }
	                // ... 추가 주소 객체들 ...
	            ];

	            // 여기에 선택된 값에 따라서 input 요소들의 값을 채우는 로직을 추가합니다.
	            if (selectedValue === "main") {
	                // 기본 배송지에 대한 처리
	                var defaultAddress = addvoList[0]; // 첫 번째 주소 객체를 기본 배송지로 가정
	                fillAddressInputs(defaultAddress);
	            } else if (selectedValue === "sub1") {
	                // 추가 배송지1에 대한 처리
	                var additionalAddress = addvoList[1]; // 두 번째 주소 객체를 추가 배송지로 가정
	                fillAddressInputs(additionalAddress);
	            }
	        });
	    });

	    function fillAddressInputs(address) {
	        $("#oName").val(address.aName);
	        $("#oAdd1").val(address.addr1);
	        $("#oAdd2").val(address.addr2);
	        $("#oAdd3").val(address.addr3);
	        $("#oPhone").val(address.aPhone);
	        $("#oMail").val(address.aMail);
	    } */
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
    <form name="checkoutFrm" id="checkoutFrm" method="post" action="checkout.do">
    <section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
                <h4>배송 정보 입력</h4>
                    <div class="row">
                    	<div class="col-lg-7">
	                    	<div class="col-lg-10 col-md-6" id="address_list" style=margin-bottom:20px;>
		                    	<p>배송지 목록</p>
		                    	<select id="sort" name="sort">
					    			<option value="main" id="main" 
					    			<c:if test="${param.sort eq 'main'}">selected</c:if>>기본 배송지</option>
					    			<option value="sub1" id="sub1"
					    			<c:if test="${param.sort eq 'sub1'}">selected</c:if>>추가 배송지1</option>
					    		</select>								
					    		<button type="button" class="btn btn-outline-primary" style=margin-left:20px; onclick="addressPopup()">배송지 관리</button>
	                    	</div>
	                    	<div class="col-lg-10 col-md-6">
	                            <div class="row">
	                                <div class="col-lg-6">
	                                    <div class="checkout__input">
	                                        <p>성명<span>*</span></p>
	                                        <input type="text" name="oName" id="oName" value="${addvo.aName }">
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="checkout__input">
	                                <p>주소<span>*</span></p>
	                                <input type="text" id="oAdd1" name="oAdd1" 
	                                value="${addvo.addr1 }" placeholder="우편번호" class="checkout__input__add" style="width:150px;">
	                                <button type="button" class="btn btn-outline-primary" onclick="sample7_execDaumPostcode()">우편번호</button>
	                                <input type="text" id="oAdd2" name="oAdd2"
	                                value="${addvo.addr2 }" placeholder="주소" class="checkout__input__add">
	                                <input type="text" id="oAdd3" name="oAdd3"
	                                value="${addvo.addr3 }" placeholder="나머지 주소" class="checkout__input__add">
	                            </div>
	                            <div class="row">
	                                <div class="col-lg-6">
	                                    <div class="checkout__input">
	                                        <p>전화번호<span>*</span></p>
	                                        <input type="text" name="oPhone" id="oPhone" value="${addvo.aPhone }">
	                                    </div>
	                                </div>
	                                <div class="col-lg-6">
	                                    <div class="checkout__input">
	                                        <p>이메일<span>*</span></p>
	                                        <input type="text" name="oMail" id="oMail" value="${addvo.aMail }">
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
		                            <span>회원님의 사용 가능한 적립금 : ${totalMileage} 포인트</span>
		                            <input type="hidden" id="maxPoint" value="${totalMileage}">
		                            <hr>
		                            <input type="text" id="usePoint"
		                            	placeholder="사용할 적립금액을 입력해주세요" oninput="this.value=this.value.replace(/[^0-9]/g,'');">
		                            <input type="hidden" name="point" id="point">
		                            <button type="button" class="site-btn" onclick="usePointFn()">적용하기</button>
		                        </div>
		                    </div>
                    		<!-- 마일리지 끝 -->
                            <div class="checkout__order">
                                <h4>주문 명세서</h4>
                                <div class="checkout__order__products">제품 <span>가격</span></div>
                                <ul>
                                	<c:forEach items="${orderList}" var="cart">
	                                    <li>${cart.pName}<span class="calPrice" id="calPrice">${cart.pPrice*cart.cCount}</span></li>
                                	</c:forEach>
	                                <li>할인 <span id="discount" style="color:#DD2222;">0원</span></li>
                                </ul>
                                <div class="checkout__order__total">
                                	총 가격 <span id="getTotal">0</span>
                                	<input type="hidden" id="total" name="total">
                                </div>
                                <button type="button" class="site-btn" onclick="requestPay()">주문하기</button>
                            </div>
                        </div>
                    </div>
            </div>
        </div>
    </section>
    </form>

    <!-- Checkout Section End -->
<%@ include file="../include/footer.jsp" %>