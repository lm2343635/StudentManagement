<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<%
session.removeAttribute("user");
session.removeAttribute("password");
response.sendRedirect("../index.html");
%>