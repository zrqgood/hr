<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>����������Դ����ϵͳ--ϵͳ����</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
</head>
<script language="JavaScript">
function insertManager(){
if(document.managerForm.account.value==""){
window.alert("�������˺�");
return false;
}
if(!isNaN(managerForm.account.value)){
window.alert("�������˺Ų�����ȫ������");
return false;
}
if(document.managerForm.password.value==""){
window.alert("����������");
return false;
}
if(document.managerForm.newPassword.value==""){
window.alert("������ȷ������");
return false;
}
if(document.managerForm.password.value!=document.managerForm.newPassword.value){
window.alert("���������������ȷ������ȷ�ϲ�һ��");
return false;
}
return true;
}
</script>


<body>
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center">
    
      <jsp:include page="top.jsp" flush="true" />   
	  
	     <table width="801" height="48" border="0" cellpadding="0" cellspacing="0" background="images/center1.jpg">
        <tr>
          <td valign="top"><table width="494">
            <tr>
              <td width="45" height="25">&nbsp;</td>
              <td width="437" valign="bottom"><font color="#66583D"><b>ϵͳ����&nbsp;</b></font>&gt; <font color="#FF0000"> �û����</font></td>
            </tr>
          </table></td>
        </tr>
      </table>
      <table width="801" height="436" border="0" cellpadding="0" cellspacing="0" background="images/center2.jpg">
        <tr>
          <td height="243" valign="top" align="center">
		 <html:form action="manager.do?method=insertManager" onsubmit="return insertManager()">
		  <table width="265" border="1" align="center" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="66583D">
            <tr>
              <th width="70" height="30"><div align="right" class="word_white">�˺ţ�</div></th>
              <td width="183" bgcolor="#FFFFFF"><html:text property="account"/></td>
            </tr>
            <tr>
              <th height="30"><div align="right" class="word_white">���룺</div></th>
              <td bgcolor="#FFFFFF"><html:password property="password"/></td>
            </tr>
             <tr>
              <th height="30"><div align="right" class="word_white">ȷ�����룺</div></th>
              <td bgcolor="#FFFFFF"><input type="password" name="newPassword"></td>
            </tr>
            <tr>
              <th height="30"><div align="right" class="word_white">����</div></th>
              <td bgcolor="#FFFFFF"><html:hidden property="managerLevel" value="0"/>��ͨ</td>
            </tr>
          </table>
		  <br>           
              <input type="submit" name="Submit2" value="����">
              &nbsp;&nbsp;
              <input type="reset" name="Submit" value="����">
          </html:form> 
          ${requestScope.result}                 
		  </td>
        </tr>
      </table>
	  <jsp:include page="down.jsp" flush="true" />
    </td>
  </tr>
</table>
</body>
</html:html>
