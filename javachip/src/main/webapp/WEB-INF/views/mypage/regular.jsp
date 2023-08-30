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
                    <h2>정기배송 관리</h2>
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
				    <th class="tg-m9t7">결제 금액</th>
				    <th class="tg-m9t7">결제 방법</th>
				    <th class="tg-m9t7">결제 주기</th>
				    <th class="tg-m9t7">신청일</th>
				    <th class="tg-m9t7">정기 배송<br>변경/취소</th>
				  </tr>
				</thead>
				<tbody>
					<c:forEach items="${regularList}" var="regular">
						<c:if test="${regular.oStatus eq 'O'}">
						  <tr style = "height : 100px">
						    <td class="tg-9wq8">(사진)</td>
						    <td class="tg-9wq8">${regular.pName}</td>
						    <td class="tg-9wq8">${regular.pPrice}</td>
						    <td class="tg-9wq8">신용카드</td>
						    <td class="tg-9wq8">1개월</td>
						    <td class="tg-9wq8">${regular.oDate.substring(0,10)}</td>
						    <td class="tg-9wq8">취소</td>
						  </tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</div>
    </div>
</section>

<section class = "subadd">
    <div class = "container">
    	<span> • 과거 정기배송 이력</span>
		<div class = "shoping__cart__table" style="margin-top:30px;">
	        <table>
				<thead>
				  <tr>
				    <th class="tg-m9t7">상품 사진</th>
				    <th class="tg-m9t7">상품명</th>
				    <th class="tg-m9t7">결제 금액</th>
				    <th class="tg-m9t7">결제 방법</th>
				    <th class="tg-m9t7">결제 주기</th>
				    <th class="tg-m9t7">마지막 결제일</th>
				    <th class="tg-m9t7">배송 이력</th>
				  </tr>
				</thead>
				<tbody>
					<c:forEach items="${regularList}" var="regular">
						<c:if test="${regular.oStatus ne 'O'}">
						  <tr style = "height : 100px">
						    <td class="tg-9wq8">(사진)</td>
						    <td class="tg-9wq8">${regular.pName}</td>
						    <td class="tg-9wq8">${regular.pPrice}</td>
						    <td class="tg-9wq8">신용카드</td>
						    <td class="tg-9wq8">1개월</td>
						    <td class="tg-9wq8">${regular.oDate.substring(0,10)}</td>
						    <c:if test="${regular.oStatus eq 'R'}">
							    <td class="tg-9wq8">배송 조회</td>
						    </c:if>
						    <c:if test="${regular.oStatus eq 'C'}">
							    <td class="tg-9wq8">취소</td>
						    </c:if>
						    <c:if test="${regular.oStatus eq 'E'}">
							    <td class="tg-9wq8">배송 완료</td>
						    </c:if>
						  </tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</section>

<!-- 배송지 설정 세션 끝 -->

<%@ include file="../include/footer.jsp" %>