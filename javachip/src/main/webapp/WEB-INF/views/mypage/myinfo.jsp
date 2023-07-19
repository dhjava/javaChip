<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>회원정보 수정</h2>
						<div class="breadcrumb__option">
							<a href="./index.jsp">Home</a>
							<a href="./mypage-main.jsp">마이페이지 </a>
							<span>회원정보 수정</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->
<section class="join spad">
        <div class="container">
            <div class="join__form">
                <h4>회원정보 수정</h4>
                <form action="#">
                    <div class="join__input">
                    	<p>아이디</p>
                        	<input type="text" class="join__input__short">
                        	<button type="button" class="btn btn-outline-secondary">중복 체크</button>
                    	<p>비밀번호<span>*</span></p>
                        	<input type="password" class="join__input__short">
                        <p>비밀번호 확인<span>*</span></p>
                        	<input type="password" class="join__input__short">
                        <p>성명<span>*</span></p>
                        	<input type="text" class="join__input__short">
                        <p>주소<span>*</span></p>
	                        <input type="text" placeholder="우편번호" class="join__input__short">
	                        <button type="button" class="btn btn-outline-secondary">우편번호</button>
	                        <input type="text" placeholder="주소" class="join__input__add">
	                        <input type="text" placeholder="나머지 주소" class="join__input__add">
                        <p>전화번호<span>*</span></p>
	                        <select class="joinNum">
								<option value="010" selected>
								010
								</option>
								<option value="011">
								011
								</option>
								<option value="016">
								016
								</option>
								<option value="017">
								017
								</option>
								<option value="018">
								018
								</option>
								<option  value="019">
								019
								</option>
							</select>
							- <input class="joinNum" type="text"> - <input  class="joinNum" type="text">
                        <p>이메일<span>*</span></p>
                        	<input type="text" class="join__input__email">
                   	</div>
                   	<hr>
					<div class="join__submit">
						<input type="submit" class="btn btn-primary" value="정보수정">
						<input type="reset" class="btn btn-outline-secondary" value="취소">
					</div>
                </form>
            </div>
        </div>
    </section>
<%@ include file="../include/footer.jsp" %>