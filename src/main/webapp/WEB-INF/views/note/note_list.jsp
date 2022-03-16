<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="com.woori.yourhome.common.*" %>
<%@page import="com.woori.yourhome.note.*" %>
<%@page import="com.woori.yourhome.board.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport1" content="width=device-width, initial-scale=1.0">
	<title>FastFest - 공지</title>
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    
	<meta name="viewport2" content="width=device-width, initial-scale=1">
	<link href="${path}/resources/css/00_member.css" rel="stylesheet" />
	
</head>
<body>
<%@include file="../include/nav.jsp" %>
<%
	String key = StringUtil.nullToValue(request.getParameter("key"),"1");
	String keyword=StringUtil.nullToValue(request.getParameter("keyword"),"");
	String pg = StringUtil.nullToValue(request.getParameter("pg"),"0");
	int totalCnt = (Integer)request.getAttribute("totalCnt");
	
%>
<%
	BoardDto dto = (BoardDto)request.getAttribute("boardDto");	//추가
%> 
	<form name="myform" method="get">
		<input type="hidden" name="key" id="key" value="<%=key%>"/>
		<input type="hidden" name="pg" id="pg" value="<%=pg %>"/>
		<input type="hidden" name="note_seq" id="note_seq" value=""/>
		
		<div class="container" style="margin-top:80px">
			<h2>공지사항 (${totalCnt}건)</h2>
			
			
	        <div class="input-group mb-3" style="margin-top:20px;">
	            <button type="button" class="btn btn-outline-success dropdown-toggle" data-bs-toggle="dropdown"
	            	id="searchItem">
	                선택하세요
	            </button>
	            <ul class="dropdown-menu">
	              <li><a class="dropdown-item" href="#" onclick="changeSearch('1')">선택하세요</a></li>
	              <li><a class="dropdown-item" href="#" onclick="changeSearch('2')">제목</a></li>
	              <li><a class="dropdown-item" href="#" onclick="changeSearch('3')">내용</a></li>
	              <li><a class="dropdown-item" href="#" onclick="changeSearch('4')">제목+내용</a></li>
	            </ul>
	            <input type="text" class="form-control" placeholder="Search"
	            	name="keyword" id="keyword" value="<%=keyword%>">
	            <button class="btn btn-outline-success" type="button" onclick="goSearch()">Go</button>
	          </div>
			          
			           
				<table class ="table table-hover" >
					<colgroup>
						<col width="8%">
						<col width="*">
						<col width="12%">
						<col width="12%">
						<col width="8%">
					</colgroup>
					<thead class="table-light">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
					<%
						List<NoteDto> list = (List<NoteDto>)request.getAttribute("noteList");
						for(NoteDto tempDto : list)
						{
					%>
					<tr>
					<td><%=totalCnt - tempDto.getRnum()+1 %></td>
			            <td><a href="#none"  onclick="goView('<%=tempDto.getNote_seq()%>')"  style="text-decoration:none; color:black;"><%=tempDto.getNote_title()%></a></td>
						<td><%=userid %></td>
						<td><%=tempDto.getNote_regdate() %></td>
						<td><%=tempDto.getNote_hit() %></td>
					</tr>
					<%}%>
					</tbody>
				</table>
				
				<div class="container mt-3" style="text-align:right;">
					<%=Pager.makeTag(request, 10, totalCnt) %>	
				</div>
				
				<% if (userLevel.equals("1")) { %>
	       		<div class="container mt-3" style="text-align:right";>
	       			<a href="<%=request.getContextPath() %>/note/write"
	       				class="btn btn-outline-success">글쓰기</a>
	       		</div>
	       		<%} %>
	       	</div>
	</form>
</body>
</html>
<script>
window.onload = function(){
	let key ='<%=key%>';
	var texts = ["","선택하세요", "제목", "내용", "제목+내용"];
	document.getElementById("serachItem").innerHTML=texts[key];
}


function changeSearch(id)
{
	var texts = ["","선택하세요", "제목", "내용", "제목+내용"];
	document.getElementById("searchItem").innerHTML=texts[id]; //화면에 보이기 위함
	document.getElementById("key").value=id;//컨트톨러로 넘기기 위함
	document.getElementById("keyword").value="";
}

function goSearch()
{
	let frm = document.myform;
	frm.pg.value=0;
	frm.action= "<%= request.getContextPath()%>/note/list";
	frm.method="get";
	frm.submit();
}

function goPage(pg)
{
	let frm = document.myform;
	frm.pg.value=pg;
	frm.method="get";
	frm.action="${pageContext.request.contextPath}/note/list";
	frm.submit();
}

function goView(id)
{
	let frm=document.myform;
	frm.note_seq.value=id;
	frm.method="get";
	frm.action="${pageContext.request.contextPath}/note/view";
	frm.submit();
}
</script>