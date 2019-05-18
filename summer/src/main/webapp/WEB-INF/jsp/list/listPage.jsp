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
	list_refresh(0);
});

function list_refresh(offset){
	$.ajax({
		type : "POST"
		, url : "/summer/listREST/getList.do"
		, data : {
			offset : offset
		}
		, success : function(data) {
			console.log(data);
			var rtvHtml = "";
			for(var i = 0;i < data.length;i++) {
				var temp = data[i];
				
				rtvHtml += "<tr>";
				rtvHtml += "<td style='text-align: center;'><input type='checkbox'></td>";
				rtvHtml += "<td style='text-align: center;'>";
				if(temp.list_stat == 1)
					rtvHtml += "" + temp.list_pri + "</td>";
				else
					rtvHtml += "-</td>";
				rtvHtml += "<td>" + temp.list_subject +"</td>";
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

			$("#list_tbody").empty();
			$("#list_tbody").prepend(rtvHtml);
		}
	    , error : function(e) {
	    	console.log(e.result);
	    }
	});
}

</script>
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
</div>
</body>
</html>