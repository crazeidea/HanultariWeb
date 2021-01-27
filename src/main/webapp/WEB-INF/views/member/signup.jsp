<<<<<<< HEAD
<<<<<<< HEAD
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!-- ======= -->
﻿<div class="wrapper">
<!-- >>>>>>> 1caeb27442875fb5c183cf7f9a91f897e6703990 -->
  <div class="left-section">
=======
﻿<div class="ui grid" style="place-items:center;">
  <div id="right" class="eight wide column">
    <div class='ripple-background' style="height:100vh">
      <div class='circle xxlarge shade1'></div>
      <div class='circle xlarge shade2'></div>
      <div class='circle large shade3'></div>
      <div class='circle mediun shade4'></div>
      <div class='circle small shade5'></div>
>>>>>>> 88d48312d91e1dd12faf655f38bcdcf15b806aa0
    <span
      class="logo"
      style="font-family: 'vitro'; font-size: 2.4em; color: white"
      onclick="location.href = '/'"
<<<<<<< HEAD
      >대따</span>
    <div>
=======
      >대따</span
    >
    <div class="title">
>>>>>>> 88d48312d91e1dd12faf655f38bcdcf15b806aa0
      <h1 style="color: white; font-size: 5rem">
        주차장을 찾는 <br />
        새로운 경험
      </h1>
    </div>
  </div>
<<<<<<< HEAD
  <div class="right-section">
    <h1>회원가입</h1>
    <div class="signup-form">
<!-- <<<<<<< HEAD -->
<!-- ======= -->
      <form id="signup" method="post" action="signup/execute">
        <p style="font-weight: 700">이메일</p>
        <input type="text" id="email" name="email" required />
        <p style="font-weight: 700">비밀번호</p>
        <input type="password" id="pw" name="pw" required />
        <p style="font-weight: 700">비밀번호 확인</p>
        <input type="password" id="pw-check" required />
        <p style="font-weight: 700">이름</p>
        <input type="text" id="name" name="name" required />
        <p style="font-weight: 700">전화번호</p>
        <input type="text" id="tel" name="tel" onkeypress="if(event.keyCode==13){signup()}" required />
        <div class="btn bg-primary shadow" onclick="signup()">회원가입</div>
        <div class="btn bg-white shadow" onclick="history.go(-1)">취소</div>
<!-- >>>>>>> 1caeb27442875fb5c183cf7f9a91f897e6703990 -->
=======
</div>

  <div class="eight wide column centered grid">
      <form id="signup" class="ui form huge" method="post" action="signup/execute" style="width:400px; margin: 0 auto;">
	    <h1>회원가입</h1>
        <div class='field'>
          <label>이메일</label>
          <input type="text" id="email" name="email" />
          <button type="button" class="ui button primary" onclick="checkEmail()">중복확인</button>
        </div>
        <div class="field">
          <label>비밀번호</label>
          <input type="password" id="pw" name="pw" />
        </div>
        <div class="field">
          <label>비밀번호 확인</label>
          <input type="password" id="pw-check" />
        </div>
        <div class="field">
        	<label>이름</label>
        	<input type="text" id="name" name="name" />
        </div>
        <div class="field">
        	<label>전화번호</label>
        	<input type="text" id="tel" name="tel" onkeypress="if(event.keyCode==13){signup()}" />
        </div>
        <button type="button" class="ui button primary" onclick="signup()">회원가입</button>
        <button type="button" class="ui button" onclick="history.go(-1)">취소</button>
>>>>>>> 88d48312d91e1dd12faf655f38bcdcf15b806aa0
      </form>
    </div>
</div>
<script>

  $("#email").on('change keyup', function(){
    $("#email").removeClass('valid');
  })

  function checkEmail() {
    var email = $('#email').val();
    $.ajax({
      type: "GET",
      url: "/checkEmail?email=" + email,
      success: function (response) {
        console.log(response);
        if(response == true || email == "") {
          $('body').toast({class: 'error', message: `입력하신 이메일을 사용할 수 없습니다.`});
          $("#email").removeClass('valid');
        } else if (response == false) {
          $('body').toast({class: 'success', message: `입력하신 이메일을 사용할 수 있습니다.`});
          $('#email').addClass('valid');
        }
      }
    });
  }

  function signup() {
      if ($("#email").val() == "") {
        $('#email').popup({content : '이메일을 입력하세요', on:'manual', position:'left center'});
        $('#email').popup('show');
        $('#email').focus();
        return;
      }
      if (!$("#email").hasClass('valid')) {
        $('#email').popup({content : '이메일 중복확인을 해주세요.', on:'manual', position:'left center'});
        $('#email').popup('show');
        $('#email').focus();
        return;
      }
      if ($("#pw").val() == "") {
        $('#pw').popup({content : '비밀번호를 입력하세요', on:'manual', position:'left center'});
        $('#pw').popup('show');
        $('#pw').focus();
        return;
      }
      if ($("#pw-check").val() == "" || $("#pw-check").val() != $("#pw").val()) {
        $('#pw-check').popup({content : '비밀번호가 일치하지 않습니다.', on:'manual', position:'left center'});
        $('#pw-check').popup('show');
        $('#pw-check').focus();
        return;
      }
      if ($("#name").val() == "") {
        $('#name').popup({content : '이름을 입력하세요', on:'manual', position:'left center'});
        $('#name').popup('show');
        $('#name').focus();
        return;
      }
      if ($("#tel").val() == "") {
        $('#tel').popup({content : '휴대전화번호를 입력하세요', on:'manual', position:'left center'});
        $('#tel').popup('show');
        $('#tel').focus();
        return;
      }
      $("#signup").submit();
  }
</script>
<style>

#right{
  background: #3399ff;
}


.circle{
  position: absolute;
  border-radius: 50%;
  background: white;
  animation: ripple 15s infinite;
  box-shadow: 0px 0px 1px 0px #508fb9;
}

.small{
  width: 200px;
  height: 200px;
  left: -100px;
  bottom: -100px;
}

.medium{
  width: 400px;
  height: 400px;
  left: -200px;
  bottom: -200px;
}

.large{
  width: 600px;
  height: 600px;
  left: -300px;
  bottom: -300px;
}

.xlarge{
  width: 800px;
  height: 800px;
  left: -400px;
  bottom: -400px;
}

.xxlarge{
  width: 1000px;
  height: 1000px;
  left: -500px;
  bottom: -500px;
}

.shade1{
  opacity: 0.2;
}
.shade2{
  opacity: 0.5;
}

.shade3{
  opacity: 0.7;
}

.shade4{
  opacity: 0.8;
}

.shade5{
  opacity: 0.9;
}

.logo {
    font-family: 'vitro';
    font-size: 2.4em;
    color: white;
    position: absolute;
    top: 30px;
    left: 30px;
    cursor: pointer;
}

.title {
    position: absolute;
    top: 41%;
    left: 40%;
}

	#right {
	overflow:hidden;
	padding: 0.5em;
	
	}

@keyframes ripple{
  0%{
    transform: scale(0.8);
  }
  
  50%{
    transform: scale(1.2);
  }
  
  100%{
    transform: scale(0.8);
  }
}

</style>
