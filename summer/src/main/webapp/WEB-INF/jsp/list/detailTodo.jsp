<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js" /></script>
	<title>2019 Summer Coding - Create TODO</title>
</head>
<body>
<script type="text/javascript">

$(document).ready(function(){
	$("#cancel").on("click", function(){
		var form = $("#send_form");
		form.attr('action', "/summer/list/listPage.do");
		form.submit();
	});
	
	$("#edit").on("click", function(){
		var form = $("#send_form");
		form.attr('method', "POST");
		form.attr('action', "/summer/list/editTodo.do");
		form.submit();
	});
});


</script>
<form id="send_form">
	<input type='hidden' id='list_key' value='${todo.list_key }'>
</form>
<div class='div_80'>
	<table class='detail_table'>
		<colgroup>
			<col width='10%'/>
			<col width='70%'/>
			<col width='20%'/>
		</colgroup>
		<tr style='height:30px;'>
			<td style='text-align:center;'>제목</td>
			<td id='detail_subject'>${todo.list_subject }</td>
			<td id='detail_date' style='text-align:center;'>
				<c:if test='${todo.list_date == null || todo.list_date == "" }'>-</c:if>
				<c:if test='${todo.list_date != null && todo.list_date != "" }'>${todo.list_date }</c:if>
			</td>
		</tr>
		<tr style='height:500px; vertical-align: top;'>
			<td style='text-align: center;vertical-align: middle;'>내용</td>
			<td id='detail_contents' colspan='2'>${todo.list_content }</td>
		</tr>
	</table>
	<input type='button' class='edit_button' id='cancel' value='돌아가기'>
	<input type='button' class='edit_button' id='edit' value='수정' style='margin-right: 15px;'>
</div>
</body>
</html>