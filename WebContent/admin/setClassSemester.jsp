<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.nefu.stumgr.util.*"%>
 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
 <%
String semester=request.getParameter("semester");
String dno=request.getParameter("dno");
String cono=request.getParameter("cono");
ResultSet rs=connectDatabase.exeQuery("select dname from department where dno="+dno);	
String dname="";
while(rs.next())
	dname= rs.getString("dname");
rs=connectDatabase.exeQuery
("select course.cno,cname,property,ccredit,tname,examTime from course,teacher,teach "+
		"where teach.cno=course.cno and teach.tno=teacher.tno and "+    
		"course.cno in (select cno from teach where dno="+dno+" and semester="+semester+")");
// ("select * from course where cno in"+
//  "(select cno from teachplan where dno="+dno+" and semester="+semester+")");
%>
<html>
	<head>
		<title><%=dname %>第<%=semester %>学期课程设置</title>
		<link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
		<link rel="stylesheet" rev="stylesheet" href="../css/myfont.css" type="text/css">
	</head>
	<body>
		<center>
		<img src="../images/top.jpg"><br>
		<jsp:include page="header.jsp"></jsp:include>
		<form action="addClass.jsp" method="post" >
		<table  border="0">
			   <tr>
				     <td height="40" colspan="7" align="center" bgcolor="#0000FF">
				     	<myfont><%=dname %>第<%=semester %>学期课程设置</myfont>
				     	<button type="button"  onClick="window.location.href='setClassDe.jsp?cono=<%=cono%>&dno=<%=dno%>'">返回</button>
				     </td>
			  </tr> 
			  <tr>
				     <td width="100" height="40" align="center" bgcolor="#D9FFFF">课程号</td>
				     <td width="200" align="center" bgcolor="#D9FFFF">课程名</td>
				     <td width="100" align="center" bgcolor="#D9FFFF">课程性质</td>
				     <td width="100" align="center" bgcolor="#D9FFFF">学分</td>
				     <td width="100" align="center" bgcolor="#D9FFFF">授课教师</td>
				     <td width="100" align="center" bgcolor="#D9FFFF">考试时间</td>
				     <td width="100" align="center" bgcolor="#D9FFFF">选择</td>
			  </tr>
				<%
				while(rs.next())
				{%>
			   <tr>
					<td height="40" align="center" bgcolor="#D9FFFF"><%=rs.getString("cno") %></td>
					<td align="center" bgcolor="#D9FFFF"><%=rs.getString("cname") %></td>
					<td align="center" bgcolor="#D9FFFF"><%=rs.getString("property") %></td>
					<td align="center" bgcolor="#D9FFFF"><%=rs.getString("ccredit") %></td>
					<td align="center" bgcolor="#D9FFFF"><%=rs.getString("tname") %></td>
					<td align="center" bgcolor="#D9FFFF">
					<%
				     if(rs.getString("examTime")==null)
				    	 out.print("未预定考试时间");
				     else
				    	 out.print(rs.getString("examTime"));		 
				     %>
					</td>
					<td align="center" bgcolor="#D9FFFF">
				     	<a href="deleteClass.jsp?dno=<%=dno %>&cno=<%=rs.getString("cno")%>&semester=<%=semester%>&cono=<%=cono%>">删除</a>		
				    </td>
			   </tr>
				<%
				}
				%>
			   <tr>
		     		 <td height="40" colspan="7" align="center" bgcolor="#0000FF"><myfont>新增课程</myfont></td>
			   </tr> 
			   <tr>
				     <td height="40" colspan="7" align="center" bgcolor="#D9FFFF">
				     	课程号<input type="text" name="cno"/>	
				     	教师编号<input type="text" name="tno"/>		
				     	<input type="hidden" name="dno" value="<%=dno%>"/>
				     	<input type="hidden" name="semester" value="<%=semester%>"/>
				     	课程性质
				     	<select name="property">
					         <option value="null" selected></option>
					         <option value="公共基础课" >公共基础课</option>
					         <option value="公共选修课" >公共选修课</option>
					         <option value="专业课" >专业课</option>
					         <option value="专业基础课" >专业基础课</option>
					         <option value="专业选修课" >专业选修课</option>
					         <option value="课程设计" >课程设计</option>
					         <option value="专业选修课" >实践教学</option>
				        </select>
				        <input type="submit" value="新增"/>
			  			<input type="reset" value="重置"/>		
				     </td>
			   </tr>
		</table>
		</form>
		<form action="addObligatory.jsp?dno=<%=dno %>&semester=<%=semester%>&cono=<%=cono%>"  method="post" >
		<table border="0" width="830" style="margin: 0; padding: 0;">
			  <tr>
		     		 <td height="40" colspan="6" align="center" bgcolor="#0000FF"><myfont>添加必修课</myfont></td>
			  </tr>
			  <tr>
					 <td height="40" colspan="6" align="center" bgcolor="#D9FFFF">
					 向
				     <select name="grade">
				     <option value="0" selected></option>
				     <%
				     Grades g=new Grades();
				     int grades[]=g.getGrades();
				     for(int i=0;i<grades.length;i++)
				     {
				     %>
				     <option value="<%=grades[i] %>" ><%=grades[i] %>级</option>
				     <%
				     }
				     %>
				     </select>
					 级<%=dname %>专业所有学生添加必修课
					  <input type="submit" value="确认添加"/>
					 </td>
			  </tr>
		</table>
		</form>
	</body>
</html>