<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>

<%@page import="java.lang.String"%>
<%@page import="java.util.regex.Pattern"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.util.ArrayList" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="com.board.beans.Board" %>

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

<%
    try{
        String driverName = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/board";

        ResultSet rs = null;

        Class.forName(driverName);
        Connection con = DriverManager.getConnection(url, "root", "2413");
        System.out.println("index page Success DB Connection");

        Statement stmt = con.createStatement();

        String sql = "select * from board order by idx desc";

        rs = stmt.executeQuery(sql);
%>
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

<%
    while(rs.next()) {
         out.print("<tr>");

        out.print("<td>" + rs.getString(1) + "</td>");

        out.print("<td> <a href='content.jsp?idx="+rs.getString("idx")+"'>" + rs.getString("title") + "</a></td>");

        out.print("<td>" + rs.getString(3) + "</td>");

        out.print("<td>" + rs.getString(4) + "</td>");

        out.print("<td>" + rs.getString(5) + "</td>");

        out.print("</tr>");
    }
%>
    </table>
    <a href="write.jsp">�۾���</a>

<%
    con.close();
    }catch (Exception e) {
        out.println("Oracle Database Connection Something Problem. <hr>");

        out.println(e.getMessage());

        e.printStackTrace();
    }
%>

</body>
</html>