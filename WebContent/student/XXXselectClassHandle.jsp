<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<html>
	<head>
		<title>选课结果</title>
	    <link rel="stylesheet" rev="stylesheet" href="../css/myfont.css" type="text/css">
		<link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
	</head>
	<body>
    <center> 
     <img src="../images/top.jpg"><br>
	<jsp:include page="header.jsp"></jsp:include>
     <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
<%
String sno=(String)session.getAttribute("user");
ResultSet rs=connectDatabase.exeQuery("select cno from course");
ArrayList<String> list=new ArrayList<String>();

int n=0;
try{
while(rs.next())
{
	if(request.getParameter(rs.getString("cno"))!=null)
	{
		list.add(request.getParameter(rs.getString("cno")));
	}
}
}catch(Exception e){}
// 	for(int i=0;i<list.size();i++)
// 	{
// 		out.print(list.get(i)+"<br>");
// 	}
if(list.isEmpty())
  out.print("请选课！");
else
{
	String insert="";
	for(int i=0;i<list.size();i++)
	{
		insert="insert into sc values("+sno+","+list.get(i)+",0)";
		//out.print(insert+"<br>");
		connectDatabase.exeUpdate(insert);
	}
	%>
	<table  border="0">
       <tr>
	     <td height="30" colspan="4" align="center" bgcolor="#0000FF"><myfont>你选择的课程</myfont></td>
       </tr>
	   <tr>
	     <td height="30" width="100" align="center" bgcolor="#0000FF"><myfont>课程号</myfont></td>
	     <td width="400" align="center" bgcolor="#0000FF"><myfont>课程名</myfont></td>
	     <td width="200" align="center" bgcolor="#0000FF"><myfont>教师</myfont></td>
	     <td width="100" align="center" bgcolor="#0000FF"><myfont>学分</myfont></td>
	   </tr>
		<%
		String selectedCno="";
		String selectedTno="";
		for(int i=0;i<list.size();i++)
		{
			String paras[]=list.get(i).split(",");
			selectedCno+=paras[0]+",";
			selectedTno+=paras[1]+",";
		}
		selectedCno=selectedCno.substring(0, selectedCno.length()-1);
		selectedTno=selectedTno.substring(0, selectedTno.length()-1);
		String search="select course.cno,cname,ccredit,tname from course,teach,teacher "+
				"where course.cno=teach.cno and teach.tno=teacher.tno "+
				"and course.cno in("+selectedCno+") and teach.tno in("+selectedTno+")";
		rs=connectDatabase.exeQuery(search);
		while(rs.next())
		{ %> 
	   <tr>
	     <td height="30" align="center" bgcolor="#D9FFFF"><%out.print(rs.getString("course.cno")+"&nbsp;"); %></td>
	     <td align="center" bgcolor="#D9FFFF"><%out.print(rs.getString("cname")+"&nbsp;"); %></td>
	     <td align="center" bgcolor="#D9FFFF"><%out.print(rs.getString("tname")+"&nbsp;"); %></td>
	     <td align="center" bgcolor="#D9FFFF"><%out.print(rs.getString("ccredit")+"&nbsp;"); %></td>	     
	     <td width="0"></td>
	   </tr>
	<% 
		}

	%>
	</table>
	<% 
 }
connectDatabase.close();
%>

	<button type="button" onClick="window.location.href='selectClass.jsp'">继续选课</button>
	<button type="button" onClick="window.location.href='../public/loginHandle.jsp'">返回首页</button>
	</body>
</html>