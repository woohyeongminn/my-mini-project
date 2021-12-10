<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

  <script src="${contextPath}/node_modules/@popperjs/core/dist/umd/popper.js"></script>
  <script src="${contextPath}/node_modules/bootstrap/dist/js/bootstrap.js"></script>
  <script src="${contextPath}/node_modules/sweetalert2/dist/sweetalert2.js"></script>

<style>
 .container {
 text-align: center;
 }
 body {
 xmargin-left: 100px; 
 xmargin-right: 100px;
 }
 .footer {
   width:100%;
   height:100px;
   position:absolute;
   bottom:0;
   text-align: center;
   color: black;
 } 
</style>

 
<title>hm-Woo</title>

<c:if test="${not empty refresh}">
  <meta http-equiv="Refresh" content="${refresh}">   
</c:if>

  <jsp:include page="header.jsp"/>
    
  <body>
    <div class="container">
	     <div class="test">
		      <p>
		        <jsp:include page="${contentUrl}"/>
		      </p>
	     </div> 
    
    <jsp:include page="footer.jsp"/> 
    </div>
  </body>  
    
    