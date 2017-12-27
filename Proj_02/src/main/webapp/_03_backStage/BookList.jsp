<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="_03_backStage.model.*"%>
<jsp:useBean id="productListingBookSvc" class="_03_backStage.model.EventService"></jsp:useBean>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8/BIG5">
<title>���ʪ���</title>
<link rel="shortcut icon" href="../img/favicon.ico.png"  type="image/x-icon"/>

<script type="text/javascript" src="../js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="../js/jquery.tablesorter.js"></script> 
</head>

<style>
.peoplePic {
	background: #1e90ff;
	-webkit-clip-path: circle(50% at 50% 50%);
	clip-path: circle(50% at 50% 50%);
	height: 40px;
	width: 40px;
}

input[type="submit"] {
	position: relative;
	display: inline-block;
 	background: #D0EEFF;
 	border: 1px solid #99D3F5;
 	border-radius: 4px;
 	padding: 4px 12px;
 	overflow: hidden;
 	color: #1E88C7;
 	text-decoration: none;
 	text-indent: 0;
 	line-height: 20px;
}

.file {
	position: relative;
	display: inline-block;
 	background: #D0EEFF;
 	border: 1px solid #99D3F5;
 	border-radius: 4px;
 	padding: 4px 12px;
 	overflow: hidden;
 	color: #1E88C7;
 	text-decoration: none;
 	text-indent: 0;
 	line-height: 20px;
}

.file:hover {
	background: #AADFFD;
 	border-color: #78C3F3;
 	color: #004974;
 	text-decoration: none;
}

.file input {
 	position: absolute;
 	font-size: 100px;
 	right: 0;
 	top: 0;
 	opacity: 0;
}

.TrLeft{
	width:300px;
}

/* table{ */
/* 	width:1650px; */
/* 	background-color:#CEF6F5; */
/*  	margin-left:50px;  */
/* 	color:black; */
/* 	font-family:Microsoft JhengHei; */
/* 	border:3px black solid; */
/*  	font-size: 16px; */
/* } */
table.tablesorter {
font-family:arial;
	background-color: #CDCDCD;
	margin:10px 0pt 15px;
	font-size: 13pt;
	width: 100%;
	text-align: left;
}
table.tablesorter thead tr th, table.tablesorter tfoot tr th {
 	background-color: #F7D3F3; 
	border: 1px solid #FFF;
	font-size: 13pt;
	padding: 4px;
	color:black;
}
table.tablesorter thead tr .header {
	background-image: url(../img/bg.gif);
	background-repeat: no-repeat;
	background-position: center right;
	cursor: pointer;
}
table.tablesorter tbody td {
	color: #3D3D3D;
	padding: 4px;
	background-color: #FFF;
	vertical-align: top;
}
table.tablesorter tbody tr.odd td {
	background-color:#F4F0F0;
}
table.tablesorter thead tr .headerSortUp {
	background-image: url(../img/asc.gif);
}
table.tablesorter thead tr .headerSortDown {
	background-image: url(../img/desc.gif);
}
table.tablesorter thead tr .headerSortDown, table.tablesorter thead tr .headerSortUp {
background-color: #9BC5FD;
}


.wire{
	padding: 8px;
	text-align: left;
	border-bottom: 2px solid #D8CEF6;
}

.sexyborder{
	width:	555px;
	border: 1px solid #0066cc;
	padding: 5px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
}

</style>

<body>

<%-- 	<jsp:include page="/fragment/top.jsp" /> --%>
	<br>
	<br>
	<br>
	<br>
	<br>
<header class="intro">
        <div class="intro-body">         
 					<%-- ���~�C�� --%>
	<c:if test="${not empty errorMsgs}">
		<font color='red'>�Эץ��U�C���~:
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<il>${message}</il>
				</c:forEach>
			</ul>
		</font>
	</c:if>

	<table border='1' bordercolor='#CCCCFF' width='2500' id="myTable" class="tablesorter">
	<thead>
		<tr>
			<th width="5%">���ʽs��</th>
			<th width="8%">���ʹϤ�</th>
			<th width="8%">���ʦW��</th>
			<th width="3%">���ʲ���</th>
			<th width="8%">�O�_�K�O</th>
			<th width="8%">���ʶ}�l���</th>
			<th width="8%">���ʵ������</th>
			<th width="6%">�t�X���</th>
			<th>���ʳs���H</th>
			<th>����²��</th>
			<th></th>
			<th></th>
		</tr>
		</thead>
<%-- 		<%@ include file="page1.file"%> --%>
	<tbody>
		<c:forEach var="eventVO" items="${productListingBookSvc.all}">
			<tr align='center' align='middle'>
				<td align="center" >${eventVO.eventID}</td> 				
				<td>
					<img height="100" width="100" src="${eventVO.imageFile}" />
				</td>
				<td>${eventVO.eventName}</td> 
				<td>${eventVO.fee}</td> 
				<td>${eventVO.isCharge}</td> 
				<td>${eventVO.durationStart}</td> 
				<td>${eventVO.durationEnd}</td> 
				<td>${eventVO.showGroupName}</td> 
				<td>${eventVO.contactName}</td> 
				<td align="left">${eventVO.briefIntroduction}</td> 
 						<td>
							<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/book/book.do">
							<input type="submit" value="�ק�">
							<input type="hidden" name="EventID" value="${eventVO.eventID}">
							<input type="hidden" name="action" value="getOne_For_Update"></FORM>			
						</td>
						<td>
							<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/book/book.do">
							<input type="submit" value="�R��">
							<input type="hidden" name="EventID" value="${eventVO.eventID}">
							<input type="hidden" name="action" value="delete"></FORM>			
						</td>	
			</tr>
		</c:forEach>
		</tbody>
	</table>
        </div>
    </header>
</body>
<script type="text/javascript">
$(function () {

	$("table").tablesorter({
		headers : {
			1 : {sorter : false},
			9 : {sorter : false},
			10 : {sorter : false},
			11 : {sorter : false},
			
		}
	});
    
});
</script>
</html>