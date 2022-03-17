<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<script src="https://cdn.ckeditor.com/ckeditor5/32.0.0/classic/ckeditor.js"></script>
	<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&display=swap" rel="stylesheet">
<style>
.ck.ck-editor {
    max-width: *;
}
.ck-editor__editable {
    min-height: 400px;
}
 
</style>
</head>
<body>
    <%@include file="../include/nav.jsp" %>
	<%
	
	GalleryDto dto = (GalleryDto)request.getAttribute("galleryDto");
	String mode = (String)request.getAttribute("mode");
	if(mode == null)
		mode = "";
	%>

	<form  name="myform" method="post" enctype="multipart/form-data">	
		<input type="hidden" name="id" value="<%=dto.getId()%>" />
		
    <div class="container" style="margin-top:100px; font-family: 'Dongle', sans-serif; font-size:30pt">
        <h2>갤러리 쓰기</h2>

        <table class="table table-hover " style="margin-top: 20px;font-size:20pt">
            <colgroup>
                <col width="25%">
                <col width="*">
            </colgroup>
        
            <tbody>
              <tr>
                <td>제목</td>
                <td>
                    <div class="mb-3" style="margin-top:13px;">
                        <input type="text" class="form-control" id="title" name="title" 
                        placeholder="제목을 입력하세요" value="<%=dto.getTitle()%>" style="font-size:20px">
                    </div>
                </td>
              </tr>       
              <tr>
                <td>작성자</td>
                <td>
                    <div class="mb-3" style="margin-top:13px;">
                    	<%if(!dto.getWriter().equals("")) {%>
                        <input type="text" class="form-control" id="writer" name="writer" 
                        placeholder="이름을 입력하세요" value="<%=dto.getWriter()%>" style="font-size:20px">
                        <%}else{ %>
                        <input type="text" class="form-control" style="font-size:20px" id="writer" name="writer" 
                        value="<%=userid%>" readOnly >
                        <%} %>
                    </div>
                </td>
              </tr>      
              <tr>
                <td>내용</td>
                <td>
                    <div class="mb-3" style="margin-top:13px;">
                      <textarea class="form-control" rows="5" id="comment" name="comment" style="font-size:20px"><%=dto.getComment()%></textarea>
                    </div>
                </td>
              </tr>    
              
              <tr>
                <!-- <td>이미지</td> -->
                <td>
                    <div class="mb-3"">
                        <input type="hidden" class="form-control" id="image" name="image" 
                        placeholder="이미지를 업로드하세요">
                    </div>
                </td>
              </tr>
              
                    
            </tbody>
          </table>
       
          <div class="container mt-3" style="text-align:right;font-size:50pt">
          <%if(!mode.equals("update")) {%>
            <input type="button" class="btn btn-secondary" value="등록" onclick="goWrite()" style="width:80px;height:40px;font-size:20pt">
            <%}else{ %>
            <input type="button" class="btn btn-secondary" value="수정완료" onclick="goModify()" style="width:80px;height:40px;font-size:20pt">
            <%} %>
          </div>
          
    </div>
    
    </form>
</body>
</html>

<script>
var myEditor;
function getImageName(){
	var frm = document.myform;
	console.log('getImageName:-----------------------'+myEditor.getData());
	
	const editorData = myEditor.getData(); // <div><img>
	

   var htmlObject = document.createElement('div');
   htmlObject.innerHTML = editorData;
   
   console.log("htmlObject"+htmlObject);
   
   
   var list = htmlObject.querySelectorAll('img');
   if(list.length!=0){
      var nameList = list[0].getAttribute("src").split("/");
      console.log("nameList"+nameList);
      
      var filename = nameList[nameList.length-1];
      console.log("filename:"+filename);
      
      frm.image.value = filename; // upload hidden tag
      
      console.log(filename);
      
   }else{
	   alert("이미지를 하나 이상 업로드 하셔야 합니다.");
	   
		return false;

   }
   
}
function goWrite()
{
	var frm = document.myform;
	var id = "<%=userid%>";
	if(id == ""){
	      alert("로그인하세요");
	      location.href="${commonURL}/member/login";
	      return false;
	 }
	if( frm.title.value.trim().length==0)
	{
		alert("제목을 입력하세요");
		frm.title.focus();
		return false;
	}
	
	if( frm.writer.value.trim().length==0)
	{
		alert("이름을 작성하세요");
		frm.writer.focus();
		return false;
	}
	
	var ret = getImageName();
	
	if(ret==false){
		return false;
	}
	
	frm.action="<%=request.getContextPath()%>/gallery/save";
	frm.method="post";
	frm.submit(); //서버로 전송하기 
	
}

function goModify(){
	  var frm = document.myform;
	  var id = "<%=userid%>";
		if(id == ""){
		      alert("로그인하세요");
		      location.href="${commonURL}/member/login";
		      return false;
		 }
	  if( frm.title.value.trim().length==0)
		{
			alert("제목을 입력하세요");
			frm.title.focus();
			return false;
		}

	    //var frmData = new FormData(document.myform);  -- 파일전송시에 사용하자 
	    //enctype="multipart/~"
	    
	   	var ret = getImageName();
	    if(ret==false){
			return false;
		}
		
	    frm.comment.value = myEditor.getData();
	    
	    var queryString = $("form[name=myform]").serialize(); 
	    //파일전송없을때 안정적으로 감
	    console.log(queryString);
	    console.log("goModify================"+ myEditor.getData());
	   
   		$.ajax({
	      url:"${commonURL}/gallery/update",
	      data:queryString,
	      type:"POST"
	    })
	    .done( (result)=>{
	        
	      alert("등록되었습니다.");
	      location.href="${commonURL}/gallery/list";
	      
	    })
	    .fail( (error)=>{
	       console.log(error);
	    });
	
}


ClassicEditor
.create( document.querySelector( '#comment' ), {
	ckfinder: {
        uploadUrl: '${commonURL}/ck/fileupload' // 내가 지정한 업로드 url (post로 요청감)
	},
	alignment: {
        options: [ 'left', 'center', 'right' ]
    }
}  )
.then( editor => {
	 console.log( 'Editor was initialized', editor );
     myEditor = editor;
} )
.catch( error => {
        console.error( error );
} );
</script>







