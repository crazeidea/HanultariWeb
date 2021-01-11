<div class="wrapper">
  <div class="left-section">
    <span
      class="logo"
      style="font-family: 'vitro'; font-size: 2.4em; color: white"
      onclick="location.href = '/'"
      >대따</span
    >
    <div>
      <h1 style="color: white; font-size: 5rem">
        주차장을 찾는 <br />
        새로운 경험
      </h1>
    </div>
  </div>
  <div class="right-section">
      <form class="ui form container" method="post" action="signup/execute">
	    <h1>회원가입</h1>
        <div class='field'>
          <label>이메일</label>
          <input type="text" id="email" name="email" required />
        </div>
        <div class="field">
          <label>비밀번호</label>
          <input type="password" id="pw" name="pw" required />
        </div>
        <div class="field">
          <label>비밀번호 확인</label>
          <input type="password" id="pw-check" required />
        </div>
        <div class="field">
        	<label>이름</label>
        	<input type="text" id="name" name="name" required />
        </div>
        <div class="field">
        	<label>전화번호</label>
        	<input type="text" id="tel" name="tel" onkeypress="if(event.keyCode==13){signup()}" required />
        </div>
        <button class="ui button primary" onclick="signup()">회원가입</button>
        <button class="ui button" onclick="history.go(-1)">취소</button>
      </form>
    </div>
</div>
<script>
  tippy.setDefaultProps({ placement: "left" });

  tippy('#email', {
    content: '❗ 올바르지 않은 이메일 입니다.',
    trigger: 'manual'
  })
	const emailinstance = document.getElementById('email');
  $("#email").on("keyup", function () {
    var emailregexp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    if (emailregexp.test($("#email").val()) == false) {
      
    	emailinstance._tippy.show();
    } else {
    	emailinstance._tippy.hide();
        }
  });

  tippy('#pw', {
    content: '❗ 비밀번호는 숫자와 특수기호를 포함해야 합니다.',
    trigger: 'manual'
  })
  const pwinstance = document.getElementById('pw');

  $('#pw').on('keyup', function(){
    var pwregexp = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/;
    if (pwregexp.test($('#pw').val()) == false) {
      pwinstance._tippy.show();
    } else {
      pwinstance._tippy.hide();
    }
  })

  tippy('#tel', {
    content : '❗ 올바르지 않은 전화번호 입니다.',
    trigger: 'manual'
  })
  const telinstance = document.getElementById('tel');

  $('#tel').on('keyup', function() {
    var telregexp = /^\d{3}\d{3,4}\d{4}$/;
	console.log(telregexp.test($('#tel').val()));
    if (telregexp.test($('#tel').val()) == false) {
      telinstance._tippy.show();
    } else {
      telinstance._tippy.hide();
    }
  })

  function signup() {
    if ($("#email").val() == "") {
      tippy("#email", {
        content: "❗ 이메일을 입력하세요.",
      });
      $("#email").focus();
      return;
    }

    if ($("#pw").val() == "") {
      tippy("#pw", {
        content: "❗ 비밀번호를 입력하세요.",
      });
      $("#pw").focus();
      return;
    }

    if ($("#pw-check").val() == "" || $("#pw").val() != $("#pw-check").val()) {
      tippy("#pw-check", {
        content: "❗ 입력한 비밀번호와 동일한 비밀번호를 입력하세요.",
      });
      $("#pw-check").focus();
      return;
    }

    if ($("#name").val() == "") {
      tippy("#name", {
        content: "❗ 이름을 입력하세요",
      });
      $("#name").focus();
      return;
    }

    if ($("#tel").val() == "") {
      tippy("#tel", {
        content: "❗ 휴대전화번호를 입력하세요",
      });
      $("#tel").focus();
      return;
    }

    $("#signup").submit();
  }
</script>
