<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="java.util.List"/>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>
<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>����������Դ����ϵͳ--��Ƹ��Ա��ϸ��ѯ</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
</head>
<body>
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center">
    
      <jsp:include page="top.jsp" flush="true" />   
	  
	     <table width="801" height="48" border="0" cellpadding="0" cellspacing="0" background="images/center1.jpg">
        <tr>
          <td valign="top">
		  <table width="494">
            <tr>
              <td width="45" height="25">&nbsp;</td>
              <td width="437" valign="bottom"><font color="#66583D"><b>��Ƹ����</b></font>&gt; <font color="#FF0000">��Ƹ��Ա��ϸ��ѯ</font></td>
            </tr>
          </table>
		  </td>
        </tr>
      </table>
      <table width="801" height="436" border="0" cellpadding="0" cellspacing="0" background="images/center2.jpg">
        <tr>
          <td height="436" valign="top" align="center">
          <table width="493" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="66583D">
            <tr>
              <th width="69" height="30" class="word_white">������</th>
              <td width="166" bgcolor="#FFFFFF">${requestScope.form.name}</td>
              <th width="67" class="word_white">�Ա�</th>
              <td width="171" bgcolor="#FFFFFF">${requestScope.form.sex}</td>
            </tr>
            <tr>
              <th height="30" class="word_white">���䣺</th>
              <td bgcolor="#FFFFFF">${requestScope.form.age}</td>
              <th class="word_white">�������ڣ�</th>
              <td bgcolor="#FFFFFF">${requestScope.form.born}</td>
            </tr>
            <tr>
              <th height="30" class="word_white">ӦƸְλ��</th>
              <td bgcolor="#FFFFFF">${requestScope.form.job}</td>
              <th class="word_white">��ѧרҵ��</th>
              <td bgcolor="#FFFFFF">${requestScope.form.specialty}</td>
            </tr>
            <tr>
              <th height="30" class="word_white">�������飺</th>
              <td bgcolor="#FFFFFF">${requestScope.form.experience}</td>
              <th class="word_white">�Ļ��̶ȣ�</th>
              <td bgcolor="#FFFFFF">${requestScope.form.teachSchool}</td>
            </tr>
            <tr>
              <th height="30" class="word_white">��ϵ�绰��</th>
              <td bgcolor="#FFFFFF">${requestScope.form.tel}</td>
              <th class="word_white">��ҵѧУ��</th>
              <td bgcolor="#FFFFFF">${requestScope.form.afterSchool}</td>
            </tr>
            <tr>
              <th height="30" class="word_white">��ͥסַ��</th>
              <td bgcolor="#FFFFFF">${requestScope.form.address}</td>
              <th class="word_white">�Ǽ�ʱ�䣺</th>
              <td bgcolor="#FFFFFF">${requestScope.form.createtime}</td>
            </tr>
		    <tr>
              <th height="30" class="word_white">�Ƿ�¼��:</th>
              <td colspan="3" bgcolor="#FFFFFF">${requestScope.form.isstock}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#FF0000"><b>/*1�����Ѿ�¼�ã�0����δ��¼��*/</b></font></td>
            </tr>
            <tr>
              <th height="111" class="word_white">���˼��:</th>
              <td colspan="3" bgcolor="#FFFFFF">${requestScope.form.content}</td>
            </tr>
          </table>
		  <br>
       <html:button property="back" value="����" onclick="javascript:history.go(-1);"></html:button>

      
      
		  </td>
        </tr>
      </table>
	  <jsp:include page="down.jsp" flush="true" />
    </td>
  </tr>
</table>
</body>
</html:html>
