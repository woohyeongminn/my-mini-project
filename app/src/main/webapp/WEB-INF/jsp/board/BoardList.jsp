<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>

  .all-content {
  width: 100%;
  max-width: 900px;
  margin: 0 auto;
  }  
  .btn {
    background-color:white
  }
  #paging {
  text-align: center;
  }
  hr {
  display: block;
  unicode-bidi: isolate;
  margin-block-start: 0;
  margin-block-end: 0;
  margin-inline-start: 0;
  margin-inline-end: 0;
  overflow: hidden;
  border-style: inset;
  border-width: 1px;
}
</style>

<br><br>
    <div id="top">
      <b style="font-size: 20px">BOARD</b><br> 
    </div>

  <div class="all-content">
  <br>
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
        <c:forEach items="${boardList}" var="board">
              <tr>
                <td>${board.no}.</td>
                <td><a href='detail?no=${board.no}'>${board.title}</a></td>
                <td>${board.writer.nickname}</td>
                <td>${board.viewCount}</td>
                <td>${board.createDate}</td>
              </tr>
        </c:forEach>
      </tbody>

    </table>
  </div>
    

    <c:if test="${empty boardList}">
     <div style="text-align: center"> 
      <b style="font-size:14; text-align: center">There are no registered posts.</b>
     </div> 
    </c:if>
  
    
    <br>
    <c:choose>
      <c:when test="${not empty loginUser}">
        <form action="form" method="get">
          <button class="btn" type="submit" >registration</button>
        </form>
      </c:when>
      
      <c:otherwise>
        <button class="btn" onclick="logout()">registration</button>
      </c:otherwise>
    </c:choose>
   
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

function logout() { 
    alert("please do login")
    }
</script>







