<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>

<%@include file="../include/fore/navigator.jsp"%>
<script src="js/jquery/2.0.0/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js">
</script>

<head>
    <title>选座</title>

    <meta charset="utf-8">

    <script>
        let second = 840;
        let d = 1;

        countDown();

        setInterval(countDown, 1000);

        function countDown() {
            second -= d;

            $(".minute").text(Math.trunc(second / 60));
            $(".second").text(second % 60);

            if(second === 0) {
                $(".cancel-wrapper").css("display", "block");
                $(".count-down-wrapper").css("display", "none");
                $(".right").css("display", "none");
                $(".warning").css("display", "none");

                d = 0;
            }
        }

        function addOrder() {

        }
    </script>

    <script>
        $(document).ready(function(){
            $('.pay-btn').click(function(){
                $.post("addOrder",
                    {   omoney : '${o.omoney}',
                        onum : '${o.onum}',
                        oseats : '${o.oseats}',
                        osid : '${o.osid}',
                        ouid : '${user.uid}', },
                    function(result) {
                        if(result === "error"){
                            $(".cancel-wrapper").css("display", "block");
                            $(".count-down-wrapper").css("display", "none");
                            $(".right").css("display", "none");
                            $(".warning").css("display", "none");

                            $(".ctip").text("订单出错请重新下单");
                        }
                        else {
                            $(".ticket-succeed").css("display", "block");
                            $(".order-note").css("display", "block");

                            $(".count-down-wrapper").css("display", "none");
                            $(".right").css("display", "none");
                            $(".warning").css("display", "none");

                            $(".order-id").text("电影狗订单号:" + result);
                        }
                    }
                );

                d = 0;
            });
        });
    </script>

    <style>
        html {
            -webkit-text-size-adjust: 100%;
        }

        body {
            font-family: Microsoft YaHei,Helvetica,Arial,sans-serif;
            -webkit-font-smoothing: subpixel-antialiased;
        }

        a:hover {
            outline-width: 0;
            text-decoration: none
        }

        .container {
            width: 1200px;
            margin: 20px auto;
        }

        .order-progress-bar {
            height: 60px;
            width: 100%;
            margin: 40px 0;
            text-align: center;
        }

        .step {
            text-align: center;
            float: left;
            width: 25%;
        }

        .step-num {
            color: #fff;
            font-size: 12px;
            display: inline-block;
            width: 16px;
            height: 16px;
            line-height: 16px;
            border-radius: 10px;
            text-align: center;
            background-color: #ffd8d7;
            position: relative;
            top: 10px;
        }

        .bar {
            text-align: center;
            width: 0;
            height: 4px;
            border-left: 150px solid #ffd8d7;
            border-right: 150px solid #ffd8d7;
        }

        .step-text {
            text-align: center;
            font-size: 14px;
            color: #999;
            display: inline-block;
            margin-top: 10px;
        }

        .done .step-num {
            background-color: #f03d37;
        }

        .done .bar {
            border-left: 150px solid #ffd8d7;
            border-right: 150px solid #ffd8d7;
            border-left-color: #f03d37;
            border-color: #f03d37;
        }

        .done .step-text {
            color: #f03d37;
        }

        .first .bar {
            border-left-color: transparent!important;
        }

        .last .bar {
            border-right-color: transparent!important;
        }

        .count-down-wrapper {
            width: 100%;
            height: 120px;
            padding-top: 20px;
            margin-bottom: 40px;
            background-color: #fff3f3;
        }

        .count-down {
            padding-left: 55px;
            min-height: 41px;
            margin-left: 30px;
            background: url("img/time.png") no-repeat;
            background-position: 0 17px;
        }

        .cancel--wrapper {
            width: 100%;
            height: 120px;
            padding-top: 20px;
            margin-bottom: 40px;
            background-color: #fff3f3;
            text-align: center;
        }

        .ctip {
            margin: 0;
            font-size: 30px;
            color: #f03d37;
            line-height: 80px;
        }

        .time-left {
            margin: 0;
            font-size: 16px;
            color: #666;
            margin-bottom: 4px;
        }

        .minute {
            font-size: 32px;
            color: #f03d37;
            margin: 0 5px;
        }

        .second {
            font-size: 32px;
            color: #f03d37;
            margin: 0 5px;
        }

        .tip {
            margin: 0;
            font-size: 14px;
            color: #f03d37;
        }

        .warning {
            margin: 0;
            font-size: 12px;
            color: #666;
            padding-left: 18px;
            background: url(data:image/png;base64,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) no-repeat;
            background-size: 12px;
            background-position-y: 2px;
            margin-bottom: 8px;
        }

        .attention {
            font-size: 12px;
            color: #faaf00;
        }

        .cancel-wrapper {
            width: 100%;
            height: 120px;
            padding-top: 20px;
            margin-bottom: 40px;
            background-color: #fff3f3;
            text-align: center;
        }

        .ctip {
            margin: 0;
            font-size: 30px;
            color: #f03d37;
            line-height: 80px;
        }

        .order-table {
            width: 100%;
            border: 1px solid #e5e5e5;
            border-spacing: 0;
            margin-bottom: 60px;
            text-align: center;
        }

        .ticket-succeed {
            height: 110px;
            padding-left: 85px;
            padding-top: 28px;
            margin-bottom: 40px;
            background-repeat: no-repeat;
            background-position: 30px;
            box-sizing: border-box;
            background-color: #f4fff6;
            background-image: url("img/succeed.png");
        }

        .title {
            margin: 0;
            line-height: 53px;
            font-size: 24px;
            font-weight: 700;
            color: #40dc6f;
        }

        .order-note {
            margin-bottom: 8px;
        }

        .order-id {
            font-size: 16px;
            color: #333;
        }

        .contact {
            font-size: 12px;
            color: #666;
            float: right;
        }

        thead {
            text-align: center;
            background-color: #f7f7f7;
        }

        th {
            border-spacing: 0;
            font-size: 16px;
            color: #333;
            width: 25%;
            padding: 14px 0;
            font-weight: 400;
            text-align: center;
        }


        .movie-name {
            border-spacing: 0;
            text-align: center;
            padding: 20px 0;
            color: #333;
            font-size: 16px;
        }

        .showtime {
            border-spacing: 0;
            text-align: center;
            padding: 20px 0;
            font-size: 14px;
            color: #f03d37;
        }

        .cinema-name {
            border-spacing: 0;
            text-align: center;
            padding: 20px 0;
            color: #333;
            font-size: 14px;
        }

        .seats {
            border-spacing: 0;
            color: #333;
            display: inline-block;
            text-align: left;
        }

        .right {
            text-align: right;
        }

        .price-wrapper {
            text-align: right;
            font-size: 14px;
            color: #333;
            margin-bottom: 17px;
        }

        .price {
            text-align: right;
            font-size: 36px;
            color: #f03d37;
        }
        .pay-btn {
            cursor: pointer;
            display: inline-block;
            width: 190px;
            height: 42px;
            line-height: 42px;
            text-align: center;
            color: #fff;
            background-color: #f03d37;
            border-radius: 100px;
            box-shadow: 0 2px 10px -2px #f03d37;
        }
    </style>
</head>
<body>
<div class="container" id="app">
    <div class="order-progress-bar">
        <div class="step first done">
            <span class="step-num">1</span>
            <div class="bar"></div>
            <span class="step-text">选择影片场次</span>
        </div>
        <div class="step done">
            <span class="step-num">2</span>
            <div class="bar"></div>
            <span class="step-text">选择座位</span>
        </div>
        <div class="step done">
            <span class="step-num">3</span>
            <div class="bar"></div>
            <span class="step-text">14分钟内付款</span>
        </div>
        <div class="step last ">
            <span class="step-num">4</span>
            <div class="bar"></div>
            <span class="step-text">影院取票观影</span>
        </div>
    </div>

    <div class="count-down-wrapper">
        <div class="count-down" data-payleftseconds="839">
            <p class="time-left">
                请在
                <span class="minute">14</span>
                分钟
                <span class="second">0</span>秒内完成支付
            </p>
            <p class="tip">座位未锁定，订单只有在支付后才会生效，如遇支付问题，请致电电影狗客服：1111-5555</p>
        </div>
    </div>

    <div class="cancel-wrapper" style="display:none">
        <p class="ctip">付款超时，订单已自动取消</p>
    </div>

    <div class="status-box ticket-succeed" style="display:none">
        <p class="title">出票成功，待消费</p>
    </div>

    <p class="warning">请仔细核对场次信息，出票后将<span class="attention">无法退票和改签</span></p>

    <div class="order-note" style="display:none">
        <span class="order-id"></span>
        <span class="contact">（有订单问题可拨打电影狗客服电话<i>1111-5555</i>，工作时间: 9:00-24:00）</span>
    </div>

    <table class="order-table">
        <thead>
        <tr>
            <th>影片</th>
            <th>时间</th>
            <th>影院</th>
            <th>座位</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td class="movie-name">${ofname}</td>
            <td class="showtime">${ostime}</td>
            <td class="cinema-name">${ocname}</td>
            <td>
                <span class="hall">${ohname}</span>
                <div class="seats">
                    <div>
                        <span class="">${o.oseats}</span>
                    </div>
                </div>
            </td>
        </tr>
        </tbody>
    </table>

    <div class="right">
        <div class="price-wrapper">
            <span>实际支付 :</span>
            <span class="price">${o.omoney}</span>
        </div>
        <div><div class="pay-btn">确认支付</div></div>
    </div>



</div>

</body>
</html>
