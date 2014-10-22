<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0.1 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR"/>
    <title>�Խ��� - �Խñ� ����Ʈ</title>            <!--������ ��ܿ� �ߴ� ����-->
    
<style type="text/css">

    table,td,th {

        border: 1px solid green;

    }

    th {

        background-color: green;

        color: white;

    }

</style>
</head>


<body>
    <h1>�Խñ� ����Ʈ</h1>
    <table>
        <tr>
        <th width=50 align="left">��ȣ</th>
        <th width=350 align="left">����</th>
        <th width=50 align="left">�ۼ���</th>
        <th width=100 align="left">��¥</th>
        <th width=50 align="left">��ȸ��</th>
    </tr>

    <c:forEach items="${articleList}" var="article">
        <tr>
            <td>${article.idx}</td>
            <td><a href="count.do?idx=${article.idx}">${article.title}</a> </td>
            <td>${article.writer}</td>
            <td>${article.regdate}</td>
            <td>${article.count}</td>
        </tr>

    </c:forEach>
    </table>
    <br/>

	<c:if test="${count > 0}">
	 <c:set var="pageCount"
	  value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}" />
	 <c:set var="startPage" value="${pageGroupSize*(numPageGroup-1)+1}" />
	 <c:set var="endPage" value="${startPage + pageGroupSize-1}" />
	
	 <c:if test="${endPage > pageCount}">
	  <c:set var="endPage" value="${pageCount}" />
	 </c:if>
	
	 <c:if test="${numPageGroup > 1}">
	  <a href="list.do?pageNum=${(numPageGroup-2)*pageGroupSize+1 }" style="text-decoration:none">[����]</a>
	 </c:if>
<!-- ������ ��ȣ ���� �� ���� ������ Ȱ��ȭ -->
	 <c:forEach var="i" begin="${startPage}" end="${endPage}">
	 	<c:if test="${i ==  currentPage}">
	 		<a href="list.do?pageNum=${i}" style="text-decoration:underline"><b>${i}</b></a>
	 	</c:if>
	 	
	 	<c:if test="${i !=  currentPage}">
	 		<a href="list.do?pageNum=${i}" style="text-decoration:none">${i}</a>
	 	</c:if>
	 </c:forEach>
	 
	 <c:if test="${numPageGroup < pageGroupCount}">
	  <a href="list.do?pageNum=${numPageGroup*pageGroupSize+1}" style="text-decoration:none">[����]</a>
	 </c:if>
	</c:if>
	
	<br/><br/>
    
    <a href="write.jsp">�۾���</a>
</body>
</html>