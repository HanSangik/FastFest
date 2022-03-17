<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.woori.yourhome.gallery.*" %>
<%@page import="com.woori.yourhome.common.*" %>
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

<style>
img{
width:100%;
}
</style>
</head>
<body>
    <%@include file="../include/nav.jsp" %>
	<%
		String key = StringUtil.nullToValue(request.getParameter("key"), "1");
		String keyword = StringUtil.nullToValue(request.getParameter("keyword"), "");
		String pg = StringUtil.nullToValue(request.getParameter("pg"), "0");
	%>
	<%
	GalleryDto dto = (GalleryDto)request.getAttribute("galleryDto");
	%>
	
	<form name="myform">
		<input type="hidden" name="id"      value="<%=dto.getId()%>" >
		<input type="hidden" name="pg"      value="<%=pg%>" >
		<input type="hidden" name="key"     value="<%=key%>" >
		<input type="hidden" name="keyword" value="<%=keyword%>" >
		
    <div class="container" style="margin-top:100px;font-family: 'Dongle', sans-serif; font-size:20pt">
        <h2>게시판 상세보기</h2>
        <table class="table table-hover " style="margin-top:30px;">
            <tbody>
              <tr class="table-secondary">
                <th >제목</th>
                <td colspan="3"><%=dto.getTitle()%></td>
              </tr>
              <tr >
                <th >작성자</th>
                <td><%=dto.getWriter()%></td>
                <th>작성일</th>
                <td><%=dto.getWdate()%></td>
       
              </tr>
              <tr>
                <th colspan="4"  >내용</td>
              </tr>
              <tr>
                <td colspan="4" >             
					<%=dto.getComment()%>
                </td>
              </tr>
              
               <tr>
                <!-- < td colspan="4" >             
					<img src="../upload/<%=dto.getImage()%>" style="width:100%"/>
                </td> -->
              </tr>
              
            </tbody>
          </table>
			
			<%if(userid.equals("")) {%>
           
           <%}else{%>
           		<div  style="margin-right:1px;">
				<button type="button" class="btn btn-warning " id="like_btn" onclick="updateLike()" style="width:80px;height:40px;font-size:15pt">추천 <%=dto.getLikehit() %></button>
           <%} %>
 			<input type="hidden" name="usernum" id="usernum" value="<%=id%>" />
            <input type="hidden" name="userid" id="userid" value="<%=userid%>" />
            <input type="hidden" name="board_id" id="board_id" value="<%=dto.getId()%>" />
            <input type="hidden" name="comment_id" id="comment_id" value="" />
            <input type="hidden" name="likeflag" id="likeflag" value="1" />
       
          <div class="container mt-3" style="text-align:right;">
            <a href="#none" onclick="goList()" class="btn btn-secondary" style="width:80px;height:40px;font-size:15pt">목록</a>
          <%
          System.out.println("userid = " + userid);
          System.out.println("dto writer = "+ dto.getWriter());
          if(userid.equals(dto.getWriter())){%>
         	<a href="#none" onclick="goModify()" class="btn btn-secondary"style="width:80px;height:40px;font-size:15pt">수정</a>
         	<a href="#none" onclick="goDelete()" class="btn btn-secondary"style="width:80px;height:40px;font-size:15pt">삭제</a>
          <%}%>
          <%if(!userid.equals("")) {%>
         	<a href="#none" onclick="golike()" class="btn btn-secondary" id ="btn_like"style="width:80px;height:40px;font-size:15pt">즐겨찾기</a>
         	<a href="#none" onclick="golikelist()" class="btn btn-secondary" id ="btn_like"style="width:80px;height:40px;font-size:15pt">즐겨찾기목록</a>
		  <%}%>
          </div>
          
                     <table class="table" style="margin-top:20px" id="tbl_comment">
              <colgroup>
                 <col width="10%">
                 <col width="*">
                 <col width="20%">
              </colgroup>
          <thead>
            <tr>
              <th colspan="3"> 댓글</th>
            </tr>
          </thead>
          <tbody >
               
          </tbody>
        </table>
          	
          
            
            <div class="mb-3" style="margin-top:13px;">
               <textarea class="form-control" rows="3" id="comment" name="comment" style="font-size:20px"></textarea>
            </div>
            
            <div class="container mt-3" style="text-align:right;" id="btnRegister" style="width:80px;height:40px;font-size:20pt">
               <a href="#none" onclick="goCommentWrite()" class="btn btn-primary" style="width:80px;height:40px;font-size:15pt"
               ><span id="btnCommentSave">댓글등록</span></a>
            </div>
          
          
          
    </div>
    
    </form>
</body>
</html>

<script>
function golikelist(){
	var frm = document.myform;
	frm.action="<%=request.getContextPath()%>/like/list";
	frm.submit();
}

function goList()
{
	var frm = document.myform;
	frm.action="<%=request.getContextPath()%>/gallery/list";
	frm.submit();
}

function goModify()
{
	var frm = document.myform;
	frm.action="<%=request.getContextPath()%>/gallery/modify";
	frm.submit();
}


function goDelete()
{
	   
	   if( !confirm("삭제하시겠습니까?"))
		   return false;
	   
	   var frmData = new FormData(document.myform);
	    //console.log( frmData );
	   $.ajax({
	      url:"${commonURL}/gallery/delete",
	      data:frmData,
	      contentType:false,
	      processData:false,
	      type:"POST",
	   })
	   .done( (result)=>{
		   location.href="${commonURL}/gallery/list";
	   })
	   .fail( (error)=>{
	      console.log(error);
	   })
}

function goInit()
{
   var frmData = new FormData(document.myform);
   console.log( $("#board_id").val() );
       
   $.ajax({
      url:"${commonURL}/comment2/list?board_id="+$("#board_id").val(),
      type:"GET",
      dataType:"JSON"
   })
   .done( (result)=>{
     //데이터가 배열형태로 전달받음 
     //forEach( (item)=>{}) 배열이 요소 하나하나마다 함수를 호출해준다 
     //각 요소를 매개변수로 전달
     
      //$("#tbl_comment > tbody:last").remove();
     for(i=$("#tbl_comment tr").length-2; i>=0; i--){
        $("#tbl_comment tr:last").remove(); //이전에 잇던거 전부 삭제 
        console.log("*");
     }
     //console.log(result);
      var userid='<%=userid%>';
      
      var i=1;
     result.forEach( (item)=>{
       var data = "<tr>";
           data += "<td>"+ i +"</td>";
           data += "<td>"+item.comment+"</td>";
           
          if(userid==item.userid)    
              data += "<td>"+item.username
                   +"&nbsp<button type='button' onclick=goCommentModify('"+item.id+"')>수정</button>"
                   +"&nbsp<button type='button' onclick=goCommentDelete('"+item.id+"')>삭제</button>"
                   +"</td>";
           else
              data += "<td>"+item.username+"</td>";
           data += "</tr>";
       i++;
       //console.log(data);    
         $("#tbl_comment > tbody:last").append(data);
         
      })
   })
   .fail( (error)=>{
      console.log(error);
   })
   
    $.ajax({
	        url:"${commonURL}/like/isDuplicate", //요청 url정보
	        data:{like_boardId:$("#board_id").val(), like_boardType:"2", like_userId:$("#usernum").val()},   //서버로 전달할 데이터정보: JSON형태
	        dataType:"json",  //결과를 jSON으로 받겠다. 결과가 text로 온다
	        type:"POST"
	     })
	     .done((data)=>{
	        //데이터가 정상적으로 수신되면 done메서드 호출되면서 매개변수는 전달받은 값
	        //값은 dataType 속성을 안주면 text로 온다.
	        console.log(data.result);
	       if(data.result == "true") //중복
	       {
	    	   $("#btn_like").html("즐겨찾기해제");
	    	   $("#likeflag").val("2");
	    	   console.log("likeflag = "+ $("#likeflag").val());
				
	       }
	       else
	       {
	    	   $("#btn_like").html("즐겨찾기");
	    	   $("#likeflag").val("1");
	    	   console.log("likeflag = "+ $("#likeflag").val());
	       }
     })
     .fail((error)=>{
        //통신에러, 오류에 관한 것
           console.log(error)
     })
}

function goCommentWrite()
{
   var userid='<%=userid%>';
   if(userid=="")
   {
      alert("로그인하세요");
      location.href="${commonURL}/member/login";
   }
   var frmData = new FormData(document.myform);
     console.log( frmData );
   $.ajax({
      url:"${commonURL}/comment2/write",
      data:frmData,
      contentType:false,
      processData:false,
      type:"POST",
   })
   .done( (result)=>{
       $("#comment").val("");
       $("#btnCommentSave").html("댓글등록");
       $("#comment_id").val("");
         goInit();
   })
   .fail( (error)=>{
      console.log(error);
   })
}


function goCommentModify(comment_id)
{
   var userid='<%=userid%>';
   $("#comment_id").val(comment_id);
   if(userid=="")
   {
      alert("로그인하세요");
      location.href="${commonURL}/member/login";
   }
   
    $.ajax({
      url:"${commonURL}/comment2/getView?id="+comment_id,
      type:"GET",
      dataType:"json"
   })
   .done( (result)=>{
       $("#comment").val(result.comment);
       $("#btnCommentSave").html("저장");
       goInit();
   })
   .fail( (error)=>{
      console.log(error);
   })
}


function goCommentDelete(comment_id)
{
   var userid ='<%=userid%>';
   $("#comment_id").val(comment_id);
   if(userid == ""){
      alert("로그인하세요");
      location.href="${commonURL}/member/login";
   }
   
   if( !confirm("삭제하시겠습니까?"))
      return false;
   
   var frmData = new FormData(document.myform);
    //console.log( frmData );
   $.ajax({
      url:"${commonURL}/comment2/delete",
      data:frmData,
      contentType:false,
      processData:false,
      type:"POST",
   })
   .done( (result)=>{
      $("#comment").val("");
      $("#comment_id").val("");
       goInit();
   })
   .fail( (error)=>{
      console.log(error);
   })
}
$(function(){

	goInit();
	
	
	     
})

function golike(){
	 var userid ='<%=userid%>';
	   $("#comment_id").val(comment_id);
	   if(userid == ""){
	      alert("로그인하세요");
	      location.href="${commonURL}/member/login";
	   }
	   var flag = $("#likeflag").val();
	   if(flag == "1"){
		   $.ajax({
			   url:"${commonURL}/gallery/like?board_id="+$("#board_id").val()+"&"+"userSeq="+$("#usernum").val(),
			      type:"GET",
			      dataType:"JSON"
			   })
			   .done( (result)=>{
				   goInit();
			   })
			   .fail( (error)=>{
			      console.log(error);
			   })
	   }
	   else{
		   $.ajax({
			   url:"${commonURL}/gallery/unlike?board_id="+$("#board_id").val()+"&"+"userSeq="+$("#usernum").val(),
			      type:"GET",
			      dataType:"JSON"
			   })
			   .done( (result)=>{
				   goInit();
			   })
			   .fail( (error)=>{
			      console.log(error);
			   })
	   }
	   
}

function updateLike(){ 
    $.ajax({
           type : "POST",  
           url : "${commonURL}/gallery/updateLike",       
           dataType : "json",   
           data : {'id' : <%=dto.getId()%>, 'writer' : '<%=userid%>'},
           error : function(){
              alert("통신 에러");
           },
           success : function(likeCheck) {
               
                   if(likeCheck == 0){
                   	alert("추천완료.");
                   	location.reload();
                   }
                   else if (likeCheck == 1){
                    alert("추천취소");
                   	location.reload();

                   
               }
           }
       });
}

</script>











