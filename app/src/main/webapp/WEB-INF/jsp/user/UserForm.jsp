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
  text-align: left;
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
      <b style="font-size: 20px">JOIN</b><br> 
    </div>
   <hr>
    <form id="user-form" action='add' name='userInfo' method='post' enctype="multipart/form-data" onsubmit="return checkValue()">
 
      <div id="mp" >
        <label id='f-photo' for='f-photo' class="col-sm-2 col-form-label">photo</label>
        <input id='i-photo' type='file' name='photoFile' /><br>
        <p style="color: blue;">*미선택시 기본이미지로 등록됩니다.</p>
      </div>

      <div id="mn">
        <label id='f-name' for='f-name' class="col-sm-2 col-form-label">name</label>
        <input id='i-name' type='text' name='name' value="${perName}" placeholder="*필수"/><br>
      </div>
     
      
      <div id="me">
        <label for='f-email' class="col-sm-2 col-form-label">e-mail</label>
        <input id='i-email' type='text' name='id' pattern="^[a-zA-Z0-9]+$" placeholder="*필수"/> @
        <select name="site">
          <option>naver.com</option>
          <option>daum.net</option>
          <option>gmail.com</option>
          <option>kakao.com</option>
        </select>
        <input type="button" class="btn btn-outline-dark" value="인증하기" onclick="idOverlap()"/><br>
      </div>   

      <div id="mt">
        <label id='f-tel'for='f-tel' class="col-sm-2 col-form-label">tel</label>
        <input id='i-tel' type='text' name='telNo' pattern="[0-9]+" minlength='3' maxlength='3'  style="width:50px;"/> -
        <input type='text' name='telNo' pattern="[0-9]+" minlength='4' maxlength='4'  style="width:50px;"/> -
        <input type='text' name='telNo' pattern="[0-9]+" minlength='4' maxlength='4'  style="width:50px;"/>
        <input type="button" class="btn btn-outline-dark" value="인증하기" /><br> 
      </div>

      <div id="mnn">
        <label id='f-nicknam'for='f-nickname' class="col-sm-2 col-form-label">nickname</label>
        <input id='i-nickname' type='text' name='nickname' placeholder="*필수" />
        <input type="button" class="btn btn-outline-dark" value="중복확인" onclick="nicknameOverlap()"/><br>
      </div>
            
      <div id="mpw">
        <label id='f-password' for='f-password' class="col-sm-2 col-form-label">password</label>
        <input id='i-password' type='password' name='newpassword'
         pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{7,16}$"
         title="영어(대소문자), 숫자, 특수문자를 포함해 8자 이상 16자 이하로 입력해주세요."
         placeholder="*필수"/><br>
      </div>
     
     <div id="mpwc">
      <label id='f-passwordcheck' for='f-passwordcheck' class="col-sm-2 col-form-label">re-input</label>
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
       <button id="x-add-btn" class="btn btn-primary" type="submit" onclick="joinPopup()" >✔join</button> 
       <a id="x-cancle-btn" type="button" class="btn btn-outline-dark btn-primary" href="${contextPath}/app/index">❌cancel</a>
     </div> 
   </form>
  </div>
</body>

<script type="text/javascript">
function checkValue() {
  
  var form = document.userInfo;
  
  if(!form.name.value){
        alert("이름을 입력하세요.");
        return false;
   }
  
  if(!form.nickname.value){
        alert("닉네임을 입력하세요.");
        return false;
    }
  
  if(!form.telNo.value && !form.telNo.value && !form.telNo.value){
        alert("전화번호를 입력하세요.");
        return false;
    }

    if(!form.email.value){
          alert("이메일을 입력하세요.");
          return false;
     }
    
/*     if(!form.email.value != "checkEmail"){
           alert("이메일 중복체크를 해주세요.");
           return false;
     }
      */
    if(!form.newpassword.value){
          alert("비밀번호를 입력하세요.");
          return false;
     }
    
    if(form.assword.value ==""){
          alert("비밀번호 확인란에 입력해주세요.");
          form.passwordcheck.focus();
          return false;
      }
    
    if(form.newpassword.value != form.password.value){
          alert("비밀번호를 동일하게 입력하세요.");
          form.passwordcheck.focus();
          return false;
     }
}
</script>

<script>
document.querySelector("#user-form").onsubmit = () => {
  if (document.querySelector("#i-name").value == "" ||
      document.querySelector("#i-email").value == "" ||
      document.querySelector("#i-nickname").value == "" ||
      document.querySelector("#i-tel").value == "" ||
      document.querySelector("#i-password").value == "") {
    window.alert("필수 입력 항목이 비어 있습니다.")
    //Swal.fire("필수 입력 항목이 비어 있습니다.")
    return false;
  }
};
</script>

<script>
var addBtn = document.querySelector("#x-add-btn");

function nicknameOverlap(){
  
  var form = document.userInfo;
      console.log("nicknameOverlap 호출")
      console.log("닉네임 입력 값 : "+form.nickname.value)
    $.ajax({
      type :"post",/* 전송 방식 */
      url :"nicknameOverlap", /* 컨트롤러 사용할 때. 내가 보낼 데이터의 주소. */
      data : {"nickname" : form.nickname.value},
      /* JSON형식 안에 JSON 형식으로 표현한 데이터. 
            "파라미터 이름" : 폼태그에 적은 NAME 값.ID입력창의 NAME값.value 여러 개도 가능
      data :{ "id" : joinForm.id.value, 
      "id1" : joinForm.password.value}, 이렇게도 사용 가능.         
      */
      dataType : "text",  /* text, xml, html, script, json, jsonp 가능 */
            //정상적인 통신을 했다면 function은 백엔드 단에서 데이터를 처리.
            
      success : function(data){ 
        
        console.log(data);
        
        if(data=="1"){
          alert("사용 가능한 닉네임 입니다.");
          addBtn.removeAttribute("disabled");
        }else{  //ajax가 제대로 안됐을 때 .
          alert("이미 사용중인 닉네임 입니다.");
          addBtn.setAttribute("disabled", "disabled");
        }
      },
      error : function(){
        alert("닉네임 중복 확인 ajax 실행 오류");
      }
    });
  }
 
 function checkCapsLock(event)  {
  if (event.getModifierState("CapsLock")) {
    document.getElementById("message").innerText 
      = "Caps Lock이 켜져 있습니다."
  }else {
    document.getElementById("message").innerText 
      = ""
  }
}
</script>
     