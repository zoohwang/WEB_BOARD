<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0.1 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.lang.String"%>
<%@page import="java.util.regex.Pattern"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR"/>
    <title>�Խ��� - �Խñ� ����Ʈ</title>            <!--������ ��ܿ� �ߴ� ����-->
</head>
<body>
<%

    int idx = 1;

    String title = request.getParameter("title");
    String writer = request.getParameter("writer");
    String regdate = request.getParameter("regdate");
    String content = request.getParameter("content");

    int count = 10000;
    if(title == "" ||title == null) out.println("title�� null�Դϴ�.");

    if(writer == "" ||writer == null)
        out.println("writer�� null�Դϴ�.");
    else if(!Pattern.matches("^[_0-9a-zA-Z-]+@[0-9a-zA-Z-]+(.[_0-9a-zA-Z-]+)*$", writer))
        out.println("�̸��� ������ �ƴմϴ�.");

    if(regdate == "" ||regdate == null)
        out.println("regdate�� null�Դϴ�.");
    else if(!Pattern.matches("^[0-9]*$", regdate))
        out.println("���������� �ƴմϴ�.");

    if(content == "" ||content == null) out.println("content�� null�Դϴ�.");



%>
<h1>�Խñ� ����Ʈ</h1>
<table>
    <tr>
        <th>��ȣ</th>
        <th>����</th>
        <th>�ۼ���</th>
        <th>��¥</th>
        <th>��ȸ��</th>
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
<a href="write.jsp">�۾���</a>
</body>
</html>