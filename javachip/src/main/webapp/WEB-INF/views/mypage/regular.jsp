<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<!-- 배너 세션 시작 -->
<section class="breadcrumb-section set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/breadcrumb.jpg" style="background-image: url(&quot;img/breadcrumb.jpg&quot;);">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Blog</h2>
                    <div class="breadcrumb__option">
                        <a href="<%= request.getContextPath() %>/">Home</a>
                        <span>정기배송 관리</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- 배너 세션 끝 -->

<!-- 배송지 설정 세션 시작 -->
<section class = "mainadd">
    <div class = "container">
        <h4>정기 배송 관리</h4>
        <span> • 정기배송 중인 상품</span>
        <div class = "shoping__cart__table" style="margin-top:30px;">
	        <table>
				<thead>
				  <tr>
				    <th class="tg-m9t7">상품 사진</th>
				    <th class="tg-m9t7">상품명</th>
				    <th class="tg-m9t7">상품 종류</th>
				    <th class="tg-m9t7">결제 금액</th>
				    <th class="tg-m9t7">결제 방법</th>
				    <th class="tg-m9t7">결제 주기</th>
				    <th class="tg-m9t7">다음 결제일</th>
				    <th class="tg-m9t7">정기 배송<br>변경/취소</th>
				  </tr>
				</thead>
				<tbody>
				  <tr style = "height : 100px">
				    <td class="tg-9wq8">(사진)</td>
				    <td class="tg-9wq8">아라비아 원두</td>
				    <td class="tg-9wq8">250g</td>
				    <td class="tg-9wq8">25,000원</td>
				    <td class="tg-9wq8">신용카드</td>
				    <td class="tg-9wq8">1개월</td>
				    <td class="tg-9wq8">2023.07.13</td>
				    <td class="tg-9wq8">변경 / 취소</td>
				  </tr>
				  <tr style = "height : 100px">
				    <td class="tg-9wq8">(사진)</td>
				    <td class="tg-9wq8">에티오피아 원두</td>
				    <td class="tg-9wq8">500g</td>
				    <td class="tg-9wq8">45,000원</td>
				    <td class="tg-9wq8">네이버페이</td>
				    <td class="tg-9wq8">2주</td>
				    <td class="tg-9wq8">2023.07.18</td>
				    <td class="tg-9wq8">변경 / 취소</td>
				  </tr>
				</tbody>
			</table>
		</div>
    </div>
</section>

<section class = "subadd">
    <div class = "container">
    	<span> • 과거 정기배송 이력</span>
    	<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups" style="margin-top:20px">
		  <div class="btn-group me-2" role="group" aria-label="First group">
		    <button type="button" class="btn btn-outline-primary">1주일</button>
		    <button type="button" class="btn btn-outline-primary">1개월</button>
		    <button type="button" class="btn btn-outline-primary">3개월</button>
		    <button type="button" class="btn btn-outline-primary">1년</button>
		  </div>
		</div>
		<div class = "shoping__cart__table" style="margin-top:30px;">
	        <table>
				<thead>
				  <tr>
				    <th class="tg-m9t7">상품 사진</th>
				    <th class="tg-m9t7">상품명</th>
				    <th class="tg-m9t7">상품 종류</th>
				    <th class="tg-m9t7">결제 금액</th>
				    <th class="tg-m9t7">결제 방법</th>
				    <th class="tg-m9t7">결제 주기</th>
				    <th class="tg-m9t7">마지막 결제일</th>
				    <th class="tg-m9t7">정기 배송<br>재개 신청</th>
				  </tr>
				</thead>
				<tbody>
				  <tr style = "height : 100px">
				    <td class="tg-9wq8">(사진)</td>
				    <td class="tg-9wq8">아라비아 원두</td>
				    <td class="tg-9wq8">250g</td>
				    <td class="tg-9wq8">25,000원</td>
				    <td class="tg-9wq8">신용카드</td>
				    <td class="tg-9wq8">1개월</td>
				    <td class="tg-9wq8">2023.06.12</td>
				    <td class="tg-9wq8">신청</td>
				  </tr>
				  <tr style = "height : 100px">
				    <td class="tg-9wq8">(사진)</td>
				    <td class="tg-9wq8">에티오피아 원두</td>
				    <td class="tg-9wq8">500g</td>
				    <td class="tg-9wq8">45,000원</td>
				    <td class="tg-9wq8">네이버페이</td>
				    <td class="tg-9wq8">2주</td>
				    <td class="tg-9wq8">2023.03.01</td>
				    <td class="tg-9wq8">신청</td>
				  </tr>
				</tbody>
			</table>
		</div>
	</div>
</section>

<!-- 배송지 설정 세션 끝 -->

<%@ include file="../include/footer.jsp" %>