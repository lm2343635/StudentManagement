<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%
String userType=(String)session.getAttribute("userType");
if(userType.equals("student"))
{
	%>
	<jsp:include page="../student/header.jsp"/>
	<% 
}
else if(userType.equals("teacher"))
{
	%>
	<jsp:include page="../teacher/header.jsp"/>
	<% 
}
else if(userType.equals("admin"))
{
	%>
	<jsp:include page="../admin/header.jsp"/>
	<% 
}
%>