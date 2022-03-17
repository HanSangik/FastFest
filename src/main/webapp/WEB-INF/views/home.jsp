<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<meta charset="UTF-8">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.*" %>
<%@page import="com.woori.yourhome.common.*" %>
<%@page import="com.woori.yourhome.main.*" %>
<%@page import="com.woori.yourhome.main2.*" %>
<html>
<head>





<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	
	<link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/owl.carousel.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/owl.theme.default.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/4.5.6/css/ionicons.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style.css">


</head>
<body>
<% String key = StringUtil.nullToValue(request.getParameter("key"), "1");
	String keyword = StringUtil.nullToValue(request.getParameter("keyword"), "");
	String pg = StringUtil.nullToValue(request.getParameter("pg"), "0");
	
	
	
%>

	<%@include file="./include/nav.jsp"%>

	
	<div class="container" style="margin-top: 120px; margin-bottom: -100px;">
		<h1>이달의 주요 행사</h1>
	</div>
	
	<section class="ftco-section">
			<div class="container" style = "margin-bottom : -90px;">
				<div class="row">
					<div class="col-md-12">
						<div class="featured-carousel owl-carousel">
						
							<div class="item">
								<div class="work">
									<div class="img d-flex align-items-end justify-content-center" style="background-image: url(<%=request.getContextPath() %>/resources/images/busan_life.jpg);">
										<div class="text w-100">
											<h3><a href="https://smartstore.naver.com/2021busanbada">부산</a></h3>
											<h3><a href="https://smartstore.naver.com/2021busanbada">라이프</a></h3>
										</div>
									</div>
								</div>
							</div>
							
							<div class="item">
								<div class="work">
									<div class="img d-flex align-items-end justify-content-center" style="background-image: url(<%=request.getContextPath() %>/resources/images/nonsan_strawberry.jpg);">
										<div class="text w-100">
											<h3><a href="https://www.nonsan.go.kr/ensfestival/">논산</a></h3>
											<h3><a href="https://www.nonsan.go.kr/ensfestival/">딸기축제</a></h3>
										</div>
									</div>
								</div>
							</div>
							
							<div class="item">
								<div class="work">
									<div class="img d-flex align-items-end justify-content-center" style="background-image: url(<%=request.getContextPath() %>/resources/images/korea_music.jpg);">
										<div class="text w-100">
											<h3><a href="https://music1998.modoo.at/">한국</a></h3>
											<h3><a href="https://music1998.modoo.at/">음악제</a></h3>	
										</div>
									</div>
								</div>
							</div>
							
							<div class="item">
								<div class="work">
									<div class="img d-flex align-items-end justify-content-center" style="background-image: url(<%=request.getContextPath() %>/resources/images/yangju_snow.jpg);">
										<div class="text w-100">
											<h3><a href="http://www.fes-artvalley.com/">양주</a></h3>
											<h3><a href="http://www.fes-artvalley.com/">눈꽃축제</a></h3>
										</div>
									</div>
								</div>
							</div>
							
							<div class="item">
								<div class="work">
									<div class="img d-flex align-items-end justify-content-center" style="background-image: url(<%=request.getContextPath() %>/resources/images/pocheon_valley.jpg);">
										<div class="text w-100">
											<h3><a href="http://luck4949a.koreafree.co.kr/main/index.html">포천 </a></h3>
											<h3><a href="http://luck4949a.koreafree.co.kr/main/index.html">동장군나드리</a></h3>
										</div>
									</div>
								</div>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</section>
		
	<div class="container">
		<br>gallery
	</div>
<%List<Main2Dto> lists = (List<Main2Dto>)request.getAttribute("main2List");%>
		<form name="myform2" method="get">
		<input type="hidden" name="id"  id="id" value=""/>
		<input type="hidden" name="pg"      value="<%=pg%>" >
		<input type="hidden" name="key"     value="<%=key%>" >
		<input type="hidden" name="keyword" value="<%=keyword%>" >
	<div class="container pt" style="display:flex; flex-direction:row; align-items: center; margin-bottom:30px; " >
	
		<div class="row"> 
		 <br><br>
		 <%
		 for( Main2Dto dto : lists){ %>
            <div class="col-sm-3" style="margin-right:0px !important">
              <div class="container">
                <a href="#none" onclick="goView2('<%=dto.getId()%>')">
                  <img src="<%=request.getContextPath() %>/upload/<%=dto.getImage()%>" alt="no_image" style="width:200px; height:200px; margin-left:20px; object-fit:contain; border: 1px solid; border-color:#C9C9C9">
		</a>
		</div>
		</div>
		<%} %>
			
	       
	     </div>	       
	  </div>
	  </form>



	
	       
	<div class="container pt" style="display:flex; flex-direction:row" > 
		 
			
			<div class="col-sm-4" > 
			<br>video</br>		
		  		<iframe width="100%" height="90%" src="https://www.youtube.com/embed/LsHr1hozcd8" 
		  		title="YouTube video player" frameborder="0" 
		  		allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
		  		allowfullscreen>
		  		</iframe>
	  		</div>
	  		
	  	<div class="col" > 	
	<form name="myform" method="get">
	<input type="hidden" name="key" id="key" value="<%=key%>"/>
	<input type="hidden" name="pg"  id="pg" value="<%=pg%>"/>
	<input type="hidden" name="note_seq" id="note_seq" value=""/>        
			
		   <table class="table table-hover" >	
		   <br>notice
		   <br>	
		    <tbody>
            <%            
            List<MainDto> list = (List<MainDto>)request.getAttribute("mainList");
           	for(MainDto tempDto : list){
            %>
             
              <tr>
				  
                <td><a href="#none"  onclick="goView('<%=tempDto.getNote_seq()%>')"  style="text-decoration:none; color:black;"><%=tempDto.getNote_title()%></a></td>

              </tr>
            <%}%>
            </tbody>
			</table> 
	        </form>
	       </div>
	        <div class="col-sm-4" > 
	        <br>calendar
				<a href="http://localhost:8080/FastFest/calendar">
	  		<img src="<%=request.getContextPath() %>/resources/images/calender.png" class="img-fluid rounded">
	  		</a>
		  		
	        </div>
	           
	      
   </div>     
	 

<footer class="bg-light text-center text-lg-start">
  <!-- Copyright -->
  <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2); margin-top:200px; ">

  </div>
  <!-- Copyright -->
</footer>

	
    <script src="<%=request.getContextPath() %>/resources/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/popper.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/main.js"></script> 
    
    <script>
    function goView(id)
    {
    	let frm=document.myform;
    	frm.note_seq.value=id;
    	frm.method="get";
    	frm.action="${pageContext.request.contextPath}/note/view";
    	frm.submit();
    }
  
    function goView2(id)
    {
    	frm = document.myform2;
    	frm.id.value=id;///////////
    	frm.method="get";
    	frm.action="${pageContext.request.contextPath}/gallery/view";
    	frm.submit();
    }
    
    </script>           


</body>
</html>

