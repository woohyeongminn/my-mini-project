<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="UTF-8">
<style>
 .btn {
 background-color: white;
 }
  a {
  color:black;
  } 
</style>

<br><br><br><br>
    <div id="top">
      <b style="font-size: 20px">INFOMATION</b><br> 
    </div>
<hr><br>
<b>${user.name}'s e-mail</b>
<br>
<b>${email}</b>
<br>
<br>
    <div class="d-grid gap-2 d-md-flex justify-content-md-center">
       <button class="btn" type="button" onclick="getPwform()">password</button>
       <button class="btn" type="button" onclick="login()">login</button>
    </div>
<br><hr>

<script>
function login() {
    var link = 'http://localhost:8080/woo/app/auth/form';
    location.href=link;
  }
function getPwform() {
    var link = 'http://localhost:8080/woo/app/user/get/pwform';
    location.href=link;
  }  
</script>