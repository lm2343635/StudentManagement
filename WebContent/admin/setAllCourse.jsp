<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
<%
request.setCharacterEncoding("gb2312");
String cno="";
String cname="";
String ccredit="";
if(request.getParameter("cno")!=null)
	cno=request.getParameter("cno");
if(request.getParameter("cname")!=null)
	cname=request.getParameter("cname");
if(request.getParameter("ccredit")!=null)
	ccredit=request.getParameter("ccredit");
String select="select * from course";
if(!cno.equals("")||!cname.equals("")||!ccredit.equals(""))
	select+=" where";
if(!cno.equals(""))
	select+=" cno="+cno+" and";
if(!cname.equals(""))
	select+=" cname like '%"+cname+"%' and";
if(!ccredit.equals(""))
	select+=" ccredit="+ccredit+" and";
if(!cno.equals("")||!cname.equals("")||!ccredit.equals(""))
	select=select.substring(0, select.length()-4);
%>
<html>
	<head>
		<title>�������пγ�</title>
		<link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
		<link rel="stylesheet" rev="stylesheet" href="../css/myfont.css" type="text/css">
	</head>
	<body>
		<center>
		<img src="../images/top.jpg"><br>
		<jsp:include page="header.jsp"></jsp:include>
		<form action="setAllCourse.jsp" method="post" style="margin: 0;padding: 0;">
		<table width="908" border="0" >
			  <tr>
		     		 <td height="40" align="center" bgcolor="#0000FF"><myfont>�����γ�</myfont></td>
			  </tr> 
			  <tr>
				     <td height="40" align="center" bgcolor="#D9FFFF">
						���γ̺�����<input type="text" name="cno"/>		
						���γ�������<input type="text" name="cname"/>		
						��ѧ������<input type="text" name="ccredit"/>		
						<input type="submit" value="" style="width:25px; height:25px; background-image:url('../images/search.jpg');">
				     </td>
			  </tr>
		</table>
		</form>
		<form action="addCourse.jsp" method="post" >
		<table  border="0">
			   <tr>
		     		 <td height="40" colspan="4" align="center" bgcolor="#0000FF"><myfont>�����γ�</myfont></td>
			   </tr> 
			   <tr>
				     <td height="40" align="center" bgcolor="#D9FFFF">
				     	�γ̺�<input type="text" name="cno"/>		
				     </td>
				     <td height="40" align="center" bgcolor="#D9FFFF">
				     	�γ���<input type="text" name="cname" />
				     </td>
				     <td height="40" align="center" bgcolor="#D9FFFF">
				     	ѧ��<input type="text" name="ccredit" "/>
				     </td>
				     <td height="40" align="center" bgcolor="#D9FFFF">
				        <input type="submit" value="����"/>
			  			<input type="reset" value="����"/>		     
				     </td>
			   </tr>
			   <tr>
				     <td height="40" colspan="4" align="center" bgcolor="#0000FF">
				     	<myfont>���пγ�</myfont>
				     </td>
			  </tr> 
			  <tr>
				     <td width="100" height="40" align="center" bgcolor="#D9FFFF">�γ̺�</td>
				     <td width="400" align="center" bgcolor="#D9FFFF">�γ���������鿴�ڿν�ʦ��</td>
				     <td width="100" align="center" bgcolor="#D9FFFF">ѧ��</td>
				     <td width="100" align="center" bgcolor="#D9FFFF">ѡ��</td>
			  </tr>
				<%
				ResultSet rs=connectDatabase.exeQuery(select);	
				while(rs.next())
				{%>
			   <tr>
					<td height="40" align="center" bgcolor="#D9FFFF"><%=rs.getString("cno") %></td>
					<td align="center" bgcolor="#D9FFFF">
						<a href="classTeacher.jsp?cno=<%=rs.getString("cno")%>"><%=rs.getString("cname") %></a>	
					</td>
					<td align="center" bgcolor="#D9FFFF"><%=rs.getString("ccredit") %></td>
					<td width="100" align="center" bgcolor="#D9FFFF">
				     	<a href="deleteCourse.jsp?cno=<%=rs.getString("cno")%>">ɾ��</a>		
				    </td>
			   </tr>
				<%
				}
				%>
		</table>
		</form>
	</body>
</html>