<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <style>
  .all-content {
  width: 100%;
  max-width: 900px;
  margin: 0 auto;
  font-size: 14px;
  }   
  label {
    margin-right: 5px;
    text-align: center;
    display: inline;
    width: 60px;
    size:100px;
  }
  .btn {
    line-height: 14px;
  }
  a {
  color: black;
  }  
</style>
<div class="all-content">
<br>
      <br>../
      <label for="f-title" class="form-label">title</label>
      <input id="title"  type="text" class="form-control" name="askTitle" placeholder="*please write title"></input>
    
      <label for="f-content" class="form-label">content</label>
      <textarea id="content"  class="form-control" id="f-content" name="askContent" placeholder="*please write content" cols="50" rows="8"></textarea>
     
    <hr><br><div class="d-grid gap-2 d-md-flex justify-content-md-end">
  <form id="all" action="add" method="post">
     <button class="btn btn-outline-dark" type="submit" value="등록" onclick="addPopup()" >registration</button>
  </form>

  <form id="all" action="" method="post">
     <button class="btn btn-outline-dark" type="submit" value="등록" onclick="addPopup()" >registration</button>
  </form>    
   </div> 
</div>
<script>
var fStatus = document.querySelector("#f-status");
var passwordRow = document.querySelector("#passwordRow");

passwordRow.style["display"] = "none";

fStatus.addEventListener("input", function() {
  if (fStatus.value == "2") {
    passwordRow.style["display"] = "";
  } else {
     passwordRow.style["display"] = "none";
  }
});
</script>

<script>  
  document.querySelector("#all").onsubmit = () => {
  if (document.querySelector("#title").value == "") {
    alert("**제목을 입력해주세요.")
    return false;
  } else if (document.querySelector("#content").value == "") {
    alert("**내용을 입력해주세요.")
    return false;
  }
};

function addPopup() { 
    alert("")
    }
</script>




