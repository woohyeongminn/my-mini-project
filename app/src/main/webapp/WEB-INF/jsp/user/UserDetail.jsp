<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="https://static.msscdn.net/mfile_outsrc/js/vendor/jquery-1.11.1.min.js?20160201"></script>

<style>
 .btn {
 background-color:white
 }
</style>

<br><br><br><br>
    <div id="top">
      <b style="font-size: 20px">JOIN</b><br> 
    </div>
<hr><br>

<body>

    <div class="all-content"> 

      <div class="uj">
        <label for='f-date'>date &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
        <input id='i-date' type='text' name='joinDate' value="${user.joinDate}" style="border:0 solid black" readonly/>
      </div>
    
      <div class="ue">
        <label for='f-email'>email&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
        <input id='i-email' type='email' name='email' value="${user.email}" style="border:0 solid black" readonly/>
      </div> 
  
      <div class="un">
        <label for='f-name'>name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
        <input id='i-name' type='text' name='name' value="${user.name}" style="border:0 solid black" readonly/>
      </div>
      
      <div class="ut">
        <label for='f-tel'>tel &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
        <input id='i-tel' type='tel' name='tel' value="${user.tel}" style="border:0 solid black" readonly/>
      </div>    

      <form action='update/nickname' name='userInfo' method='post'>    
			    <div class="d-grid gap-2 d-md-flex justify-content-md-center">
		        <label for='f-nickname'>nickname</label>
		        <input id='i-nickname' type='text' name='nickname' placeholder="${user.nickname}"/>
			      <button class="btn" type="submit">update</button>
		      </div>
      </form>

		  <form action='update/password' name='userInfo' method='post'>
		      <div class="d-grid gap-2 d-md-flex justify-content-md-center">
		        <label for='f-password'>password</label>
		        <input id='i-password' type='password' name='password'/>
            <button class="btn" type="submit">update</button>
		      </div>
		  </form>
		  <br>
      <form action='delete' name='userInfo' method='post'>
          <div class="d-grid gap-2 d-md-flex justify-content-md-center">
            <button class="btn" type="submit">secession</button>
          </div>
      </form>		  

    </div>
    <br>
  <br><hr>
</body>


     