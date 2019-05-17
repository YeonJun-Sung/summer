<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js" /></script>
	<title>2019 Summer Coding - TODO List</title>
</head>
<body>
<script type="text/javascript">

$(document).ready(function(){
	$("#create").on("click", function(){
		$.ajax({
	        type : "POST"
	        , url : "/summer/create/createPage.do"
	        , data : { }
	        , success : function() {}
	        , error : function(e) {
	        	console.log(e.result);
	        }
	    });
	});
	$("#view").on("click", function(){
		$.ajax({
	        type : "POST"
	        , url : "/summer/list/listPage.do"
	        , data : { }
	        , success : function() {}
	        , error : function(e) {
	        	console.log(e.result);
	        }
	    });
	});
	$("#alarm").on("click", function(){
		$.ajax({
	        type : "POST"
	        , url : "/summer/alarm/alarmPage.do"
	        , data : { }
	        , success : function() {}
	        , error : function(e) {
	        	console.log(e.result);
	        }
	    });
	});
});

</script>
<div class='main_div'>
	<input type='button' class='main_button' id='create' value='TODO 생성'>
	<input type='button' class='main_button' id='view' value='TODO 리스트 보기'>
	<input type='button' class='main_button' id='alarm' value='마감된 TODO'>
</div>
</body>
</html>