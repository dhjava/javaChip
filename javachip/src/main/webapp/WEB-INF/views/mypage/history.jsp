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
                                    <th class="shoping__product">구매정보 (클릭 시 상세 정보 조회)</th>
                                    <th>결제금액</th>
                                    <th>주문일자</th>
                                    <th>상세조회</th>
                                    <th>배송정보</th>
                                </tr>
                            </thead>
                            <tbody>
                            <%
                            for(int i=0; i<5; i++) {
                            %>
                                <tr>
                                    <td class="shoping__cart__item">
                                        <h5><a href="./mypage-hdetail.jsp">주문 번호(장바구니 번호)</a></h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                        $55.00
                                    </td>
                                    <td class="shoping__cart__total">
                                        2023-07-11
                                    </td>
                                    <td class="shoping__cart__quantity" style="width:8%;">
                                    	<input type="button" value="조회" onclick="location.href='shop-details.jsp'">
                                    </td>
                                    <td class="shoping__cart__quantity" style="width:8%;">
                                    	<input type="button" value="조회" onclick="location.href='shop-details.jsp'">
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
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->
<!-- 메인 작성 영역 -->
<%@ include file="../include/footer.jsp" %>