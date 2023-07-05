<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>

<%@include file="./include/fore/navigator.jsp"%>
<head>
    <title>影院热映大片_热映电影票房_高清电影影视大全-猫眼电影</title>

    <style>
        .container {
            -webkit-text-size-adjust: 100%;
            font-family: Microsoft YaHei,Helvetica,Arial,sans-serif;
            -webkit-font-smoothing: subpixel-antialiased;
            width: 1200px;
            margin: 0 auto;
        }

        .not-found-body {
            -webkit-text-size-adjust: 100%;
            font-family: Microsoft YaHei,Helvetica,Arial,sans-serif;
            -webkit-font-smoothing: subpixel-antialiased;
            text-align: center;
        }

        .img-wrap {
            -webkit-text-size-adjust: 100%;
            font-family: Microsoft YaHei,Helvetica,Arial,sans-serif;
            -webkit-font-smoothing: subpixel-antialiased;
            text-align: center;
            margin: 70px auto 0;
            width: 590px;
            height: 400px;
            overflow: hidden;
            display: flex;
            -webkit-box-pack: center;
            justify-content: center;
            -webkit-box-align: center;
            align-items: center;
        }

        .not-found-img {
            -webkit-text-size-adjust: 100%;
            font-family: Microsoft YaHei,Helvetica,Arial,sans-serif;
            -webkit-font-smoothing: subpixel-antialiased;
            text-align: center;
            border-style: none;
            width: 600px;
            height: 410px;
        }

        .not-found-message {
            -webkit-text-size-adjust: 100%;
            font-family: Microsoft YaHei,Helvetica,Arial,sans-serif;
            -webkit-font-smoothing: subpixel-antialiased;
            text-align: center;
            font-size: 24px;
            color: #4f3f3f;
            margin: 0;
        }

        .error-message {
            -webkit-text-size-adjust: 100%;
            font-family: Microsoft YaHei,Helvetica,Arial,sans-serif;
            -webkit-font-smoothing: subpixel-antialiased;
            text-align: center;
            margin: 0;
            margin-top: 20px;
            font-size: 16px;
            color: #9e9696;
        }

        .home-button {
            -webkit-text-size-adjust: 100%;
            font-family: Microsoft YaHei,Helvetica,Arial,sans-serif;
            -webkit-font-smoothing: subpixel-antialiased;
            text-align: center;
            margin: auto;
            margin-top: 40px;
            background-color: #ef4238;
            width: 180px;
            height: 56px;
            border-radius: 30px;
            display: flex;
            -webkit-box-align: center;
            align-items: center;
            -webkit-box-pack: center;
            justify-content: center;
        }

        a:hover {
            outline-width: 0;
            text-decoration: none
        }
    </style>
</head>
<body>
    <div class="container" id="app">
        <div class="not-found-body">
            <div class="img-wrap">
                <img class="not-found-img" src="img/site/notfound.png">
            </div>
            <p class="not-found-message">抱歉，页面暂时无法访问...</p>
            <p class="error-message">错误信息：服务器找不到请求的网页</p>
            <div class="home-button">
                <a href="/" one-link-mark="yes">返回首页</a>
            </div>
        </div>
    </div>
</body>

