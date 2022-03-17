<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.woori.yourhome.note.*"%>
<%@ page import="com.woori.yourhome.common.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
 <%@include file="../include/nav.jsp" %>
   <%
      String key =StringUtil.nullToValue(request.getParameter("key"),"1");
      String keyword = StringUtil.nullToValue(request.getParameter("keyword"), "");
      String pg = StringUtil.nullToValue(request.getParameter("pg"), "0");
   %>
   <%
      NoteDto dto = (NoteDto)request.getAttribute("noteDto");
   %>
   
   <form name="myform">
      <input type="hidden" name="note_seq" value="<%=dto.getNote_seq()%>">
      <input type="hidden" name="pg" value="<%=pg%>">
      <input type="hidden" name="key" value="<%=key%>">
      <input type="hidden" name="keyword" value="<%=keyword%>">
   
   <div class="container" style="margin-top:80px">
      <h2>게시판 상세보기</h2>
      <table class="table table-hover" style="margin-top:30px";>
      <colgroup>
         <col width="10%">
         <col width="23%">
         <col width="10%">
         <col width="23%">
         <col width="10%">
         <col width="23%">
      </colgroup>
         <tbody>
            <tr class="table-secondary">
               <th>제목</th>
               <td colspan="5"><%=dto.getNote_title() %></td>
            </tr>
            <tr>
               <th>작성자</th>
               <td><%=dto.getNote_userid() %></td>
               <th>작성일</th>
               <td><%=dto.getNote_regdate() %></td>
               <th>조회수</th>
               <td><%=dto.getNote_hit()%></td>
            </tr>
            <tr>
               <th colspan="6" >내용</th>
            </tr>
            <tr>
               <td colspan="6">
                  <%=dto.getNote_contents().replaceAll("\n","<br/>") %>
               </td>
            </tr>
         </tbody>
      </table>
      
      <div class="container mt-3" style="text-align:right;">
         <a href="#none" onclick="goList()" class="btn btn-primary">목록</a>
         <% if (userLevel.equals("1")) { %>
         <a href="#none" onclick="goModify()" class="btn btn-primary">수정</a>
         <a href="#none" onclick="goDelete()" class="btn btn-primary">삭제</a>
         <!--  if note userid 구현 여기까지      마침점 -->
         <%} %>
      </div>
      
          
           

      </div>
   </form>
</body>
</html>

<script>
$(function(){
   goInit();
});

function goList()
{
   var frm = document.myform;
   frm.action="<%=request.getContextPath()%>/note/list";
   frm.submit();
}
function goModify()
{
   var frm = document.myform;
   frm.action="<%=request.getContextPath()%>/note/modify";
   frm.submit();
}


function goDelete()
{
   if(confirm("삭제하시겠습니까?"))
      {
      var frm = document.myform;
      frm.action="<%=request.getContextPath()%>/note/delete";
      frm.submit();
      }
}



</script>