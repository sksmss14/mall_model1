<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
<%
	//로그인 후 접근가능
	if(session.getAttribute("managerNo") == null) { // 세션에 managerNo를 만든적이 없다
		response.sendRedirect(request.getContextPath()+"/managerLogin.jsp");
		return;
	}
	
	int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
	NoticeDao noticeDao = new NoticeDao();
	
	ArrayList<HashMap<String, Object>> list = noticeDao.selectNoticeOne(noticeNo);
	//ArrayList<HashMap<String, Object>> 값 가져와서 변수에 저장
	String noticeTitle = list.get(0).get("noticeTitle").toString();
	String noticeContent = list.get(0).get("noticeContent").toString();

%>
<!DOCTYPE html>
<html>
<head>
  	<meta charset="UTF-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1.0">
  	<meta http-equiv="X-UA-Compatible" content="ie=edge">
  	<title>공지 수정</title>	
  	<link rel="icon" href="img/Fevicon.png" type="image/png">
  	<link rel="stylesheet" href="vendors/bootstrap/bootstrap.min.css">
  	<link rel="stylesheet" href="vendors/fontawesome/css/all.min.css">	
  	<link rel="stylesheet" href="vendors/themify-icons/themify-icons.css">
	<link rel="stylesheet" href="vendors/linericon/style.css">
  	<link rel="stylesheet" href="vendors/owl-carousel/owl.theme.default.min.css">
  	<link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
  	<link rel="stylesheet" href="css/style.css">
  
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
	<jsp:include page="/inc/managerMenu.jsp"></jsp:include>
<!--================ End Header Menu Area =================-->

<div class="container">
	<h3>공지 수정</h3><br>
	<form action="<%=request.getContextPath()%>/managerUpdateNoticeAction.jsp" method="post" id="updateNotice">
		<input type="hidden" name="managerNo" value="<%=session.getAttribute("managerNo")%>">
		<input type="hidden" name="noticeNo" value="<%=noticeNo%>">
<div class="mb-3 mt-3">
	<label for="title" class="form-label">제목</label>
	<input type="text" class="form-control" id="noticeTitle" name="noticeTitle" value="<%=noticeTitle%>" readonly="readonly">
</div>
<div class="mb-3">
	<label for="comment">공지</label>
		<textarea class="form-control" rows="5" id="noticeContent" name="noticeContent" ><%=noticeContent%></textarea>
</div>
<div class="text-right">
	<button type="button" class="btn btn-dark" id="button">수정</button>
</div>
</form>
</div>
	<script>
	$('#button').click(function() {
	
	//공지 내용 필수 입력
	if($('#noticeContent').val() == ""){
		alert('공지내용을 입력하세요.');
		return;
	}

	alert('공지사항수정이 완료되었습니다.')
	$('#updateNotice').submit();
	});
	
	</script>
</body>
</html>