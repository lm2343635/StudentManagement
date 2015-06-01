<%@page import="java.nio.charset.CharsetEncoder"%>
<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
<html>
		<head>
		<link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css"/>
		<%
		request.setCharacterEncoding("gb2312");
		String nid=request.getParameter("nid");
		ResultSet rs=connectDatabase.exeQuery("select * from news where nid="+nid);
		while(rs.next())
		{
			%>
		<title><%= rs.getString("nname") %></title>
		</head>
		<body>
		    <center>
		    <img src="../images/top.jpg" >
			<jsp:include page="../public/headerUserType.jsp"/>
		     <table id="__01" width="1000" height="572" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td colspan="4">
							<img src="../images/newsContentbg_01.gif" width="1000" height="62" alt="">
						</td>
					</tr>
					<tr>
						<td>
							<img src="../images/newsContentbg_02.gif" width="86" height="43" alt=""></td>
						<td backgroud="../images/newsContentbg_03.gif" width="866" height="43">
								<font size="5"><%= rs.getString("nname")%></font>
								&nbsp;&nbsp;&nbsp;&nbsp;
								作者：<%= rs.getString("author")%>
								&nbsp;&nbsp;&nbsp;&nbsp;
								日期：<%= rs.getString("ndate")%>
								&nbsp;&nbsp;&nbsp;&nbsp;	
	
						</td>
						<td colspan="2">
							<img src="../images/newsContentbg_04.gif" width="48" height="43" alt="">
						</td>
					</tr>
					<tr>
						<td colspan="4">
							<img src="../images/newsContentbg_05.gif" width="1000" height="30" alt="">
						</td>
					</tr>
					<tr>
						<td background="../images/newsContentbg_06.gif" width="86" height="413"></td>
						<td width="890" height="413" colspan="2" valign="top" backgroud="images/newsContentbg_07.gif">
								<p id="content">&nbsp;&nbsp;&nbsp;&nbsp;<%= rs.getString("content") %></p>
						</td >
						<td background="../images/newsContentbg_08.gif" width="24" height="413">
						</td>
					</tr>
					<tr>
						<td colspan="4">
							<img src="../images/newsContentbg_09.gif" width="1000" height="23" alt="">
						</td>
					</tr>
					<tr>
						<td>
							<img src="../images/&#x5206;&#x9694;&#x7b26;.gif" width="86" height="1" alt=""></td>
						<td>
							<img src="../images/&#x5206;&#x9694;&#x7b26;.gif" width="866" height="1" alt=""></td>
						<td>
							<img src="../images/&#x5206;&#x9694;&#x7b26;.gif" width="24" height="1" alt=""></td>
						<td>
							<img src="../images/&#x5206;&#x9694;&#x7b26;.gif" width="24" height="1" alt=""></td>
					</tr>
			</table>
			<%
			}
			rs.close();
			connectDatabase.close();
			%>
	</body>
</html>