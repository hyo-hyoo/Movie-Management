<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div style="text-align:center">
        
        <a href="?start=0">«</a>
        <c:if test="${page.isHasPrevious() }">
        	<a href="?start=${page.start-page.count}">‹</a>	
        </c:if>
        <c:if test="${!page.isHasPrevious() }">
        	<a href="?start=${page.start}">‹</a>	
        </c:if>
        	
        <a href="?start=${page.start}">第${page.getPage()}页</a>
        	
        <c:if test="${page.isHasNext() }">
        	<a href="?start=${page.start+page.count}">›</a>	
        </c:if>
        <c:if test="${!page.isHasNext() }">
        	<a href="?start=${page.start}">›</a>	
        </c:if>
        <a href="?start=${page.last}">»</a>
</div>