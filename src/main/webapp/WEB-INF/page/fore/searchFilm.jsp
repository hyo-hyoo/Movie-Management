<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../include/fore/navigator.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
    <title>${name} 影视剧搜索-DogeMovie</title>

    <style>
        .search-box {
            width: 100%;
            height: 130px;
            min-width: 1200px;
            background: #47464a;
            padding-bottom: 60px;
            margin-bottom: -60px;
        }

        .search-box form {
            width: 630px;
            margin: auto;
            padding-top: 38px;
            padding-bottom: 8px;
            position: relative;
        }

        .search-box .kw {
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            line-height: 18px;
            width: 630px;
            padding: 15px 50px 15px 20px;
            border: 1px solid #999;
            border-radius: 50px;
        }

        .search-box .submit {
            position: absolute;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            border: none;
            left: auto;
            top: 51px;
            right: 12px;
            width: 27px;
            height: 27px;
            cursor: pointer;
            background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABsAAAAbCAYAAACN1PRVAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAACXBIWXMAAAsTAAALEwEAmpwYAAAEF2lUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNS40LjAiPgogICA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPgogICAgICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgICAgICAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyIKICAgICAgICAgICAgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iCiAgICAgICAgICAgIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIgogICAgICAgICAgICB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iPgogICAgICAgICA8dGlmZjpPcmllbnRhdGlvbj4xPC90aWZmOk9yaWVudGF0aW9uPgogICAgICAgICA8eG1wTU06RGVyaXZlZEZyb20gcmRmOnBhcnNlVHlwZT0iUmVzb3VyY2UiPgogICAgICAgICAgICA8c3RSZWY6aW5zdGFuY2VJRD54bXAuaWlkOjBDNUQ4ODBFNDFCRTExRTZBRDBFQjNFRDNDQkMxOTEyPC9zdFJlZjppbnN0YW5jZUlEPgogICAgICAgICAgICA8c3RSZWY6ZG9jdW1lbnRJRD54bXAuZGlkOjBDNUQ4ODBGNDFCRTExRTZBRDBFQjNFRDNDQkMxOTEyPC9zdFJlZjpkb2N1bWVudElEPgogICAgICAgICA8L3htcE1NOkRlcml2ZWRGcm9tPgogICAgICAgICA8eG1wTU06RG9jdW1lbnRJRD54bXAuZGlkOjBD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) no-repeat 50%;
            background-size: contain;
        }

        .container {
            width: 1200px;
            margin: 0 auto;
            margin-top: 130px;
        }

        .search-result-box {
            width: 950px;
            margin: 0 auto;
        }

        dd {
            width: 160px;
        }

        a:hover {
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="search-box">
        <form data-state-val="{kw:''}" class="search-form" acttion="#">
            <input class="kw" type="text" name="name" maxlength="32" value="${name}" placeholder="找影视剧" autocomplete="off">
            <button class="submit" type="submit"></button>
        </form>
    </div>

    <div class="container" id="app">
        <div class="search-result-box">
            <div class="movie-list">
                <c:forEach items="${fs}" var="f" varStatus="st">
                    <dd>
                        <div class="movie-item film-channel">
                            <a href="filmDetail?fid=${f.fid }">
                                <div class="movie-poster">
                                    <img src="img/filmSignal/${f.fid }.jpg">
                                </div>
                            </a>
                        </div>

                        <div class="channel-detail movie-item-title" title="你是我的春天" style="text-align: center">
                            <a href="filmDetail?fid=${f.fid }">${f.fname_cn }</a>
                        </div>
                        <div class="movie-item-subtitle" style="text-align: center">
                                <c:if test="${f.fname_en.length() > 18 }">
                                    ${f.fname_en.substring(0,18) }...
                                </c:if>

                                <c:if test="${f.fname_en.length() <= 18 }">
                                    ${f.fname_en }
                                </c:if>
                        </div>
                        <div class="channel-detail channel-detail-orange" style="text-align: center; margin-top: 0px">${fn:substring(f.fscore, 0, 3)}</div>
                        <div class="movie-item-pub" style="text-align: center">
                            ${f.freleasetime} ${f.fregion}
                        </div>

                    </dd>
                </c:forEach>
            </div>
        </div>
    </div>
</body>
</html>
