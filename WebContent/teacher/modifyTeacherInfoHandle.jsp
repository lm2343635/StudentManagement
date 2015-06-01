<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
 <%
request.setCharacterEncoding("gb2312");
String user=(String)session.getAttribute("user");
String tname=request.getParameter("tname");
String tage=request.getParameter("tage");
String tsex=request.getParameter("tsex");
if(tsex!=null)
{
	if(tsex.equals("male")) tsex="男";
	else tsex="女";
}

//取得生日
String birthdayYear=request.getParameter("birthdayYear");
String birthdayMonth=request.getParameter("birthdayMonth");
String birthdayDay=request.getParameter("birthdayDay");
if(Integer.parseInt(birthdayMonth)<10)
	birthdayMonth="0"+birthdayMonth;
if(Integer.parseInt(birthdayDay)<10)
	birthdayDay="0"+birthdayDay;
String birthday=birthdayYear+"-"+birthdayMonth+"-"+birthdayDay;

//取得入校日期
String admissionTimeYear=request.getParameter("admissionTimeYear");
String admissionTimeMonth=request.getParameter("admissionTimeMonth");
String admissionTimeDay=request.getParameter("admissionTimeDay");
if(Integer.parseInt(admissionTimeMonth)<10)
	admissionTimeMonth="0"+admissionTimeMonth;
if(Integer.parseInt(admissionTimeDay)<10)
	admissionTimeDay="0"+admissionTimeDay;
String admissionTime=admissionTimeYear+"-"+admissionTimeMonth+"-"+admissionTimeDay;

String ethnic=request.getParameter("ethnic");
String edubg=request.getParameter("edubg");
String political=request.getParameter("political");
String telphone=request.getParameter("telphone");
String email=request.getParameter("email");
String college=request.getParameter("college");
String IDcard=request.getParameter("IDcard");
String homeAddress=request.getParameter("homeAddress");
String photo=request.getParameter("photo");
//开始动态生成更新语句
String update="update teacher set ";
if(!tname.equals(""))
	update+="tname="+"'"+tname+"',";
if(!tage.equals("null"))
	update+="tage="+"'"+tage+"',";
if(tsex!=null)
	update+="tsex="+"'"+tsex+"',";
if(!birthday.equals("-1-0-1-0-1"))
	update+="birthday="+"'"+birthday+"',";
if(!admissionTime.equals("-1-0-1-0-1"))
	update+="admissionTime="+"'"+admissionTime+"',";
if(!ethnic.equals("null"))
	update+="ethnic="+"'"+ethnic+"',";
if(!edubg.equals("null"))
	update+="edubg="+"'"+edubg+"',";
if(!political.equals("null"))
	update+="political="+"'"+political+"',";
if(!college.equals(""))
	update+="college="+"'"+college+"',";
if(!IDcard.equals(""))
	update+="IDcard="+"'"+IDcard+"',";
if(!telphone.equals(""))
	update+="telphone="+"'"+telphone+"',";
if(!email.equals(""))
	update+="email="+"'"+email+"',";
if(!homeAddress.equals(""))
	update+="homeAddress="+"'"+homeAddress+"',";
if(photo!=null)
	update+="photo="+"'photo/"+photo+"',";
update=update.substring(0,update.length()-1);	
update+=" where tno='"+user+"'";
connectDatabase.exeUpdate(update);
response.sendRedirect("maintainTeacherInfo.jsp");
//out.print(update+"<br>");//显示update语句
%>