<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp"%>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,400,500,700|Noto+Serif+KR&display=swap" rel="stylesheet">
    <title>Hotel Blue Moon</title>
</head>
<style>
body {
    padding: 0;
    margin: 0;
    box-sizing: border-box;
    font-family: 'Noto Sans KR', sans-serif;
    font-size: 14px;
    color: #666;
    -webkit-font-smoothing: antialiased;
}
.reservation-container{width: 1280px;padding: 0 90px;margin: 0 auto;}
.current-path span:not(:last-of-type)::after  {content: " / "}
.current-path span:last-child{font-weight: 500;}
.current-path{font-size: 16px;padding: 13px 0 30px 0;}
.stepbox span:not(:last-of-type)::after  {content: " > "}
.stepbox{border-bottom: 1px solid #666;padding-bottom: 14px;font-size: 18px;}
.main-section-container {padding: 30px 30px 0;margin: 0 auto;}
.reservation-selectedOption{padding: 14px 30px;background: #f5f5f5;margin-bottom: 43px;}
.reservation-selectedOption ul{padding: 0;margin: 0;list-style: none;}
.reservation-selectedOption ul li{font-size: 16px; color: #333; float: left;}
.reservation-selectedOption ul:after{content:'';display:block;clear:both}
.reservation-selectedOption li:last-child:after{display:none}
.reservation-selectedOption li:after{content:'';display:inline-block;width:1px;height:15px;background:#a5a5a5;margin:0 20px -2px}
.hotel-location{padding-left:30px;background:url("../../images/locationIcon.PNG") left no-repeat;background-size: 20px;}
.hotel-date{padding-left:30px;background:url("../../images/locationIcon.PNG") left no-repeat;background-size: 18px;}
.hotel-person{padding-left:30px;background:url("../../images/locationIcon.PNG") left no-repeat;background-size: 18px;}
.product-container{
    position: relative;
    border-top: 1px solid #e5e5e5;
    padding: 25px 0 25px 0;
    min-height: 210px;
}
.product-container::after{
    content:'';
    display:block;
    clear:both
}
.product-img{
    width: 283px;
    height: 160px;
    overflow: hidden;
    display: inline-block;
    float: left;
}
.product-img img{
    width: 100%;
    height: auto;
    border: 0;
    vertical-align: top;
}
.product-price{
    /* display: inline-block; */
    text-align: right;
    padding-left: 130px;
    margin-top: 6px;
    color: black;
    font-weight: 500;
    
}
.room-price:first-child{
    font-size: 16px;
}
.price-text{
    font-size: 32px;
}
.price-textInfo{
    display: inline-block;
    color: #666;
}
.room-info{
    float: left;
    width: 70%;
}
.room-type{
    display: inline-block;
    padding-top: 12px;
    float: left;
}
.room-type li:last-child{
    font-size: 26px;
    color: black;
}
.room-option li:last-child{
    margin-left: -10px;
}
.room-type li{
    padding: 0;
    margin: 0;
    list-style: none;
}
.room-option li{
    padding: 0;
    margin: 0;
    list-style: none; 
    margin-right: 10px;
    font-size: 16px;
    color: #666;
    float: left;
}
.room-option{
    clear: both;
    display: inline-block;
    float: left;
    margin-top: 20px;
    margin-bottom: 9px;
    
}
/* prograss bar style */
.multi-steps > li.is-active:before, .multi-steps > li.is-active ~ li:before {
  content: counter(stepNum);
  font-family: inherit;
  font-weight: 700;
}
.multi-steps > li.is-active:after, .multi-steps > li.is-active ~ li:after {
  background-color: #ededed;
}
.multi-steps {
  display: table;
  table-layout: fixed;
  width: 100%;
}
.multi-steps > li {
  counter-increment: stepNum;
  text-align: center;
  display: table-cell;
  position: relative;
  color: #153450;
}
.multi-steps > li:before {
  content: '\f00c';
  content: '\2713;';
  content: '\10003';
  content: '\10004';
  content: '\2713';
  display: block;
  margin: 0 auto 4px;
  background-color: #fff;
  width: 36px;
  height: 36px;
  line-height: 32px;
  text-align: center;
  font-weight: bold;
  border-width: 2px;
  border-style: solid;
  border-color: #153450;
  border-radius: 50%;
}
.multi-steps > li:after {
  content: '';
  height: 2px;
  width: 100%;
  background-color: #153450;
  position: absolute;
  top: 16px;
  left: 50%;
  z-index: -1;
}
.multi-steps > li:last-child:after {
  display: none;
}
.multi-steps > li.is-active:before {
  background-color: #fff;
  border-color: #153450;
}
.multi-steps > li.is-active ~ li {
  color: #808080;
}
.multi-steps > li.is-active ~ li:before {
  background-color: #ededed;
  border-color: #ededed;
}
.room-option li:after{content:'';display:inline-block;width:1px;height:15px;background:#a5a5a5;margin:0 10px -2px}
.room-option li:last-child:after{display:none}
/* prograss bar end */
.btn-outline-secondary{
    width: 160px;
}
</style>
<script>
    function ToPaymentPage(){
		location.href = "<%=request.getContextPath()%>/views/reservation/payment";	
	};
</script>
    <div class="reservation-container">
        <div class="current-path">
            <span>홈</span>
            <span>일정선택</span>
            <span>객실,요금 선택</span>
        </div>
        <div class="stepbox">
            <!-- <span>01호텔선택</span>
            <span>02객실,요금,옵션 선택</span>
            <span>03고객정보입력</span> -->
            <div class="container-fluid ">
                <br /><br />
                <ul class="list-unstyled multi-steps">
                    <li>일정선택</li>
                    <li class="is-active">객실/요금 선택</li>
                    <li >결제</li>
                    <li>예약완료</li>
                </ul>
            </div>
        </div>
        <div class="main-section-container">
            <div class="reservation-selectedOption">
                <ul>
                    <li><span class="hotel-location">블루문제주</span></li>
                    <li><span class="hotel-date">2019-12-25-2019-12-27(2박)</span></li>
                    <li><span class="hotel-person">객실 1, 성인 1</span></li>
                </ul>
            </div>
            <div class="tap-section">
                
            </div>
        </div>
        <div class="product-container">
            <div class="product-img">
                <img src="<%=request.getContextPath()%>/images/premiumDelux.jpg" alt="프리미엄디럭스">
            </div>
            <div class="room-info">
                <ul class="room-type">
                    <li>프리미엄디럭스</li>
                    <li>프리미엄 디럭스 더블</li>
                </ul>
                <ul class="room-option">
                    <li>전망<span>시티뷰/리버뷰</span></li>
                    <li>객실크기<span>56~65 ㎡</span></li>
                </ul>        
                <div class="product-price">
                    <div class="room-price">
                        <span>KRW</span>
                        <span class="price-text">580,000</span>
                    </div>
                    <div class="price-textInfo">
                        <p>표준요금/1박<br>(세금,봉사료 포함)</p>
                    </div>
                    <div class="room-button">
                        <button type="button" class="btn btn-outline-secondary" onclick="ToPaymentPage();">예약하기</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="product-container">
                <div class="product-img">
                    <img src="<%=request.getContextPath()%>/images/premiumDelux2.jpg" alt="프리미엄디럭스">
                </div>
                <div class="room-info">
                    <ul class="room-type">
                        <li>프리미엄디럭스</li>
                        <li>프리미엄 디럭스 트윈</li>
                    </ul>
                    <ul class="room-option">
                        <li>전망<span>시티뷰/리버뷰</span></li>
                        <li>객실크기<span>56~65 ㎡</span></li>
                    </ul>        
                    <div class="product-price">
                        <div class="room-price">
                            <span>KRW</span>
                            <span class="price-text">580,000</span>
                        </div>
                        <div class="price-textInfo">
                            <p>표준요금/1박<br>(세금,봉사료 포함)</p>
                        </div>
                        <div class="room-button">
                            <button type="button" class="btn btn-outline-secondary">예약하기</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="product-container">
                    <div class="product-img">
                        <img src="<%=request.getContextPath()%>/images/sweet.jpg" alt="프리미엄디럭스">
                    </div>
                    <div class="room-info">
                        <ul class="room-type">
                            <li>스위트</li>
                            <li>스위트 트윈</li>
                        </ul>
                        <ul class="room-option">
                            <li>전망<span>시티뷰/리버뷰</span></li>
                            <li>객실크기<span>204.3㎡</span></li>
                        </ul>        
                        <div class="product-price">
                            <div class="room-price">
                                <span>KRW</span>
                                <span class="price-text">685,000</span>
                            </div>
                            <div class="price-textInfo">
                                <p>표준요금/1박<br>(세금,봉사료 포함)</p>
                            </div>
                            <div class="room-button">
                                <button type="button" class="btn btn-outline-secondary">예약하기</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="product-container">
                        <div class="product-img">
                            <img src="<%=request.getContextPath()%>/images/specialSweet3.jpg" alt="프리미엄디럭스">
                        </div>
                        <div class="room-info">
                            <ul class="room-type">
                                <li>스위트</li>
                                <li>스페셜 스위트</li>
                            </ul>
                            <ul class="room-option">
                                <li>전망<span>시티뷰/리버뷰</span></li>
                                <li>객실크기<span>204.3㎡</span></li>
                            </ul>        
                            <div class="product-price">
                                <div class="room-price">
                                    <span>KRW</span>
                                    <span class="price-text">4,500,000</span>
                                </div>
                                <div class="price-textInfo">
                                    <p>표준요금/1박<br>(세금,봉사료 포함)</p>
                                </div>
                                <div class="room-button">
                                    <button type="button" class="btn btn-outline-secondary">예약하기</button>
                                </div>
                            </div>
                        </div>
                    </div>
    </div><!--End of reservation-container-->

<%@include file="/WEB-INF/views/common/footer.jsp" %>