<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
<%
String tno=(String)session.getAttribute("user");
request.setCharacterEncoding("gb2312");
String sno="";
String sname="";
String className="";
if(request.getParameter("sno")!=null)
	sno=request.getParameter("sno");
//out.print(sno+"<br/>");
if(request.getParameter("sname")!=null)
	sname=request.getParameter("sname");
//out.print(sname+"<br/>");
if(request.getParameter("class")!=null)
	className=request.getParameter("class");
//out.print(className+"<br/>");
String select="select sc.sno,sname,ssex,sage,class from sc,student "+
					 "where sc.sno=student.sno and tno="+tno;
if(!sno.equals("")||!className.equals("")||!sname.equals(""))
	select+=" and";
if(!sno.equals(""))
	select+=" sc.sno like '%"+sno+"%' and";
if(!className.equals(""))
	select+=" class like '%"+className+"%' and";
if(!sname.equals(""))
	select+=" sname like '%"+sname+"%' and";
select=select.substring(0, select.length()-4);
select+=" group by sc.sno";
if(sno.equals("")&&className.equals("")&&sname.equals(""))
	select="select sc.sno,sname,ssex,sage,class from sc,student "+
			 "where sc.sno=student.sno and tno="+tno+" group by sc.sno";
//out.print(select);
%>
<html>
	<head>
		<title>学生信息</title>
		<link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
		<link rel="stylesheet" rev="stylesheet" href="../css/myfont.css" type="text/css">
		<link rel="stylesheet" rev="stylesheet" href="../css/hover.css" type="text/css">
	</head>
	<body>
		 <center>
 		 <img src="../images/top.jpg"><br>
 		 <jsp:include page="../teacher/header.jsp"/>		
		<form action="studentInfo.jsp" method="post" style="margin: 0;padding: 0;">
		<table width="805"  border="0" >
			  <tr>
		     		 <td height="40" align="center" bgcolor="#0000FF"><myfont>搜索学生</myfont></td>
			  </tr> 
			  <tr>
				     <td height="40" align="center" bgcolor="#D9FFFF">
						按学号搜索<input type="text" name="sno"/>		
						按姓名搜索<input type="text" name="sname"/>		
						按班级搜索<input type="text" name="class"/>		
						<input type="submit" value="" style="width:25px; height:25px; background-image:url('../images/search.jpg');">
				     </td>
			  </tr>
		</table>
		</form>
		<table  border="0">
	       <tr>
		     <td height="40" width="120"  align="center" bgcolor="#0000FF"><myfont>学号</myfont></td>
		     <td width="120" align="center" bgcolor="#0000FF"><myfont>姓名</myfont></td>
		     <td width="120" align="center" bgcolor="#0000FF"><myfont>性别</myfont></td>    
		     <td width="120" align="center" bgcolor="#0000FF"><myfont>年龄</myfont></td>
		     <td width="300" align="center" bgcolor="#0000FF"><myfont>班级</myfont></td>
	       </tr>
	       <%
		   ResultSet rs=connectDatabase.exeQuery(select);
	       while(rs.next())
	       {
	    	%>
	       <tr>
		     <td height="40"  align="center" bgcolor="#D9FFFF"><%=rs.getString("sc.sno") %></td>
		     <td align="center" bgcolor="#D9FFFF">
		     	<a href="studentInfoPersonal.jsp?sno=<%=rs.getString("sc.sno") %>"><%=rs.getString("sname") %></a>		     
		     </td>
		     <td align="center" bgcolor="#D9FFFF"><%=rs.getString("ssex") %></td>
		     <td align="center" bgcolor="#D9FFFF"><%=rs.getString("sage") %></td>
		     <td align="center" bgcolor="#D9FFFF"><%=rs.getString("class") %></td>
	       </tr>  
			<%
			}
			rs.close();
			%>
		</table>			
	</body>
</html>