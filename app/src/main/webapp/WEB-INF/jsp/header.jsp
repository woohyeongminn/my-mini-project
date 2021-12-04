<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <header id="header" >
 
 <style>
  #headtitle {
  text-align:center;
  font-size:20px;
  }
  #headlist {
  text-align:right;
  }
 </style>
  
   <div id="headtitle">
    <a href="${contextPath}/app/index">
     <b>woohyeongmin</b>
    </a>  
   </div>
   
   <div id="headlist">
	  <a href="${contextPath}/app/user/form" >join&nbsp;</a> 
	  <a href="${contextPath}/app/auth/form">login&nbsp;</a> 
	  <a href="${contextPath}/app/board/list">board</a>
   </div>
  

 </header>
 
