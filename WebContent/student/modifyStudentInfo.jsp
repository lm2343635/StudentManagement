<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />

<html>
<head>
	<title>�޸ĸ�����Ϣ</title>
	<link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
	<link rel="stylesheet" rev="stylesheet" href="../css/myfont.css" type="text/css">
</head>
<body>
	<center>
	<img src="../images/top.jpg"><br>
	<jsp:include page="header.jsp"/>	
    <form action="modifyStudentInfoHandle.jsp" method="post"  name="modifyStudentInfo">
    <table width="914"  border="0">
       <tr>
	     <td height="40" colspan="6" align="center" bgcolor="#0000FF">
	     	<myfont>������Ϣ�� ���޸ĸ�����Ϣ�������޸����ÿգ�</myfont>	
	     </td>
       </tr> 
	   <tr>
	     <td width="150" height="40" align="center" bgcolor="#D9FFFF">����</td>
	     <td width="300" align="center" bgcolor="#D9FFFF">
	     	<input type="text" name="sname" >
	     </td>
	     <td width="150" align="center" bgcolor="#D9FFFF">����</td>
	     <td width="300" align="center" bgcolor="#D9FFFF">
	         <select name="sage">
	         <option value="null" selected></option>
	         <%
	            for(int i=0;i<=100;i++)
	        	 {
	        	 %>
	        	 <option value="<%=i %>" ><%=i %></option>
	        	 <%
	        	 }
	             %>
	         </select>��
         </td>
	   </tr>   
	   <tr>
	     <td height="40" align="center" bgcolor="#D9FFFF">�Ա�</td>
	     <td align="center" bgcolor="#D9FFFF">
		     <input type="radio" name="ssex" value="male" >��
	         <input type="radio" name="ssex" value="female">Ů
	     </td>
	     <td align="center" bgcolor="#D9FFFF">��Ƭ</td>
	     <td align="center" bgcolor="#D9FFFF">
	     	<a href="../public/uploadPhoto.jsp">����ϴ���Ƭ</a>
         </td>
       </tr>
	   <tr>
	     <td width="150" height="40" align="center" bgcolor="#D9FFFF">��������</td>
	     <td width="300" align="center" bgcolor="#D9FFFF">
	         <select name="birthdayYear">
	         <option value="-1" selected></option>
	         <%         
	         for(int i=1985;i<=2013;i++)
	        	 {
                 %><option value="<%=i %>" ><%=i %></option><%
	        	 }
	         %>
	         </select>��
	         <select name="birthdayMonth">
	         <option value="-1" selected></option>
	         <%
	         for(int i=1;i<=12;i++)
	        	 {
                 %><option value="<%=i %>" ><%=i %></option><%
	        	 }
	         %>
	         </select>��
	         <select name="birthdayDay">
	         <option value="-1" selected></option>
	         <%
	         for(int i=1 ;i<=31;i++)
	        	 {
	        	 %><option value="<%=i %>" ><%=i %></option><%
	        	 }
	         %>
	         </select>��
         </td>
	     <td width="150" align="center" bgcolor="#D9FFFF">��ѧʱ��</td>
	     <td align="center" bgcolor="#D9FFFF">
	     	<select name="admissionTimeYear">
	     	<option value="-1" selected></option>
	         <%
	         for(int i=2005;i<=2013;i++)
	        	 {
                 %><option value="<%=i %>" ><%=i %></option><%
	        	 }
	         %>
	         </select>��
	         <select name="admissionTimeMonth">
	         <option value="-1" selected></option>
	         <%
	         for(int i=1;i<=12;i++)
	        	 {
                 %><option value="<%=i %>" ><%=i %></option><%
	        	 }
	         %>
	         </select>��
	         <select name="admissionTimeDay">
	         <option value="-1" selected></option>
	         <%
	         for(int i=1 ;i<=31;i++)
	        	 {
	        	 %><option value="<%=i %>" ><%=i %></option><%
	        	 }
	         %>
	         </select>��
         </td>
       </tr> 
	   <tr>
	     <td height="40" align="center" bgcolor="#D9FFFF">����</td>
	     <td align="center" bgcolor="#D9FFFF">
	     	 <select name="ethnic">
	     	 <option value="null" selected></option>
	         <%
	         String ethnic[]={
                      "����","����","����","�ɹ���","����","����","����","׳��",
	    	         "����","����","����","����","����","����","���",   
	    	         "ˮ��", "����","Ǽ��","ŭ��","����" 
	  	           ,"������","������","������","������","������","��ɽ��",  
		           "������","������","������","������","������","������","������",
		           "ë����","������","������","������","������","�°���","������", 
		           "ԣ����","������","������","�Ű���","�����","��ŵ��",        
		           "ά�����","��������","���Ӷ���","��������","��������", 
		           "���״���","����˹��","���¿���","���α����","�¶�������"	    	         
	         };
           

	         for(int i=0 ;i<ethnic.length;i++)
	        	 {
	        	 %><option value="<%=ethnic[i]%>" ><%=ethnic[i] %></option><%
	        	 }
	         %>
	         </select>
         </td>
	     <td align="center" bgcolor="#D9FFFF">ѧ�����</td>
	     <td align="center" bgcolor="#D9FFFF">
	         <select name="edubg">
	         <option value="null" selected></option>
	         <%
	         String edubg[]={"����","����","˶ʿ","��ʿ"};
	         for(int i=0 ;i<edubg.length;i++)
	        	 {
	        	 %><option value="<%=edubg[i]%>" ><%=edubg[i] %></option><%
	        	 }
	         %>
	         </select>
	     </td>
      </tr>
	   <tr>
	     <td height="40" align="center" bgcolor="#D9FFFF">������ò</td>
	     <td align="center" bgcolor="#D9FFFF">
	     	 <select name="political">
	     	 <option value="null" selected></option>
	         <%
	         String political[]={"Ⱥ��","��Ա","��Ա"};
	         for(int i=0 ;i<political.length;i++)
	        	 {
	        	 %><option value="<%=political[i]%>" ><%=political[i] %></option><%
	        	 }
	         %>
	         </select>
         </td>
         <td align="center" bgcolor="#D9FFFF">���֤��</td>
	     <td align="center" bgcolor="#D9FFFF"><input type="text" name="IDcard" ></td>
      </tr>

      <jsp:include page="CoDeInfo.jsp"/>	

	   <tr>
	     <td height="40" align="center" bgcolor="#D9FFFF">�绰</td>
	     <td align="center" bgcolor="#D9FFFF"><input type="text" name="telphone" ></td>
	     <td align="center" bgcolor="#D9FFFF">����</td>
	     <td align="center" bgcolor="#D9FFFF"><input type="text" name="email" ></td>
      </tr>
	   <tr>
	     <td height="40" align="center" bgcolor="#D9FFFF">����</td>
	     <td align="center" bgcolor="#D9FFFF"><input type="text" name="hometown" ></td>
	     <td align="center" bgcolor="#D9FFFF">��ͥסַ</td>
	     <td align="center" bgcolor="#D9FFFF"><input type="text" name="homeAddress" ></td>
      </tr>      
      
	</table>
	<input type="submit" value="�޸�">
    <input type="reset" value="����">
    </form>
</body>
</html>




