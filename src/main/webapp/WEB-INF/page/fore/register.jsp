<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>电影狗注册界面</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }
        html {
            height: 100%;
        }
        body {
            height: 100%;
        }
        .container {
            height: 100%;
            background-image: linear-gradient(to right, #fbc2eb, #a6c1ee);
        }
        .login-wrapper {
            background-color: #fff;
            width: 358px;
            height: 588px;
            border-radius: 15px;
            padding: 0 50px;
            position: relative;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
        }
        .header {
            font-size: 38px;
            font-weight: bold;
            text-align: center;
            line-height: 100px;
        }
        .input-item {
            display: block;
            width: 100%;
            margin-bottom: 20px;
            border: 0;
            padding: 10px;
            border-bottom: 1px solid rgb(128, 125, 125);
            font-size: 15px;
            outline: none;
        }
        .input-item:placeholder {
            text-transform: uppercase;
        }
        .btn {
            text-align: center;
            padding: 10px;
            width: 100%;
            margin-top: 40px;
            background-image: linear-gradient(to right, #a6c1ee, #fbc2eb);
            color: #fff;
        }
        .msg {
            text-align: center;
            line-height: 66px;
        }
        a {
            text-decoration-line: none;
            color: #abc1ee;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="login-wrapper">
            <div class="header">Welcome</div>
            <div class="form-wrapper">
                <input type="text" name="uname" placeholder="用户名" class="input-item">
                <input type="password" name="upassword" placeholder="密码" class="input-item">
                <input type="password" name="conform-upassword" placeholder="请确认你的密码" class="input-item">
                <input type="text" name="uemail" placeholder="邮箱" class="input-item">
                <input type="text" name="utel" placeholder="电话" class="input-item">
                <div class="btn"><a href="" style="color:white">注册</a></div>
            </div>
            <div class="msg">
                欢迎加入电影狗，你想看的这里都有，点击
                <a href="login">登录</a>
                一起进入新世界吧！！！
            </div>
        </div>
    </div>
</body>
</html>
