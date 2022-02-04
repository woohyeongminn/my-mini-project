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
      <b style="font-size: 20px">TO ISSUE</b><br> 
    </div>
<hr><br>
<b>A temporary password has been issued to ${user.name}'s e-mail.</b>
<br>
<br>
<br>
    <div class="d-grid gap-2 d-md-flex justify-content-md-center">
       <button class="btn" type="button" onclick="findEmailform()">email</button>
       <button class="btn" type="button" onclick="login()">login</button>
    </div>
<br><hr>

<script>
function findEmailform() {
    var link = 'http://localhost:8080/woo/app/user/find/emailform';
    location.href=link;
  }
function login() {
    var link = 'http://localhost:8080/woo/app/auth/form';
    location.href=link;
  }  
</script>