<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
 
<html>
	<head>
		<title>�ο����</title>
		<link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
		<link rel="stylesheet" rev="stylesheet" href="../css/myfont.css" type="text/css">
	</head>
	<body>
		 <center>
 		 <img src="../images/top.jpg"><br>
 		 <jsp:include page="../teacher/header.jsp"/>
<% 
String tno=(String)session.getAttribute("user");
ResultSet rs=connectDatabase.exeQuery
    ("select sc.cno,ccredit,cname,count(sno),avg(grade) from sc,course "+
    		"where sc.cno=course.cno and tno="+tno+" group by sc.cno");
%>
 	<table  border="0">
       <tr>
         <td height="40" colspan="5" align="center" bgcolor="#0000FF"><myfont>�ο������ѯ���</myfont></td>
       </tr>
       <tr>
	     <td height="40" width="100"  align="center" bgcolor="#0000FF"><myfont>�γ̺�</myfont></td>
	     <td width="350" align="center" bgcolor="#0000FF"><myfont>�γ���</myfont></td>
	     <td width="100" align="center" bgcolor="#0000FF"><myfont>ѧ��</myfont></td>
	     <td width="100" align="center" bgcolor="#0000FF"><myfont>ƽ���ɼ�</myfont></td>
	     <td width="100" align="center" bgcolor="#0000FF"><myfont>ѡ������</myfont></td>
       </tr>
       <%
       while(rs.next())
       {
    	%>
       <tr>
	     <td height="40"  align="center" bgcolor="#D9FFFF"><%=rs.getString("sc.cno") %></td>
	     <td align="center" bgcolor="#D9FFFF">
	     	<a href="selectList.jsp?cno=<%=rs.getString("sc.cno")%>"><%=rs.getString("cname")%></a>
	     </td>
	     <td align="center" bgcolor="#D9FFFF"><%=rs.getString("ccredit") %></td>
	     <td align="center" bgcolor="#D9FFFF">
		     <%
		     if(rs.getString("avg(grade)")==null)
		    	 out.print("���޳ɼ�");
		     else
		    	 out.print(rs.getString("avg(grade)"));
		     %>
	     </td>
	     <td align="center" bgcolor="#D9FFFF"><%=rs.getString("count(sno)") %></td>
       </tr>  
		<%
		}
		rs.close();
		%>
	</table>
	</body>
</html>