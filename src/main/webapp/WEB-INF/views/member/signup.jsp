<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<div class="wrapper">
  <div class="left-section">
    <span class="logo" onclick="location.href = '/'">대따</span>
    <div>
      <h1>
        주차장을 찾는 <br />
        새로운 경험
      </h1>
      <span style="font-family: 'vitro'">대따</span>
    </div>
  </div>
  <div class="right-section">
    <div class="signup-form">
      <form id="signup">
        <p style="font-weight: 800">아이디</p>
        <input type="text" id="id" class="input_box" placeholder="" />
        <p style="font-weight: 800">이메일</p>
        <input type="text" id="email" class="input_box" placeholder="" />
        <p style="font-weight: 800">비밀번호</p>
        <input type="password" id="pw" name="pw" class="input_box" placeholder="" />
        <p style="font-weight: 800">비밀번호확인</p>
        <input type="password" id="pw" name="pw_chk" class="input_box" placeholder="" />
        <p style="font-weight: 800">성명</p>
        <input type="text" id="name" class="input_box" placeholder="" />
        <p style="font-weight: 800">연락처</p>
        <input type="text" id="tel" name="tel" class="input_box" placeholder="ex)01012345678" />
        <p style="font-weight: 800">닉네임</p>
        <input type="text" id="nickname" class="input_box" placeholder="" />
        <div class="btn bg-white shadow">회원가입</div>
        <div class="btn bg-primary shadow" onclick="location.href = '/login'">
          취소
        </div>
      </form>
    </div>
  </div>
</div>
