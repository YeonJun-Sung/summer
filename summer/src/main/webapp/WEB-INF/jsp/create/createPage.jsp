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
		form.attr('method', "POST");
		form.attr('action', "/summer/main/mainPage.do");
		form.submit();
	});
	
	$("#create").on("click", function(){
		var subject = $("#create_subject").val();
		var date = $("#create_date").val();
		var contents = $("#create_contents").val();
		contents = contents.replace(/(?:\r\n|\r|\n)/g, '<br />');
		console.log(contents);

		var date_valid = dateValidation(date);
		
		console.log(date_valid);
		if(!date_valid)	{
			$("#create_date").val("");
		}
		else if(subject == null || subject == ""){
			alert("제목을 입력해주세요.");
		}
		else if(contents == null || contents == ""){
			alert("내용을 입력해주세요.");
		}
		else {
			$.ajax({
				type : "POST"
				, url : "/summer/createREST/saveTodo.do"
				, data : {
					subject : subject
					, date : date
					, contents : contents
				}
				, success : function(data) {
					var form = $("#send_form");
					form.attr('method', "POST");
					form.attr('action', "/summer/main/mainPage.do");
					form.submit();
				}
			    , error : function(e) {
			    	console.log(e.result);
			    }
			});
		}
	});
});


function dateValidation(date) {
	var month_check = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"];
	var day_check = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
	var date_split = date.split("-");
	var Y, M, D;
	if(date == null || date == "")
		return true;
	else if(date_split.length != 3){
		alert("마감기한을 'YYYY-MM-DD' 형식에 맞춰 입력해주세요.");
		return false;
	}
	else {
		Y = parseInt(date_split[0]);
		M = parseInt(date_split[1]);
		D = parseInt(date_split[2]);
	}
	
	var today = new Date();
	var year = today.getFullYear();
	var month = today.getMonth() + 1;
	var day = today.getDate();
	var date_form = "" + year + "-" + ((month < 10)?("0"+month):month) + "-" + ((day < 10)?("0"+day):day);

	if(Y < year)
		alert("마감기한을 '" + date_form + "' 이후로 입력해주세요.");
	else if(Y == year && M < month)
		alert("마감기한을 '" + date_form + "' 이후로 입력해주세요.");
	else if(Y == year && M == month && D < day)
		alert("마감기한을 '" + date_form + "' 이후로 입력해주세요.");
	else if($.inArray(date_split[1], month_check) == -1)
		alert("마감기한을 'YYYY-MM-DD' 형식에 맞춰 입력해주세요.");
	else if(D > day_check[M - 1] || D < 1)
		alert("마감기한을 'YYYY-MM-DD' 형식에 맞춰 입력해주세요.");
	else
		return true;
	
	return false;
}

</script>
<form id="send_form"></form>
<div class='div_80'>
	<table class='detail_table'>
		<colgroup>
			<col width='80%'/>
			<col width='20%'/>
		</colgroup>
		<tr style='height:30px;'>
			<td id='detail_subject'>
				<input type='text' class='subject' id='create_subject' placeholder='제목을 입력하세요.'>
			</td>
			<td id='detail_date' style='text-align:center;'>
				<input type='text' class='date' id='create_date' placeholder='YYYY-MM-DD'>
			</td>
		</tr>
		<tr style='height:500px; vertical-align: top;'>
			<td id='detail_contents' colspan='2'>
				<textarea class='contents' id='create_contents' placeholder='내용을 입력하세요.'></textarea>
			</td>
		</tr>
	</table>
	<input type='button' class='edit_button' id='cancel' value='취소'>
	<input type='button' class='edit_button' id='create' value='생성' style='margin-right: 15px;'>
</div>
</body>
</html>