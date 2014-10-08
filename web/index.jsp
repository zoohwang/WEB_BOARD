<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0.1 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.lang.String"%>
<%@page import="java.util.regex.Pattern"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR"/>
    <title>게시판 - 게시글 리스트</title>            <!--윈도우 상단에 뜨는 내용-->
</head>
<body>
<%

    int idx = 1;

    String title = request.getParameter("title");
    String writer = request.getParameter("writer");
    String regdate = request.getParameter("regdate");
    String content = request.getParameter("content");

    int count = 10000;
    if(title == "" ||title == null) out.println("title이 null입니다.");

    if(writer == "" ||writer == null)
        out.println("writer가 null입니다.");
    else if(!Pattern.matches("^[_0-9a-zA-Z-]+@[0-9a-zA-Z-]+(.[_0-9a-zA-Z-]+)*$", writer))
        out.println("이메일 형식이 아닙니다.");

    if(regdate == "" ||regdate == null)
        out.println("regdate가 null입니다.");
    else if(!Pattern.matches("^[0-9]*$", regdate))
        out.println("숫자형식이 아닙니다.");

    if(content == "" ||content == null) out.println("content가 null입니다.");



%>
<h1>게시글 리스트</h1>
<table>
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>날짜</th>
        <th>조회수</th>
    </tr>
    <tr>
    <tr>
        <td><%=idx %></td>

        <td><%=title %></td>

        <td><%=writer %></td>

        <td><%=regdate %></td>

        <td><%=count %></td>

    </tr>
    </tr>
</table>
<a href="write.jsp">글쓰기</a>
</body>
</html>