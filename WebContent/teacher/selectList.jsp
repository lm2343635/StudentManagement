<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
<html>
	<head>
		<title>ѡ������</title>
		</head>
		<style>
			myfont{color: #FFFFFF; font-size: 20}
	    </style>
	    <link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
	<body>
		<center>
		<img src="../images/top.jpg"><br>
		<jsp:include page="../teacher/header.jsp"></jsp:include>
		<% 
		String cno=request.getParameter("cno");
		String tno=(String)session.getAttribute("user");
		ResultSet rs=connectDatabase.exeQuery("select cname from course where cno="+cno);
		String cname="";
		while(rs.next())
		{
			cname=rs.getString("cname");
		}
		%>.
		<table  border="0">
	    <tr>
	      <td height="40" colspan="4" align="center" bgcolor="#0000FF">
	      	<myfont><%=cname%>&nbsp;�ο������ѯ���</myfont>
	      </td>
	    </tr>
	    <tr>
		     <td height="40" width="100"  align="center" bgcolor="#0000FF"><myfont>ѧ��</myfont></td>
		     <td width="100" align="center" bgcolor="#0000FF"><myfont>����</myfont></td>
		     <td width="300" align="center" bgcolor="#0000FF"><myfont>�༶</myfont></td>
		     <td width="100" align="center" bgcolor="#0000FF"><myfont>�ɼ�</myfont></td>
	
	    </tr>
	    <%
	    rs=connectDatabase.exeQuery
		("select sc.sno,sname,class,grade from sc,student "+
		 "where student.sno=sc.sno and cno="+cno+" and tno="+tno);
	    while(rs.next())
	    {
	 	%>
	    <tr>
		     <td height="40"  align="center" bgcolor="#D9FFFF"><%=rs.getString("sc.sno") %></td>
		     <td align="center" bgcolor="#D9FFFF"><%=rs.getString("sname")%></td>
		     <td align="center" bgcolor="#D9FFFF"><%=rs.getString("class") %></td>
		     <td align="center" bgcolor="#D9FFFF"><%=rs.getString("grade") %></td>
	
	    </tr>  
		<%
		}
		rs.close();
		%>
		</table>
	</body>
</html>

