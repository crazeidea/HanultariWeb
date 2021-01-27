<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<span class="logo" style="font-size:3em; color:white; position:absolute; top:30px; left: 10px;" onclick="location.href = '/'">대따</span>
<div class="area">
	<ul class="circles">
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
	</ul>
</div>
<div style="display: grid; place-items:center; width:100vw; height:100vh;">	
		<div id="login" class="ui large form" style='width:400px;'>
			<div class="ui stacked segment">
				<div class="ui field">
					<h1>
						주차장을 찾는 <br /> 새로운 경험
					</h1>
				</div>
				<div class="ui field">
					<h3>이메일</h3>
					<div class="ui left icon input">
						<i class="user icon"></i> <input type="text" id="email"
							name='email' placeholder="" />
					</div>
				</div>
				<div class="ui field">
					<h3>비밀번호</h3>
					<div class="ui left icon input">
						<i class="lock icon"></i> <input
							onkeypress="if(event.keyCode==13){login()}" type="password"
							id="pw" name='pw' placeholder="" />
					</div>
				</div>
				<button type="button" id="btnLogin" class="ui primary button fluid large" onclick="login()">로그인</button>
			</div>
			<div class="ui message">
				<h4>회원이 아니신가요?</h4>
				<button class="ui primary button fluid large"
					onclick="location.href = '/signup'">회원가입
			</div>
		</div>
</div>

<script type="text/javascript">

    function login() {
        let email = $("#email");
        let pw = $("#pw");
        let emailCheck = 0;
        let pwCheck = 0;

        if ($("#email").val() == "") {
            $('#email').popup({content : '이메일을 입력하세요', on:'manual', position:'left center'});
            $('#email').popup('show');
            $('#email').focus();
            return;
        } else {
            emailCheck = 1;
        }

      if ($("#pw").val() == "") {
            $('#pw').popup({content : '비밀번호를 입력하세요', on:'manual', position:'left center'});
            $('#pw').popup('show');
            $('#pw').focus();
            return;
      } else {
          pwCheck = 1;
      }
      
      if(emailCheck == 1 || pwCheck == 1) {
        $.ajax({
            type: "POST",
            url: "/login/execute?email=" + $("#email").val() + "&pw=" + $("#pw").val(),
            success: function (response) {
                if(response) location.href = document.referrer;
                else {
                        $("#btnLogin").popup({content : '이메일 또는 비밀번호가 올바르지 않습니다.', on:'manual', position:'top center'});
                        $("#btnLogin").popup('show');
                }
            }
        });
        }
    }
	
</script>
<style>
.area{
    background: #5b86e5;  
    background: -webkit-linear-gradient(to left, #8f94fb, #4e54c8);  
    width: 100%;
    height:100vh;
    z-index:-999;
    position: absolute;
   
}

.circles{
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    overflow: hidden;
}

.circles li{
    position: absolute;
    display: block;
    list-style: none;
    width: 20px;
    height: 20px;
    background: rgba(255, 255, 255, 0.2);
    animation: animate 25s linear infinite;
    bottom: -150px;
    
}

.circles li:nth-child(1){
    left: 25%;
    width: 80px;
    height: 80px;
    animation-delay: 0s;
}


.circles li:nth-child(2){
    left: 10%;
    width: 20px;
    height: 20px;
    animation-delay: 2s;
    animation-duration: 12s;
}

.circles li:nth-child(3){
    left: 70%;
    width: 20px;
    height: 20px;
    animation-delay: 4s;
}

.circles li:nth-child(4){
    left: 40%;
    width: 60px;
    height: 60px;
    animation-delay: 0s;
    animation-duration: 18s;
}

.circles li:nth-child(5){
    left: 65%;
    width: 20px;
    height: 20px;
    animation-delay: 0s;
}

.circles li:nth-child(6){
    left: 75%;
    width: 110px;
    height: 110px;
    animation-delay: 3s;
}

.circles li:nth-child(7){
    left: 35%;
    width: 150px;
    height: 150px;
    animation-delay: 7s;
}

.circles li:nth-child(8){
    left: 50%;
    width: 25px;
    height: 25px;
    animation-delay: 15s;
    animation-duration: 45s;
}

.circles li:nth-child(9){
    left: 20%;
    width: 15px;
    height: 15px;
    animation-delay: 2s;
    animation-duration: 35s;
}

.circles li:nth-child(10){
    left: 85%;
    width: 150px;
    height: 150px;
    animation-delay: 0s;
    animation-duration: 11s;
}

@keyframes animate {

    0%{
        transform: translateY(0) rotate(0deg);
        opacity: 1;
        border-radius: 0;
    }

    100%{
        transform: translateY(-1000px) rotate(720deg);
        opacity: 0;
        border-radius: 50%;
    }

}
</style>