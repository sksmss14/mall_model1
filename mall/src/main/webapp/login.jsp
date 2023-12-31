<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("customerId") != null) { // 로그인 되어 있으면 
		response.sendRedirect(request.getContextPath()+"/home.jsp");
		return;	
	}

%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>로그인</title>
	<link rel="icon" href="img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="vendors/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="vendors/themify-icons/themify-icons.css">
	<link rel="stylesheet" href="vendors/linericon/style.css">
  <link rel="stylesheet" href="vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
  <link rel="stylesheet" href="vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="vendors/nouislider/nouislider.min.css">

  <link rel="stylesheet" href="css/style.css">
  
  <!--구글폰트 -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="css/font.css">
  
  <style>
  	body {overflow : hidden;}
  </style>
  
  <!-- jQuery CDN 주소 -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> 
</head>
<body>
  <!--================ Start Header Menu Area ===============-->
  <jsp:include page="/inc/customerLogoutMenu.jsp"></jsp:include>
  <!--================ End Header Menu Area =================-->
  

  
  <!--================Login Box Area =================-->
	<section class="login_box_area" style="margin-top:70px;">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="login_box_img">
						<div class="hover">
							<h4>처음이신가요?</h4>
							<a class="button button-account" href="<%=request.getContextPath()%>/register.jsp">회원가입</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login_form_inner">
						<h3>로그인 화면</h3>
	
						<p style="margin:50px" id="msg"></p>
				
						<form class="row login_form" id="loginForm" >
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="customerId" name="customerId" placeholder="아이디" onfocus="this.placeholder = ''" onblur="this.placeholder = '아이디'">
							</div>
							<div class="col-md-12 form-group">
								<input type="password" class="form-control" id="customerPw" name="customerPw" placeholder="비밀번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호'">
							</div>
						
							<div class="col-md-12 form-group">
								<button type="button" class="button button-login w-100 mx-auto" style="margin:30px;" id="loginBtn">로그인</button>
								<a href="<%=request.getContextPath()%>/managerLogin.jsp" style="font-size:20px">관리자 로그인</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Login Box Area =================-->
	
	<script>
		$('#loginBtn').click(function(){
			
			let dataset = $('#loginForm').serialize();
			
			$.ajax({
				url: "<%=request.getContextPath()%>/loginAction.jsp",
				type: "post",
				data: dataset,
				dataType: 'json',
				success: function(result) {
					if(result == 1) {
						$('#msg').text('ID, 비밀번호가 일치하지 않습니다.');
					} else if(result == 2) {
						$('#msg').text('탈퇴된 회원입니다.');
					} else if(result == 3){
						alert('로그인 성공하였습니다.');
						$(location).attr("href","<%=request.getContextPath()%>/home.jsp");
					}
				}
			});
		});
	</script>
	

  <script src="vendors/jquery/jquery-3.2.1.min.js"></script>
  <script src="vendors/bootstrap/bootstrap.bundle.min.js"></script>
  <script src="vendors/skrollr.min.js"></script>
  <script src="vendors/owl-carousel/owl.carousel.min.js"></script>
  <script src="vendors/nice-select/jquery.nice-select.min.js"></script>
  <script src="vendors/jquery.ajaxchimp.min.js"></script>
  <script src="vendors/mail-script.js"></script>
  <script src="js/main.js"></script>
</body>
</html>