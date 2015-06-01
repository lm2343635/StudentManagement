<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.nefu.stumgr.util.*"%>
 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
<%
String semester=request.getParameter("semester");
String sno=(String)session.getAttribute("user");
String dno="";
ResultSet rs=connectDatabase.exeQuery("select dno from department where dname in (select department from student where sno="+sno+")");
while(rs.next())
	dno=rs.getString("dno");
%>
<html>
	<head>
		<title>��<%=semester %>ѧ��-ѡ��</title>
		<link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
		<link rel="stylesheet" rev="stylesheet" href="../css/myfont.css" type="text/css">
	</head>
	<body>
	 	<center>
 		<img src="../images/top.jpg" ><br>
 		<jsp:include page="header.jsp"></jsp:include>
 		<%
 		//��ȡʱ��
 		Semester s=new Semester();
 		int nowSemester=s.getSemester(sno);
 		if(nowSemester!=Integer.parseInt(semester))
 		{
 			%>
 			<img src="../images/sorry.jpg" width="50" height="50">
 			�Բ������ڲ���ѡ��ʱ�䣡
 			<a href="selectClass.jsp">����</a>
 			<%
 		}
 		else
 		{
 		%>
		<table width="750"  border="0">
		   <tr>
			     <td height="40" colspan="5" align="center" bgcolor="#0000FF">
			     	<myfont><%=nowSemester %>��<%=semester %>ѧ��-ѡ��</myfont>
			     	<button type="button"  onClick="window.location.href='selectClass.jsp'">����</button>
			     </td>
		  </tr> 
		  <tr>
			     <td width="300" height="40"  align="center" bgcolor="#D9FFFF">�γ���</td>
			     <td width="250" height="40"  align="center" bgcolor="#D9FFFF">�γ�����</td>
			     <td width="100" height="40" align="center" bgcolor="#D9FFFF">ѧ��</td>
			     <td width="150" height="40" align="center" bgcolor="#D9FFFF">�ڿν�ʦ</td>
			     <td width="100" height="40" align="center" bgcolor="#D9FFFF">ѡ��</td>
		  </tr> 
		  <%
		  rs=connectDatabase.exeQuery("select teach.cno,teach.tno,cname,ccredit,tname,property from teach,course,teacher "+
					"where semester="+semester+" and dno="+dno+" and (property='רҵѡ�޿�' or property='����ѡ�޿�') "+
					"and teach.cno=course.cno and teacher.tno=teach.tno");
		  while(rs.next())
		  {
		  %>
		  <tr>
			     <td height="40"  align="center" bgcolor="#D9FFFF"><%=rs.getString("cname") %></td>
			     <td height="40"  align="center" bgcolor="#D9FFFF"><%=rs.getString("property") %></td>
			     <td height="40" align="center" bgcolor="#D9FFFF"><%=rs.getString("ccredit") %></td>
			     <td height="40" align="center" bgcolor="#D9FFFF"><%=rs.getString("tname") %></td>
			     <td height="40" align="center" bgcolor="#D9FFFF">
			     	<a href="selectClassHandle.jsp?cno=<%=rs.getString("teach.cno")%>&tno=<%=rs.getString("teach.tno")%>">ѡ��</a>
			     </td>
		  </tr> 
		  <%
		   }
		   //��ѡ�γ���ʾ
		   rs=connectDatabase.exeQuery("select teach.cno,teach.tno,cname,ccredit,property,tname from sc,teach,course,teacher "+
		 		"where sno="+sno+" and semester="+semester+" and sc.tno=teach.tno and sc.cno=teach.cno and sc.cno=course.cno and sc.tno=teacher.tno "
		 		+"and (property='רҵѡ�޿�' or property='����ѡ�޿�')");
	  	  %>
		   <tr>
			     <td height="40" colspan="5" align="center" bgcolor="#0000FF">
			     	<myfont><%=sno %>,��<%=semester %>ѧ����ѡ�γ�</myfont>
			     </td>
		  </tr> 
		  <tr>
			     <td width="300" height="40"  align="center" bgcolor="#D9FFFF">�γ���</td>
			     <td width="250" height="40"  align="center" bgcolor="#D9FFFF">�γ�����</td>
			     <td width="100" height="40" align="center" bgcolor="#D9FFFF">ѧ��</td>
			     <td width="150" height="40" align="center" bgcolor="#D9FFFF">�ڿν�ʦ</td>
			     <td width="100" height="40" align="center" bgcolor="#D9FFFF">��ѡ</td>
		  </tr> 
		  <%
		  while(rs.next())
		  {
		  %>
		  <tr>
			     <td height="40"  align="center" bgcolor="#D9FFFF"><%=rs.getString("cname") %></td>
			     <td height="40"  align="center" bgcolor="#D9FFFF"><%=rs.getString("property") %></td>
			     <td height="40" align="center" bgcolor="#D9FFFF"><%=rs.getString("ccredit") %></td>
			     <td height="40" align="center" bgcolor="#D9FFFF"><%=rs.getString("tname") %></td>
			     <td height="40" align="center" bgcolor="#D9FFFF">
			     	<a href="deleteSelectedClass.jsp?cno=<%=rs.getString("teach.cno")%>&tno=<%=rs.getString("teach.tno")%>">��ѡ</a>
			     </td>
		  </tr> 
		  <%
		  }
		  %>
		</table>
		  <%
		  }
		  %>
	</body>
</html>