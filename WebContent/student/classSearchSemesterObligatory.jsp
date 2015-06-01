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
		"where dno="+dno+" and semester="+semester+" and (property='专业课' or property='专业基础课' or property='公共基础课') "+
		"and teach.cno=course.cno and teach.tno=teacher.tno");
%>

<table border="0">
   <tr>
	     <td height="40" colspan="4" align="center" bgcolor="#0000FF">
	     	<myfont>第<%=semester %>学期必修课</myfont>
	     </td>
  </tr> 
  <tr>
	     <td width="300" height="40"  align="center" bgcolor="#D9FFFF">课程名</td>
	     <td width="250" height="40"  align="center" bgcolor="#D9FFFF">课程性质</td>
	     <td width="100" height="40" align="center" bgcolor="#D9FFFF">学分</td>
	     <td width="150" height="40" align="center" bgcolor="#D9FFFF">授课教师</td>
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
