<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
<% 
String tno=(String)session.getAttribute("user");
ResultSet rs=connectDatabase.exeQuery
    ("select teach.cno,cname,examTime from teach,course where teach.cno=course.cno and tno="+tno);
%>
<html>
	<head>
		<title>����ʱ��Ԥ��</title>
		<link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
		<link rel="stylesheet" rev="stylesheet" href="../css/myfont.css" type="text/css">
	</head>
	<body>
		<center>
 		<img src="../images/top.jpg"><br>
 		<jsp:include page="../teacher/header.jsp"/>
 		<form action="scheduleExaminationHandle.jsp" method="post">
	 	<table  border="0">
	       <tr>
	         <td height="40" colspan="5" align="center" bgcolor="#0000FF"><myfont>����ʱ��Ԥ��</myfont></td>
	       </tr>
	       <tr>
		     <td height="40" width="100"  align="center" bgcolor="#0000FF"><myfont>�γ̺�</myfont></td>
		     <td width="200" align="center" bgcolor="#0000FF"><myfont>�γ���</myfont></td>
		     <td width="200" align="center" bgcolor="#0000FF"><myfont>Ԥ��ʱ��</myfont></td>
		     <td width="300" align="center" bgcolor="#0000FF"><myfont>��ʼԤ��</myfont></td>
	       </tr>
	       <%
		 	while(rs.next())
		 	{
		 	%>
	       <tr>
		     <td height="40"  align="center" bgcolor="#D9FFFF"><%=rs.getString("teach.cno") %></td>
		     <td align="center" bgcolor="#D9FFFF"><%=rs.getString("cname")%></td>
		     <td align="center" bgcolor="#D9FFFF">
		     <%
		     if(rs.getString("examTime")==null)
		    	 out.print("��δԤ������ʱ��");
		     else
		    	 out.print(rs.getString("examTime"));		 
		     %>
		     </td>
		     <td align="center" bgcolor="#D9FFFF">
		         <select name="examTimeMonth<%=rs.getString("teach.cno")%>">
		         <option value="-1" selected></option>
		         <%
		         for(int i=1;i<=12;i++)
		        	 {
	                 %><option value="<%=i %>" ><%=i %></option><%
		        	 }
		         %>
		         </select>��
		         <select name="examTimeDay<%=rs.getString("teach.cno")%>">
		         <option value="-1" selected></option>
		         <%
		         for(int i=1 ;i<=31;i++)
		        	 {
		        	 %><option value="<%=i %>" ><%=i %></option><%
		        	 }
		         %>
		         </select>�� 
		         
	         </tr>  
	         <%
			}
			rs.close();
			connectDatabase.close();
			%>
		   <tr>
	         <td height="40" colspan="5" align="center" bgcolor="#D9FFFF">
		        <input type="submit"/>
				<input type="reset"/>
	         </td>
	       </tr>
		</table>
		</form>
	</body>
</html>
