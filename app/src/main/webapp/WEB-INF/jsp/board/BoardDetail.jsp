<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <style>
  .all-content {
  width: 100%;
  max-width: 900px;
  margin: 0 auto;
  font-size: 14px;
  }   
  label {
    margin-right: 5px;
    text-align: center;
    display: inline;
    width: 60px;
    size:100px;
  }
  .btn {
    line-height: 14px;
    background-color:white
  }
  a {
  color: black;
  }  
</style>
<br><br>
    <div id="top">
      <b style="font-size: 20px">BOARD</b><br> 
    </div>
    
    <div class="all-content">
        <c:choose>
          <c:when test="${loginUser.no == board.writer.no}">
	          <form id="board-form" action='update' name='boardInfo' method='post' enctype="multipart/form-data" onsubmit="return checkValue()">
				      <hr>    
				      <br>
				      
				      <div id="bwd" style="margin-left:234px;">
					      <input  style="border:0 solid black; font-size: 14px;" placeholder="${board.writer.nickname}" readonly />
					      <input  style="border:0 solid black; font-size: 14px;" placeholder="${board.createDate}" readonly />
				      </div>
				      
				      <br>
				      <br>
				      <label for="f-title" style="margin-right: 360px;">title</label>
				      <br>
				      <textarea id="title"  class="form-control" name="title" placeholder="${board.title}" cols="50" rows="1" ></textarea>
				      <br>
				      <br>
				    
				      <label for="f-content" class="form-label" style="margin-right: 338px;">content</label>
				      <br>
				      <textarea id="content"  class="form-control" id="f-content" name="content" placeholder="${board.content}" cols="50" rows="8" ></textarea>
				      <input type ='hidden' name='no' value='${board.no}'>
				      <br>
				      <br>
				          
				 
				      <div id="mp">
				        <label id='f-photo' for='f-photo' class="col-sm-2 col-form-label"></label>
				        <input id='f-photo' type='file' name='photoFile' /><br>
				      </div>
				      <hr>  
				                
			        <button class="btn " type="submit" onclick="updatePopup()" >update</button>
			        <button class="btn " type="submit" onclick="deletePopup()" >delete</button>
			        <button type="button" class="btn" onclick="backPopup()">back</button>
			      </form>
          </c:when>
          
          <c:otherwise>
            <hr>    
            <br>
            
            <c:choose>
              <c:when test="${board.writer.activityState == 2 or board.writer.activityState == 3}">
		            <div id="bwd" style="margin-left:234px;">              
			            <input  style="border:0 solid black; font-size: 14px; color:blue;" placeholder="Member who not exist" readonly />
	                <input  style="border:0 solid black; font-size: 14px;" placeholder="${board.createDate}" readonly />
                </div>
              </c:when>
                        
              <c:otherwise>
                <div id="bwd" style="margin-left:234px;">  
				          <input  style="border:0 solid black; font-size: 14px;" placeholder="${board.writer.nickname}" readonly />
		              <input  style="border:0 solid black; font-size: 14px;" placeholder="${board.createDate}" readonly />
                </div>
              </c:otherwise>
            </c:choose>
            
            <br>
            <br>
            <label for="f-title" style="margin-right: 360px;">title</label>
            <br>
            <textarea id="title"  class="form-control" name="title" placeholder="${board.title}" cols="50" rows="1" readonly></textarea>
            <br>
            <br>
          
            <label for="f-content" class="form-label" style="margin-right: 338px;">content</label>
            <br>
            <textarea id="content"  class="form-control" id="f-content" name="content" placeholder="${board.content}" cols="50" rows="8" readonly></textarea>
            <br>
            <br>
                
       
            <div id="mp">
              <label id='f-photo' for='f-photo' class="col-sm-2 col-form-label"></label>
              <input id='f-photo' type='file' name='photoFile' /><br>
            </div>
            <hr>          
		        <button type="button" class="btn" onclick="backPopup()">back</button>
          </c:otherwise>
        </c:choose>
    </div> 

<script>  
  
 document.querySelector("#all").onsubmit = () => {
  
  if (document.querySelector("#title").value == "") {
    alert("**please enter the title.")
    return false;
  } else if (document.querySelector("#content").value == "") {
    alert("**please enter the content.")
    return false;
  } else {
    function updatePopup() { 
      alert("the post has been registered.")
      }
  }
};

function updatePopup() {
  alert("has been changed.")
}

function backPopup() {
  var link = 'http://localhost:8080/woo/app/board/list';
  location.href=link;
}
  
</script>




