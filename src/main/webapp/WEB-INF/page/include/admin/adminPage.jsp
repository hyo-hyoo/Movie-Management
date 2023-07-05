<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <script src="js/jquery/2.0.0/jquery.min.js"></script>
    <link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
	<script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
	<script>
        $(function(){
            $("ul.pagination li.disabled a").click(function(){
            return false;
            });
        });
    </script>
</head>
<body>

<nav aria-label="Page navigation">
    <ul class="pagination">
    
        <!-- 首页 -->
        <li <c:if test="${!page.hasPrevious}">class="disabled"</c:if>>
            <a  href="?start=0${page.param}" aria-label="Previous" >
                <span aria-hidden="true">«</span>
            </a>
        </li>
         
        <!-- 上一页 -->
        <li <c:if test="${!page.hasPrevious}">class="disabled"</c:if>>
            <a  href="?start=${page.start-page.count}${page.param}" aria-label="Previous" >
                <span aria-hidden="true">‹</span>
            </a>
        </li> 
        
        <!-- 遍历页码 -->
        <c:forEach begin="0" end="${page.totalPage - 1}" varStatus="status">
            <c:if test="${status.count * page.count - page.start <= 4 * page.count && status.count * page.count - page.start >= -2 * page.count}">
	            <li <c:if test="${status.index * page.count == page.start}">class="disabled"</c:if>>
	                <a href="?start=${status.index * page.count}${page.param}"
	                	<c:if test="${status.index * page.count == page.start}">class="current"</c:if>>${status.count}
	                </a>
	            </li>
           </c:if>
        </c:forEach>
        
        <!-- 下一页 -->
        <li <c:if test="${!page.hasNext}">class="disabled"</c:if>>
            <a href="?start=${page.start+page.count}${page.param}" aria-label="Next">
                <span aria-hidden="true">›</span>
            </a>
        </li>
        
        <!-- 尾页 -->
        <li <c:if test="${!page.hasNext}">class="disabled"</c:if>>
            <a href="?start=${page.last}${page.param}" aria-label="Next">
                <span aria-hidden="true">»</span>
            </a>
        </li>
    </ul>
</nav>

</body>
</html>