<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.wy.form.DepartmentForm"/>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>
<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>����������Դ����ϵͳ--Ա������</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
<jsp:useBean id="getSystemTime" scope="page" class="com.wy.tool.GetSystemTime"></jsp:useBean>
<script language="javascript">
function checkEmptyForm(form){
for(i=0;i<form.length;i++){
if(form.elements[i].value==""){
if(isNaN(form.em_age.value)){
window.alert("����ֻ��Ϊ����");
return false;
}
if(isNaN(form.em_tel.value)){
window.alert("�绰ֻ��Ϊ����");
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
              <td width="437" valign="bottom"><font color="#66583D"><b>Ա������&nbsp;</b></font>&gt; <font color="#FF0000"> Ա����Ϣ����</font></td>
            </tr>
          </table></td>
        </tr>
      </table>

      <table width="801" height="436" border="0" cellpadding="0" cellspacing="0" background="images/center2.jpg">
        <tr>
          <td height="436" valign="top" align="center">
		       
 <html:form action="employee.do?method=updateEmployee" onsubmit="return checkEmptyForm(employeeForm)">
		  <table border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="66583D">
            <tr>
              <th width="75" height="25">��ţ�</th>
              <td width="200" bgcolor="#FFFFFF"><html:text property="em_serialNumber"  readonly="readonly" onclick="alert('���ı�������Ϊֻ�����û������޸�')"/></td>
              <th width="75">������</th>
              <td width="200" bgcolor="#FFFFFF"><html:text property="em_name" title="������Ա������"/></td>
            </tr>
            <tr>
              <th height="25">���䣺</th>
              <td bgcolor="#FFFFFF"><html:text property="em_age" title="������Ա������"/></td>
              <th>�Ա�</th>
              <td bgcolor="#FFFFFF"><html:radio property="em_sex" value="��" styleClass="input1"/>&nbsp;��&nbsp; &nbsp; &nbsp; <html:radio property="em_sex" value="Ů" styleClass="input1"/>&nbsp;Ů</td>
            </tr>
            <tr>
              <th height="25">�������ڣ�</th>
              <td bgcolor="#FFFFFF"><html:text property="em_born" title="������Ա����������"/></td>
              <th>���֤�ţ�</th>
              <td bgcolor="#FFFFFF"><html:text property="em_IDCard" title="������Ա�����֤����"/></td>
            </tr>
            <tr>
              <th height="25">���壺</th>
              <td bgcolor="#FFFFFF"><html:text property="em_nation" title="�������Ա��������"/></td>
              <th>����״����</th>
              <td bgcolor="#FFFFFF"><html:radio property="em_marriage" value="δ��" styleClass="input1"/>&nbsp;δ��&nbsp; &nbsp; &nbsp; <html:radio property="em_marriage" value="�ѻ�" styleClass="input1"/>&nbsp;�ѻ�</td>
            </tr>
            <tr>
              <th height="25">������ò��</th>
              <td bgcolor="#FFFFFF"><html:radio property="em_visage" value="��Ա" styleClass="input1"/>&nbsp;��Ա&nbsp; &nbsp; <html:radio property="em_visage" value="��Ա" styleClass="input1"/>&nbsp;��Ա&nbsp;  &nbsp; <html:radio property="em_visage" value="��" styleClass="input1"/>&nbsp;��</td>
              <th>���᣺</th>
              <td bgcolor="#FFFFFF"><html:text property="em_ancestralHome" title="�����뼮��"/></td>
            </tr>
            <tr>
              <th height="25">��ϵ�绰��</th>
              <td bgcolor="#FFFFFF"><html:text property="em_tel" title="��������ϵ�绰"/></td>
              <th>��ͥסַ��</th>
              <td bgcolor="#FFFFFF"><html:text property="em_address" title="�������ͥסַ"/></td>
            </tr>
            <tr>
              <th height="25">��ҵѧУ��</th>
              <td bgcolor="#FFFFFF"><html:text property="em_afterschool" title="�������ҵѧУ"/></td>
              <th>רҵ��</th>
              <td bgcolor="#FFFFFF"><html:text property="em_speciality" title="������רҵ����"/></td>
            </tr>
            <tr>
              <th height="25">�Ļ��̶ȣ�</th>
              <td bgcolor="#FFFFFF">
                <html:select property="em_culture">
                     <html:option value="�о���">�о���</html:option>
                     <html:option value="������">������</html:option>
                     <html:option value="��ר��">��ר��</html:option>
                </html:select>
              </td>
              <th>�ϸ�ʱ�䣺</th>
              <td bgcolor="#FFFFFF"><html:text property="em_startime" title="�������ϸ�ʱ��"/></td>
            </tr>
            <tr>
              <th height="25">�������ƣ�</th>
              <td bgcolor="#FFFFFF">
                <html:select property="em_departmentId">
                <%
                List list=(List)request.getAttribute("departmentList");
                for(int i=0;i<list.size();i++){
                DepartmentForm departmentForm=(DepartmentForm)list.get(i);
                %>
                <html:option value="<%=departmentForm.getId()%>"><%=departmentForm.getDt_name()%></html:option>
                <%}%>
                </html:select>              </td>
              <th>���Ź��֣�</th>
              <td bgcolor="#FFFFFF">
                <html:select property="em_typework">
                   <html:option value="����Ա">����Ա</html:option>
                   <html:option value="�ĵ���Ա">�ĵ���Ա</html:option>
                   <html:option value="���ž���">���ž���</html:option>
                </html:select>
              </td>
            </tr>
            <tr>
              <th height="25">�Ǽ�������</th>
              <td bgcolor="#FFFFFF"><html:text property="em_createName"  readonly="readonly" onclick="alert('���ı�������Ϊֻ�����û������޸�')"/></td>
              <th>�Ǽ�ʱ�䣺</th>                                                              
              <td bgcolor="#FFFFFF"><html:text property="em_creatime"  readonly="readonly" onclick="alert('���ı�������Ϊֻ�����û������޸�')"/></td>
            </tr>
			<tr>
              <th height="107">��ע��Ϣ��</th>
              <td colspan="3" bgcolor="#FFFFFF"><html:textarea property="em_bz" title="�����뱸ע��Ϣ" styleClass="textarea" rows="7" cols="75"/></td>
              </tr>
          </table>
           <br>
           <html:hidden property="id"/>
             <html:submit>�޸�</html:submit> &nbsp; <html:reset>����</html:reset> &nbsp; <html:button property="back" value="����" onclick="javascript:history.go(-1);"></html:button>
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
