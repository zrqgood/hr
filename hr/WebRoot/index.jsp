<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link type="text/css" rel="stylesheet" href="css/style.css">
<title>������ҵ������Դ����ϵͳ--��¼</title>
</head>

<script language="JavaScript">
function checkManager(){
if(document.managerForm.account.value==""){
window.alert("�������˺�");
return false;
}
if(document.managerForm.password.value==""){
window.alert("����������");
return false;
}
return true;
}
</script>




<body>
<table width="100%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>
	<html:form action="manager.do?method=checkManager" onsubmit="return checkManager()">
<table width="550" height="371" border="0" align="center" cellpadding="0" cellspacing="0" background="images/managerLand.jpg">
  <tr>
    <td valign="bottom">
	<table height="100" align="center">
      <tr>
        <td width="50" height="63">�˺ţ�</td>
        <td width="149"><html:text property="account"/></td>
        <td width="50">���룺</td>
        <td width="150"><html:password property="password"/></td>
        <td width="70">
       <html:image src="images/land.gif" styleClass="img1"></html:image>         
        </td>
      </tr>
    </table>	</td>
  </tr>
</table>
	</html:form>
	</td>
  </tr>
</table>

</body>
</html:html>
