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

var min = 1;
var list_size = 0;
var page_size = 0;
var offset = 0;

$(document).ready(function(){
	listRefresh();
	getListSize();

	$("body").on("click", "#pre_bt", function(){
		if(min != 1){
			console.log("pre");
			min = min - 10;
			paging();
		}
	});
	
	$("body").on("click", "#next_bt", function(){
		if(min + 10 <= page_size){
			console.log("next");
			min = min + 10;
			paging();
		}
	});
	
	$("body").on("click", ".page", function(){
		var page = $(this).text();
		if(offset != (page - 1) * 10) {
			offset = (page - 1) * 10;
			listRefresh();
		}
	});
	
	$("body").on("click", ".list_subject", function(){
		var key = $(this).data("key");
		var form = $("#send_form");
		$("#list_key").val(key);
		console.log(key);
		form.attr('method', 'POST');
		form.attr('action', "/summer/list/detailTodo.do");
		form.submit();
	});
});

function listRefresh(){
	$.ajax({
		type : "GET"
		, url : "/summer/listREST/getList.do"
		, data : {
			offset : offset
		}
		, success : function(data) {
			console.log(data);
			var rtvHtml = "";
			for(var i = 0;i < data.length;i++) {
				var temp = data[i];
				
				rtvHtml += "<tr style='height: 49px;'>";
				rtvHtml += "<td style='text-align: center;'><input type='checkbox'></td>";
				rtvHtml += "<td style='text-align: center;'>";
				if(temp.list_stat == 1)
					rtvHtml += "" + temp.list_pri + "</td>";
				else
					rtvHtml += "-</td>";
				rtvHtml += "<td class='list_subject' data-key='" + temp.list_key + "'>" + temp.list_subject +"</td>";
				rtvHtml += "<td style='text-align: center;'>";
				if(temp.list_date != null && temp.list_date != "")
					rtvHtml += "" + temp.list_date + "</td>";
				else
					rtvHtml += "-</td>";
				rtvHtml += "<td style='text-align: center;'>";
				if(temp.list_stat == 3)
					rtvHtml += "완료</td>";
				else
					rtvHtml += "-</td>";
				rtvHtml += "</tr>";
			}
			
			for(var i = 0;i < 10 - data.length;i++) {
				rtvHtml += "<tr style='height: 49px;'>";
				rtvHtml += "<td colspan='5'></td>";
				rtvHtml += "</tr>";
			}

			$("#list_tbody").empty();
			$("#list_tbody").prepend(rtvHtml);
		}
	    , error : function(e) {
	    	console.log(e.result);
	    }
	});
}

function getListSize() {
	$.ajax({
		type : "GET"
		, url : "/summer/listREST/getListSize.do"
		, data : {}
		, success : function(data) {
			console.log(data);
			list_size = data;
			page_size = list_size / 10;
			paging();
		}
	    , error : function(e) {
	    	console.log(e.result);
	    }
	});
}

function paging() {
	var rtvHtml = "<input type='button' id='pre_bt' value='<' style='margin-right: 30px;'>";
	for(var i = min;i < (min + 10 <= page_size?min + 10:page_size + 1);i++) {
		rtvHtml += "<span class='page' style='padding: 0px 10px;'>";
		rtvHtml += "" + i;
		rtvHtml += "</span>";
	}
	rtvHtml += "<input type='button' id='next_bt' value='>' style='margin-left: 30px;'>";
	
	$(".paging_div").empty();
	$(".paging_div").append(rtvHtml);
	
}

</script>
<form id='send_form'>
	<input type='hidden' name='list_key' id='list_key' value=''>
</form>
<div class='div_80'>
	<table class='list_table'>
		<colgroup>
			<col width='10%'/>
			<col width='10%'/>
			<col width='50%'/>
			<col width='20%'/>
			<col width='10%'/>
		</colgroup>
		<thead>
			<tr>
				<th></th>
				<th>우선순위</th>
				<th>제목</th>
				<th>마감기한</th>
				<th>완료여부</th>
			</tr>
		</thead>
		<tbody id='list_tbody'>
			<tr>
				<td colspan='5'></td>
			</tr>
		</tbody>
	</table>
	<div class='paging_div' style='text-align: center; padding-top:25px;'></div>
</div>
</body>
</html>