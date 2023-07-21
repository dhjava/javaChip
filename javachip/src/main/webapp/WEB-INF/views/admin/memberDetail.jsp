<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberModify</title>
</head>
<body>
	<h4><b>회원 정보</b></h4>
	<table border="1">
		<tr>
			<th>
				아이디
			</th>
			<td>
				hong12
			</td>
			<th>
				이름
			</th>
			<td>
				홍길동
			</td>
		</tr>
		<tr>
			<th>
				회원 유형
			</th>
			<td>
				일반
			</td>
			<th>
				회원 등급
			</th>
			<td>
				5
			</td>
		</tr>

		<tr>
			<th rowspan="3">
				주소
			</th>
			<th>
				우편 번호
			</th>
			<td colspan="2">
				000-000
			</td>
		</tr>
		<tr>
			<td colspan="3">
				전라북도 전주시 ooo구 ooo동 ooo아파트
			</td>
		</tr>
		<tr>
			<td colspan="3">
				000동000호
			</td>
		</tr>
		<tr>	
			<th>
				상태
			</th>
			<td>
				활동
			</td>
			<th>
				누적 경고
			</th>
			<td>
				0
			</td>
		</tr>
	</table>
	구매 리스트
	<table border="1">
		<tr>
			<th>
				번호
			</th>
			<th>
				상품 이름
			</th>
			<th>
				구매 날짜
			</th>
			<th>
				상품 상태
			</th>
			<th>
				금액
			</th>
		</tr>
		<tr>
			<td>
				1
			</td>
			<td>
				커피1
			</td>
			<td>
				2023-00-00
			</td>
			<td>
				배달 완료
			</td>
			<td>
				10000
			</td>
		</tr>
		<tr>
			<td>
				2
			</td>
			<td>
				커피1
			</td>
			<td>
				2023-00-00
			</td>
			<td>
				배달 완료
			</td>
			<td>
				10000
			</td>
		</tr>
		<tr>
			<td>
				3
			</td>
			<td>
				커피1
			</td>
			<td>
				2023-00-00
			</td>
			<td>
				배달 완료
			</td>
			<td>
				10000
			</td>
		</tr>
		<tr>
			<td>
				4
			</td>
			<td>
				커피1
			</td>
			<td>
				2023-00-00
			</td>
			<td>
				배달 완료
			</td>
			<td>
				10000
			</td>
		</tr>

	</table>
	환불 리스트
	<table border="1">
		<tr>
			<th>
				번호
			</th>
			<th>
				상품 이름
			</th>
			<th>
				구매 날짜
			</th>
			<th>
				환불 날짜
			</th>
			<th>
				환불 상태
			</th>
			<th>
				환불 사유
			</th>
		</tr>
		<tr>
			<td>
				1
			</td>
			<td>
				커피1
			</td>
			<td>
				2023-02-22
			</td>
			<td>
				2023-02-25
			</td>
			<td>
				환불 완료
			</td>
			<td>
				잘못된 상품
			</td>
		</tr>
		<tr>
			<td>
				2
			</td>
			<td>
				커피2
			</td>
			<td>
				2023-03-22
			</td>
			<td>
				2023-03-22
			</td>
			<td>
				환불 완료
			</td>
			<td>
				상품 변경
			</td>
		</tr>
	</table>
</body>
</html>