<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>


<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script>
		var naverLogin = new naver.LoginWithNaverId({
			clientId: "NCz5WpwISNnKiY_jFa8I",
			callbackUrl: "http://localhost:8886/enjoyforott/naverenrollcallback.me",
			isPopup: false,
			callbackHandle: true
		});
		naverLogin.init();
	
		window.addEventListener('load', function () {
		naverLogin.getLoginStatus(function (status) {
	
		if (status) {
			console.log(naverLogin.user);
			var email = naverLogin.user.getEmail();
			var id = naverLogin.user.getId();
			var name = naverLogin.user.getName();
			var nickName = naverLogin.user.getNickName();
	
			$.ajax({
				type: 'post',
				url: 'naverlogin',
				data: {
					userEmail : email, 
					userId : id, 
					userName : name, 
					userNickname : nickName
					},
				success: function(result) {
					if(result=='ok') {
						console.log('성공')
						location.replace("http://localhost:8886/enjoyforott") 
					} else if(result=='no') {
						console.log('실패')
						alert("로그인에 실패하였습니다. 다시 시도해주세요.");
						location.replace("http://localhost:8886/enjoyforott/loginForm.me")
					}
				},
				error: function(result) {
					console.log('오류 발생')
					alert("로그인에 실패하였습니다. 다시 시도해주세요.");
					location.replace("http://localhost:8886/enjoyforott/loginForm.me")
				}
			})
		} else {
			console.log("callback 처리 실패");
		}
		});
	});
	
</script>
</body>
</html>