<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <header id="header" >
 
 <style>
 
  #atag {
	 text-align: right;
	 font-size:16px;
	  padding: 10px;
 }
  #title {
	 text-align: center;
	 font-size:16px;
 }
  b {
	 font-size: 14px;
	 line-height: 10px;
 }
 </style>
  <br>
  
  <div id="title">
    <a href="${contextPath}/app/index" >
      <b>📝hmWoo</b>
    </a>  
  </div> 
  
  <div id="atag">
	  <a href="${contextPath}/app/user/form" >
	    <b>회원가입</b>
	  </a> |
	  <a href="${contextPath}/app/auth/form">
	    <b>로그인</b>
	  </a> |
	  <a href="${contextPath}/app/board/list">
	    <b>게시판</b>
	  </a>
  </div>

 </header>

