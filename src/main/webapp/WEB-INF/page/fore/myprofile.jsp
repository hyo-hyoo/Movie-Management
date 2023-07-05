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

        .avatar-container {
            -webkit-text-size-adjust: 100%;
            font-family: Microsoft YaHei,Helvetica,Arial,sans-serif;
            -webkit-font-smoothing: subpixel-antialiased;
            text-align: center;
            float: left;
            color: #333;
            background: #fff;
            width: 270px;
        }

        .avatar-content {
            -webkit-text-size-adjust: 100%;
            font-family: Microsoft YaHei,Helvetica,Arial,sans-serif;
            -webkit-font-smoothing: subpixel-antialiased;
            text-align: center;
            color: #333;
        }

        .J-setted-avatar {
            -webkit-text-size-adjust: 100%;
            font-family: Microsoft YaHei,Helvetica,Arial,sans-serif;
            -webkit-font-smoothing: subpixel-antialiased;
            text-align: center;
            color: #333;
            border-style: none;
            width: 258px;
            height: 258px;
        }

        .J-upload-avatar-w {
            -webkit-text-size-adjust: 100%;
            font-family: Microsoft YaHei,Helvetica,Arial,sans-serif;
            -webkit-font-smoothing: subpixel-antialiased;
            text-align: center;
            color: #333;
            position: relative;
            cursor: pointer;
        }

        .upload-btn {
            -webkit-text-size-adjust: 100%;
            -webkit-font-smoothing: subpixel-antialiased;
            font: inherit;
            overflow: visible;
            -webkit-appearance: button;
            cursor: pointer;
            margin: 20px auto 0;
            width: 182px;
            height: 56px;
            line-height: 56px;
            color: #5b5b5b;
            background-color: #e6e6e6;
            border-radius: 10px;
            border: 1px;
            font-size: 18px;
            padding: 0;
        }

        #fileUpload {
            -webkit-text-size-adjust: 100%;
            -webkit-font-smoothing: subpixel-antialiased;
            font: inherit;
            margin-top: 20px;
            margin-right: 40px;
            overflow: visible;
            position: absolute;
            top: 0;
            right: 0;
            opacity: 0;
            bottom: -50px;
            direction: ltr;
            font-size: 200px!important;
            cursor: pointer;
            width: 182px;
            height: 56px;
        }

        .tips {
            -webkit-text-size-adjust: 100%;
            font-family: Microsoft YaHei,Helvetica,Arial,sans-serif;
            -webkit-font-smoothing: subpixel-antialiased;
            text-align: center;
            margin-top: 10px;
            color: #999;
            font-size: 18px;
            line-height: 30px;
        }


        a:hover {
            text-decoration: none;
        }

        .orders:hover {
            color: white;
        }

        .J-userexinfo-form {
            -webkit-text-size-adjust: 100%;
            font-family: Microsoft YaHei,Helvetica,Arial,sans-serif;
            -webkit-font-smoothing: subpixel-antialiased;
            float: left;
            width: 495px;
            margin-left: 58px;
        }

        .userexinfo-form-section {
            -webkit-text-size-adjust: 100%;
            font-family: Microsoft YaHei,Helvetica,Arial,sans-serif;
            -webkit-font-smoothing: subpixel-antialiased;
            color: #666;
            position: relative;
            margin: 20px 0;
            padding-left: 90px;
            height: 30px;
            line-height: 30px;
            font-size: 14px;
            margin-top: 0;
        }

        .userexinfo-bottom-section {
            -webkit-text-size-adjust: 100%;
            font-family: Microsoft YaHei,Helvetica,Arial,sans-serif;
            -webkit-font-smoothing: subpixel-antialiased;
            color: #666;
            position: relative;
            margin-top: 40px;
            padding-left: 90px;
            line-height: 30px;
            font-size: 14px;
            zoom: 1;
        }

        p {
            -webkit-text-size-adjust: 100%;
            font-family: Microsoft YaHei,Helvetica,Arial,sans-serif;
            -webkit-font-smoothing: subpixel-antialiased;
            line-height: 30px;
            position: absolute;
            top: 0;
            left: 0;
            width: 80px;
            text-align: right;
            color: #333;
            padding: 0;
            margin: 0;
            font-size: 16px;
        }

        .userexinfo-form-section span {
            -webkit-text-size-adjust: 100%;
            font-family: Microsoft YaHei,Helvetica,Arial,sans-serif;
            -webkit-font-smoothing: subpixel-antialiased;
            color: #666;
            line-height: 30px;
            font-size: 14px;
        }

        .ui-checkbox {
            -webkit-text-size-adjust: 100%;
            -webkit-font-smoothing: subpixel-antialiased;
            font: inherit;
            margin: 0;
            overflow: visible;
            width: 240px;
            font-size: 12px;
            height: 30px;
            padding-left: 10px;
        }

        .form-save-btn {
            -webkit-text-size-adjust: 100%;
            -webkit-font-smoothing: subpixel-antialiased;
            font: inherit;
            margin: 0;
            overflow: visible;
            -webkit-appearance: button;
            cursor: pointer;
            border-radius: 5px;
            width: 100px;
            height: 40px;
            color: #fff;
            font-size: 18px;
            line-height: 40px;
            border: none;
            background-color: #ed3931;
            padding: 0;
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
                    <a href="myorders" class="profile" one-link-mark="yes">我的订单</a>
                    <a href="myprofile" class="orders active " one-link-mark="yes">基本信息</a>
                </div>

                <div class="orders-container">
                    <div class="profile-title">基本信息</div>

                    <div class="avatar-container">
                        <div class="avatar-content">
                            <img class="J-setted-avatar" src="img/user/${user.uid}.jpg">
                            <div class="J-upload-avatar-w upload-avatar-image">
                                <form method="post" id="editForm" enctype="multipart/form-data" action="updateUserImage">
                                    <input type="button" class="J-upload-avatar upload-btn" value="更换头像">
                                    <input id="fileUpload" accept="image/*" type="file" name="image" />
                                    <input type="submit" class="J-upload-avatar upload-btn" style="margin-top: 10px" value="确认">
                                </form>
                            </div>
                            <div class="tips">支持JPG格式</div>
                        </div>
                    </div>
                    <form id="J-userexinfo-form" class ="J-userexinfo-form" action="updateUser">
                        <div class="userexinfo-form-section">
                            <p>用户名：</p>
                            <span>
                                <input type="text" name="uname" id="userexinfo-form-nickname" readonly class="ui-checkbox" value="${user.uname }">
                             </span>
                        </div>
                        <div class="userexinfo-form-section">
                            <p>邮箱：</p>
                            <span>
                                <input type="text" name="uemail" id="userexinfo-form-nickname" class="ui-checkbox" value="${user.uemail }">
                             </span>
                        </div>
                        <div class="userexinfo-form-section">
                            <p>电话：</p>
                            <span>
                                <input type="text" name="utel" id="userexinfo-form-nickname" class="ui-checkbox" value="${user.utel }">
                             </span>
                        </div>

                        <div class="userexinfo-bottom-section clearfix">
                            <input type="submit" class="form-save-btn" value="保存">
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
