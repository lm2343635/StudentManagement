<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
<%
request.setCharacterEncoding("gb2312");
String dno=request.getParameter("dno");
String cono=request.getParameter("cono");
String semester=request.getParameter("semester");
String grade=request.getParameter("grade");
String add="insert into sc(sno,cno,tno) select sno,cno,tno from teach,student "+
		"where sno like '"+grade+"%' and dno="+dno+" and semester="+semester+" "+
		"and (property='����������' or property='רҵ��' or property='רҵ������') "+
		"and department=(select dname from department where dno="+dno+")";

//response.sendRedirect("../admin/setClassSemester.jsp?dno="+dno+"&cono="+cono+"&semester="+semester);
%>

<html>
	<head>
		<title>��ӱ��޿�</title>
		<link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
		<link rel="stylesheet" rev="stylesheet" href="../css/myfont.css" type="text/css">
	</head>
	<body>
		<center>
		<img src="../images/top.jpg"><br>
		<jsp:include page="header.jsp"></jsp:include>
		<%
		try
		{
			connectDatabase.exeUpdate(add);
			out.print("��ӳɹ�");
		}
		catch(Exception e)
		{
			out.print("���ʧ��");
		}
		%>
		<a href="../admin/setClassSemester.jsp?dno=<%=dno %>&cono=<%=cono %>&semester=<%=semester %>">����</a>
	</body>
</html>