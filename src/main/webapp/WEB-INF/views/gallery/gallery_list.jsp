<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="com.woori.yourhome.common.*" %>
<%@page import="com.woori.yourhome.gallery.*" %>

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

<%
	String key = StringUtil.nullToValue(request.getParameter("key"), "1");
	String keyword = StringUtil.nullToValue(request.getParameter("keyword"), "");
	String pg = StringUtil.nullToValue(request.getParameter("pg"), "0");
	int totalCnt = (Integer)request.getAttribute("totalCnt");
	List<GalleryDto> list = (List<GalleryDto>)request.getAttribute("galleryList");
%> 
<!--  style="font-family: 'Dongle', sans-serif; font-size:20pt" -->
<%@include file="../include/nav.jsp" %>

<form name="myform" method="get">
	<input type="hidden" name="key" id="key" value="<%=key%>"/>
	<input type="hidden" name="pg"  id="pg" value="<%=pg%>"/>
	<input type="hidden" name="id"  id="id" value=""/>
	<input type="hidden" name="usernum" id="usernum" value="<%=id%>" />
	

    <div class="container" style="margin-top:100px; font-family: 'Dongle', sans-serif; font-size:20pt">
        <h2>게시판 목록 (${totalCnt}건)</h2>

        <div class="input-group mb-3" style="margin-top:20px;">
            <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown"
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
            <button class="btn btn-secondary" type="button" onclick="goSearch()">Go</button>
          </div>

        	<div class="row">
             <!-- 한행시작 -->
            <% for( GalleryDto dto : list){ %>
            <div class="col-sm-3" style="margin-right:50px !important">
              <div class="thumbnail">
                <a href="#none" onclick="goView('<%=dto.getId()%>')">
                  <img src="../upload/<%=dto.getImage()%>" alt="no_image" style="width:200px; height:200px; object-fit:contain; border: 1px solid; border-color:#C9C9C9">
                  <div class="caption">
                    <a href="#none" onclick="goView('<%=dto.getId()%>')"><div style="width:150px;text-overflow: ellipsis;  overflow:hidden; white-space:nowrap;"><%=dto.getTitle()%></div></a>
                  	<p>추천수 : <td><%= dto.getLikehit()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  	
                  	
                  <%
                  if(dto.getLikeYN()==1){%>
                	 <a href="#none" onclick="unlike('<%=dto.getId()%>')" id="likeon<%=dto.getId()%>">
                  		<img src="<%=request.getContextPath()%>/resources2/images/full_star.png" alt="Lights"
                  		 style="width:20px; height:20px;" id = "btnlike<%=dto.getId()%>">
                  		</a>
                  <%}else{%>
                  		<a href="#none" onclick="golike('<%=dto.getId()%>')" id="likeon<%=dto.getId()%>">
                  		<img src="<%=request.getContextPath()%>/resources2/images/blank_star.png" alt="Lights"
                  		 style="width:20px; height:20px;" id = "btnlike<%=dto.getId()%>">
                  		 </a>
                  <%}%>
                 
                  	</td></p>
                  </div>
                </a>
              </div>
            </div>
           <%} %>
           
             <!-- 한행종료 -->
          </div>

 		  <div class="container mt-3" style="text-align:right;">
       	  	<%=Pager.makeTag(request, 12, totalCnt)%>
       	  </div>
       	  
          <div class="container mt-3" style="text-align:right;">
            <a href="<%=request.getContextPath()%>/gallery/write" 
               class="btn btn-secondary" style="width:80px;height:40px;font-size:15pt">글쓰기</a>
          </div>
          
    </div>
    
   </form>
</body>
</html>

<script>


window.onload=function(){
	let key = '<%=key%>';
	var texts=["", "선택하세요", "제목", "내용", "제목+내용"];
	document.getElementById("searchItem").innerHTML=texts[key];
	
}


function changeSearch(id)
{
	var texts=["", "선택하세요", "제목", "내용", "제목+내용"];
	document.getElementById("searchItem").innerHTML=texts[id]; //화면에 보이기 위해서 
	document.getElementById("key").value=id;//컨트롤러로 넘기기 위해서
	document.getElementById("keyword").value="";/////
}

function goSearch(){
	let frm = document.myform;
	frm.pg.value=0;
	frm.action = "<%=request.getContextPath()%>/gallery/list";
	frm.method="get";
	frm.submit();
}

function goPage(pg)
{
	frm = document.myform;
	frm.pg.value=pg;///////////
	frm.method="get";
	frm.action="${pageContext.request.contextPath}/gallery/list";
	frm.submit();
}

function goView(id)
{
	frm = document.myform;
	frm.id.value=id;///////////
	frm.method="get";
	frm.action="${pageContext.request.contextPath}/gallery/view";
	frm.submit();
}


function golike(id){
	 var userid ='<%=userid%>';
	 var board_id = id;
	 
		 console.log("---------------------")
		 console.log($("#usernum").val());
		 console.log("---------------------")  
	   if(userid == ""){
	      alert("로그인하세요");
	      location.href="${commonURL}/member/login";
	   }
	  
	   $.ajax({
		   url:"${commonURL}/gallery/like?board_id="+board_id+"&"+"userSeq="+$("#usernum").val(),
		      type:"GET",
		      dataType:"JSON"
		   })
		   .done( (result)=>{
			   $("#btnlike"+id).attr("src", "<%=request.getContextPath()%>/resources2/images/full_star.png");
	    	   $("#likeon"+id).attr("onclick", "unlike('"+board_id+"')");
	    	   
		   })
		   .fail( (error)=>{
		      console.log(error);
		   })
	   
	  
}

function unlike(id){
	var userid ='<%=userid%>';
	var board_id = id;
	  
	   if(userid == ""){
	      alert("로그인하세요");
	      location.href="${commonURL}/member/login";
	   }
	   
		   $.ajax({
			   url:"${commonURL}/gallery/unlike?board_id="+board_id+"&userSeq"+"="+$("#usernum").val(),
			      type:"GET",
			      dataType:"JSON"
			   })
			   .done( (result)=>{
				  
		    	   $("#btnlike"+id).attr("src", "<%=request.getContextPath()%>/resources2/images/blank_star.png");
		    	   $("#likeon"+id).attr("onclick", "golike('"+board_id+"')");
		    	   
			   })
			   .fail( (error)=>{
			      console.log(error);
			   })
	  
	   
}



</script>



