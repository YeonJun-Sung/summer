<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<input type='hidden' id='list_key' value='${list_key }'>
</form>
<div class='div_80'>
	<div class='subject' id='detail_subject'></div>
	<div class='date' id='detail_date'></div>
	<div class='contents' id='detail_contents'></div>
	<input type='button' class='edit_button' id='cancel' value='돌아가기'>
	<input type='button' class='edit_button' id='edit' value='수정' style='margin-right: 15px;'>
</div>
</body>
</html>