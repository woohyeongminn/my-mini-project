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
      <b style="font-size: 20px">FIND</b><br> 
    </div>
<hr><br>

<body>
  <form action='email' name='userInfo' method='post' enctype="multipart/form-data" onsubmit="return checkValue()">
    <div class="all-content"> 
    
	    <div class="un">
	      <label for='f-name'>name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
	      <input id='i-name' type='text' name='name'/>
	    </div>

	    <div class="ut">
	      <label for='f-tel'>tel &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
	      <input id='i-tel' type='tel' name='tel'/>
	    </div>    
    </div>
    <br>
    
    <div class="d-grid gap-2 d-md-flex justify-content-md-center">
       <button class="btn" type="submit">find</button>
       <button class="btn" type="button" onclick="login()">back</button>
    </div>   
  </form>
  <br><hr>
</body>

<script>
 function checkValue() {
	 
	 var form = document.userInfo;
	 
	 if (!form.name.value) {
		  alert("please enter your name")
		  return false;
	 }
	 else if (!form.tel.value) {
	      alert("please enter your tel")
	      return false;
	   } 
 }
 
  function login() {
	    var link = 'http://localhost:8080/woo/app/auth/form';
	    location.href=link;
	  }  
</script>

     