<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

    <title>�Խñ� ��ȸ</title>

<script>

function onDownload(idx) {

	var o = document.getElementById("ifrm_filedown");	

	o.src = "download.do?idx="+idx;

}

</script>	

</head>
<%
//     String idx = request.getParameter("idx");
//     try {

//         String driverName = "com.mysql.jdbc.Driver";
//         String url = "jdbc:mysql://localhost:3306/board";
//         ResultSet rs = null;

//         Class.forName(driverName);
//         Connection con = DriverManager.getConnection(url, "root", "2413");
//         out.println("Database Connection Success.");

//         Statement stmt = con.createStatement();
//         String sql = "select * from board where idx = " + idx ;

//         rs = stmt.executeQuery(sql);

//         while(rs.next()){
//             request.setAttribute("idx", rs.getString("idx"));
//             request.setAttribute("writer", rs.getString("writer"));
//             request.setAttribute("regdate", rs.getString("regdate"));
//             request.setAttribute("count", rs.getString("count"));
//             request.setAttribute("title", rs.getString("title"));
//             request.setAttribute("content", rs.getString("content"));
//         }
//         con.close();
//     }catch(Exception e) {
//         out.println("DB Connection Error");
//         out.println(e.getMessage());
//         e.printStackTrace();
//     }
%>


<body>

<iframe id="ifrm_filedown"  style="position:absolute; z-index:1;visibility : hidden;"></iframe>  

<h1>�Խñ� ��ȸ</h1>

<table border="1">                            <!-- border�� �׵θ��� ǥ���ϴ� �Ӽ��Դϴ�. -->

    <tr>
        <th>��ȣ</th>
        <td>${article.idx}</td>

        <th>�ۼ���</th>
        <td>${article.writer}</td>

        <th>��¥</th>
        <td>${article.regdate}</td>

        <th>��ȸ��</th>
        <td>${article.count}</td>
    </tr>

    <tr>
        <th colspan="2">����</th>                     <!-- colspan�� �ິ�� �Ӽ��Դϴ�. -->
        <td colspan="6">${article.title}</td>
    </tr>

    <tr>
        <th colspan="2">����</th>
        <td colspan="6">${article.content}</td>
    </tr>
    
    <tr>
    	<th colspan="2">÷������</th>
    	<td colspan="8">
    		<a href="#" onclick="onDownload('${article.idx}')">${article.filename}</a>
    	</td>
    </tr>

</table>

<a href="delete.do?idx=${article.idx}">�Խñۻ���</a>

<a href="list.do">�������</a>


</body>

</html>
