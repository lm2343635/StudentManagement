<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
<%
request.setCharacterEncoding("gb2312");
String cno=request.getParameter("cno");
String className=request.getParameter("class");
className=new String(className.getBytes( "ISO8859-1"), "GB2312"); 
String tno=(String)session.getAttribute("user");
ResultSet rs=connectDatabase.exeQuery("select sno from student where class='"+className+"'");
ArrayList<String> snos=new ArrayList<String>();
ArrayList<String> grades=new ArrayList<String>();
while(rs.next())
    snos.add(rs.getString("sno"));
for(int i=0;i<snos.size();i++)
	grades.add(request.getParameter(snos.get(i)));
// for(int i=0;i<snos.size();i++)
// 	out.print(snos.get(i)+" "+grades.get(i)+"<br/>");
for(int i=0;i<snos.size();i++)
	if(!grades.get(i).equals("-1"))
		connectDatabase.exeUpdate
		("update sc set grade="+grades.get(i)+" where sno="+snos.get(i)+" and cno="+cno+" and tno="+tno);
//out.print(cno+" "+tno);
%>
<html>
	<head>
		<title><%=className %>-录入成绩</title>
		<link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
		<link rel="stylesheet" rev="stylesheet" href="../css/myfont.css" type="text/css">
	</head>
	<body>
		 <center>
 		 <img src="../images/top.jpg"><br>
 		 <jsp:include page="../teacher/header.jsp"></jsp:include>
		 录入完成
		 <a href="inputGradeClass.jsp?cno=<%=cno%>">返回</a>
	</body>
</html>
