<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>
<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>����������Դ����ϵͳ--��ѵ����</title>
<link type="text/css" rel="stylesheet" href="css/style.css">

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
              <td width="437" valign="bottom"><font color="#66583D"><b>��ѵ����&nbsp;</b></font>&gt; <font color="#FF0000"> �鿴��ѵ��Ϣ</font></td>
            </tr>
          </table></td>
        </tr>
      </table>
      <table width="801" height="436" border="0" cellpadding="0" cellspacing="0" background="images/center2.jpg">
        <tr>
          <td height="436" valign="top" align="center">        
            <table width="355" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="66583D">
			
              <tr>
                <th width="79" height="30"><span class="word_white">��ѵ�ˣ�</span></th>
                <td width="263" bgcolor="#FFFFFF">${requestScope.trainForm.tn_man}</td>
              </tr>
              <tr>
                <th height="30"><span class="word_white">��ѵ���⣺</span></th>
                <td bgcolor="#FFFFFF">${requestScope.trainForm.tn_title}</td>
              </tr>
              <tr>
                <th height="30"><span class="word_white">��ѵ��ּ��</span></th>
                <td bgcolor="#FFFFFF">${requestScope.trainForm.tn_content}</td>
              </tr>
			    <tr>
                <th height="30"><span class="word_white">��ѵʱ�䣺</span></th>
                <td bgcolor="#FFFFFF">${requestScope.trainForm.tn_time}</td>
              </tr>
			    <tr>
                <th height="30"><span class="word_white">��ѵ�ص㣺</span></th>
                <td bgcolor="#FFFFFF">${requestScope.trainForm.tn_address}</td>
              </tr>
			    <tr>
                <th height="30"><span class="word_white">�μ���Ա��</span></th>
                <td bgcolor="#FFFFFF">${requestScope.trainForm.tn_join}</td>
              </tr>
			  <tr>
                <th height="30"><span class="word_white">��ע��Ϣ��</span></th>
                <td bgcolor="#FFFFFF">${requestScope.trainForm.tn_bz}</td>
              </tr>
			  
            </table><br>         

			    <html:button property="button" value="����"  onclick="javascript:history.go(-1);"></html:button>
			   
			   </td>
        </tr>
      </table>
	  <jsp:include page="down.jsp" flush="true" />
    </td>
  </tr>
</table>
</body>
</html:html>
