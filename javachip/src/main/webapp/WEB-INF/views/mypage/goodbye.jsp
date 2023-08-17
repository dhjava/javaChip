<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
	<div class="frame login">
		<form name="goodbye frm" action="myinfoUpdate.do" method="post" onsubmit="return checks()">
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