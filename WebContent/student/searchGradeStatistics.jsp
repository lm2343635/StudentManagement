<%@page import="com.nefu.stumgr.util.Statistics"%>
<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.nefu.stumgr.util.*"%>
<jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
<%
String sno=(String)session.getAttribute("user");
//获取学生姓名，专业
String sname="";
String department="";
ResultSet rs=connectDatabase.exeQuery("select sname,department from student where sno="+sno);
if(rs.next())
{
	sname=rs.getString("sname");
	department=rs.getString("department");
}
//获取专业人数
int personNumber=0;
rs=connectDatabase.exeQuery("select count(*) from student where department='"+department+"'");
if(rs.next())
	personNumber=Integer.parseInt(rs.getString("count(*)"));

String properties[]={"公共基础课","公共必修课","专业基础课","专业课","专业选修课","课程设计","实践教学"};
int credits[]={0,0,0,0,0,0,0};
rs=null;
for(int i=0;i<properties.length;i++)
{
	rs=connectDatabase.exeQuery("select count(*) from sc,teach where sc.cno=teach.cno and sc.tno=teach.tno "+
			"and sno="+sno+" and property='"+properties[i]+"' ");
	if(rs.next())
		credits[i]=Integer.parseInt(rs.getString("count(*)"));
}
int credit=0;
for(int i=0;i<properties.length;i++)
	credit+=credits[i];
//获取加权成绩
Statistics s=new Statistics();		
String []grades=s.getGrade(sno);
grades[0]=grades[0].substring(0, 5);
grades[1]=grades[1].substring(0, 4);
%>
<html> 
	<head>
	<title>成绩统计</title>
	<link rel="stylesheet" rev="stylesheet" href="../css/myfont.css" type="text/css">
    <link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
	<link rel="stylesheet" rev="stylesheet" href="../css/hover.css" type="text/css">
</head>
<body>
	<center>
	<img src="../images/top.jpg"><br>
	<jsp:include page="header.jsp"/>
	<table  border="0" style="border-spacing:0">
	   <tr>
		  <td width="200" height="40" align="center" bgcolor="#0000FF" class="block">
		  	 <a href="searchGrade.jsp" ><myfont>历年成绩</myfont></a>     
		  </td>
		  <td width="1" height="40" align="center" bgcolor="#FFFFFF" class="block"></td>
		  <td width="200" align="center" bgcolor="#0000FF" class="block">
	 	    <a href="searchGradeSemester.jsp"><myfont>学期成绩</myfont></a>     
		  </td>
		  <td width="1" height="40" align="center" bgcolor="#FFFFFF" class="block"></td>
		  <td width="200" height="40" align="center" bgcolor="#0000FF" class="block">
		  	 <a href="searchGradeYear.jsp"><myfont>学年成绩</myfont></a>     
		  </td>
		  <td width="1" height="40" align="center" bgcolor="#FFFFFF" class="block"></td>
		  <td width="200" align="center" bgcolor="#009933" class="block">
		 	 <a href="searchGradeStatistics.jsp"><myfont>成绩统计</myfont></a>     
		  </td>
	   </tr> 
	   <tr>
		  <td colspan="7" width="800" height="8" align="center"  bgcolor="#009933"></td>
	   </tr>
	</table>
	<table  border="0" style="margin: 0; padding: 0;">
	 <tr>
	     <td colspan="8" height="40" align="center" bgcolor="#0000FF">
	     	<myfont>成绩统计</myfont>
	     </td>
	 </tr>
	 <tr>
		<td height="40"  width="99" align="center" bgcolor="#D9FFFF">学号</td>
		<td width="99" align="center" bgcolor="#D9FFFF"><%=sno %></td>
		<td width="99" align="center" bgcolor="#D9FFFF">姓名</td>
		<td width="99" align="center" bgcolor="#D9FFFF"><%=sname %></td>
		<td width="99" align="center" bgcolor="#D9FFFF">学院</td>
		<td colspan="3" align="center" bgcolor="#D9FFFF"><%=department %></td>
	 </tr>
	 <tr>
	     <td height="40" width="99" align="center" bgcolor="#D9FFFF">课程性质</td>
	     <%
	     for(int i=0;i<properties.length;i++)
	     {
	     %>
	     <td width="99" align="center" bgcolor="#D9FFFF"><%=properties[i] %></td>
	     <%
	     }
	     %>
	 </tr>
	 <tr>
	     <td height="40" width="99" align="center" bgcolor="#D9FFFF">已获学分</td>
	     <%
	     for(int i=0;i<credits.length;i++)
	     {
	     %>
	     <td width="99" align="center" bgcolor="#D9FFFF"><%=credits[i] %></td>
	     <%
	     }
	     %>
	 </tr>
	 <tr>
		<td height="40"  width="99" align="center" bgcolor="#D9FFFF">获得学分</td>
		<td width="99" align="center" bgcolor="#D9FFFF"><%=credit %></td>
		<td width="99" align="center" bgcolor="#D9FFFF">加权平均成绩</td>
		<td width="99" align="center" bgcolor="#D9FFFF"><%=grades[0] %></td>
		<td width="99" align="center" bgcolor="#D9FFFF">学分绩点</td>
		<td width="99" align="center" bgcolor="#D9FFFF"><%=grades[1] %></td>
		<td width="99" align="center" bgcolor="#D9FFFF">专业人数</td>
		<td width="99" align="center" bgcolor="#D9FFFF"><%=personNumber %></td>
	 </tr>
	</table>
</body>
</html>