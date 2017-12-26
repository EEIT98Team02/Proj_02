<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="_03_backStage.model.*"%>
<%
      EventVO eventVO = (EventVO) request.getAttribute("eventVO");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8/BIG5">
<title>���ʷs�W</title>
<link rel="shortcut icon" href="../img/favicon.ico.png"  type="image/x-icon"/>

<!-- <script src="js/cmxforms.js" type="text/javascript"></script> -->


<style>
#commentForm {
		width: 500px;
	}
	#commentForm label {
		width: 250px;
	}
	#commentForm label.error, #commentForm input.submit {
		margin-left: 253px;
	}
	#signupForm {
		width: 670px;
		margin-left: 5px;
	}
	#signupForm label.error {
		margin-left: 10px;
		width: auto;
		display: inline;
	}
	#newsletter_topics label.error {
		display: none;
		margin-left: 103px;
	}
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

table{
	width:400px;
	background-color:#CEF6F5;
	margin-left:60px;
/* 	margin-right:auto; */
	color:black;
	font-family:Microsoft JhengHei;
	border:3px black solid;
 	font-size: 15px;
 	text-align: left;
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

#aaa #bbb {
  display: table-cell;
  vertical-align: middle;
}
#aaa #bbb .brand-heading {
  font-size: 40px;
}
#aaa #bbb .intro-text {
  font-size: 18px;
}
#aaa #bbb p {  
    margin: 5px;
    text-align: left;
    color:black;
}
#aaa #bbb .error {  
   color:red;
}
#aaa #bbb .intro-body {  
   margin-left: auto;
   margin-right: auto;
}
@media (min-width: 768px) {
  #aaa {
    height: 100%;
    padding: 0;
  }
  #aaa #bbb .brand-heading {
    font-size: 100px;
  }
  #aaa #bbb .intro-text {
    font-size: 26px;
  }
}

</style>
</head>
<body>
<%-- 	<jsp:include page="/fragment/top.jsp" /> --%>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
<header class="intro">    
 		<div class="intro-body" >         
 				<table border='1' cellpadding='3' cellspacing='0' width='250'>
		<tr height='5'>
			<td align="center" valign="middle"><h3>���ʷs�W</h3></td>
	</table>
	<%-- ���~��C--%>
	
	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/book/book.do"	name="form1" enctype="multipart/form-data"  id="signupForm">

		<fieldset>
<!-- 			<legend>Validating a complete form</legend> -->
			<p>
				<label for="EventID">���ʽs��<font color=red><b>*</b></font></label>
				<input id="EventID" name="EventID" type="text" >
			</p>
			<p>
				<label for="EventName">���ʦW��<font color=red><b>*</b></font></label>
				<input id="EventName" name="EventName" type="text" >
<%-- 				value="<%=(productListingBookVO == null) ? "XXX�r��" : productListingBookVO.getProductListingBook_Name()%>">  --%>
			</p>
			<p>
				<label for="Fee">����<font color=red><b>*</b></font></label>
				<input id="Fee" name="Fee" type="text">
<%-- 				value="<%=(productListingBookVO == null) ? "2000.0" : productListingBookVO.getProductListingBook_Price()%>"> --%>
			</p>
<!-- 			<p> -->
<!-- 				<label for="IsCharge">�O�_�K�O<font color=red><b>*</b></font></label> -->
<!-- 				<input id="IsCharge" name="IsCharge" type="text"> -->
<%-- <%-- 				value="<%=(productListingBookVO == null) ? "1.0" : productListingBookVO.getProductListingBook_Discount()%>" > --%> 
<!-- 			</p> -->
			<p>
				<label for="DurationStart">���ʶ}�l&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label>
				<input id="DurationStart" name="DurationStart" type="date">
<%-- 				value="<%=(productListingBookVO == null) ? "5" : productListingBookVO.getProductListingBook_Quantity()%>"> --%>
			</p>
			<p>
				<label for="DurationEnd">���ʵ���&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label>
				<input id="DurationEnd" name="DurationEnd" type="date">
<%-- 				value="<%=(productListingBookVO == null) ? "1900-01-01" : productListingBookVO.getProductListingBook_Publishedate()%>"> --%>
			</p>
			<p>
				<label for="ShowGroupName">�t�X���&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label>
				<input id="ShowGroupName" name="ShowGroupName" type="text">
<%-- 				value="<%=(productListingBookVO == null) ? "XXX�X����" : productListingBookVO.getProductListingBook_Publisher()%>"> --%>
			</p>
			<p>
				<label for="ContactName">�t�X�s���H&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label>
				<input id="ContactName" name="ContactName" type="text">
<%-- 				value="<%=(productListingBookVO == null) ? "AaaBbb" : productListingBookVO.getProductListingBook_Authors()%>" > --%>
			</p>
			<p>
				<label for="BriefIntroduction">����²��</label>
				<textarea id="BriefIntroduction" name="BriefIntroduction" cols="40" rows="5" style="resize:none;"></textarea>
			</p>
			<p>
			<label for="ImageFile">��ܤW�ǹϤ�<font color=red><b>*</b></font></label>
			<input type="file" id="ImageFile" name="ImageFile" class="required" accept="image/*">
			</p>
			<p>
				<input type="hidden" name="action" value="insert" > <input
				type="submit" value="�e�X�s�W" id="submit" >		
			</p>
		</fieldset>
		
	</FORM>
        </div>
    </header>
	<%-- 	<%@ include file="page2.file" %>				 --%>
</body>
<script src="../js/jquery.js"></script>
<script src="../js/jquery.validate.js"></script>
<script>
$( "#submit" ).click(function() {
			  $( "#signupForm" ).submit();
			});

$().ready(function() {
	// validate the comment form when it is submitted
	$("#commentForm").validate();

	// validate signup form on keyup and submit
	$("#signupForm").validate({
		rules: {
			EventName: "required",
			Fee: {
				required: true,
				number: true
			},
			IsCharge:{
				required: true,
				number: true
			},
// 			ProductListingBook_Quantity: {
// 				required: true,
// 				digits: true
// 			},
			
		},
		messages: {
			EventName: "���i�ť�",
			Fee: {
				required: "���i�ť�",
				number: "�п�J�Ʀr1~9,�i�ϥΤp���I"
			},
			IsCharge: {
				required: "���i�ť�",
				number: "�п�J�Ʀr1~9,�i�ϥΤp���I"
			},
// 			ProductListingBook_Quantity: {
// 				required: "���i�ť�",
// 				digits: "�п�J�Ʀr1~9,���i�ϥΤp���I"
// 			},
			ImageFile:{
				required: "����ܹϤ�"
			},
		}
	});
});
</script>
</html>