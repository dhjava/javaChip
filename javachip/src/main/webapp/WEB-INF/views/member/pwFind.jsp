<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
	<div class="frame login">
		<form name="login frm" action="pwFind.do" method="post">
			<h2>비밀번호 찾기</h2>
			<div class="main login">
				<br>
				<input type="text" placeholder="이름" id="uName" name="uName"><br>
				<input type="text" placeholder="아이디" id="uId" name="uId"><br>
				<input type="text" placeholder="이메일" id="uMail" name="uMail"><br>
				<input class="login btn"  type="button" onclick="emailAuth()" value="임시 비밀번호 전송">
				<input type="hidden" id="mail-check-input">
			</div>
			
			<div>
			<c:if test="${check == 1}">
			<script>
				opener.document.findform.uName.value = "";
				opener.document.findform.uId.value = "";
				opener.document.findform.uMail.value = "";
			</script>
			<label>일치하는 정보가 존재하지 않습니다.</label>
			</c:if>
			<!-- 이름과 비밀번호가 일치하지 않을 때 -->
			<c:if test="${check == 0 }">
			<label>찾으시는 계정의 이메일로 임시 비밀번호가 발급되었습니다.<br>로그인 후 비밀번호를 변경해주세요!</label>
			<div class="form-label-group" style="margin-bottom:20px;">
					<input class="login btn" type="button" value="로그인" 
					onclick="location.href='<%=request.getContextPath() %>/member/login.do'">
			</div>
			</c:if>
			</div>
			<div id="msg_id">
			</div>
		</form>
		
	</div>
	<script type="text/javascript">
	<!-- 이메일 인증  -->
		function emailAuth()
		{
			$(".mail-check-input").prop("type","text");
			var uId_email = $("#uMail").val();
			var	checkinput = $(".mail-check-input") //인증번호 입력 창 
			if( uId_email.trim() == "")
			{
				$("#msg_id").text("이메일 이름을 써주세요");
				$("#msg_id").css("color","#FE642E");
				$("#uMail").focus();
			}else{
				
				uId_email.trim();
				console.log("emailAuth="+uId_email);
				$.ajax({
					url: "<%= request.getContextPath()%>/member/emailAuth.do",
					type : "POST",
					data : {"uId_email": uId_email},
					success :function(data){
						//히든 값 변경으로 인증번호 쓰기 
						console.log("emailAuth="+data);
						code = data;
					},
					error : function(){
						alert("요청실패");
					}
				});
			}
		}
		
		$('.mail-check-input').blur(function () {
			var inputCode = $(this).val();
			const $resultMsg = $('#msg_email');
			
			if(inputCode === code){
				$resultMsg.html('인증번호가 일치합니다.');
				$resultMsg.css('color','green');
				$('#mail-Check-Btn').attr('disabled',true);
				$('#userEamil1').attr('readonly',true);
				$('#userEamil2').attr('readonly',true);
				$('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
		         $('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
			}else{
				$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
				$resultMsg.css('color','red');
			}
		});
</script>
<%@ include file="../include/footer.jsp" %>