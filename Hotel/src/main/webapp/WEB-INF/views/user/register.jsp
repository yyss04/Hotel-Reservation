<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
<title>회원가입</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
body {
	color: #999;
	background: #f3f3f3;
	font-family: 'Roboto', sans-serif;
}
.form-control {
	border-color: #eee;
	min-height: 41px;
	box-shadow: none !important;
}
.form-control:focus {
	border-color: #5cd3b4;
}
.form-control, .btn {        
	border-radius: 3px;
}
.signup-form {
	width: 500px;
	margin: 0 auto;
	padding: 30px 0;
}
.signup-form h2 {
	color: #333;
	margin: 0 0 30px 0;
	display: inline-block;
	padding: 0 30px 10px 0;
	border-bottom: 3px solid #5cd3b4;
}
.signup-form form {
	color: #999;
	border-radius: 3px;
	margin-bottom: 15px;
	background: #fff;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	padding: 30px;
}
.signup-form .form-group row {
	margin-bottom: 20px;
}
.signup-form label {
	font-weight: normal;
	font-size: 14px;
	line-height: 2;
}
.signup-form input[type="checkbox"] {
	position: relative;
	top: 1px;
}
.signup-form .btn {        
	font-size: 16px;
	font-weight: bold;
	background: #5cd3b4;
	border: none;
	margin-top: 20px;
	min-width: 140px;
}
.signup-form .btn:hover, .signup-form .btn:focus {
	background: #41cba9;
	outline: none !important;
}
.signup-form a {
	color: #5cd3b4;
	text-decoration: underline;
}
.signup-form a:hover {
	text-decoration: none;
}
.signup-form form a {
	color: #5cd3b4;
	text-decoration: none;
}	
.signup-form form a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
<div class="signup-form">
    <form action="${path}/user/register" method="post" class="form-horizontal" id="regForm">
      	<div class="row">
        	<div class="col-8 offset-4">
				<h2>회원가입</h2>
			</div>	
      	</div>			
        <div class="form-group row">
			<label class="col-form-label col-4">아이디</label>
			<div class="col-8">
                <input type="text" class="form-control" name="userId" id="userId" required="required">
            	<div class="checl_font" id="id_check"></div>
            	</div>        	
        </div>
         <div class="form-group row">
			<label class="col-form-label col-4">이름</label>
			<div class="col-8">
                <input type="text" class="form-control" name="userName" id="userName" required="required">
				<div class="check_font" id="name_check"></div>
            </div>        	
        </div>
		<div class="form-group row">
			<label class="col-form-label col-4">이메일</label>
			<div class="col-8">
                <input type="email" class="form-control" name="userEmail" id="userEmail" required="required">
            	<div class="check_font" id="email_check"></div>
            </div>        	
        </div>
		<div class="form-group row">
			<label class="col-form-label col-4">비밀번호</label>
			<div class="col-8">
                <input type="password" class="form-control" name="userPw" id="userPw" required="required">
            	<div class="check_font" id="pw_check"></div>
            </div>        	
        </div>
		<div class="form-group row">
			<label class="col-form-label col-4">비밀번호 확인</label>
			<div class="col-8">
                <input type="password" class="form-control" name="userPw2" id="userPw2" required="required">
            	<div class="check_font" id="pw2_check"></div>
            </div>        	
        </div>
		<div class="form-group row">
			<div class="col-8 offset-4">
				<button id="reg_submit" class="btn btn-primary">회원가입</button>
			</div>  
		</div>		      
    </form>
	<div class="text-center">이미 회원이십니까? <a href="${path}/user/login">로그인</a></div>
</div>

<script type="text/javascript">
//모든 공백 체크 정규식
var empJ = /\s/g;
//아이디 정규식
var idJ = /^[a-z0-9]{4,12}$/;
//이름 정규식
var nameJ = /^[가-힣]{2,6}$/;
//이메일 검사 정규식
var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
//비밀번호 정규식
var pwJ = /^[A-Za-z0-9]{4,12}$/;


// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
$("#userId").blur(function() {
	// id = "id_reg" / name = "userId"
	var userId = $('#userId').val();
	$.ajax({
		url : '${pageContext.request.contextPath}/user/idCheck?userId='+ userId,
		type : 'get',
		success : function(data) {
			console.log("1 = 중복o / 0 = 중복x : "+ data);							
			
			if (data == 1) {
					// 1 : 아이디가 중복되는 문구
					$("#id_check").text("이미 사용중인 아이디입니다.");
					$("#id_check").css("color", "red");
					$("#reg_submit").attr("disabled", true);
				} else {
					
					if(idJ.test(userId)){
						// 0 : 아이디 길이 / 문자열 검사
						$("#id_check").text("");
						$("#reg_submit").attr("disabled", false);
			
					} else if(userId == ""){
						
						$('#id_check').text('아이디를 입력해주세요 :)');
						$('#id_check').css('color', 'red');
						$("#reg_submit").attr("disabled", true);				
						
					} else {
						
						$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다 :)");
						$('#id_check').css('color', 'red');
						$("#reg_submit").attr("disabled", true);
					}
					
				}
			}, error : function() {
					console.log("실패");
			}
		});
	});
	
	
//이름에 특수문자 들어가지 않도록 설정
$("#userName").blur(function() {
	if (nameJ.test($(this).val())) {
			console.log(nameJ.test($(this).val()));
			$("#name_check").text('');
	} else {
		$('#name_check').text('이름을 확인해주세요');
		$('#name_check').css('color', 'red');
	}
});
		
// 이메일 중복 검사(1 중복 || 0 사용가능)
$('#userEmail').blur(function(){
	// id = "id_reg" / name = "userId"
	var userEmail = $(this).val();
	$.ajax({
		url :'${pageContext.request.contextPath}/user/emailCheck?userEmail='+ userEmail,
		type :'get',
		dataType : 'json',
		success : function(data){
			console.log(data);
			
			if(data == 1){
				// 1 : 아이디가 중복되는 문구
				$("#email_check").text("이미 가입된 이메일입니다 :p");
				$("#email_check").css("color", "red");
				$("#reg_submit").attr("disabled", true);
			} else{
				// 이메일
				if(mailJ.test($('#userEmail').val())){
					console.log(mailJ.test($('#userEmail').val()));
					$("#email_check").text('');
					$("#reg_submit").attr("disabled", false);
				} else {
					$('#email_check').text('이메일을 확인해주세요 :)');
					$('#email_check').css('color', 'red');
					$("#reg_submit").attr("disabled", true);
				}
			
			}
			
		}, error : function(error) {
			console.log("실패");
		}
	});
	
});

// 비밀번호 유효성 검사
// 1-1 정규식 체크
$('#userPw').blur(function() {
	if (pwJ.test($('#userPw').val())) {
		console.log('true');
		$('#pw_check').text('');
	} else {
		console.log('false');
		$('#pw_check').text('숫자 or 문자로만 4~12자리 입력');
		$('#pw_check').css('color', 'red');
	}
});

// 1-2 패스워드 일치 확인
$('#userPw2').blur(function() {
	if ($('#userPw').val() != $(this).val()) {
		$('#pw2_check').text('비밀번호가 일치하지 않습니다 :(');
		$('#pw2_check').css('color', 'red');
	} else {
		$('#pw2_check').text('');
	}
});

		
//가입하기 실행 버튼 유효성 검사!
var inval_Arr = new Array(3).fill(false);
$('#reg_submit').click(function(){
	// 비밀번호가 같은 경우 && 비밀번호 정규식
	if (($('#userPw').val() == ($('#userPw2').val()))
			&& pwJ.test($('#userPw').val())) {
		inval_Arr[0] = true;
	} else {
		inval_Arr[0] = false;
	}
	// 이름 정규식
	if (nameJ.test($('#userName').val())) {
		inval_Arr[1] = true;	
	} else {
		inval_Arr[1] = false;
	}
	// 이메일 정규식
	if (mailJ.test($('#userEmail').val())){
		console.log(phoneJ.test($('#userEmail').val()));
		inval_Arr[2] = true;
	} else {
		inval_Arr[2] = false;
	}
	
	var validAll = true;
	for(var i = 0; i < inval_Arr.length; i++){
		
		if(inval_Arr[i] == false){
			validAll = false;
		}
	}
	
	if(validAll){ // 유효성 모두 통과
		$("#reg_submit").submit();
	} else{
	}
});
	
</script>
</body>
</html>