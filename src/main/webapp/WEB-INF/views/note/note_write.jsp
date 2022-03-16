<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.woori.yourhome.note.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
 	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>공지사항</title>


  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
	<%@include file="../include/nav.jsp" %>
	<%
	NoteDto dto = (NoteDto)request.getAttribute("noteDto");
	%>
	
	
	<form  name="myform" action="<%=request.getContextPath()%>/note/save" method="post"
	    onsubmit="return false;" >
		<input type="hidden" name="note_seq" value="<%=dto.getNote_seq()%>"/>
	<div class = "container" style ="margin-top:80px;">
		<h2>게시판 쓰기</h2>
		
		<table class="table table-hover" style="margin-top: 30px;">
			<colgroup>
				<col width="25%">
				<col width="*">
			</colgroup>
			
			<tbody>
				<tr>
					<td>제목</td>
					<td>
						<div class="mb-3" style="margin-top:13px;">
							<input type="text" class="form-control" id="note_title" name="note_title"
							placeholder="제목을 입력하세요" value="<%=dto.getNote_title()%>"/>
						</div>
					</td>
				</tr>
				<tr> 
					<td>작성자</td>
					<td>
						<div class="mb-3" style="margin-top:13px;">
							<input type="hidden" id="note_userid" name="note_userid" value="<%=userid%>"/>
							<input type="text" class="form-control" id="note_username"  name="note_username"
							placeholder="이름을 입력하세요" value="<%=userid %>"/>
						</div>
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<div class= "mb-3" style="margin-top:13px;">
							<textarea class="form-control" rows="5" id="note_contents" name="note_contents"><%=dto.getNote_contents() %></textarea>
						</div>	
					</td>
				</tr>		
			</tbody>
		</table>
		
		<div class="container mt-3" style="text-align:right;">
			<input type="button" class="btn btn-primary" value="등록" onclick="goWrite()">
		</div>
	</div>
	</form>
		
</body>
</html>

<script>
	function goWrite()
	{
		var frm = document.myform;
		if(frm.note_title.value.trim().length<10)
		{
				alert("제목을 10글자 이상 작성하세요");
				frm.title.focus();
				return false;
		}
		
		if( frm.note_contents.value.trim().length<10)
		{
			alert("내용을 10글자 이상 작성하세요");
			frm.contents.focus();
			return false;
		}
		
		frm.action="<%=request.getContextPath()%>/note/save";
		frm.method="post";
		frm.submit();
	}
</script>