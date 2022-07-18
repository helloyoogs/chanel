<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table width="500" cellpadding="0" cellspacing="0" border="1">
	<form action="modify.do">
	<input type="hidden" name="cId" value="${content_view.cId }">
		<tr>
			<td>상품id</td>
			<td>${content_view.sId}</td>
		</tr>
		<tr>
			<td>상품이름</td>
			<td> <input type="text" name="sName" value="${content_view.sName}"> </td>
		</tr>
		<tr>
			<td>상품이미지</td>
			<td> <input type="text" name="sImg" value="${content_view.sImg}"> </td>
		</tr>
		<tr>
			<td>상품사이즈</td>
			<td> <input type="text" name="sSize" value="${content_view.sSize}"> </td>
		</tr>
		<tr>
			<td>상품가격</td>
			<td> <input type="text" name="sPrice" value="${content_view.sPrice}"> </td>
		</tr>
		<tr>
			<td>상품재고</td>
			<td> <input type="text" name="sStock" value="${content_view.sStock}"> </td>
		</tr>
		<tr>
			<td>구매수량</td>
			<td> <input type="text" name="cQuantity" value="${content_view.cQuantity}"> </td>
		</tr>
		<tr>
			<td>전체가격</td>
			<td> <input type="text" name="cPriceAll" value="${content_view.cPriceAll}"> </td>
		</tr>
		<tr>
			<td>유저아이디</td>
			<td> <input type="text" name="memberId" value="${content_view.memberId}"> </td>
		</tr>
		<tr>
			<td>장바구니아이디</td>
			<td> <input type="text" name="sId" value="${content_view.sId}"> </td>
		</tr>
		<tr>
			<td colspan="5"> <input type="submit" value="수정">
			&nbsp;&nbsp;<a href="list.do">목록보기</a>
			&nbsp;&nbsp;<a href="delete.do?sId=${content_view.sId}">삭제</a></td>
		</tr>
	</form>



</table>
</body>
</html>



