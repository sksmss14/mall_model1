<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>주문확인</title>
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
</head>
<body>
<%
	//세션 적용(로그인하지 않은 사람은 접근하지 않게 하기 위함)
	int customerNo = 0;
	if(session.getAttribute("customerNo") == null) {
		response.sendRedirect(request.getContextPath()+"/login.jsp");
		return;
	} else {
		customerNo = (Integer) session.getAttribute("customerNo");
	}
%>
  <!--================ Start Header Menu Area ===============-->
  <jsp:include page="/inc/customerLoginMenu.jsp"></jsp:include>
  <!--================ End Header Menu Area =================-->
  
  
  <!--================Order Details Area =================-->
  <section class="order_details">
    <div class="container" style="margin-bottom:50px;">
   		<div style="margin-top : 50px;">
   			<p class="billing-alert">주문 완료되었습니다. 이용해 주셔서 감사합니다.</p>
   		</div>
      
      
      <div class="row mb-5">
      
        <div class="col-md-6 col-xl-4 mb-4 mb-xl-0">
          <div class="confirmation-card">
            <h3 class="billing-title">주문 정보</h3>
            <table class="order-rable">
              <tr>
                <td>Order number</td>
                <td>: 60235</td>
              </tr>
              <tr>
                <td>Date</td>
                <td>: Oct 03, 2017</td>
              </tr>
              <tr>
                <td>Total</td>
                <td>: USD 2210</td>
              </tr>
            </table>
          </div>
        </div>
        
      </div>
      
      
      <div class="order_details_table">
        <h2>상세 정보</h2>
        <div class="table-responsive">
          <table class="table">
            <thead>
              <tr>
                <th scope="col">Product</th>
                <th scope="col">Quantity</th>
                <th scope="col">Total</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>
                  <p>Pixelstore fresh Blackberry</p>
                </td>
                <td>
                  <h5>x 02</h5>
                </td>
                <td>
                  <p>$720.00</p>
                </td>
              </tr>
              <tr>
                <td>
                  <p>Pixelstore fresh Blackberry</p>
                </td>
                <td>
                  <h5>x 02</h5>
                </td>
                <td>
                  <p>$720.00</p>
                </td>
              </tr>
              <tr>
                <td>
                  <p>Pixelstore fresh Blackberry</p>
                </td>
                <td>
                  <h5>x 02</h5>
                </td>
                <td>
                  <p>$720.00</p>
                </td>
              </tr>
              <tr>
                <td>
                  <h4>Subtotal</h4>
                </td>
                <td>
                  <h5></h5>
                </td>
                <td>
                  <p>$2160.00</p>
                </td>
              </tr>
              <tr>
                <td>
                  <h4>Shipping</h4>
                </td>
                <td>
                  <h5></h5>
                </td>
                <td>
                  <p>Flat rate: $50.00</p>
                </td>
              </tr>
              <tr>
                <td>
                  <h4>Total</h4>
                </td>
                <td>
                  <h5></h5>
                </td>
                <td>
                  <h4>$2210.00</h4>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </section>
  <!--================End Order Details Area =================-->


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