<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="UTF-8">
<style>
  a {
  color:black;
  } 
</style>

<br><br><br><br>
    <div id="top">
      <b style="font-size: 20px">LOGIN</b><br> 
    </div>
<hr><br>

<form action="login" method="post">
  <div id="all">
    <label>email&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
	  <input type="email" name="email" value="${cookie.email.value}" style="margin-left: 2px;">
	  <br>
	  <label>password&nbsp;</label>
	  <input type="password" name="password">
	  <br>
    <div class="form-check">
       <span>remember</span>
       <input id="f-saveEmail" type="checkbox" class="rememberCheck" name="saveEmail" ${not empty cookie.email ? "checked":""}>
    </div>
    <br>	    
	  <button type="submit" style="background-color:white">login</button>
	  <button type="button" style="background-color:white" onclick="findEmailForm()">email</button> 
	  <button type="button" style="background-color:white" onclick="getPasswordForm()">password</button> 
  </div>
</form>

<br><hr>

<script>

function findEmailForm() {
	  var link = 'http://localhost:8080/woo/app/user/find/emailform';
	  location.href=link;
	}
function getPasswordForm() {
    var link = 'http://localhost:8080/woo/app/user/get/pwform';
    location.href=link;
  }	

</script>
