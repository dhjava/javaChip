/* help */

var checkTitleFlag = false;
var checkPNoFlag = false;
var checkContentsFlag = false;
var submitFlag = false;

// help qna write submit
function helpSubmitFn() {
	
	// QnA 제목이 입력되지 않았을 때
	if($("#qTitle").val() == "") {
			checkTitleFlag = false;
			alert("제목을 입력해주세요.");
			$("#qTitle").focus();
			
			return;
		}else
	// QnA 내용이 입력되지 않았을 때
	if($("#qContents").val() == "") {
			checkContentsFlag = false;
			alert("내용을 입력해주세요.");
			$("#qContents").focus();
			
			return;
		}else
	// QnA 제목과 내용이 있을경우
	{
		checkTitleFlag = true;
		checkContentsFlag = true;
	}
	
	// 상품 QnA가 선택되고, 상품이 선택되지 않았을 때	
	if( $("#qType").val() == "pQna" ) {
		
			if($("#pNo").val() == 0) {
				checkPNoFlag = false;
				alert("질문하실 상품을 선택해주세요.");
				 $("#pNo").focus();
			}else {
			// 상품QnA가 선택되고, 상품이 선택되었을 경우
				checkPNoFlag = true;
			}
	}else {
	// 일반 QnA일때	
		checkPNoFlag = true;
	
	}
	// Flag확인하고 submit
	if(checkTitleFlag && checkPNoFlag && checkContentsFlag){
		submitFlag = true;
	}
	
	if(submitFlag) {
		// 선택 불가한 select 값 form에 전송하기위해 disabled 값 제거
		$("#pNo").prop('disabled',false);
		// 제출
		$("form").submit();
	}
}

// help qna Type select
function selectQTypeFn(){	
	
	var htmlTag = "";	
	
	if ( $("#qType").val() == "pQna" ) {
		/* 상품 select start*/
		htmlTag += "<p>문의 상품<p>";
		htmlTag += "<div class='pNoSelectWrap'>";
		htmlTag += "<div class='pNoEvent' ";
		htmlTag += "onmouseover='pNoSelectWrapInFn();' onmouseleave='pNoSelectWrapOutFn()' onclick='openSelectBoxFn();'>";
		htmlTag += "</div>";
		htmlTag += "<select name='pNo' id='pNo' class='pSelect board-type nice-select' ";
		htmlTag += "disabled>";
		/* 상품 option start */
		htmlTag += "<option name='pNoOption'";
		htmlTag += "value = '" + "'>";
		htmlTag += "=====상품 선택=====";
		htmlTag += "</option>";
		htmlTag += "<option name='posOption' id='posOption'>";
		htmlTag += "</option>";
		/* 상품 option end */
		htmlTag += "</div>";
		
	}else{
		return $("#addQnaSelect").html("");
	}
		return $("#addQnaSelect").html(htmlTag);
}

function selectPNoFn(){	
	
	var htmlTag = "";	
	// 상품 QnA일때,
	if ( $("#qType").val() == "pQna" ) {
		
		// pNo가 선택되지 않았을 때,
		if ( $("#pNo").val() == "" ) {
			
		}else {
		// qNo가 선택되었을 때,
			htmlTag += "<div class='pContainer pInfo'>"
			htmlTag += "<div class='img pInfo'>"
			htmlTag += " 상품 이미지"
			htmlTag += "</div>"
			htmlTag += "<div>"
			htmlTag += " 상품 명 : " + $("#pNo").val();
			htmlTag += "</div>"
			htmlTag += "</div>"
		}
	// 상품 QnA가 아닐 때
	}else{
		
	}
		return $("#pInfo").html(htmlTag);
}

window.onload = selectQTypeFn;
window.onload = selectPNoFn;

// wrap css 이벤트
function pNoSelectWrapInFn(){
		$(".pSelect").css({borderColor: '#dcdcdc' });
}
function pNoSelectWrapOutFn(){
		$(".pSelect").css({borderColor: '#e8e8e8' });
}

// qna select 창
function openSelectBoxFn() {
	$("#pSelectContainer").removeClass("modalHidden");
}

function closeSelectBoxFn() {
	$("#pSelectContainer").addClass("modalHidden");
}

// 게시글 취소 재확인 문구
function helpResetFn() {
	if( confirm("작성된 게시글을 취소하시겠습니까?") ) {
		//true
		location.href="qna.do";
	}else {
		// false
		return;
	}	
}

// Pno 자식창에서 값보내기
function sendPnoFn() {
	var radioVal = $("input[name=pNoRadio]:radio").val();
	
	if( radioVal == null && reaionVal.equals("") ) {
		alert("상품을 선택하세요.");
		return;
	}else {
	// 값을 넣기전에 공간을 비워두고 넣음.
		var getVal = $("input[name=pNoRadio]:checked").val();
		$("#posOption").empty();
		
		$("#posOption").append(getVal);
		
	// 추가된 option에 val 값 설정
		$('#posOption').attr('value',getVal);
		$("#posOption").attr("selected",true);
	}
	// 선택된 상품의 info 출력
		selectPNoFn();
	// 모달 닫기	
		closeSelectBoxFn();
}
