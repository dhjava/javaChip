<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<!-- 메인 작성 영역 -->
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>구매내역 상세정보</h2>
                        <div class="breadcrumb__option">
                            <a href="<%= request.getContextPath() %>/">홈</a>
                            <a href="main.do">마이페이지</a>
                            <span>구매내역 상세정보</span>
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
	                    <h4>주문번호 1234567890 (주문일 2023.07.17)</h4>
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">상품</th>
                                    <th>가격</th>
                                    <th>수량</th>
                                    <th>총합</th>
                                </tr>
                            </thead>
                            <tbody>
                            <%
                            // 장바구니 내 상품들 꺼내서 반복문
                            for(int i=0; i<3; i++) {
                            %>
                                <tr>
                                    <td class="shoping__cart__item">
                                        <img src="<%= request.getContextPath() %>/resources/img/cart/cart-1.jpg" alt="">
                                        <h5>케냐산 원두</h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                        30,000원
                                    </td>
                                    <td class="shoping__cart__quantity">
                                                <b>1</b>
                                    </td>
                                    <td class="shoping__cart__total">
                                        30,000원
                                    </td>
                                </tr>
                            <%
                            }
                            %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="javascript:history.back()" class="primary-btn cart-btn">돌아가기</a>
                        <a href="#" class="primary-btn cart-btn">배송조회</a>
                    </div>
                </div>
                <div class="col-lg-6">
                </div>
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <h5>결제 총합</h5>
                        <ul>
                            <li>판매가 <span>222,220원</span></li>
                            <li>할인 <span>22,220원</span></li>
                            <li>총액 <span>200,000원</span></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->
<!-- 메인 작성 영역 -->
<%@ include file="../include/footer.jsp" %>