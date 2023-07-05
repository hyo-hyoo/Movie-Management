<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../include/fore/navigator.jsp"%>
<head>
    <title>${name} 影视剧搜索-DogeMovie</title>

    <style>
        div {
            -webkit-text-size-adjust: 100%;
            font-family: Microsoft YaHei,Helvetica,Arial,sans-serif;
            -webkit-font-smoothing: subpixel-antialiased;
        }

        .container {
            width: 1200px;
            margin: 0 auto;
        }

        .content {
            overflow: hidden;
            margin-top: 30px;
        }

        .main {
            padding: 0 18px;
            width: 100%;
        }

        .info-content {
            border: 1px solid #e1e1e1;
            position: relative;
        }

        .user-profile-nav {
            position: absolute;
            top: 0;
            bottom: 0;
            width: 200px;
            background-color: #f4f3f4;
            text-align: center;
            border-right: 1px solid #e1e1e1;
        }

        .orders {
            text-align: center;
            text-decoration: none;
            display: block;
            font-weight: 400;
            height: 40px;
            width: 202px;
            margin-left: -1px;
            line-height: 40px;
            font-size: 18px;
            color: #fff;
            background-color: #ed3931;
        }

        .profile {
            text-align: center;
            background-color: transparent;
            text-decoration: none;
            display: block;
            font-weight: 400;
            color: #333;
            height: 40px;
            width: 202px;
            margin-left: -1px;
            line-height: 40px;
            font-size: 18px;
        }

        .orders-container {
            float: left;
            margin-left: 200px;
            padding-left: 40px;
            width: 922px;
            min-height: 900px;
        }

        .profile-title {
            padding: 26px 0;
            color: #ec443f;
            font-size: 18px;
            border-bottom: 1px solid #e1e1e1;
            margin-bottom: 30px;
        }

        .order-box {
            border: 1px solid #e5e5e5;
            margin: 0 40px 30px 0;
        }

        .order-header {
            background-color: #f7f7f7;
            font-size: 14px;
            padding: 16px 20px;
        }

        .order-date {
            font-size: 14px;
            color: #333;
            display: inline-block;
            margin-right: 30px;
        }

        .order-body {
            padding: 20px;
            padding-right: 0;
        }

        .order-id {
            font-size: 14px;
            color: #999;
        }

        .del-order {
            font-size: 14px;
            width: 15px;
            height: 16px;
            background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA8AAAAQCAYAAADJViUEAAAAAXNSR0IArs4c6QAAAP5JREFUKBVjZMACZs2alfTv3z95kNT///9FOTg4qhITEz+gK2UEKlQDKhBEklAG8ksZGRk3QDWzAPmhLCws0UADWWDqBAUFz7MABVKAAvYwQaBCVnZ2drekpKTXMLEZM2Y8/fv37wwg/x9M7MuXLz4wNnk00NTkmTNnppGiG6jnCEg9E9BvMkCnSsM0T58+/T8+NlAtE1DeCqQGxCAbjGomMegoDrAvwLgzglmamZnJiI89Z84cdaB6sBpgemeZ9evXrx5g4rgLTDALgRqZYZrRaaA8858/f6qBdCZIDmwCMHmyAjNIDpDPz8TEBE9h6JqBNv4Fih3PyMjYC5IDACkobU1JvS12AAAAAElFTkSuQmCC) no-repeat;
            float: right;
        }

        .poster {
            display: inline-block;
            vertical-align: top;
            border: 2px solid #fff;
            box-shadow: 0 1px 2px 0 hsla(0,0%,53%,.5);
            margin-right: 11px;
            font-size: 0;
        }

        .order-content {
            display: inline-block;
            vertical-align: top;
            width: 49%;
        }

        .order-price {
            display: inline-block;
            vertical-align: top;
            font-size: 14px;
            color: #333;
            width: 12%;
            line-height: 95px;
        }

        .order-status {
            display: inline-block;
            vertical-align: top;
            font-size: 14px;
            color: #333;
            line-height: 95px;
            width: 15%;
        }

        .actions {
            display: inline-block;
            vertical-align: top;
            font-size: 14px;
            color: #333;
            width: 12%;
            line-height: 95px;
            text-align: center;
        }

        a:hover {
            text-decoration: none;
        }

        .orders:hover {
            color: white;
        }
    </style>
</head>
<body>
<div class="container" id="app">
    <div class="content">
        <div class="main">
            <div class="info-content clearfix">
                <div class="user-profile-nav">
                    <h1>个人中心</h1>
                    <a href="myorders" class="orders active" one-link-mark="yes">我的订单</a>
                    <a href="myprofile" class="profile " one-link-mark="yes">基本信息</a>
                </div>

                <div class="orders-container">
                    <div class="profile-title">我的订单</div>




                        <c:forEach items="${os}" var="o">
                            <div class="order-box">
                                <div class="order-header">
                                    <span class="order-date">${o.odealtime}</span>
                                    <span class="order-id">订单号:${o.oid}</span>
                                </div>

                                <div class="order-body">
                                    <div class="poster">
                                        <img src="img/filmSignal/${o.ofid}.jpg" width="66" height="91">
                                    </div>

                                    <div class="order-content">
                                        <div class="movie-name">《${o.ofname}》</div>
                                        <div class="cinema-name">${o.ocname}</div>
                                        <div class="hall-ticket">
                                            <span>${o.ohname}</span>
                                            <span>${o.oseats}</span>
                                        </div>
                                        <div class="show-time">${o.ostime}</div>
                                    </div>

                                    <div class="order-price">￥${o.omoney}</div>

                                    <div class="order-status">
                                        已付款
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
