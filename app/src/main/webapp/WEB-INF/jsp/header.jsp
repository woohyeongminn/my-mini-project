<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <header id="header" >
 
 <style>
 
  #atag {
	 text-align: right;
	 font-size:20px;
	 padding: 10px;
 }
  #title {
	 text-align: letf;
	 font-size:16px;
 }
  b {
	 font-size: 14px;
	 line-height: 10px;
 }
  #ht {
   font-size: 26px;
   line-height: 10px;
 } 
 </style>
  <br>
  
  <div id="title">
    <a href="${contextPath}/app/index" >
     <p id="ht">woohyeongmin🖋</p>
    </a>  
  </div> 
  
  <div id="atag">
	  <a href="${contextPath}/app/user/form" >
	    <b>join</b>
	  </a> |
	  <a href="${contextPath}/app/auth/form">
	    <b>login</b>
	  </a> |
	  <a href="${contextPath}/app/board/list">
	    <b>board</b>
	  </a>
  </div>

 </header>

