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
	
});

</script>
<div class='div_80'>
	<input type='text' class='subject' id='create_subject' placeholder='제목을 입력하세요.'>
	<input type='text' class='date' id='create_date' placeholder='YYYY-MM-DD'>
	<textarea type='text' class='contents' id='create_contents' placeholder='내용을 입력하세요.'></textarea>
	<input type='button' class='edit_button' id='cancel' value='취소'>
	<input type='button' class='edit_button' id='create' value='생성' style='margin-right: 15px;'>
</div>
</body>
</html>