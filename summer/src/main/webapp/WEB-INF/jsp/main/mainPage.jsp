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
		var form = $("#send_form");
		form.attr('action', "/summer/create/createPage.do");
		form.submit();
	});
	
	$("#view").on("click", function(){
		var form = $("#send_form");
		form.attr('action', "/summer/list/listPage.do");
		form.submit();
	});
	
	$("#alarm").on("click", function(){
		var form = $("#send_form");
		form.attr('action', "/summer/alarm/alarmPage.do");
		form.submit();
	});
	
	$("body").on("click", ".black, #close", function(){
		$(".black").hide();
		$(".alarm_dialog").hide();
	});
	
	$.ajax({
		type : "POST"
		, url : "/summer/alarmREST/expireTodo.do"
		, data : {
			check : "alarm"
		}
		, success : function(data) {
			console.log(data);
			if(data != 0){
				$(".black").show();
				$(".alarm_dialog").show();
				var rtvHtml = "";
				for(var i = 0;i < data.length;i++) {
					var temp = data[i];
					rtvHtml += "<div style='margin-bottom:10px;'> ▶ " + temp.list_subject + "</div>";
				}
				$(".vertical_scroll").empty();
				$(".vertical_scroll").append(rtvHtml);
			}
		}
	    , error : function(e) {
	    	console.log(e.result);
	    }
	});
});
</script>
<form id="send_form">
</form>
<div class='main_div'>
	<input type='button' class='main_button' id='create' value='TODO 생성'>
	<input type='button' class='main_button' id='view' value='TODO 리스트 보기'>
	<input type='button' class='main_button' id='alarm' value='마감된 TODO'>
</div>
<div class='black'></div>
<div class='alarm_dialog'>
	<input type='button' class='edit_button' id='close' value='X' style='margin-bottom: 5px; width: 26px; height: 21px;'>
	<div class='vertical_scroll' style='overflow-y:scroll; width:100%; height: 374px;'>
		
	</div>
</div>
</body>
</html>