<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.nefu.stumgr.util.*"%>
 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
<%
String sno=(String)session.getAttribute("user");
Semester s=new Semester();
int nowSemester=s.getSemester(sno);
String semester="";
if(request.getParameter("semester")!=null)
	semester=request.getParameter("semester");
else
	semester=String.valueOf(nowSemester);
String dno="";
ResultSet rs=connectDatabase.exeQuery("select dno from department where dname in (select department from student where sno="+sno+")");
while(rs.next())
	dno=rs.getString("dno");
rs=connectDatabase.exeQuery("select cname,property,tname,ccredit from teach,course,teacher "+
		"where dno="+dno+" and semester="+semester+" and (property='רҵ��' or property='רҵ������' or property='����������') "+
		"and teach.cno=course.cno and teach.tno=teacher.tno");
%>

<table border="0">
   <tr>
	     <td height="40" colspan="4" align="center" bgcolor="#0000FF">
	     	<myfont>��<%=semester %>ѧ�ڱ��޿�</myfont>
	     </td>
  </tr> 
  <tr>
	     <td width="300" height="40"  align="center" bgcolor="#D9FFFF">�γ���</td>
	     <td width="250" height="40"  align="center" bgcolor="#D9FFFF">�γ�����</td>
	     <td width="100" height="40" align="center" bgcolor="#D9FFFF">ѧ��</td>
	     <td width="150" height="40" align="center" bgcolor="#D9FFFF">�ڿν�ʦ</td>
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
  </tr> 
  <%
  }
  %>
</table>
