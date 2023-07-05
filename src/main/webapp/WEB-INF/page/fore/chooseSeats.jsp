<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>

<%@include file="../include/fore/navigator.jsp"%>
<script src="js/jquery/2.0.0/jquery.min.js"></script>
<head>
    <title>选座</title>

    <meta charset="utf-8">

    <script>
        let cnt = 0;

        $(document).ready(function(){
            $('.selectable').click(function(){
                let col = $(this).attr("col");
                let row = $(this).attr("row");

                if(col.length  === 1) col = "0" + col;
                if(row.length  === 1) row = "0" + row;

                let text = row + "排" + col + "座"

                let money = ${s.sprice };

                if($(this).attr("class") === "seat selected") {
                    cnt --;
                    $(this).attr("class", "seat selectable");

                    $('.ticket-container span').each(function(index){
                        if($(this).attr("col") === col && $(this).attr("row") === row) {
                            $(this).remove();
                        }
                    });

                    $('.ticket-container input').each(function(index){
                        if($(this).attr("value") === text) {
                            $(this).remove();
                        }
                    })
                }
                else if(cnt < 3) {
                    $(this).attr("class", "seat selected");

                    // $(this).addClass("selected");
                    // $(this).removeClass("selectable");

                    cnt ++;

                    let tadd = document.createElement("span");
                    let iadd = document.createElement("input");

                    $(tadd).attr("class", "ticket");
                    $(tadd).attr("row", row);
                    $(tadd).attr("col", col);
                    $(tadd).text(text);

                    $(iadd).attr("type", "hidden");
                    $(iadd).attr("name", "seat" + cnt);
                    $(iadd).attr("value", text);

                    $(".ticket-container").append(tadd);
                    $(".ticket-container").append(iadd);
                }
                else {
                    alert("最多只能同时选三张票");
                }

                if(cnt === 0) {
                    $(".no-ticket").css("display","block");
                    $(".has-ticket").css("display","none");
                }
                else {
                    $(".no-ticket").css("display","none");
                    $(".has-ticket").css("display","block");
                }

                $(".price").text(money * cnt);
                $(".submit-money").attr("value", money * cnt);
                $(".onum").attr("value", cnt);
            });

            $('.selected').click(function(){
                $(this).attr("class", "seat selectable");
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

        .main {
            width: 100%;
            border: 1px solid #e5e5e5;
            font-size: 0;
            padding: 0;
        }

        .hall {
            font-size: 0;
            width: 828px;
            display: inline-block;
            vertical-align: top;
        }

        .seat-example {
            font-size: 0;
            margin: 30px 0 30px 208px;
        }

        .example {
            display: inline-block;
            font-size: 16px;
            color: #666;
            height: 26px;
            line-height: 26px;
            padding-left: 38px;
            background-repeat: no-repeat;
            margin-right: 50px;
        }

        .selectable-example {
            background-image: url("img/0.png");
        }

        .sold-example {
            background-image: url("img/1.png");
        }

        .selected-example {
            background-image: url("img/2.png");
        }

        .seats-block {
            font-size: 0;
            overflow: hidden;
            margin-left: 20px;
            white-space: nowrap;
        }

        .row-id-container {
            width: 20px;
            float: left;
            margin-top: 112px;
            white-space: normal;
        }

        .row-id {
            font-size: 16px;
            color: #999;
            margin-right: 40px;
            margin-bottom: 10px;
            display: inline-block;
            width: 20px;
            height: 26px;
            line-height: 29px;
            text-align: center;
        }

        .empty-row-id {
            display: inline-block;
            height: 20px;
            width: 20px;
        }

        .seats-container {
            margin-left: 50px;
            overflow: auto;
            position: relative;
            padding-top: 112px;
        }

        .screen-container {
            display: inline-block;
            position: absolute;
            top: 0;
            bottom: 0;
            z-index: -1;
            left: 85px;
        }

        .screen {
            width: 550px;
            padding-top: 50px;
            text-align: center;
            font-size: 16px;
            color: #666;
            background: url("img/screen.png") no-repeat;
            background-position-x: center;
            position: relative;
            margin-bottom: 40px;
        }

        .c-screen-line {
            width: 0;
            border-left: 1px dashed #e5e5e5;
            position: absolute;
            top: 90px;
            bottom: 0;
            left: 50%;
        }

        .seats-wrapper {
            display: inline-block;
            min-width: 550px;
        }

        .row {
            margin-left: 0;
            margin-right: 0;
            margin-bottom: 10px;
            text-align: center;
        }

        .empty-row {
            height: 20px;
        }

        .seat {
            white-space: nowrap;
            text-align: center;
            display: inline-block;
            font-size: 0;
            width: 30px;
            height: 26px;
            margin: 0 5px;
            background: url("img/0.png") no-repeat;
            background-position: 0 1px;
            background-image: none;
        }

        .selectable {
            background-image: url("img/0.png");
        }

        .sold {
            background-image: url("img/1.png");
        }

        .selected {
            background-image: url("img/2.png");
        }

        .side {
            font-size: 0;
            width: 340px;
            background-color: #f9f9f9;
            padding: 20px;
            display: inline-block;
        }

        .clearfix::before, .clearfix:after {
            content: " ";
            display: table;
        }

        .clearfix:after {
            clear: both;
        }

        .poster {
            width: 115px;
            height: 158px;
            border: 2px solid #fff;
            box-shadow: 0 2px 7px 0 hsla(0,0%,53%,.5);
            float: left;
        }

        .poster img {
            border-style: none;
            width: 100%;
            height: 100%;
        }

        .content {
            -webkit-text-size-adjust: 100%;
            font-family: Microsoft YaHei,Helvetica,Arial,sans-serif;
            -webkit-font-smoothing: subpixel-antialiased;
            font-size: 0;
            margin-left: 140px;
        }

        .info-item {
            font-size: 12px;
            color: #999;
            margin-bottom: 4px;
        }

        .value {
            font-size: 12px;
            color: #151515;
            margin-left: 2px;
        }

        .show-info {
            font-size: 0;
            margin-top: 20px;
        }

        .text-ellipsis {
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
            color: #151515;
            margin-left: 2px;
            display: inline-block;
            vertical-align: top;
            font-size: 14px;
            width: 85%;
        }

        .ticket-info {
            padding: 20px 0 10px;
            border-top: 1px dashed #e5e5e5;
            border-bottom: 1px dashed #e5e5e5;
        }

        .no-ticket {
            font-size: 0;
        }

        .ticket {
            cursor: default;
            position: relative;
            font-size: 12px;
            color: #f03d37;
            display: inline-block;
            width: 60px;
            height: 30px;
            line-height: 30px;
            text-align: center;
            margin: 0 12px 10px 0;
            padding-left: 4px;
            background: url("img/ticket.png") no-repeat;
        }

        .buy-limit {
            font-size: 14px;
            color: #999;
            margin: 0;
        }

        .no-selected {
            font-size: 14px;
            color: #333;
            text-align: center;
            margin: 28px 0 39px;
        }

        .text {
            font-size: 14px;
            color: #999;
            float: left;
        }

        .ticket-container {
            font-size: 0;
            margin-left: 42px;
            margin-bottom: 20px;
            position: relative;
            top: -5px;
        }

        .total-price {
            font-size: 14px;
            color: #333;
        }

        .price {
            color: #f03d37;
            font-size: 24px;
        }

        .price::before {
            content: "\FFE5";
            font-size: 14px;
        }

        .confirm-order {
            font-size: 0;
            padding: 20px 0;
            text-align: center;
        }

        .cellphone {
            text-align: center;
            color: #999;
            font-size: 14px;
        }

        .phone-num {
            text-align: center;
            font-size: 14px;
            color: #151515;
        }

        .confirm-btn {
            cursor: pointer;
            width: 260px;
            height: 42px;
            line-height: 42px;
            text-align: center;
            font-size: 16px;
            color: #fff;
            border-radius: 21px;
            position: relative;
            left: 50%;
            margin: 38px 0 0 -295px;
            background-color: #f03d37;
            border: 0px;
            box-shadow: 0 2px 10px -2px #f03d37;
        }

        .disable {
            cursor: default;
            background-color: #dedede;
            -webkit-box-shadow: none;
            box-shadow: none;
        }

        .name {
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
            font-size: 20px;
            font-weight: 700;
            color: #333;
            margin: 0 0 14px;
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
        <div class="step ">
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


    <div class="main clearfix">
        <div class="hall">
            <div class="seat-example">
                <div class="selectable-example example">
                    <span>可选座位</span>
                </div>
                <div class="sold-example example">
                    <span>已售座位</span>
                </div>
                <div class="selected-example example">
                    <span>已选座位</span>
                </div>
            </div>


            <div class="seats-block" data-cols="18" data-section-id="0" data-section-name="默认分区" data-seq-no="202207300400135">
                <div class="row-id-container">
                    <span class="row-id">1</span>
                    <span class="row-id">2</span>
                    <span class="row-id">3</span>
                    <span class="empty-row-id"></span>
                    <span class="row-id">4</span>
                    <span class="row-id">5</span>
                    <span class="row-id">6</span>
                    <span class="row-id">7</span>
                    <span class="row-id">8</span>
                    <span class="row-id">9</span>
                    <span class="row-id">10</span>
                    <span class="row-id">11</span>
                </div>

                <div class="seats-container">
                    <div class="screen-container" style="left: 85px;">
                        <div class="screen">银幕中央</div>
                        <div class="c-screen-line"></div>
                    </div>

                    <div class="seats-wrapper">
                        <c:forEach items="${as }" var="a" varStatus="st">
                            <c:if test="${st.count % 16 == '1'}">
                                <div class="row">
                                <span class="seat empty"></span>
                            </c:if>

                            <span class="seat ${a == 0 ? "selectable" : "sold"}" col="${st.count % 16}" row="${fn:substring((st.count - 1) / 16 + 1, 0, 1) }"></span>

                            <c:if test="${st.count % 16 == '0'}">
                                <span class="seat empty"></span>
                                </div>
                            </c:if>

                            <c:if test="${st.count == '48'}">
                                <div class="empty-row"></div>
                            </c:if>

                        </c:forEach>
                    </div>
                </div>

            </div>

        </div>

        <div class="side">
            <div class="movie-info clearfix">
                <div class="poster">
                    <img src="img/filmSignal/${s.sfid}.jpg">
                </div>
                <div class="content">
                    <p class="name text-ellipsis">${s.sfname}</p>
                </div>
            </div>

            <div class="show-info">
                <div class="info-item">
                    <span>影院 :</span>
                    <span class="value text-ellipsis">${s.scname}</span>
                </div>
                <div class="info-item">
                    <span>影厅 :</span>
                    <span class="value text-ellipsis">${s.shname}</span>
                </div>

                <div class="info-item">
                    <span>场次 :</span>
                    <span class="value text-ellipsis">${s.stime}</span>
                </div>
                <div class="info-item">
                    <span>票价 :</span>
                    <span class="value text-ellipsis">￥${s.sprice}/张</span>
                </div>
            </div>

            <form action="confirmOrder">
                <div class="ticket-info">
                    <div class="no-ticket" style="display: block;">
                        <p class="buy-limit">座位：一次最多选3个座位</p>
                        <p class="no-selected">请<span>点击左侧</span>座位图选择座位</p>
                    </div>
                    <div class="has-ticket" style="display: none;">
                        <span class="text">座位：</span>
                        <div class="ticket-container">
                        </div>
                    </div>

                    <div class="total-price">
                        <span>总价 :</span>
                        <span class="price">0</span>
                    </div>
                </div>

                <div class="confirm-order">
                    <div class="cellphone">
                        <span>手机号 :</span>
                        <span class="phone-num">${user.utel.substring(0, 3)}****${user.utel.substring(7)}</span>
                    </div>

                    <input type="hidden" name="ofname" value="${s.sfname }" />
                    <input type="hidden" name="ocname" value="${s.scname }" />
                    <input type="hidden" name="ohname" value="${s.shname }" />
                    <input type="hidden" name="ostime" value="${s.stime }" />
                    <input type="hidden" class="onum" name="onum" value="0" />

                    <input type="hidden" name="osid" value="${s.sid }" />
                    <input type="hidden" class="submit-money" name="omoney" value="0" />
                    <input type="submit" class="confirm-btn" value="确认选座" />

                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
