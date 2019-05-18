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
});


</script>
<div>
	<table class='list_table'>
		<colgroup>
			<col width='50%'/>
			<col width='50%'/>
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
				<td><input type='checkbox'></td>
				<td>priority</td>
				<td>subject</td>
				<td>date</td>
				<td>status</td>
			</tr>
		</tbody>
	</table>
</div>
</body>
</html>