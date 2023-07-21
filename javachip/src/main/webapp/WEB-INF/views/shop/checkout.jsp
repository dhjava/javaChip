<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

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
                <form action="#">
                    <div class="row">
                    	<div class="col-lg-8">
                    	<p>&nbsp;&nbsp;&nbsp;&nbsp;주문자 정보와 동일 &nbsp;&nbsp;<input type="checkbox"></p>
	                    	<div class="col-lg-8 col-md-6">
	                            <div class="row">
	                                <div class="col-lg-6">
	                                    <div class="checkout__input">
	                                        <p>성명<span>*</span></p>
	                                        <input type="text">
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="checkout__input">
	                                <p>주소<span>*</span></p>
	                                <input type="text" placeholder="우편번호" class="checkout__input__add" style="width:150px;">
	                                <button type="button" class="btn btn-outline-primary">우편번호</button>
	                                <input type="text" placeholder="주소" class="checkout__input__add">
	                                <input type="text" placeholder="나머지 주소" class="checkout__input__add">
	                            </div>
	                            <div class="row">
	                                <div class="col-lg-6">
	                                    <div class="checkout__input">
	                                        <p>전화번호<span>*</span></p>
	                                        <input type="text">
	                                    </div>
	                                </div>
	                                <div class="col-lg-6">
	                                    <div class="checkout__input">
	                                        <p>이메일<span>*</span></p>
	                                        <input type="text">
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
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4>주문 명세서</h4>
                                <div class="checkout__order__products">제품 <span>가격</span></div>
                                <ul>
                                    <li>케냐산 원두 <span>25,000원</span></li>
                                    <li>ABC 생두 <span>77,777원</span></li>
                                    <li>네스카페 돌체 구스토 <span>120,000원</span></li>
                                </ul>
                                <div class="checkout__order__total">총 가격 <span>222,777원</span></div>
                                <button type="submit" class="site-btn">주문하기</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->
<%@ include file="../include/footer.jsp" %>