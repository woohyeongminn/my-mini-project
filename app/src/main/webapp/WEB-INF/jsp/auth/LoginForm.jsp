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
    <label>email</label>
	  <input type="email" name="email" style="border:0 solid black">
	  <br>
	  <label>password</label>
	  <input type="password" name="password" style="border:0 solid black">
	  <br>
	  <br>  
	  <button type="submit" style="background-color:white">login</button> 
  </div>
</form>

<br><hr>