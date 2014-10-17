<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 14. 10. 7
  Time: 오후 10:00
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.util.regex.Pattern"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <style type="text/css">
        table, td, th   {
            border:1px solid green;
        }
        th{
            background-color:green;
            color:white;
        }
    </style>

    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR"/>
    <title>Insert page</title>
</head>
<%
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

    try {
        String driverName = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/board";

        Class.forName(driverName);
        Connection conn = DriverManager.getConnection(url, "root", "2413");
        out.println("Success DB Connection");
        Statement stmt = conn.createStatement();

        String sql = "INSERT INTO BOARD "+

                "(title, WRITER, REGDATE, COUNT, CONTENT) "+

                "VALUES ('"+title+"', '"+writer+"', '"+regdate+"', '1', '"+content+"')";
        System.out.println(sql);
        stmt.executeUpdate(sql);
        conn.close();
    }catch(Exception e) {
        out.println("Fault DB Connection");
        out.println(e.getMessage());
        e.printStackTrace();
    }
%>
<body>
<script>location.href="list.do"; </script>
</body>
</html>
