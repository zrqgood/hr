<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>
<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>����������Դ����ϵͳ--���͹���</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
<jsp:useBean id="getSystemTime" scope="page" class="com.wy.tool.GetSystemTime"></jsp:useBean>
<script language="javascript">
function checkEmptyForm(form){
for(i=0;i<form.length;i++){
if(form.elements[i].value==""){

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
              <td width="437" valign="bottom"><font color="#66583D"><b>���͹���&nbsp;</b></font>&gt; <font color="#FF0000"> �������</font></td>
            </tr>
          </table></td>
        </tr>
      </table>
      <table width="801" height="436" border="0" cellpadding="0" cellspacing="0" background="images/center2.jpg">
        <tr>
          <td height="436" valign="top" align="center">           <html:form action="cj.do?method=saveCj" onsubmit="return checkEmptyForm(cjForm)">          
            <table width="355" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="66583D">
              <tr>
                <th width="79" height="30"><span class="word_white">������Ŀ��</span></th>
                <td width="263" bgcolor="#FFFFFF"><html:text property="cj_title" title="������Ŀ"/></td>
              </tr>
              <tr>
                <th height="30"><span class="word_white">�������ͣ�</span></th>
                <td bgcolor="#FFFFFF">
                <html:select property="cj_type">
                  <html:option value="1">����</html:option>
                  <html:option value="0">�ͷ�</html:option>
                </html:select>
                </td>
              </tr>
              <tr>
                <th height="30"><span class="word_white">���ͽ�</span></th>
                <td bgcolor="#FFFFFF"><html:text property="cj_money" title="�����뽱�ͽ��"/></td>
              </tr>
              <tr>
                <th height="30"><span class="word_white">����ʱ�䣺</span></th>
                <td bgcolor="#FFFFFF"><html:text property="cj_time" title="�����뽱��ʱ��"/></td>
              </tr>
              <tr>
                <th height="30"><span class="word_white">����ԭ��</span></th>
                <td bgcolor="#FFFFFF"><html:textarea property="cj_content" title="�����뽱��ԭ��" rows="10" cols="35"  styleClass="textarea" /></td>
              </tr>
            </table><br>   
              <html:submit>����</html:submit>
              &nbsp;&nbsp;
              <html:reset>����</html:reset>
               &nbsp;&nbsp;
			   <html:button property="button" value="����"  onclick="javascript:history.go(-1);"></html:button>
			   
			   </html:form></td>
        </tr>
      </table>
	  <jsp:include page="down.jsp" flush="true" />
    </td>
  </tr>
</table>
</body>
</html:html>
