<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>


 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
<%
request.setCharacterEncoding("GBK");
String user=(String)session.getAttribute("user");
String sname=request.getParameter("sname");
String sage=request.getParameter("sage");
String ssex=request.getParameter("ssex");
if(ssex!=null)
{
	if(ssex.equals("male")) ssex="男";
	else ssex="女";
}
out.print("pppppppppp"+ssex);

//取得生日
String birthdayYear=request.getParameter("birthdayYear");
String birthdayMonth=request.getParameter("birthdayMonth");
String birthdayDay=request.getParameter("birthdayDay");
if(birthdayMonth!=null&&Integer.parseInt(birthdayMonth)<10)
	birthdayMonth="0"+birthdayMonth;
if(birthdayDay!=null&&Integer.parseInt(birthdayDay)<10)
	birthdayDay="0"+birthdayDay;
String birthday=birthdayYear+"-"+birthdayMonth+"-"+birthdayDay;

//取得入学日期
String admissionTimeYear=request.getParameter("admissionTimeYear");
String admissionTimeMonth=request.getParameter("admissionTimeMonth");
String admissionTimeDay=request.getParameter("admissionTimeDay");
if(admissionTimeMonth!=null&&Integer.parseInt(admissionTimeMonth)<10)
	admissionTimeMonth="0"+admissionTimeMonth;
if(admissionTimeDay!=null&&Integer.parseInt(admissionTimeDay)<10)
	admissionTimeDay="0"+admissionTimeDay;
String admissionTime=admissionTimeYear+"-"+admissionTimeMonth+"-"+admissionTimeDay;

String ethnic=request.getParameter("ethnic");
String edubg=request.getParameter("edubg");
String political=request.getParameter("political");
String direction=request.getParameter("direction");
String college=request.getParameter("college");
ResultSet rs=connectDatabase.exeQuery("select coname from college where cono="+college);
while(rs.next())
	college=rs.getString("coname");
String department=request.getParameter("department");
String Class=request.getParameter("class");
String IDcard=request.getParameter("IDcard");
String telphone=request.getParameter("telphone");
String email=request.getParameter("email");
String hometown=request.getParameter("hometown");
String homeAddress=request.getParameter("homeAddress");
String photo=request.getParameter("photo");
//开始动态生成更新语句
String update="update student set ";
if(!sname.equals(""))
    update+="sname="+"'"+sname+"',";
if(!sage.equals("null"))
	update+="sage="+"'"+sage+"',";
if(ssex!=null)
	update+="ssex="+"'"+ssex+"',";
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
if(!direction.equals(""))
	update+="direction="+"'"+direction+"',";
if(!college.equals(""))
	update+="college="+"'"+college+"',";
if(!department.equals(""))
	update+="department="+"'"+department+"',";
if(!Class.equals(""))
	update+="Class="+"'"+Class+"',";
if(!IDcard.equals(""))
	update+="IDcard="+"'"+IDcard+"',";
if(!telphone.equals(""))
	update+="telphone="+"'"+telphone+"',";
if(!email.equals(""))
	update+="email="+"'"+email+"',";
if(!hometown.equals(""))
	update+="hometown="+"'"+hometown+"',";
if(!homeAddress.equals(""))
	update+="homeAddress="+"'"+homeAddress+"',";
if(photo!=null)
	update+="photo="+"'..photo/"+user+".jpg',";
update=update.substring(0,update.length()-1);	
update+=" where sno='"+user+"'";
connectDatabase.exeUpdate(update);
response.sendRedirect("maintainInfo.jsp");
//  out.print(update+"<br>");//显示update语句
// out.print(user+"<br>");
// out.print(sname+"<br>");
// out.print(sage+"<br>");
// out.print(ssex+"<br>");
// out.print(birthday+"<br>");
// out.print(admissionTime+"<br>");
// out.print(ethnic+"<br>");
// out.print(edubg+"<br>");
// out.print(political+"<br>");
// out.print(direction+"<br>");
// out.print(college+"<br>");
// out.print(department+"<br>");
// out.print(Class+"<br>");
// out.print(IDcard+"<br>");
// out.print(telphone+"<br>");
// out.print(email+"<br>");
// out.print(hometown+"<br>");
// out.print(photo+"<br>");
%>

