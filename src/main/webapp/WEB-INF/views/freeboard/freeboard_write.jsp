<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.woori.yourhome.free_board.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   <link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&display=swap" rel="stylesheet">
</head>
<body>
    <%@include file="../include/nav.jsp" %>
   <%
   FreeBoardDto dto = (FreeBoardDto)request.getAttribute("boardDto");
   String mode = (String)request.getAttribute("mode");
   %>

   <form  name="myform"  method="post"    >
      <input type="hidden" name="seq"      id="seq"      value="<%=dto.getSeq()%>" />
      <input type="hidden" name="group_id" id="group_id" value="<%=dto.getGroup_id()%>" />
      <input type="hidden" name="g_level"  id="g_level"  value="<%=dto.getG_level()%>" />
      <input type="hidden" name="depth"    id="depth"    value="<%=dto.getDepth()%>" />
      <input type="hidden" name="mode"     id="mode"     value="insert" />
      
    <div class="container" style="margin-top:100px;font-family: 'Dongle', sans-serif; font-size:20pt" >
        <h2>게시판 쓰기</h2>

        <table class="table table-hover " style="margin-top: 30px;">
            <colgroup>
                <col width="25%">
                <col width="*">
            </colgroup>
        
            <tbody>
              <tr>
                <td>제목</td>
                <td>
                    <div class="mb-3" style="margin-top:13px;">
                        <input type="text" class="form-control" id="title" name="title" style="font-size:20px"
                        placeholder="제목을 입력하세요" value="<%=dto.getTitle()%>">
                    </div>
                </td>
              </tr>       
              <tr>
                <td>작성자</td>
                <td>
                    <div class="mb-3" style="margin-top:13px;">
                        <input type="text" class="form-control" id="userid" name="userid" style="font-size:20px" value="<%=userid%>" readOnly>

                    </div>
                </td>
              </tr>      
              <tr>
                <td>내용</td>
                <td>
                    <div class="mb-3" style="margin-top:13px;">
                      <textarea class="form-control" rows="5" id="contents" style="font-size:20px"name="contents"><%=dto.getContents()%></textarea>
                    </div>
                </td>
              </tr>          
            </tbody>
          </table>
       
          <div class="container mt-3" style="text-align:right;">
          <% if(dto.getGroup_id()==0 || mode.equals("reply")) { %>
            <input type="button" class="btn btn-secondary" value="등록" onclick="goWrite()" style="width:80px;height:40px;font-size:15pt">
           <%} else { %>
            <input type="button" class="btn btn-secondary" value="수정" onclick="goModify()"style="width:80px;height:40px;font-size:15pt">
           <%} %>
          </div>
          
    </div>
    
    </form>
</body>
</html>

<script>
function goWrite()
{	var id = "<%=userid%>";
	if(id == ""){
	      alert("로그인하세요");
	      location.href="${commonURL}/member/login";
	      return false;
	 }
   var frm = document.myform;
   if( frm.title.value.trim().length==0)
   {
      alert("제목을 작성하세요");
      frm.title.focus();
      return false;
   }

   
   if( frm.contents.value.trim().length==10)
   {
      alert("내용을 작성하세요");
      frm.contents.focus();
      return false;
   }

    //var frmData = new FormData(document.myform);  -- 파일전송시에 사용하자 
    //enctype="multipart/~"
    
    var queryString = $("form[name=myform]").serialize(); 
    //파일전송없을때 안정적으로 감
    console.log(queryString);
    
     $.ajax({
      url:"${commonURL}/freeboard/save",
      data:queryString,
      type:"POST",
      queryString
    })
    .done( (result)=>{
        
      alert("등록되었습니다.");
      location.href="${commonURL}/freeboard/list";
      
    })
    .fail( (error)=>{
       console.log(error);
    });
}

function goModify(){
	  var frm = document.myform;
	  var id = "<%=userid%>";
		if(id == ""){
		      alert("로그인하세요");
		      location.href="${commonURL}/member/login";
		      return false;
		 }
	  
	   if( frm.title.value.trim().length<10)
	   {
	      alert("제목을 10글자 이상 작성하세요");
	      frm.title.focus();
	      return false;
	   }

	   
	   if( frm.contents.value.trim().length<10)
	   {
	      alert("내용을 10글자 이상 작성하세요");
	      frm.contents.focus();
	      return false;
	   }

	    //var frmData = new FormData(document.myform);  -- 파일전송시에 사용하자 
	    //enctype="multipart/~"
	    
	    var queryString = $("form[name=myform]").serialize(); 
	    //파일전송없을때 안정적으로 감
	    console.log(queryString);
	    
	     $.ajax({
	      url:"${commonURL}/freeboard/update",
	      data:queryString,
	      type:"POST",
	      queryString
	    })
	    .done( (result)=>{
	        
	      alert("등록되었습니다.");
	      location.href="${commonURL}/freeboard/list";
	      
	    })
	    .fail( (error)=>{
	       console.log(error);
	    });
	
}
</script>










