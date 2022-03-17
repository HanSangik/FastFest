<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="com.woori.yourhome.common.*" %>
<%@page import="com.woori.yourhome.like.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&display=swap" rel="stylesheet">

</head>
<body>
<%
	//String key = StringUtil.nullToValue(request.getParameter("key"), "1");
	//String keyword = StringUtil.nullToValue(request.getParameter("keyword"), "");
	String pg = StringUtil.nullToValue(request.getParameter("pg"), "0");
	int totalCnt = (Integer)request.getAttribute("totalCnt");
%> 

<%@include file="../include/nav.jsp" %>

<form name="myform" method="get">


	<input type="hidden" name="pg"  id="pg" value="<%=pg%>"/>
	<input type="hidden" name="id"  id="id" value=""/>
	<input type="hidden" name="seq" id="seq" value=""/>

    <div class="container" style="margin-top:100px;font-family: 'Dongle', sans-serif; font-size:20pt">
        <h2>즐겨찾기 목록 (${totalCnt}건)</h2>


        <table class="table table-hover ">
        	<colgroup>
        		<col width="15%">
        		<col width="*">
        		<col width="12%">
        		<col width="12%">
        	</colgroup>
            <thead class="table-secondary">
              <tr>
                <th>게시판구분</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
              </tr>
            </thead>
            <tbody>
            <%
            
            List<LikeDto> list = (List<LikeDto>)request.getAttribute("likeList");
           	for(LikeDto tempDto : list){
            %>
              <tr>
              	<%if(tempDto.getLike_boardType().equals("1")) {%>
                	<td>자유게시판</td>
                <%}else if(tempDto.getLike_boardType().equals("2")){%>
                	<td>갤러리</td>
                <%} %>
                <td><a href="#none" onclick="goView('<%=tempDto.getLike_boardId()%>', '<%=tempDto.getLike_boardType()%>')" ><%=tempDto.getTitle()%></a></td>
                <td><%=tempDto.getWriter()%></td>
                <td><%=tempDto.getRegdate()%></td>
              </tr>
            <%}%>
            </tbody>
          </table>

		
 		  <div class="container mt-3" style="text-align:right;">
       	  	<%=Pager.makeTag(request, 10, totalCnt)%>
       	  </div>
       	  
          
    </div>
    
   </form>
</body>
</html>

<script>

function goPage(pg)
{
	frm = document.myform;
	frm.pg.value=pg;///////////
	frm.method="get";
	frm.action="${pageContext.request.contextPath}/like/list";
	frm.submit();
}

function goView(id, type)
{	
	var type = type;
	frm = document.myform;
	frm.seq.value=id;
	frm.id.value=id;///////////
	frm.method="get";
	if(type == "1"){
		frm.action="${pageContext.request.contextPath}/freeboard/view";
		
	}else if(type == "2"){
		
		frm.action="${pageContext.request.contextPath}/gallery/view";
	}
	frm.submit();
}


</script>



