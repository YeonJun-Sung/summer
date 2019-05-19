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
	
	$("#back").on("click", function(){
		var form = $("#send_form");
		form.attr('action', "/summer/list/listPage.do");
		form.submit();
	});
	
	$("body").on("change", ".list_priority", function(){
		var priority = $(this).val();
		var list_key = $(this).data("key");
		if(priority <= 0) {
			$(this).val("");
			$.ajax({
				type : "POST"
				, url : "/summer/listREST/removePriority.do"
				, data : {
					list_key: list_key
				}
				, success : function(data) {
					console.log(data);
					
					listRefresh();
				}
			    , error : function(e) {
			    	console.log(e.result);
			    }
			});
		}
		else {
			$.ajax({
				type : "POST"
				, url : "/summer/listREST/setPriority.do"
				, data : {
					priority: priority
					, list_key: list_key
				}
				, success : function(data) {
					console.log(data);
					
					listRefresh();
				}
			    , error : function(e) {
			    	console.log(e.result);
			    }
			});
		}
	});
});

function listRefresh(){
	if(list_size == 0) {
		var rtvHtml = "";
		for(var i = 0;i < 10;i++) {
			rtvHtml += "<tr style='height: 49px;'>";
			rtvHtml += "<td colspan='5'></td>";
			rtvHtml += "</tr>";
		}

		$("#list_tbody").empty();
		$("#list_tbody").prepend(rtvHtml);
		
		return;
	}
	
	$.ajax({
		type : "GET"
		, url : "/summer/listREST/getList.do"
		, data : {
			offset : offset
			, check: "pri"
		}
		, success : function(data) {
			console.log(data);
			var rtvHtml = "";
			
			if(data.length == 0) {
				offset = (offset - 10 < 0?0:offset - 10);
				listRefresh()
				return;
			}
			
			for(var i = 0;i < data.length;i++) {
				var temp = data[i];
				
				rtvHtml += "<tr style='height: 49px;'>";
				rtvHtml += "<td style='text-align: center; padding: 0px;'>";
				rtvHtml += "<input type='number' class='list_priority' value='"
				if(temp.list_stat == 1)
					rtvHtml += "" + temp.list_pri;
				rtvHtml += "' data-key='" + temp.list_key + "' style='text-align: center;'></td>";
				rtvHtml += "<td class='list_subject'>" + temp.list_subject +"</td>";
				rtvHtml += "<td style='text-align: center;'>";
				if(temp.list_date != null && temp.list_date != "")
					rtvHtml += "" + temp.list_date + "</td>";
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
		, data : {
			check: "pri"
		}
		, success : function(data) {
			console.log(data);
			list_size = data;
			page_size = Math.ceil(list_size / 10);
			paging();
			listRefresh();
		}
	    , error : function(e) {
	    	console.log(e.result);
	    }
	});
}

function paging() {
	var rtvHtml = "<input type='button' id='pre_bt' value='<' style='margin-right: 30px;'>";
	
	if(page_size == 0){
		rtvHtml += "<span class='page' style='padding: 0px 10px;'>";
		rtvHtml += "" + 1;
		rtvHtml += "</span>";
	}
	else {
		for(var i = min;i < min + 10;i++) {
			rtvHtml += "<span class='page' style='padding: 0px 10px;'>";
			rtvHtml += "" + i;
			rtvHtml += "</span>";
			if(i == page_size)	break;
		}
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
	<input type='button' class='edit_button' id='back' value='뒤로' style='margin-bottom: 5px;'>
	<table class='list_table'>
		<colgroup>
			<col width='5%'/>
			<col width='75%'/>
			<col width='20%'/>
		</colgroup>
		<thead>
			<tr>
				<th>우선순위</th>
				<th>제목</th>
				<th>마감기한</th>
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