<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
	<ul class="nav justify-content-center">
	  <li class="nav-item">
	    <a class="nav-link disabled" tabindex="-1" aria-disabled="true">관리자 페이지</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link active" href="<%=request.getContextPath()%>/admin/memberList.do">회원 관리</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="<%=request.getContextPath()%>/admin/productList.do">상품 등록</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="<%=request.getContextPath()%>/admin/delivery.do">주문 관리</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="<%=request.getContextPath()%>/admin/boardList.do">게시글 관리</a>
	  </li>
	</ul>
    <!-- Product Details Section Begin -->
    <section class="board-box spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large"
                                src="img/product/details/board-box-1.jpg" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                <form class="product__input">
                    <div class="product__details__text">
                    	상품구분 :<br>
                    	<select class="custom-select" id="pType" name="pType">
						  <option selected>선택해주세요.</option>
						  <option value="원두">원두</option>
						  <option value="생두">생두</option>
						  <option value="드립백">드립백</option>
						  <option value="캡슐">캡슐</option>
						  <option value="도매">도매</option>
						  <option value="커피용품">커피용품</option>
						  <option value="정기배송">정기배송</option>
						</select><br><br><br>
                        상품명 :<br><input class="form-control"  type="text" id="pName" name="pName" placeholder="상품명" ><br>
                        가격 :<br><input class="form-control"  type="text" id="pPrice" name="pPrice" placeholder="개당 가격"><br>
                        상품설명 :<br><textarea class="form-control" rows="4" id="" name="" placeholder="상품설명"></textarea><br>
                        입고수 :<br><input class="form-control"  type="text" id="pInput" name="pInput" placeholder="입고 수량"><br>
                        사진 첨부 :<br>
                        <div class="input-group mb-3">
						  <div class="custom-file">
						    <input type="file" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01">
						    <label class="custom-file-label" for="inputGroupFile01">파일을 선택하세요</label>
						  </div>
						</div>
						<br>
						<button type="submit" class="btn btn-dark">등록하기</button>
                    	</div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->
<!-- 메인 작성 영역 -->
<%@ include file="../include/footer.jsp" %>