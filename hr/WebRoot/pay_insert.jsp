<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.wy.form.EmployeeForm"/>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>
<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>����������Դ����ϵͳ--н�ʹ���</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
<jsp:useBean id="getSystemTime" scope="page" class="com.wy.tool.GetSystemTime"></jsp:useBean>
<script language="javascript">
function checkEmptyForm(form){
for(i=0;i<form.length;i++){
if(form.elements[i].value==""){

if(isNaN(form.pay_baseMoney.value)){
window.alert("��������ֻ��Ϊ����");
return false;
}
if(isNaN(form.pay_overtime.value)){
window.alert("�Ӱ����ֻ��Ϊ����");
return false;
}

if(isNaN(form.pay_age.value)){
window.alert("����ֻ��Ϊ����");
return false;
}

if(isNaN(form.pay_check.value)){
window.alert("ȫ�ڽ�ֻ��Ϊ����");
return false;
}

if(isNaN(form.pay_absent.value)){
window.alert("������ֻ��Ϊ����");
return false;
}

if(isNaN(form.pay_safety.value)){
window.alert("���շ�ֻ��Ϊ����");
return false;
}

alert(form.elements[i].title);
return false;
}
}





}
</script>



</head>
<body>
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center">
    
      <jsp:include page="top.jsp" flush="true" />   
	  
	     <table width="801" height="48" border="0" cellpadding="0" cellspacing="0" background="images/center1.jpg">
        <tr>
          <td valign="top">		  <table width="494">
            <tr>
              <td width="45" height="25">&nbsp;</td>
              <td width="437" valign="bottom"><font color="#66583D"><b>н�ʹ���&nbsp;</b></font>&gt; <font color="#FF0000"> н�����</font></td>
            </tr>
          </table></td>
        </tr>
      </table>
      <table width="801" height="436" border="0" cellpadding="0" cellspacing="0" background="images/center2.jpg">
        <tr>
          <td height="436" valign="top" align="center">        
		   <html:form action="pay.do?method=savePay">          
            <table width="355" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="66583D">
              <tr>
                <th width="87" height="30"><span class="word_white">��ż�������</span></th>
                <td width="255" bgcolor="#FFFFFF">
                <html:select property="pay_emNumber">
                <%
                List employeeList=(List)request.getAttribute("employeeList");
                for(int i=0;i<employeeList.size();i++){
                EmployeeForm employeeForm=(EmployeeForm)employeeList.get(i);
                %>
                  <html:option value="<%=employeeForm.getEm_serialNumber()%>"><%=employeeForm.getEm_serialNumber()%>&nbsp;&nbsp;<%=employeeForm.getEm_name()%></html:option>
                <%}%>
                </html:select>
              </td>
              </tr>
              <tr>
                <th height="30"><span class="word_white">����ʱ�䣺</span></th>
                <td bgcolor="#FFFFFF"><html:text property="pay_month" value="<%=getSystemTime.getYearMonth()%>" readonly="readonly" onclick="alert('���ı�������Ϊֻ�����û������޸�')"/></td>
              </tr>
              <tr>
                <th height="30"><span class="word_white">�������ʣ�</span></th>
                <td bgcolor="#FFFFFF"><html:text property="pay_baseMoney" title="�������������"/></td>
              </tr>
			  <tr>
                <th height="30"><span class="word_white">�Ӱ������</span></th>
                <td bgcolor="#FFFFFF"><html:text property="pay_overtime" title="������Ӱ����"/></td>
              </tr>
			   <tr>
                <th height="30"><span class="word_white">���䣺</span></th>
                <td bgcolor="#FFFFFF"><html:text property="pay_age" title="�����빤��"/></td>
              </tr>
			  <tr>
                <th height="30"><span class="word_white">ȫ�ڽ���</span></th>
                <td bgcolor="#FFFFFF"><html:text property="pay_check" title="������ȫ�ڽ�"/></td>
              </tr>
			  <tr>
                <th height="30"><span class="word_white">�����ѣ�</span></th>
                <td bgcolor="#FFFFFF"><html:text property="pay_absent" title="�����������"/></td>
              </tr>
			  <tr>
                <th height="30"><span class="word_white">���շѣ�</span></th>
                <td bgcolor="#FFFFFF"><html:text property="pay_safety" title="�����뱣�շ�"/></td>
              </tr>
            </table><br>         
              <html:submit>����</html:submit>
              &nbsp;&nbsp;
              <html:reset>����</html:reset>
               &nbsp;&nbsp;
			   <html:button property="button" value="����"  onclick="javascript:history.go(-1);"></html:button>			   
			   </html:form>
			   
			   </td>
        </tr>
      </table>
	  <jsp:include page="down.jsp" flush="true" />
    </td>
  </tr>
</table>
</body>
</html:html>
