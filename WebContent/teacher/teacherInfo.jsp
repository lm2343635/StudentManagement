<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
<%
String myNo=(String)session.getAttribute("user");
request.setCharacterEncoding("gb2312");
String tno="";
String tname="";
String tsex="";
if(request.getParameter("tno")!=null)
	tno=request.getParameter("tno");
//out.print(tno+"<br/>");
if(request.getParameter("tname")!=null)
	tname=request.getParameter("tname");
//out.print(tname+"<br/>");
if(request.getParameter("tsex")!=null)
	tsex=request.getParameter("tsex");
if(tsex.equals("null"))
	tsex="";
//out.print(tsex+"<br/>");
String select="select tno,tname,tsex,tage,edubg from teacher "+
					 "where college=(select college from teacher where tno="+myNo+")";
if(!tno.equals("")||!tname.equals("")||!tsex.equals(""))//搜索有问题
	select+=" and";
if(!tno.equals(""))
	select+=" tno like '%"+tno+"%' and";
if(!tname.equals(""))
	select+=" tname like '%"+tname+"%' and";
if(!tsex.equals(""))
	select+=" tsex like '%"+tsex+"%' and";
select=select.substring(0, select.length()-4);

if(tno.equals("")&&tname.equals("")&&tsex.equals(""))
	select="select tno,tname,tsex,tage,edubg from teacher "+
			 "where college=(select college from teacher where tno="+myNo+")";
//out.print(select);
%>
<html>
	<head>
		<title>本学院教师信息</title>
		<link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
		<link rel="stylesheet" rev="stylesheet" href="../css/myfont.css" type="text/css">
		<link rel="stylesheet" rev="stylesheet" href="../css/hover.css" type="text/css">
	</head>
	<body>
		 <center>
 		 <img src="../images/top.jpg"><br>
 		 <jsp:include page="../teacher/header.jsp"/>		
		<form action="teacherInfo.jsp" method="post" style="margin: 0;padding: 0;">
		<table width="805"  border="0" >
			  <tr>
		     		 <td height="40" align="center" bgcolor="#0000FF"><myfont>搜索本学院教师</myfont></td>
			  </tr> 
			  <tr>
				     <td height="40" align="center" bgcolor="#D9FFFF">
						按编号搜索<input type="text" name="tno"/>		
						按姓名搜索<input type="text" name="tname"/>		
						按性别搜索
						<select name="tsex">
				        	<option value="null" selected></option>
				        	<option value="男" >男</option>
				        	<option value="女" >女</option>
				        </select>
						<input type="submit" value="" style="width:25px; height:25px; background-image:url('../images/search.jpg');">
				     </td>
			  </tr>
		</table>
		</form>
		<table  border="0">
	       <tr>
		     <td height="40" width="156"  align="center" bgcolor="#0000FF"><myfont>编号</myfont></td>
		     <td width="156" align="center" bgcolor="#0000FF"><myfont>姓名</myfont></td>
		     <td width="156" align="center" bgcolor="#0000FF"><myfont>性别</myfont></td>    
		     <td width="156" align="center" bgcolor="#0000FF"><myfont>年龄</myfont></td>
		     <td width="156" align="center" bgcolor="#0000FF"><myfont>学历</myfont></td>
	       </tr>
	       <%
		   ResultSet rs=connectDatabase.exeQuery(select);
	       while(rs.next())
	       {
	    	%>
	       <tr>
		     <td height="40"  align="center" bgcolor="#D9FFFF"><%=rs.getString("tno") %></td>
		     <td align="center" bgcolor="#D9FFFF">
		     	<a href="teacherInfoPersonal.jsp?tno=<%=rs.getString("tno") %>"><%=rs.getString("tname") %></a>		     
		     </td>
		     <td align="center" bgcolor="#D9FFFF"><%=rs.getString("tsex") %></td>
		     <td align="center" bgcolor="#D9FFFF"><%=rs.getString("tage") %></td>
		     <td align="center" bgcolor="#D9FFFF"><%=rs.getString("edubg") %></td>
	       </tr>  
			<%
			}
			rs.close();
			%>
		</table>		
	</body>
</html>