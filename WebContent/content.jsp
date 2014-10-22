<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

    <title>게시글 조회</title>

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

<h1>게시글 조회</h1>

<table border="1">                            <!-- border은 테두리를 표시하는 속성입니다. -->

    <tr>
        <th>번호</th>
        <td>${article.idx}</td>

        <th>작성자</th>
        <td>${article.writer}</td>

        <th>날짜</th>
        <td>${article.regdate}</td>

        <th>조회수</th>
        <td>${article.count}</td>
    </tr>

    <tr>
        <th colspan="2">제목</th>                     <!-- colspan은 행병합 속성입니다. -->
        <td colspan="6">${article.title}</td>
    </tr>

    <tr>
        <th colspan="2">내용</th>
        <td colspan="6">${article.content}</td>
    </tr>
    
    <tr>
    	<th colspan="2">첨부파일</th>
    	<td colspan="8">
    		<a href="#" onclick="onDownload('${article.idx}')">${article.filename}</a>
    	</td>
    </tr>

</table>

<a href="delete.do?idx=${article.idx}">게시글삭제</a>

<a href="list.do">목록으로</a>


</body>

</html>
