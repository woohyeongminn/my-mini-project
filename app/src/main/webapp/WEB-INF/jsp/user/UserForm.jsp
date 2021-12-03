<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="https://static.msscdn.net/mfile_outsrc/js/vendor/jquery-1.11.1.min.js?20160201"></script>

<style>

 .all-content {
    width: 100%;
    max-width: 500px;
    margin: 0 auto;
    font-size:14px;
  }
  form {
  max-width: 500px;
  }
  .btn {
   font-size: 14px;
   line-height: 10px;
  }
  a {
  color:black;
  } 
  #x-add-btn {
  background: white;
  }  
  
  
</style>

<body>
  <div class="all-content">
   <br>
    <div id="top">
      <b style="font-size: 20px">🙋회원 가입</b><br> 
    </div>
   <hr>
    <form id="user-form" action='add' name='userInfo' method='post' enctype="multipart/form-data" onsubmit="return checkValue()">
 
      <div id="mp">
        <label id='f-photo' for='f-photo' class="col-sm-2 col-form-label">사진</label>
        <input id='f-photo' type='file' name='photoFile' /><br>
        <p style="color: blue; margin-left: 85px;">*미선택시 기본이미지로 등록됩니다.</p>
      </div>

      <div id="mn">
        <label id='f-name' for='f-name' class="col-sm-2 col-form-label">이름</label>
        <input id='i-name' type='text' name='name' value="${perName}" placeholder="*필수"/><br>
      </div>
     
      
      <div id="mE">
        <label for='f-email' class="col-sm-2 col-form-label">이메일</label>
        <input id='f-email' type='text' name='id' pattern="^[a-zA-Z0-9]+$" placeholder="*필수"/> @
        <select name="site">
          <option>naver.com</option>
          <option>daum.net</option>
          <option>gmail.com</option>
          <option>kakao.com</option>
        </select>
        <input type="button" class="btn btn-outline-dark" value="중복확인" onclick="idOverlap()"/><br>
      </div>   
         
      <div id="mNn">
        <label id='f-nicknam'for='f-nickname' class="col-sm-2 col-form-label">닉네임</label>
        <input id='i-nickname' type='text' name='nick' placeholder="*필수" />
        <input type="button" class="btn btn-outline-dark" value="중복확인" onclick="nickOverlap()"/><br>
      </div>

      <div id="mt">
        <label id='f-tel'for='f-tel' class="col-sm-2 col-form-label">전화번호</label>
        <input id='i-tel' type='text' name='telNo' pattern="[0-9]+" minlength='3' maxlength='3'  style="width:50px;"/> -
        <input type='text' name='telNo' pattern="[0-9]+" minlength='4' maxlength='4'  style="width:50px;"/> -
        <input type='text' name='telNo' pattern="[0-9]+" minlength='4' maxlength='4'  style="width:50px;"/>
        <input type="button" class="btn btn-outline-dark" value="인증하기" /><br> 
      </div>
            
      <div id="mpw">
        <label id='f-password' for='f-password' class="col-sm-2 col-form-label">비밀번호</label>
        <input id='i-password' type='password' name='password'
         pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{7,16}$"
         title="영어(대소문자), 숫자, 특수문자를 포함해 8자 이상 16자 이하로 입력해주세요."
         placeholder="*필수"/><br>
      </div>
     
     <div id="mpwc">
      <label id='f-passwordcheck' for='f-passwordcheck' class="col-sm-2 col-form-label">재입력</label>
      <input id='i-passwordcheck' type='password' name='password' placeholder="비밀번호 확인"/><br>
     </div>
     <br>
     <label >개인정보 수집 및 이용에 대한 안내</label>
     <input id="perAgree" type="checkbox"/><br>
     <label >이용 약관</label>
     <input id="useAgree" type="checkbox"/><br>
     <label >전체 동의</label>
     <input id="allAgree" type="checkbox"/>
     <hr>
     
     <div class="d-grid gap-2 d-md-flex justify-content-md-center">
       <button id="x-add-btn" class="btn btn-outline-dark btn-primary" type="submit" onclick="joinPopup()" >✔가입하기</button> 
       <a id="x-cancle-btn" type="button" class="btn btn-outline-dark btn-primary" href="${contextPath}/app/index">❌취소하기</a>
     </div> 
   </form>
  </div>
</body>
     