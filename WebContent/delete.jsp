<%@page import="java.util.regex.Pattern"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"

         pageEncoding="EUC-KR"%>

<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

    <title>�Խñ� ����</title>

</head>

<%-- <% --%>

<!--     String idx = request.getParameter("idx"); -->

<!--     try { -->

<!--         String driverName = "com.mysql.jdbc.Driver"; -->
<!--         String url = "jdbc:mysql://localhost:3306/board"; -->

<!--         Class.forName(driverName); -->

<!--         Connection con = DriverManager.getConnection(url, "root", "2413"); -->

<!--         out.println("Database Connection Success."); -->

<!--         Statement stmt = con.createStatement(); -->

<!--         String sql = "delete from board where idx=" + idx; -->

<!--         stmt.executeUpdate(sql); -->
<!--     }catch (Exception e) { -->
<!--         out.println("Oracle Database Connection Something Problem. <hr>"); -->
<!--         out.println(e.getMessage()); -->
<!--         e.printStackTrace(); -->
<!--     } -->

<!-- %> -->
<script>

    alert("�Խñ��� �����Ǿ����ϴ�");  // �Խñ��� �����Ǿ��ٴ� ���â�� ����ְ�

    location.href="redirect.jsp";			// ����Ʈ�������� �̵��մϴ�.

</script>

</body>

</html>
