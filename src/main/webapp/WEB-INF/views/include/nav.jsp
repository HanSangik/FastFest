<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.woori.yourhome.common.*" %>

<%
request.setAttribute("commonURL", request.getContextPath());

// request 객체에 저장된 데이터를 ${변수명} 이렇게 가져다 쓸수있어요
// 
String id= StringUtil.nullToValue(session.getAttribute("id"), "");
String userid= StringUtil.nullToValue(session.getAttribute("userid"), "");
String username= StringUtil.nullToValue(session.getAttribute("username"), "");
String email= StringUtil.nullToValue(session.getAttribute("email"), "");
String phone= StringUtil.nullToValue(session.getAttribute("phone"), "");
String userLevel=StringUtil.nullToValue(session.getAttribute("userLevel"),"");	//공지사항 글쓰기는 관리자만
%>
<meta charset="UTF-8">



<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">        
        <title>Mobile Menu</title>
        <link rel="stylesheet" href="slicknav.min.css">
        <link href="https://fonts.googleapis.com/css?family=Oswald:400" rel="stylesheet"> 
        <style>
           body{background: url(bg.jpg);font-family: 'Oswald', sans-serif;font-size: 15px;font-weight: 400; line-height: 1.5em;}
            .inner_main_menu {margin: 0 auto; width: 1170px;}    
            .inner_main_menu ul{margin: 0; padding: 80px 0 0; list-style: none;text-align: right;}    
            .inner_main_menu ul li{float: none; display: inline-block;position: relative}    
            .inner_main_menu ul li:nth-child(1){float: left;}    
            .inner_main_menu ul li:nth-child(2){float: left;}    
            .inner_main_menu ul li:nth-child(3){float: left;}    
            .inner_main_menu ul li a{color: #262626; font-size: 20px; text-transform: uppercase;text-decoration: none; display: block;padding: 10px 20px;}    
            .inner_main_menu ul li a:hover{color: #6FDA44}  
            .inner_main_menu ul li ul{position: absolute; top: 40px; left: -9999999px; width: 200px;background: #262626; padding: 0;}  
            .inner_main_menu ul li:hover ul{left: 0px;}   
            .inner_main_menu ul li ul li{float: left;width: 100%;text-align: left;}  
            .inner_main_menu ul li ul li a{color: #fff;text-transform: capitalize; font-size: 15px;}  
            .inner_main_menu ul li ul li a:hover{background: #ddd; color: #262626;}  
            .inner_main_menu ul li ul li ul{top: 0; left: -999999px;}  
            .inner_main_menu ul li:hover ul li ul{top: 0; left: -999999px;}  
            .inner_main_menu ul li ul li:hover ul{top: 0; left: 200px;}  
            .inner_main_menu ul li:hover a{color: #6FDA44}  
            .inner_main_menu ul li:hover ul li a{color: #ffffff}  
            .inner_main_menu ul li ul li a:hover{color: #262626}  
            .inner_main_menu ul li ul li:hover a{background: #ddd; color: #262626;}  
            .inner_main_menu ul li ul li:hover ul li a{background: #262626; color: #fff;}  
            .inner_main_menu ul li ul li ul li a:hover{background: #ddd; color: #262626;}  
            .slicknav_menu {
              background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
              font-size: 16px;
              padding: 5px;
              display: none;    
              position: fixed;
              right: 0;
              width: 100%;
              z-index: 99999;
            }
            ul.slicknav_nav {
              background: #262626 none repeat scroll 0 0;
              left: 0;
              position: absolute;
              top: 0;
              width: 80%;
            }
            .slicknav_btn {top: 35px;}
            #main_menu{width: 100%; position: relative;}
            .logo_area{width: 300px; height: 300px; position: absolute; left: 45%; top: 0; content: ""; margin-left:-150px; text-align: center; }
            @media only screen and (min-width: 200px) and (max-width: 767px) { 
                .slicknav_menu{display: block;}
                .inner_main_menu{display: none;}
                .logo_area {height: auto;left: 0;margin-left: 0;position: relative;top: 0;width: 130px;}
                .logo_area img{height: auto;width: 100%;}









            }
        </style>
    </head>
    <body>
        <div id="main_menu" style="display:flex;">
            <div class="logo_area" style="display:flex; z-index:-10">
                <a href="http://localhost:8080/FastFest/" style="height:150px;"><img src="<%=request.getContextPath()%>/resources/images/logo3.png" alt="" style="height:230px; margin-top:-20px; margin-left:20px; display:flex;"></a>
            </div>
           <div class="inner_main_menu">
                <ul id="menu">
                    <li><a href="http://localhost:8080/FastFest/">Home</a></li>
                    <li><a  class="nav-link" href="${commonURL}/note/list">공지사항</a></li>
                    <li><a href="">게시판</a>
                        <ul style = "background: #0067a3">
                            <li><a href="http://localhost:8080/FastFest/freeboard/list">자유게시판</a></li>
                            <li><a href="http://localhost:8080/FastFest/gallery/list">갤러리</a></li>
                            <li><a href="http://localhost:8080/FastFest/like/list">즐겨찾기</a></li>
                        </ul>
                    </li>
                    <li><a href="http://localhost:8080/FastFest/calendar">이달의 축제</a></li>
                    
                    
                    <%if(userid.equals("")) {%>
                    <li style="margin-right:60px"><a href="">로그인</a>
                        <ul style = "background: #0067a3">
                            <li><a class="nav-link" href="${commonURL}/member/login">로그인</a>
           			</li>
                            <li><a class="nav-link" href="${commonURL}/member/join">회원가입</a>
           			</li>
                        </ul>
                    </li>
                    <%}else{%>
                    <li><a href="">내정보</a>
                        <ul style = "background: #0067a3">
                            <li><a class="nav-link" href="${commonURL}/member/myinfo">내정보</a>
           			</li>
                            <li><a class="nav-link" href="${commonURL}/member/logout">로그아웃</a>
           			</li>
                        </ul>
                    </li>
                    <%} %>
                    
                    
                    
                </ul>
            </div>
        </div>
        
     <!-- 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script src="jquery.slicknav.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $('#menu').slicknav();
        });
    </script>
     -->  
    </body>
</html>