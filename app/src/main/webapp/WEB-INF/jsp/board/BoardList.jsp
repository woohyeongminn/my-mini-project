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
 .all-content {
  width: 100%;
  max-width: 900px;
  margin: 0 auto;
  font-size: 16px;
  }  
</style>

<br><br>
<div id="top">
  <b style="font-size: 20px">Board</b><br> 
</div>
  
<div class="all-content">
<hr>
 <table class="table table-responsive text-center">
   <thead>
     <tr id="head">
       <th>no</th>
       <th>title</th>
       <th>writer</th>
       <th>view</th>
       <th>create</th>
     </tr>   
   </thead>
 
   <tbody>
     <c:forEach items="${boadList}" var="board">
       <td>${askBoard.askNo}.</td>
       <td><a href='detail?no=${board.no}'>${board.title}</a></td>
       <td>${board.writer.perNickname}</td>
       <td>${askBoard.askVeiwCount}</td>
       <td>${askBoard.askRegisteredDate}</td>          
     </c:forEach>
   </tbody>
 </table>
 <hr>

 <c:if test="${empty boardList}">
  <div style="text-align: center"> 
   <b style="font-size:14; text-align: center">There are no registered board post</b>
  </div> 
 </c:if>
 <br>
 <br>
</div>
  
<div class="d-grid gap-2 d-md-flex justify-content-md-end">
  <c:choose>
      <c:when test="${not empty loginUser}">
           <form action='form' name='boardInfo' method='get'>		        
           <button class ="btn">registration</button>
         </form>  
      </c:when>
      
      <c:otherwise>
         <button class ="btn" onclick="loginpopup()">registration</button>
      </c:otherwise>
  </c:choose>
</div>

<p id="paging">
    <c:if test="${pageNo > 1}">
      <a href="list?pageNo=${pageNo-1}&pageSize=${pageSize}">◀</a>
    </c:if>
    <c:if test="${pageNo <= 1}">
     ◀
    </c:if>
    ${pageNo}
    <c:if test="${pageNo < totalPage}">
      <a href="list?pageNo=${pageNo+1}&pageSize=${pageSize}"> ▶</a>
    </c:if>
    <c:if test="${pageNo >= totalPage}">
     ▶
    </c:if>
</p>    

<script>
document.querySelectorAll("tbody a").forEach((aTag) => {
  aTag.onclick = () => false;
});

var trList = document.querySelectorAll("tbody tr"); // 리턴 객체는 HTMLCollection 타입 객체이다.
trList.forEach(function(trTag) {
  trTag.onclick = (e) => {
    //console.log(e.currentTarget.querySelector("a").href);
    //e.currentTarget.querySelector("a").click();
    window.location.href = e.currentTarget.querySelector("a").href;
    //window.location.href = "detail?no=" + e.currentTarget.getAttribute("data-no");
  };
});

function loginpopup() {
	  alert("please do login.")
	  }
</script>







