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
      <b style="font-size: 20px">MY&nbsp;PAGE</b><br> 
    </div>
<hr><br>

<body>
  <form action='updateform' name='userInfo' method='post' enctype="multipart/form-data" onsubmit="return checkValue()">
		<b>${user.name}</b><br>
		<b>${user.nickname}</b><br>
		<b>${user.email}</b><br>
		<b>${user.joinDate}</b><br>
		<br>
		<div class="d-grid gap-2 d-md-flex justify-content-md-center">
	       <button id="x-add-btn" class="btn" type="submit" onclick="joinPopup()" >update</button> 
	  </div>
	</form> 
  <br><hr>
</body>




