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
			<h1>로그인</h1>
			<input type="text" class="form-control" placeholder="아이디" name="user_id" id="user_id">
			<input type="password" class="form-control" name="user_password" id="user_password" placeholder="비밀번호">
			<button type="button" class="btn btn-primary" onclick="goWrite()">로그인</button>&nbsp;&nbsp;
			<button type="button" class="btn btn-primary" onclick="goFindid()">아이디찾기</button>&nbsp;&nbsp;
			<button type="button" class="btn btn-primary"onclick="goFindpassword()">비밀번호찾기</button>&nbsp;&nbsp;
		<!-- <button type="button" class="btn btn-primary" onclick="goCancel()">취소</button>&nbsp;&nbsp;-->		
		<p color="blue" class="message">Not registered? <a href="${commonURL}/member/join">Create an account</a></p>
		</div>
	</form>
</body>
</html>

<script>
function goWrite()
{
   var frmData = new FormData(document.myform);
   console.log( frmData );
   
   // 쿼리스트링만들어서 직렬화한다음에 데이터를 저전송하는거에요
   var queryString = $("form[name=myform]").serialize(); 
   //파일전송없을때 안정적으로 감
   console.log(queryString);
   
   
   $.ajax({
      url:"${commonURL}/member/login_proc",
      data:queryString,
      //data:frmData,
      //contentType:false,
      //processData:false,
      type:"POST",
   })
   .done( (result)=>{
      	if(result.flag=="1")
		{
      		alert("로그인 되었습니다.");
      		location.href="${commonURL}/";
		}
      	else if(result.flag=="2")
      	{
      		alert("아이디를 찾을 수 없습니다.");
      	}
      	else  //패스워드 실패시 3을 보낸다  
      	{
      		alert("패스워드가 일치하지 않습니다.");	
      	}
   })
   .fail( (error)=>{
      console.log(error);
   })
}


function goFindid()
{
	location.href="${commonURL}/member/findid"; //페이지 이동 
}

function  goFindpassword()
{
	location.href="${commonURL}/member/findpassword"; //페이지 이동 
}

function goCancel()
{
	location.href="${commonURL}/";
}
</script>





