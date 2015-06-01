<%@page import="javax.swing.plaf.SliderUI"%>
<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
<%
request.setCharacterEncoding("gb2312");
String sno_cno=request.getParameter("sno_cno");
String tno=(String)session.getAttribute("user");
String scs[]=sno_cno.split(",");
String buffer[]={"",""};
ArrayList<String> snos=new ArrayList<String>();
ArrayList<String> cnos=new ArrayList<String>();
ArrayList<String> grades=new ArrayList<String>();
for(int i=0;i<scs.length;i++)
{
	buffer=scs[i].split("-");
	snos.add(buffer[0]);
	cnos.add(buffer[1]);
}
for(int i=0;i<snos.size();i++)
	grades.add(request.getParameter(snos.get(i)+cnos.get(i)));
for(int i=0;i<snos.size();i++)
	if(!grades.get(i).equals("-1"))
		connectDatabase.exeUpdate
		("update sc set grade="+grades.get(i)+" where sno="+snos.get(i)+" and cno="+cnos.get(i)+" and tno="+tno);
// for(int i=0;i<snos.size();i++)
// 	out.print(snos.get(i)+" "+cnos.get(i)+" "+grades.get(i)+"<br/>");
// out.print(sno_cno);
%>
<html>
	<head>
		<title>按学生录入成绩</title>
		<link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
		<link rel="stylesheet" rev="stylesheet" href="../css/myfont.css" type="text/css">
	</head>
	<body>
		 <center>
 		 <img src="../images/top.jpg"><br>
 		 <jsp:include page="../teacher/header.jsp"></jsp:include>
		 录入完成
		 <a href="inputGradeStudent.jsp">返回</a>
	</body>
</html>