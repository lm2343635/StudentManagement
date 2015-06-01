<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
<%
String tno=(String)session.getAttribute("user");
request.setCharacterEncoding("gb2312");
String sno="";
String sname="";
String cname="";
if(request.getParameter("sno")!=null)
	sno=request.getParameter("sno");
//out.print(sno);
if(request.getParameter("sname")!=null)
	sname=request.getParameter("sname");
if(request.getParameter("cname")!=null)
	cname=request.getParameter("cname");
String select="select sc.sno,sc.cno,sname,cname from sc,student,course where sc.sno=student.sno and sc.cno=course.cno and tno="+tno;
if(!sno.equals("")||!cname.equals("")||!sname.equals(""))//按学号搜索有问题
	select+=" and";
if(!sno.equals(""))
	select+=" sc.sno="+sno+" and";
if(!cname.equals(""))
	select+=" cname like '%"+cname+"%' and";
if(!sname.equals(""))
	select+=" sname like '%"+sname+"%' and";
select=select.substring(0, select.length()-4);
if(sno.equals("")&&cname.equals("")&&sname.equals(""))
	select="select sc.sno,sc.cno,sname,cname from sc,student,course where sc.sno=student.sno and sc.cno=course.cno and tno="+tno;
//out.print(select);
%>
<html>
	<head>
		<title>按学生录入成绩</title>
		<link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
		<link rel="stylesheet" rev="stylesheet" href="../css/myfont.css" type="text/css">
		<link rel="stylesheet" rev="stylesheet" href="../css/hover.css" type="text/css">
	</head>
	<body>
		 <center>
 		 <img src="../images/top.jpg"><br>
 		 <jsp:include page="../teacher/header.jsp"/>
 		 <table  border="0"  style="border-spacing:0">
		   <tr>
			  <td width="375" height="40" align="center" bgcolor="#0000FF" class="block">
			  	 <a href="inputGrade.jsp"><myfont>按班级录入</myfont></a>     
			  </td>
			  <td width="1" height="40" align="center" bgcolor="#FFFFFF" class="block"></td>
			  <td width="375" align="center" bgcolor="#009933" class="block">
			 	 <a href="inputGradeStudent.jsp"><myfont>按学生录入</myfont></a>     
			  </td>
		   </tr>   	
		   <tr>
		  	 <td colspan="3" width="800" height="8" align="center"  bgcolor="#009933"></td>
	   	   </tr>	
		</table>
		<form action="inputGradeStudent.jsp" method="post" style="margin: 0;padding: 0;">
		<table width="810"  border="0" >
			  <tr>
		     		 <td height="40" align="center" bgcolor="#0000FF"><myfont>搜索课程</myfont></td>
			  </tr> 
			  <tr>
				     <td height="40" align="center" bgcolor="#D9FFFF">
						按学号搜索<input type="text" name="sno"/>		
						按姓名搜索<input type="text" name="sname"/>		
						按课程搜索<input type="text" name="cname"/>		
						<input type="submit" value="" style="width:25px; height:25px; background-image:url('../images/search.jpg');">
				     </td>
			  </tr>
		</table>
		</form>
		<form action="inputGradeStudentHandle.jsp" method="post">
		<table  border="0">
	       <tr>
		     <td height="40" width="198"  align="center" bgcolor="#0000FF"><myfont>学号</myfont></td>
		     <td width="198" align="center" bgcolor="#0000FF"><myfont>姓名</myfont></td>
		     <td width="198" align="center" bgcolor="#0000FF"><myfont>课程</myfont></td>    
		     <td width="198" align="center" bgcolor="#0000FF"><myfont>成绩</myfont></td>
	       </tr>
	       <%
		   ResultSet rs=connectDatabase.exeQuery(select);
	       String sno_cno="";
	       while(rs.next())
	       {
	    	   sno_cno+=rs.getString("sc.sno")+"-"+rs.getString("sc.cno")+",";
	    	%>
	       <tr>
		     <td height="40"  align="center" bgcolor="#D9FFFF"><%=rs.getString("sc.sno") %></td>
		     <td align="center" bgcolor="#D9FFFF"><%=rs.getString("sname") %></td>
		     <td align="center" bgcolor="#D9FFFF"><%=rs.getString("cname") %></td>
		     <td align="center" bgcolor="#D9FFFF">  
		     		选择成绩
					 <select name="<%=rs.getString("sc.sno")+rs.getString("sc.cno")%>">
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
			sno_cno=sno_cno.substring(0, sno_cno.length()-1);
			%>
			<tr>
			     <td colspan="4" height="40" align="center" bgcolor="#D9FFFF">
			     	<input type="submit"/>
			     	<input type="reset"/>
			     </td>
		    </tr>
		</table>
		<input type="hidden" name="sno_cno"  value="<%=sno_cno%>"/>
		</form>
		
	</body>
</html>