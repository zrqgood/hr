<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="java.util.List"/>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>
<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>����������Դ����ϵͳ--��Ƹ��Ա���</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
</head>
<jsp:useBean id="getSystemTime" scope="page" class="com.wy.tool.GetSystemTime"></jsp:useBean>
<script language="javascript">
function checkEmptyForm(form){
for(i=0;i<form.length;i++){
if(form.elements[i].value==""){
if(isNaN(form.age.value)){
window.alert("����ֻ��Ϊ����");
return false;
}
if(isNaN(form.tel.value)){
window.alert("�绰ֻ��Ϊ����");
return false;
}


alert(form.elements[i].title);
return false;
}
}





}
</script>



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
              <td width="437" valign="bottom"><font color="#66583D"><b>��Ƹ����&nbsp;</b></font>&gt; <font color="#FF0000">���ӦƸ����Ϣ</font></td>
            </tr>
          </table>
		  </td>
        </tr>
      </table>
      <table width="801" height="436" border="0" cellpadding="0" cellspacing="0" background="images/center2.jpg">
        <tr>
          <td height="436" valign="top" align="center">
        <html:form action="inviteJob.do?method=insertInviteJob" onsubmit="return checkEmptyForm(inviteJobForm)">  
          <table width="493" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="66583D">
            <tr>
              <th width="69" height="30" class="word_white">������</th>
              <td width="166" bgcolor="#FFFFFF"><html:text property="name" title="������ӦƸ������"/></td>
              <th width="67" class="word_white">�Ա�</th>
              <td width="171" bgcolor="#FFFFFF">&nbsp;&nbsp;<html:radio property="sex" value="��" styleClass="input1" />&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;<html:radio property="sex" value="Ů" styleClass="input1"/>&nbsp;Ů</td>
            </tr>
            <tr>
              <th height="30" class="word_white">���䣺</th>
              <td bgcolor="#FFFFFF"><html:text property="age" title="������ӦƸ������"/></td>
              <th class="word_white">�������ڣ�</th>
              <td bgcolor="#FFFFFF"><html:text property="born" title="�������������"/></td>
            </tr>
            <tr>
              <th height="30" class="word_white">ӦƸְλ��</th>
              <td bgcolor="#FFFFFF"><html:text property="job" title="������ӦƸְ��"/></td>
              <th class="word_white">��ѧרҵ��</th>
              <td bgcolor="#FFFFFF"><html:text property="specialty" title="��������ѧרҵ"/></td>
            </tr>
            <tr>
              <th height="30" class="word_white">�������飺</th>
              <td bgcolor="#FFFFFF"><html:text property="experience" title="�����빤������"/></td>
              <th class="word_white">�Ļ��̶ȣ�</th>
              <td bgcolor="#FFFFFF">
                  <html:select property="teachSchool" >
                     <html:option value="�о���">�о���</html:option>
                     <html:option value="������">������</html:option>
                     <html:option value="��ר��">��ר��</html:option>
                  </html:select>
             </td>
            </tr>
            <tr>
              <th height="30" class="word_white">��ϵ�绰��</th>
              <td bgcolor="#FFFFFF"><html:text property="tel" title="��������ϵ�绰"/></td>
              <th class="word_white">��ҵѧУ��</th>
              <td bgcolor="#FFFFFF"><html:text property="afterSchool" title="�������ҵѧУ"/></td>
            </tr>
            <tr>
              <th height="30" class="word_white">��ͥסַ��</th>
              <td bgcolor="#FFFFFF"><html:text property="address" title="�������ͥסַ"/></td>
              <th class="word_white">�Ǽ�ʱ�䣺</th>
              <td bgcolor="#FFFFFF"><html:text property="createtime" value="<%=getSystemTime.getToday()%>" readonly="readonly" onclick="alert('���ı�������Ϊֻ�����û������޸�')"/></td>
            </tr>
            <tr>
              <th height="111" class="word_white">���˼��:<html:hidden property="isstock" value="0"/></th>
              <td colspan="3" bgcolor="#FFFFFF"><html:textarea property="content" rows="8" styleClass="textarea" cols="50" title="��������˼��"/></td>
            </tr>
          </table>
          <br>
          <html:submit>����</html:submit> &nbsp; <html:reset>����</html:reset> &nbsp; <html:button property="back" value="����" onclick="javascript:history.go(-1);"></html:button>
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
