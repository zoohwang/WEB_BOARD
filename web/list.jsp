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
        <th>��ȣ</th>
        <th>����</th>
        <th>�ۼ���</th>
        <th>��¥</th>
        <th>��ȸ��</th>
    </tr>

    <c:forEach items="${articleList}" var="article">
        <tr>
            <td>${article.idx}</td>
            <td><a href="content.jsp?idx=${article.idx}">${article.title}</a> </td>
            <td>${article.writer}</td>
            <td>${article.regdate}</td>
            <td>${article.count}</td>
        </tr>

    </c:forEach>
    </table>
    <a href="write.jsp">�۾���</a>
</body>
</html>