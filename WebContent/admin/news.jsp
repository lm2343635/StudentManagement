<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
<html>
	<head>
		<title>��������</title>
		<link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
		<link rel="stylesheet" rev="stylesheet" href="../css/myfont.css" type="text/css">
		<link rel="stylesheet" rev="stylesheet" href="../css/hover.css" type="text/css">
	</head>
	<body>
		<center>
		<img src="../images/top.jpg"><br>
		<jsp:include page="header.jsp"/>
		<form action="addNewsHandle.jsp">
		
		<table  border="0" style="border-spacing:0">
		   <tr>
			  <td width="272" height="40" align="center" bgcolor="#009933" class="block">
			  	 <a href="news.jsp"><myfont>��������</myfont></a>     
			  </td>
			  <td width="1" height="40" align="center" bgcolor="#FFFFFF" class="block"></td>
			  <td width="272" align="center" bgcolor="#0000FF" class="block">
			 	 <a href="addNews.jsp"><myfont>��������</myfont></a>     
			  </td>
			  <td width="1" height="40" align="center" bgcolor="#FFFFFF" class="block"></td>
			  <td width="272" align="center" bgcolor="#0000FF" class="block">
			 	 <a href="manageNewsImg.jsp"><myfont>�������ͼƬ</myfont></a>     
			  </td>
		    </tr>   		
		   	<tr>
			   <td colspan="5" width="800" height="8" align="center"  bgcolor="#009933"></td>
			</tr>
		</table>
		
		<table  border="0">
		   <tr>
			     <td width="100" height="40" align="center" bgcolor="#D9FFFF">���ű��</td>
			     <td width="400" height="40" align="center" bgcolor="#D9FFFF">���ű���</td>
			     <td width="100" height="40" align="center" bgcolor="#D9FFFF">��������</td>
			     <td width="100" height="40" align="center" bgcolor="#D9FFFF">����ʱ��</td>
			     <td width="100" align="center" bgcolor="#D9FFFF">ѡ��</td>
		   </tr>
		   	<%
			ResultSet rs=connectDatabase.exeQuery("select nid,nname,author,ndate from news order by ndate desc");	
			while(rs.next())
			{%>
				  <tr>
					     <td height="40" align="center" bgcolor="#D9FFFF"><%=rs.getString("nid") %></td>
					     <td  align="center" bgcolor="#D9FFFF">
					     	<a href="../public/news.jsp?nid=<%=rs.getString("nid")%>"><%=rs.getString("nname")%></a>
					     </td>
					     <td height="40" align="center" bgcolor="#D9FFFF"><%=rs.getString("author") %></td>
					     <td height="40" align="center" bgcolor="#D9FFFF"><%=rs.getString("ndate") %></td>
					     <td height="40" align="center" bgcolor="#D9FFFF">
					     	<a href="deleteNews.jsp?nid=<%=rs.getString("nid")%>">ɾ��</a>
					     </td>
				  </tr>
			<%		
			}
			%>
		</table>
		</form>
	</body>
</html>