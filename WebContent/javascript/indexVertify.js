function submitVerify()
{
	var user=index.user.value;
	var password=index.password.value;
	var userType=getRadioBoxValue("userType");
	if(userType=="student"&&user.length!=8)
		alert("�û����ʹ���ѧ���û���Ϊ8λ");
	if(userType=="teacher"&&user.length!=6)
		alert("�û����ʹ��󣬽�ʦ�û���Ϊ6λ");
	if(userType=="admin"&&user.length!=3)
		alert("�û����ʹ��󣬹���Ա�û���Ϊ3λ");
	if(userType=="student"&&user.length==8||userType=="teacher"&&user.length==6||userType=="admin"&&user.length==3)
		document.getElementById("index").submit();
}
function getRadioBoxValue(radioName)  
{   
    var obj = document.getElementsByName(radioName);         
      for(i=0;i<obj.length;i++)    
      {  
          if(obj[i].checked)    
             return  obj[i].value;  
      }          
     return "undefined";        
}  