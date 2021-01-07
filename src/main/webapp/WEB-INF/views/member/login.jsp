<div class="area" >
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
    </div >
<div class="wrapper">
<span onclick="location.href = '/'">대따</span>
    <div class="login-form">
        <form id="login" method="POST" action="login/execute">
            <h1>주차장을 찾는 <br/> 새로운 경험</h1>
            <p style="font-weight: 700">이메일</p>
            <input type="text" id="email" name='email' placeholder=""/>
            <p style="font-weight: 700">비밀번호</p>
            <input onkeypress="if(event.keyCode==13){login()}" type="password" id="pw" name='pw' placeholder=""/>
            <div class="btn bg-primary shadow" onclick="login()">로그인</div>
            <div class="btn bg-white shadow" onclick="location.href = '/signup'">회원가입</div>
        </form>
    </div>
</div>

<script type="text/javascript">
    tippy.setDefaultProps({placement: 'left'});
    
    tippy('#email', {content: '❗ 이메일과 비밀번호가 일치하지 않습니다.', trigger:'manual'});
    const idinstance = document.getElementById('email');
    idinstance._tippy.disable();

    function login() {    
        if($('#email').val() == "" ) {
            tippy('#email', {
                content: '❗ 이메일을 입력하세요.'
            });
            $('#email').focus();
            return;
        }

        if($('#pw').val() == "" ) {
         tippy('#pw', {
             content: '❗ 비밀번호를 입력하세요.'
         });
         $('#pw').focus();
         return;
        }

        $.ajax({
        type: "POST",
        url: "login/execute",
        data: {email: $('#email').val(), pw: $('#pw').val()},
        success: function (response) {
            if(response == true) {
				location.href = '/';
            } else {
                idinstance._tippy.enable();
                idinstance._tippy.show();
            }
            
        }
    });
    }

</script>