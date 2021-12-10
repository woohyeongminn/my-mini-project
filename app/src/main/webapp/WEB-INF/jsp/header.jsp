<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <header id="header" >
 
 <style>
  #headtitle {
  text-align:center;
  font-size:22px;
  }
  #headlist {
  text-align:right;
  }
  a {
  color: black;
  text-decoration:none
   }
 </style>
  
   <div id="headtitle">
    <a href="${contextPath}/app/index">
     <b>hyeonminWoo&nbsp;studio</b>
    </a>  
   </div>
 
<c:choose>
  <c:when test="${empty loginUser}">
	   <div id="headlist">
		  <a href="${contextPath}/app/user/form" >join&nbsp;</a> 
		  <a href="${contextPath}/app/auth/form">login&nbsp;</a> 
		  <a href="${contextPath}/app/board/list">board</a>
	   </div>
   </c:when>

   <c:otherwise>
     <div id="headlist">
      <a href="${contextPath}/app/user/detail" >myinfo&nbsp;</a> 
      <a href="${contextPath}/app/auth/logout">logout&nbsp;</a> 
      <a href="${contextPath}/app/board/list">board</a>
     </div>   
   </c:otherwise>   
</c:choose> 
  

 </header>
 