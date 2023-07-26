<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>회원탈퇴</h2>
                        <div class="breadcrumb__option">
                            <a href="<%= request.getContextPath() %>/">홈</a>
                            <a href="main.do">마이페이지</a>
                            <span>회원탈퇴</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    
	<div class="frame login">
		<form name="goodbye frm">
			<h3>회원탈퇴</h3>
			<div class="main login">
				<br>
				javachip 계정<br>
				<input type="password" style="margin-top:10px;" placeholder="비밀번호"><br>
			</div>
			<input class="login btn" type="submit" value="탈퇴하기"><br>
			<input type="button" class="btn btn-outline-secondary" style="width:150px; height:40px; margin-top:10px;" value="돌아가기">
		</form>
	</div>
</body>
</html>
<%@ include file="../include/footer.jsp" %>