<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table width="500" cellpadding="0" cellspacing="0" border="1">
	<form action="modify.do">
	<input type="hidden" name="sId" value="${content_view.sId }">
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
			<td colspan="2"> <input type="submit" value="수정">
			&nbsp;&nbsp;<a href="list.do">목록보기</a>
			&nbsp;&nbsp;<a href="delete.do?sId=${content_view.sId}">삭제</a>
			&nbsp;&nbsp;<a href="reply_view.do?sId=${content_view.sId}">답변</a>
		</tr>
	</form>



</table>
</body>
</html>



