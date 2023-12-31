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
	<jsp:include page="/inc/customerLogoutMenu.jsp"></jsp:include>
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
	// customerNo로 주문내역에 있는 상품명 출력
	// reviewDao 객체 생성 
	ReviewDao reviewDao = new ReviewDao();
	
	// 상품명을 가져올 메소드 호출
	ArrayList<HashMap<String,Object>> goodsList = reviewDao.selectReviewGoodsTitle((int)(session.getAttribute("customerNo")));
	System.out.println(goodsList.get(1).get("goodsTitle")+" <--goodsTitle");
	// 상품명 출력 반복하기 위한(for) 상품수 저장
	int goodsCount = goodsList.size();
	System.out.println(goodsCount + "<--- 상품수 (goodsCount)");
%>


<div class="container">
	
<form action="<%=request.getContextPath()%>/insertReviewAction.jsp" method="post" id="insertReviewForm">
		<input type="hidden" name="customerNo" value="<%=session.getAttribute("customerNo")%>">
	<div class="mb-3 mt-3">
	</div>
		<ul>
			<li>
               <label>상품명</label>
               		<br>
                   <select name="goodsTitle" id="goodsTitle">
                       <option value="">-구매한 상품-</option>
                       <%
                       		
                       		for(int i = 0; i < goodsCount; i=i+1){
                       %>
                       			<option value="<%=goodsList.get(i).get("goodsTitle")%>" >
                       				<%=goodsList.get(i).get("goodsTitle") %>
                       			</option>
 						<%
                       			}
 						%>
                   </select>
            </li>
		</ul>
		<br>
		<br>
		
	<div class="mb-3">
		<label for="comment">리뷰</label>
			<textarea class="form-control" rows="5" id="reviewContent" name="reviewContent" id="reviewContent"></textarea>
	</div>
	<div class="text-right">
	<button type="button" class="btn btn-dark" id="button">등록</button>
	</div>
</form>
</div>
	<br>
	<br>
	<script>
	
	$('#button').click(function() {

	//리뷰작성할 상품 선택 필수
	if($('#goodsTitle').val() == ""){
		alert('리뷰작성할 상품을 선택하세요.');
		return;
	}
	
	//리뷰내용 입력 필수
	if($('#reviewContent').val().length < 1){
		alert('리뷰 내용을 입력하세요.');
		return;
	}
	
	alert('리뷰작성이 완료되었습니다.')
	$('#insertReviewForm').submit();
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