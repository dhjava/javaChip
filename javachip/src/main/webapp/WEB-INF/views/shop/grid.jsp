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
                        <h2>쇼핑몰</h2>
                        <div class="breadcrumb__option">
                            <a href="<%= request.getContextPath() %>">홈</a>
                            <span>쇼핑몰</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                        <div class="sidebar__item">
                            <h4>목록</h4>
                            <ul>
                                <li><a href="grid.do?pType=1">원두</a></li>
                                <li><a href="grid.do?pType=2">생두</a></li>
                                <li><a href="grid.do?pType=3">드립백</a></li>
                                <li><a href="grid.do?pType=4">캡슐</a></li>
                                <li><a href="grid.do?pType=5">도매</a></li>
                                <li><a href="grid.do?pType=6">커피용품</a></li>
                                <li><a href="grid.do?pType=R">정기배송</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-7">
                <h4><b>원두</b></h4><br>
                    <div class="filter__item">
                        <div class="row">
                            <div class="col-lg-4 col-md-5">
                                <div class="filter__sort">
                                    <span>정렬</span>
                                    <select name="searchType">
                                        <option value="new">신상품순</option>
                                        <option value="pop">인기순</option>
                                        <option value="price">가격순</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                                <div class="filter__found">
                                    <h6><span>16</span>개의 상품이 조회되었습니다</h6>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-3">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                    <%
                    for(int i=0; i<12; i++) {
                    %>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/product/product-1.jpg" OnClick="location.href ='<%= request.getContextPath() %>/shop/details.do'" style="cursor:pointer;">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                        <li><a href="<%= request.getContextPath() %>/mypage/cart.do"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="details.do">Crab Pool Security</a></h6>
                                    <h5>$30.00</h5>
                                </div>
                            </div>
                        </div>
                    <%
                    }
                    %>
                    </div>
                    <div class="product__pagination">
                        <a href="grid.do">1</a>
                        <a href="grid.do">2</a>
                        <a href="grid.do">3</a>
                        <a href="grid.do"><i class="fa fa-long-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Section End -->
<!-- 메인 작성 영역 -->
<%@ include file="../include/footer.jsp" %>