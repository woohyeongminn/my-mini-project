<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="https://static.msscdn.net/mfile_outsrc/js/vendor/jquery-1.11.1.min.js?20160201"></script>

<style>
 .btn {
 background-color:white
 }
</style>

<br><br><br><br>
    <div id="top">
      <b style="font-size: 20px">JOIN</b><br> 
    </div>
<hr><br>

<body>
  <form action='add' name='userInfo' method='post' enctype="multipart/form-data" onsubmit="return checkValue()">
    <div class="all-content"> 
      
      <div id="mp">
        <label id='f-photo' for='f-photo' class="col-sm-2 col-form-label">사진</label>
        <input id='f-photo' type='file' name='photoFile' /><br>
        <p>*미선택시 기본이미지로 등록됩니다.</p>
      </div>    
    
	    <div class="ue">
		    <label for='f-email' class="col-sm-2 col-form-label">email</label>
	      <input id='i-email' type='email' name='email' placeholder="*" />
	    </div> 
	    
	    <div class="up">
	      <label for='f-password' class="col-sm-2 col-form-label">password</label>
	      <input id='i-password' type='password' name='password' placeholder="*" />
	    </div>     
	
	    <div class="un">
	      <label for='f-name' class="col-sm-2 col-form-label">name</label>
	      <input id='i-name' type='text' name='name' placeholder="*" />
	    </div>
	    
	    <div class="unn">
	      <label for='f-nickname' class="col-sm-2 col-form-label">nickname</label>
	      <input id='i-nickname' type='text' name='nickname' placeholder="*" />
	    </div>    

	    <div class="ut">
	      <label for='f-tel' class="col-sm-2 col-form-label">tel</label>
	      <input id='i-tel' type='tel' name='tel' placeholder="*" />
	    </div>    
    </div>
    <br>
    
    <div class="d-grid gap-2 d-md-flex justify-content-md-center">
       <button id="x-add-btn" class="btn" type="submit" onclick="joinPopup()" >join</button> 
    </div>   
  </form>
  <br><hr>
</body>

     