<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<style>
 .container {
 text-align: center;
 }
 body {
 margin-left: 100px; 
 margin-right: 100px;
 }
</style>

<head>
<c:if test="${not empty refresh}">
  <meta http-equiv="Refresh" content="${refresh}">   
</c:if>

  <title>hm-Woo</title>
 
  <script src="${contextPath}/node_modules/@popperjs/core/dist/umd/popper.js"></script>
  <script src="${contextPath}/node_modules/bootstrap/dist/js/bootstrap.js"></script>
  <script src="${contextPath}/node_modules/sweetalert2/dist/sweetalert2.js"></script>

</head>
  <body>
    <jsp:include page="header.jsp"/>
    <hr>
    
    <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">
        <p>${pageTitle}</p>
      </div>
    </section><!-- End Breadcrumbs -->

    <section class="inner-page pt-4">
      <div class="container">
        <p>
          <jsp:include page="${contentUrl}"/>
        </p>
      </div>
    </section>

    </main><!-- End #main -->
    
    
    <jsp:include page="footer.jsp"/> 
    
  </body>  