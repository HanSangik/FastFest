<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Insert title here</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link href="${path}/resources/css/00_member.css" rel="stylesheet" />
</head>
<body>
	<%@include file="../include/nav.jsp"%>
	<form name="myform" id="myform">
		<input type="hidden" name="idcheck" id="idcheck" value="N" />

		<div class="container" style="margin-top: 80px; width: 60%">
			<h1>비밀번호찾기</h1>
			<input type="text" class="form-control" placeholder="아이디" name="user_id" id="user_id">
			<input type="text" class="form-control" name="user_mail" id="user_mail" placeholder="이메일">
			<button type="button" class="btn btn-primary" onclick="goFindId()">비밀번호찾기</button>&nbsp;&nbsp;
			<button type="button" class="btn btn-primary" onclick="goCancel()">취소</button>&nbsp;&nbsp;
			<div id="result"></div>
		</div>
	</form>

</body>
</html>

<script>

function goFindId()
{
   var frmData = new FormData(document.myform);
   console.log( frmData );
       
   $.ajax({
      url:"${commonURL}/member/findpass_proc",
      data:frmData,
      contentType:false,
      processData:false,
      type:"POST",
   })
   .done( (result)=>{
      	if(result.result=="fail")
		{
      		alert("해당하는 아이디를 찾을 수 없습니다.");
		}
       	else  //패스워드 실패시 3을 보낸다  
      	{
      		$("#result").html("비밀번호는 <strong>" + result.result + "</strong> 입니다.");	
      	}
   })
   .fail( (error)=>{
      console.log(error);
   })
}



function goCancel()
{
	var frm = document.myform;
	 frm.action="${commonURL}/member/login";
	 frm.submit();
}
</script>