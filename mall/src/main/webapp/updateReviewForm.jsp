<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
    
<%
	// 로그인 후 접근가능
	if(session.getAttribute("customerNo") == null) { // 세션에 customerNo를 만든적이 없다
		response.sendRedirect(request.getContextPath()+"/login.jsp");
		return;
	}
	//String msg = request.getParameter("msg");

%>
<!DOCTYPE html>
<html>
<head>
  	<meta charset="UTF-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1.0">
  	<meta http-equiv="X-UA-Compatible" content="ie=edge">
  	<title>리뷰 추가</title>	
  	<link rel="icon" href="img/Fevicon.png" type="image/png">
  	<link rel="stylesheet" href="vendors/bootstrap/bootstrap.min.css">
  	<link rel="stylesheet" href="vendors/fontawesome/css/all.min.css">	
  	<link rel="stylesheet" href="vendors/themify-icons/themify-icons.css">
	<link rel="stylesheet" href="vendors/linericon/style.css">
  	<link rel="stylesheet" href="vendors/owl-carousel/owl.theme.default.min.css">
  	<link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
  	<link rel="stylesheet" href="css/style.css">
  	<link rel="stylesheet" href="vendors/nice-select/nice-select.css">
  	<link rel="stylesheet" href="vendors/nouislider/nouislider.min.css">
  
  	<!--구글폰트 -->
  	<link rel="preconnect" href="https://fonts.googleapis.com">
  	<link rel="preconnect" href="https://fonts.gstatic.com">
  	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" >
  	<link rel="stylesheet" href="css/font.css">
  
 	 <!-- jQuery CDN-->
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  
</head>
<body>
 <!--================ Start Header Menu Area ===============-->
 <%
  	if(session.getAttribute("customerNo") != null) {
  %>
  		<jsp:include page="/inc/customerLoginMenu.jsp"></jsp:include>
  <% 	
  	} else {
  %>
  		<jsp:include page="/inc/customerLogoutMenu.jsp"></jsp:include>
  <% 	
  	}
  %>
  <!--================ End Header Menu Area =================-->
<!-- ================ start banner area ================= -->
	<br>
	<div class="container">
		<div class="text-center">
			<h1>Review</h1>
		</div>
    </div>
<!-- ================ end banner area ================= -->
<%
	//수정할 reviewNo 받아오기
	int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));

	//수정전의 데이터 출력 위해 객체 생성
	ReviewDao reviewDao = new ReviewDao();
	ArrayList<HashMap<String,Object>> list = reviewDao.selectReviewOne(reviewNo);
%>


<div class="container">
	
<form action="<%=request.getContextPath()%>/updateReviewAction.jsp" method="post" id="updateReviewForm">
		<input type="hidden" name="reviewNo" value="<%=reviewNo%>">
	<div class="mb-3 mt-3">
		<table>
			<tr>
				<th>상품명:  </th>
				<td><%=list.get(0).get("goodsTitle") %></td>
			</tr>
			<tr>
				<td colspan ="2">
					<img src="<%=request.getContextPath() %>/upload/<%=list.get(0).get("giFileName") %> " width = "100" height="100">
				<td>
			</tr>
		</table>
	</div> 

		<br>
		
	<div class="mb-3">
		<label for="comment">리뷰</label>
			<textarea class="form-control" rows="5" id="reviewContent" name="reviewContent"><%=list.get(0).get("reviewContent") %></textarea>
	</div>
	<div class="text-right">
	<button type="button" class="btn btn-dark" id="button">수정</button>
	</div>
</form>
</div>
	<br>
	<br>
	<script>
	
	$('#button').click(function() {
	
	//리뷰내용 입력 필수
	if($('#reviewContent').val().length < 1){
		alert('리뷰 내용을 입력하세요.');
		return;
	}
	
	alert('리뷰수정이 완료되었습니다.')
	$('#updateReviewForm').submit();
	});
	
	</script>
	<script src="vendors/jquery/jquery-3.2.1.min.js"></script>
  	<script src="vendors/bootstrap/bootstrap.bundle.min.js"></script>
  	<script src="vendors/skrollr.min.js"></script>
  	<script src="vendors/owl-carousel/owl.carousel.min.js"></script>
  	<script src="vendors/nice-select/jquery.nice-select.min.js"></script>
  	<script src="vendors/nouislider/nouislider.min.js"></script>
  	<script src="vendors/jquery.ajaxchimp.min.js"></script>
  	<script src="vendors/mail-script.js"></script>
  	<script src="js/main.js"></script>
	
</body>
</html>