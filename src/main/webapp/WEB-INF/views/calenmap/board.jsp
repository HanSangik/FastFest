<%@ page language="java" 
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.*"%>
<%@page import="com.woori.yourhome.calenmap.*" %>

<h2 id="h2title" style="text-align:left; font-family: 'Dongle' !important; font-size: 25pt" >* 이달의 지역별 축제 및 행사 *</h2>
<hr width=1000px>
<div id="h2sub"></div>
<div id="imagediv" style="display:block; text-align:center;"><img class="img1" src="<%=request.getContextPath()%>/resources/images/클릭전2.png"></div>


<div id="festboard"></div>

  <!-- 
<div class="courses-container" style= "margin-left: 150px; margin-bottom:80px; width:1000px; height:100px">
    <div class="course" style="width:900px ; height:150px;">
        <div name="festimage2"style="width:600px; z-index:100; background-size: cover; class="course-preview">
        </div>
        <div class="course-info" style="margin-left:5px; margin-bottom:5px">
			<h5 class="card-title" style="padding:-100px; margin-top:5px; margin-bottom:5px"></h5>
			<p class="card-text" style="margin-top:5px; margin-bottom:5px"><br/></p>
            <button class="btn" style="width:100px; padding:2px"><span style="font-size:10pt"></span></a></button>
        </div>
    </div>
</div>

 -->
 <form name="myform">
 <input type="hidden" value="" name="addr"/>
 </form>
 <script>
 
 
 function mapview(addr){
	 frm = document.myform;
	 	frm.addr.value=addr;///////////
	 	frm.method="get";
	 	frm.action="${pageContext.request.contextPath}/calendar/kakaomap";
	 	frm.submit();
 }
 </script>