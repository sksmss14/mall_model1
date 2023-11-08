<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1.0">
  	<meta http-equiv="X-UA-Compatible" content="ie=edge">
  	<title>공지관리</title>
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
  	<link rel="preconnect" href="https://fonts.gstatic.com">
  	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
  	<link rel="stylesheet" href="css/font.css">
</head>
<body>
<% 
	//세션 적용(로그인하지 않은 사람은 접근하지 않게 하기 위함)
	if(session.getAttribute("managerNo") == null) {
		response.sendRedirect(request.getContextPath()+"/managerLogin.jsp");
	}

	int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
	System.out.println(noticeNo + "<--관리할 공지 번호");	//디버깅
	
	NoticeDao noticeDao = new NoticeDao();
	
	ArrayList<HashMap<String,Object>> list = noticeDao.selectNoticeOne(noticeNo);
	
%>
<!--================ Start Header Menu Area ===============-->
	<jsp:include page="/inc/adminMenu.jsp"></jsp:include>
<!--================ End Header Menu Area =================-->
<div class="container">
	<h3>공지 관리</h3>
	<br>
	<table class="table table-hover table-bordered">
		<colgroup>
            <col width=20% style="background-color: black; color: white;">
            <col width=80%>
 	    </colgroup>
		<tr>
			<th>공지번호</th><td><%=list.get(0).get("noticeNo") %></td>
		</tr>
		<tr>
			<th>담당매니져</th><td><%=list.get(0).get("managerName") %></td>
		</tr>
		<tr>
			<th>제목</th><td><%=list.get(0).get("noticeTitle") %></td>
		</tr>
		<tr>
			<th>내용</th><td><%=list.get(0).get("noticeContent") %></td>
		</tr>
		<tr>
			<th>작성일</th><td><%=list.get(0).get("createdate") %></td>
		</tr>
		<tr>
			<th>수정일</th><td><%=list.get(0).get("updatedate") %></td>
		</tr>
	</table>	
</div>
<div class="container">
	<a href="<%=request.getContextPath() %>/managerUpdateNoticeForm.jsp?noticeNo=<%=list.get(0).get("noticeNo") %>" class="btn btn-primary">수정</a>
	<a href="<%=request.getContextPath() %>/managerDeleteNoticeAction.jsp?noticeNo=<%=list.get(0).get("noticeNo") %>" class="btn btn-primary">삭제</a>
</div>

</body>
</html>