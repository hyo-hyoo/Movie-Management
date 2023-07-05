<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>

<%@include file="../include/fore/navigator.jsp"%>
<head>
    <title>影院热映大片_热映电影票房_高清电影影视大全-猫眼电影</title>

    <link rel="stylesheet" href="css/fore/listFilm.css"/>


    <meta charset="utf-8">

    <style>
        a:hover {
            outline-width: 0;
            text-decoration: none
        }
    </style>
</head>
<body>

<div class="subnav">
    <ul class="navbar">
        <li>
            <a class="${showType.equals("在映") ? "active" : ""}" href="listFilm?showType=在映&typeId=${typeId }&region=${region}&orderType=${orderType }">正在热映</a>
        </li>
        <li>
            <a class="${showType.equals("待映") ? "active" : ""}" href="listFilm?showType=待映&typeId=${typeId }&region=${region}&orderType=${orderType }">即将上映</a>
        </li>
    </ul>
</div>


<div class="container" id="app" class="page-movie/list" >
    <div class="movies-channel">
        <div class="tags-panel">
            <ul class="tags-lines">
                <li class="tags-line" data-val="{tagTypeName:'cat'}">
                    <div class="tags-title">类型 :</div>
                    <ul class="tags">
                        <li class="${typeId.equals("") ? "active" : ""}" data-state-val="{ catTagName:'全部'}" >
                            <a data-act="tag-click" data-val="{TagName:'全部'}"
                               href="?showType=${showType }&typeId=&region=${region}&orderType=${orderType }" style="cursor: default"
                            >全部</a>
                        </li>
                        <li class="${typeId.equals("1") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'爱情'}"
                               href="?showType=${showType }&typeId=1&region=${region}&orderType=${orderType }"
                            >爱情</a>
                        </li>
                        <li class="${typeId.equals("2") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'喜剧'}"
                               href="?showType=${showType }&typeId=2&region=${region}&orderType=${orderType }"
                            >喜剧</a>
                        </li>
                        <li class="${typeId.equals("3") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'动画'}"
                               href="?showType=${showType }&typeId=3&region=${region}&orderType=${orderType }"
                            >动画</a>
                        </li>
                        <li class="${typeId.equals("4") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'剧情'}"
                               href="?showType=${showType }&typeId=4&region=${region}&orderType=${orderType }"
                            >剧情</a>
                        </li>
                        <li class="${typeId.equals("5") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'恐怖'}"
                               href="?showType=${showType }&typeId=5&region=${region}&orderType=${orderType }"
                            >恐怖</a>
                        </li>
                        <li class="${typeId.equals("6") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'惊悚'}"
                               href="?showType=${showType }&typeId=6&region=${region}&orderType=${orderType }"
                            >惊悚</a>
                        </li>
                        <li class="${typeId.equals("7") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'科幻'}"
                               href="?showType=${showType }&typeId=7&region=${region}&orderType=${orderType }"
                            >科幻</a>
                        </li>
                        <li class="${typeId.equals("8") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'动作'}"
                               href="?showType=${showType }&typeId=8&region=${region}&orderType=${orderType }"
                            >动作</a>
                        </li>
                        <li class="${typeId.equals("9") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'悬疑'}"
                               href="?showType=${showType }&typeId=9&region=${region}&orderType=${orderType }"
                            >悬疑</a>
                        </li>
                        <li class="${typeId.equals("10") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'犯罪'}"
                               href="?showType=${showType }&typeId=10&region=${region}&orderType=${orderType }"
                            >犯罪</a>
                        </li>
                        <li class="${typeId.equals("11") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'冒险'}"
                               href="?showType=${showType }&typeId=11&region=${region}&orderType=${orderType }"
                            >冒险</a>
                        </li>
                        <li class="${typeId.equals("12") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'战争'}"
                               href="?showType=${showType }&typeId=12&region=${region}&orderType=${orderType }"
                            >战争</a>
                        </li>
                        <li class="${typeId.equals("13") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'奇幻'}"
                               href="?showType=${showType }&typeId=13&region=${region}&orderType=${orderType }"
                            >奇幻</a>
                        </li>
                        <li class="${typeId.equals("14") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'运动'}"
                               href="?showType=${showType }&typeId=14&region=${region}&orderType=${orderType }"
                            >运动</a>
                        </li>
                        <li class="${typeId.equals("15") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'家庭'}"
                               href="?showType=${showType }&typeId=15&region=${region}&orderType=${orderType }"
                            >家庭</a>
                        </li>
                        <li class="${typeId.equals("16") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'古装'}"
                               href="?showType=${showType }&typeId=16&region=${region}&orderType=${orderType }"
                            >古装</a>
                        </li>
                        <li class="${typeId.equals("17") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'武侠'}"
                               href="?showType=${showType }&typeId=17&region=${region}&orderType=${orderType }"
                            >武侠</a>
                        </li>
                        <li class="${typeId.equals("18") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'西部'}"
                               href="?showType=${showType }&typeId=18&region=${region}&orderType=${orderType }"
                            >西部</a>
                        </li>
                        <li class="${typeId.equals("19") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'历史'}"
                               href="?showType=${showType }&typeId=19&region=${region}&orderType=${orderType }"
                            >历史</a>
                        </li>
                        <li class="${typeId.equals("20") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'传记'}"
                               href="?showType=${showType }&typeId=20&region=${region}&orderType=${orderType }"
                            >传记</a>
                        </li>
                        <li class="${typeId.equals("21") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'歌舞'}"
                               href="?showType=${showType }&typeId=21&region=${region}&orderType=${orderType }"
                            >歌舞</a>
                        </li>
                        <li class="${typeId.equals("22") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'黑色电影'}"
                               href="?showType=${showType }&typeId=22&region=${region}&orderType=${orderType }"
                            >黑色电影</a>
                        </li>
                        <li class="${typeId.equals("23") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'短片'}"
                               href="?showType=${showType }&typeId=23&region=${region}&orderType=${orderType }"
                            >短片</a>
                        </li>
                        <li class="${typeId.equals("24") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'纪录片'}"
                               href="?showType=${showType }&typeId=24&region=${region}&orderType=${orderType }"
                            >纪录片</a>
                        </li>
                        <li class="${typeId.equals("25") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'戏曲'}"
                               href="?showType=${showType }&typeId=25&region=${region}&orderType=${orderType }"
                            >戏曲</a>
                        </li>
                        <li class="${typeId.equals("26") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'音乐'}"
                               href="?showType=${showType }&typeId=26&region=${region}&orderType=${orderType }"
                            >音乐</a>
                        </li>
                        <li class="${typeId.equals("27") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'灾难'}"
                               href="?showType=${showType }&typeId=27&region=${region}&orderType=${orderType }"
                            >灾难</a>
                        </li>
                        <li class="${typeId.equals("28") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'青春'}"
                               href="?showType=${showType }&typeId=28&region=${region}&orderType=${orderType }"
                            >青春</a>
                        </li>
                        <li class="${typeId.equals("29") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'儿童'}"
                               href="?showType=${showType }&typeId=29&region=${region}&orderType=${orderType }"
                            >儿童</a>
                        </li>
                        <li class="${typeId.equals("30") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'其他'}"
                               href="?showType=${showType }&typeId=30&region=${region}&orderType=${orderType }"
                            >其他</a>
                        </li>
                    </ul>
                </li>
                <li class="tags-line tags-line-border" data-val="{tagTypeName:'source'}">
                    <div class="tags-title">区域 :</div>
                    <ul class="tags">
                        <li class="${region.equals("") ? "active" : ""}" data-state-val="{ sourceTagName:'全部'}" >
                            <a data-act="tag-click" data-val="{TagName:'全部'}"
                               href="?showType=${showType }&typeId=${typeId }&region=&orderType=${orderType }"
                            >全部</a>
                        </li>
                        <li class="${region.equals("中国大陆") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'大陆'}"
                               href="?showType=${showType }&typeId=${typeId }&region=中国大陆&orderType=${orderType }"
                            >中国大陆</a>
                        </li>
                        <li class="${region.equals("美国") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'美国'}"
                               href="?showType=${showType }&typeId=${typeId }&region=美国&orderType=${orderType }"
                            >美国</a>
                        </li>
                        <li class="${region.equals("韩国") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'韩国'}"
                               href="?showType=${showType }&typeId=${typeId }&region=韩国&orderType=${orderType }"
                            >韩国</a>
                        </li>
                        <li class="${region.equals("日本") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'日本'}"
                               href="?showType=${showType }&typeId=${typeId }&region=日本&orderType=${orderType }"
                            >日本</a>
                        </li>
                        <li class="${region.equals("中国香港") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'中国香港'}"
                               href="?showType=${showType }&typeId=${typeId }&region=中国香港&orderType=${orderType }"
                            >中国香港</a>
                        </li>
                        <li class="${region.equals("中国台湾") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'中国台湾'}"
                               href="?showType=${showType }&typeId=${typeId }&region=中国台湾&orderType=${orderType }"
                            >中国台湾</a>
                        </li>
                        <li class="${region.equals("泰国") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'泰国'}"
                               href="?showType=${showType }&typeId=${typeId }&region=泰国&orderType=${orderType }"
                            >泰国</a>
                        </li>
                        <li class="${region.equals("印度") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'印度'}"
                               href="?showType=${showType }&typeId=${typeId }&region=印度&orderType=${orderType }"
                            >印度</a>
                        </li>
                        <li class="${region.equals("法国") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'法国'}"
                               href="?showType=${showType }&typeId=${typeId }&region=法国&orderType=${orderType }"
                            >法国</a>
                        </li>
                        <li class="${region.equals("英国") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'英国'}"
                               href="?showType=${showType }&typeId=${typeId }&region=英国&orderType=${orderType }"
                            >英国</a>
                        </li>
                        <li class="${region.equals("俄罗斯") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'俄罗斯'}"
                               href="?showType=${showType }&typeId=${typeId }&region=俄罗斯&orderType=${orderType }"
                            >俄罗斯</a>
                        </li>
                        <li class="${region.equals("意大利") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'意大利'}"
                               href="?showType=${showType }&typeId=${typeId }&region=意大利&orderType=${orderType }"
                            >意大利</a>
                        </li>
                        <li class="${region.equals("西班牙") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'西班牙'}"
                               href="?showType=${showType }&typeId=${typeId }&region=西班牙&orderType=${orderType }"
                            >西班牙</a>
                        </li>
                        <li class="${region.equals("德国") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'德国'}"
                               href="?showType=${showType }&typeId=${typeId }&region=德国&orderType=${orderType }"
                            >德国</a>
                        </li>
                        <li class="${region.equals("波兰") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'波兰'}"
                               href="?showType=${showType }&typeId=${typeId }&region=波兰&orderType=${orderType }"
                            >波兰</a>
                        </li>
                        <li class="${region.equals("澳大利亚") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'澳大利亚'}"
                               href="?showType=${showType }&typeId=${typeId }&region=澳大利亚&orderType=${orderType }"
                            >澳大利亚</a>
                        </li>
                        <li class="${region.equals("伊朗") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'伊朗'}"
                               href="?showType=${showType }&typeId=${typeId }&region=伊朗&orderType=${orderType }"
                            >伊朗</a>
                        </li>
                        <li class="${region.equals("其他") ? "active" : ""}">
                            <a data-act="tag-click" data-val="{TagName:'其他'}"
                               href="?showType=${showType }&typeId=${typeId }&region=其他&orderType=${orderType }"
                            >其他</a>
                        </li>
                    </ul>
                </li>

            </ul>
            </li>
            </ul>
        </div>
        <div class="movies-panel" style="width:100%">
            <div class="movies-sorter">
                <div class="cat-sorter">
                    <ul>
                        <li>
                            <span class="sort-control-group" data-act='sort-click' data-val="{tagId: 1 }"
                                  data-href="listFilm?showType=${showType}&typeId=${typeId}&region=${region}&orderType=" onclick="location.href=this.getAttribute('data-href')">
                                <span class="sort-control sort-radio ${orderType.equals("") ? "sort-radio-checked" : ""}"></span>
                                <span class="sort-control-label">按热门排序</span>
                            </span>
                        </li>
                        <li>
                            <span class="sort-control-group" data-act='sort-click' data-val="{tagId: 2 }"
                                  data-href="listFilm?showType=${showType}&typeId=${typeId}&region=${region}&orderType=1" onclick="location.href=this.getAttribute('data-href')">
                              <span class="sort-control sort-radio ${orderType.equals("1") ? "sort-radio-checked" : ""}"></span>
                              <span class="sort-control-label">按评论排序</span>
                            </span>
                        </li>

                    </ul>
                </div>
            </div>

            <div class="movies-list">

                <dl class="movie-list">
                    <c:forEach items="${fs}" var="f">
                        <dd style="margin-left: 27px">
                            <div class="movie-item film-channel">
                                <a href="filmDetail?fid=${f.fid }">
                                    <div class="movie-poster">
                                        <img src="img/filmSignal/${f.fid }.jpg"/>
                                    </div>
                                </a>
                                <div class="channel-action channel-action-sale">
                                    <a>购票</a>
                                </div>


                                <div class="movie-item-hover">
                                    <a href="filmDetail?fid=${f.fid }">
                                        <img class="movie-hover-img" src="img/filmSignal/${f.fid }.jpg" alt="人生大事" />
                                        <div class="movie-hover-info">
                                            <div class="movie-hover-title" >
                                                <span class="name ">${f.fname_cn}</span>
                                                <span class="score channel-detail-orange"><i class="integer">${fn:substring(f.fscore, 0, 1)}.</i><i class="fraction">${fn:substring(f.fscore, 2, 3)}</i></span>
                                            </div>
                                            <div class="movie-hover-title" >
                                                <span class="hover-tag">时长:</span>
                                                    ${f.flength } 分钟
                                            </div>
                                            <div class="movie-hover-title movie-hover-brief" >
                                                <span class="hover-tag">上映时间:</span>
                                                ${f.freleasetime }
                                            </div>
                                            <div class="movie-hover-title" >
                                                <span class="hover-tag">地区:</span>
                                                ${f.fregion }
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>

                            <div class="channel-detail movie-item-title">
                                <a href="filmDetail?fid=${f.fid }">${f.fname_cn}</a>
                            </div>
                            <div class="channel-detail channel-detail-orange"><i class="integer">${fn:substring(f.fscore, 0, 1)}.</i><i class="fraction">${fn:substring(f.fscore, 2, 3)}</i></div>
                        </dd>
                    </c:forEach>
                </dl>


            </div>
        </div>
    </div>

</div>


</body>
</html>
