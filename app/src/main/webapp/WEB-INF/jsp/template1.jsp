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
 min-height: 100vh;
 width:100%
 }
 section {
  padding-bottom:100px;
 }
 html, body {
  margin: 0;
  padding:0;
 }
 .footer {
   width:100%;
   height:110px;
   position:absolute;
   bottom:0;
   text-align: center;
   color: black;
 } 
</style>

<html>
 
<title>hm-Woo</title>

	<c:if test="${not empty refresh}">
	  <meta http-equiv="Refresh" content="${refresh}">   
	</c:if>

  <jsp:include page="header.jsp"/>
    
  <body>
    <div class="container">
	     <div class="test">
	      <section>
		      <p>
		        <jsp:include page="${contentUrl}"/>
		      </p>
	      </section>
	     </div> 
    
    <jsp:include page="footer.jsp"/> 
    
    </div>
  </body>  
</html> 

  
    
    