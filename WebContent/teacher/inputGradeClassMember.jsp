<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
<%
request.setCharacterEncoding("gb2312");
String cno=request.getParameter("cno");
String className=request.getParameter("class");
className=new String(className.getBytes( "ISO8859-1"), "GB2312"); 
ResultSet rs=connectDatabase.exeQuery("select sno,sname from student where class='"+className+"'");
%>
<html>
	<head>
		<title><%=className %>-录入成绩</title>
		<link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
		<link rel="stylesheet" rev="stylesheet" href="../css/myfont.css" type="text/css">
	</head>
	<body>
		 <center>
 		 <img src="../images/top.jpg"><br>
 		 <jsp:include page="../teacher/header.jsp"></jsp:include>
 		 <form action="inputGradeClassMemberHandle.jsp?class=<%=className %>" method="post">
 		 <table border="0">
		    <tr>
		      <td height="40" colspan="3" align="center" bgcolor="#0000FF">
		      	<myfont><%=className %>-录入成绩</myfont>
		      	<button type="button"  onClick="window.location.href='inputGradeClass.jsp?cno=<%=cno%>'">返回</button>
		      </td>
		    </tr>
		    <tr>
			     <td height="40" width="250"  align="center" bgcolor="#0000FF"><myfont>学号</myfont></td>
			     <td width="250" align="center" bgcolor="#0000FF"><myfont>姓名</myfont></td>
			     <td width="250" align="center" bgcolor="#0000FF"><myfont>成绩</myfont></td>	
		    </tr>
		    <%
		    while(rs.next())
		    {
		 	%>
		    <tr>
			     <td height="40" align="center" bgcolor="#D9FFFF"><%=rs.getString("sno") %></td>
			     <td align="center" bgcolor="#D9FFFF"><%=rs.getString("sname")%></td>
			     <td align="center" bgcolor="#D9FFFF">
			     	 选择成绩
					 <select name="<%=rs.getString("sno")%>">
				         <option value="-1" selected></option>
				         <%         
				         for(int i=100;i>=0;i--)
				        	 {
			                 %><option value="<%=i %>" ><%=i %></option><%
				        	 }
				         %>
			         </select>
				 </td>
		    </tr>  
				<%
				}
				rs.close();
				%>
			<tr>
			     <td colspan="3" height="40" align="center" bgcolor="#D9FFFF">
			     	<input type="submit"/>
			     	<input type="reset"/>
			     </td>
		    </tr>  
		 </table>
		  <input type="hidden" name="cno"  value="<%=cno%>"/>
		  
		 </form>
	</body>
</html>