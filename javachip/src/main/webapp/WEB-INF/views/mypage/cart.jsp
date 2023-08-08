<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.javachip.vo.CartVO" %>
<%
	List<CartVO> cartList = (List<CartVO>)request.getAttribute("cartList");
%>
	<script>
		function doCheckoutFn() {
			var orderCart = [];
			$("input[name=chkCart]").each(function() {
				if($(this).is(":checked") == false) {
					
				}else {
					var chk = $(this).val();
					orderCart.push(chk);
				}
			});
			console.log(orderCart);
			if(orderCart.length == 0) {
				alert("구매하고자 상품을 선택해 주세요.");
				return;
			}
			console.log($("input[name=chkCart]"))
			$("#cart").submit();
		}
		
		function chkAll() {
			$("input[name=chkCart]").prop("checked", true);
		}
		
		
		
		$(document).ready(function(){
			var sum = 0;
			$(".shoping__cart__total").each(function(i, e) {
				sum += parseInt($(e).text());
			});
			$("#sumAll").text(sum+"원");
			
			$("input[name=cCount]").change(function() {
				var obj = $(this);
				var cNo = obj.parents("tr").find("input[name=chkCart]").val();
				var cCount = obj.parents("tr").find("input[name=cCount]").val();
				var input = obj.parents("tr").find(".shoping__cart__total");
				var price = obj.parents("tr").find(".shoping__cart__price").text();
				var cal = parseInt(cCount)*parseInt(price);
				$.ajax({
					url:"updateCount.do",
					type:"post",
					data:"cNo="+cNo+"&cCount="+cCount,
					success:function(data) {
						if(data > 0) {
							console.log(data+" success");
							input.html(cal+"원");
							
							sum = 0;
							$(".shoping__cart__total").each(function(i, e) {
								sum += parseInt($(e).text());
							});
							$("#sumAll").text(sum+"원");
						}
					},
					error:function(){
						alert("예외발생!");
					}
				});
			});
			
			$(".icon_close").click(function() {
				var obj = $(this);
				var cNo = obj.parents("tr").find("input[name=chkCart]").val();
				$.ajax({
					url:"deleteCart.do",
					type:"post",
					data:"cNo="+cNo,
					success:function(data) {
						if(data > 0) {
							console.log("success");
							obj.parents("tr").empty();
						}
					},
					error:function(){
						alert("예외발생!");
					}
				});
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
                        <table id="cartTable">
                            <thead>
                                <tr>
                                    <th width="50px"></th>
                                    <th class="shoping__product">상품</th>
                                    <th>가격</th>
                                    <th>수량</th>
                                    <th>총합</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:choose>
                            	<c:when test="${empty cartList}">
                            		<tr>
                            			<td colspan="5">장바구니가 비어있습니다.</td>
                            		</tr>
                            	</c:when>
                            	<c:otherwise>
		                            <c:forEach items="${cartList}" var="cart">
		                                <tr>
		                                	<td><input type="checkbox" name="chkCart" value="${cart.cNo}"></td>
		                                    <td class="shoping__cart__item">
		                                        <img src="<%= request.getContextPath() %>/resources/img/cart/cart-1.jpg" alt="">
		                                        <h5>${cart.pName}</h5>
		                                    </td>
		                                    <td class="shoping__cart__price">
		                                    	${cart.pPrice}
		                                    </td>
		                                    <td class="shoping__cart__quantity">
		                                        <div class="quantity">
		                                            <div class="pro-qty">
		                                                <input type="text" name="cCount" value="${cart.cCount}">
		                                            </div>
		                                        </div>
		                                    </td>
		                                    <td class="shoping__cart__total">
		                                        ${cart.cCount * cart.pPrice}원
		                                    </td>
		                                    <td class="shoping__cart__item__close">
		                                        <span class="icon_close"></span>
		                                    </td>
		                                </tr>
		                            </c:forEach>
                            	</c:otherwise>
                            </c:choose>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="javascript:chkAll()" class="primary-btn cart-btn"><span class="icon_check"></span>모두 선택하기</a>
                        <a href="" class="primary-btn cart-btn cart-btn-right">
                        	<span class="icon_trash"></span>
                        	모두 비우기
                        </a>
                    </div>
                </div>
                <div class="col-lg-6 offset-sm-6">
                    <div class="shoping__checkout">
                        <h5>장바구니 총합</h5>
                        <ul>
                            <li></li>
                            <li><span id="sumAll">$110</span></li>
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