<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.wy.form.EmployeeForm"/>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>
<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>������Դ����ϵͳ--���Ź���</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
</head>
<script language="JavaScript">
function deleteForm(date){
if(confirm("ȷ��Ҫɾ���˲�����Ϣ��")){
window.location.href="department.do?method=deleteDepartment&id="+date;
}
}
</script>
<jsp:useBean id="pagination" class="com.wy.tool.MyPagination" scope="session"></jsp:useBean>
<%
String str=request.getParameter("Page");
int Page=1;
List list=null;
if(str==null){
	list=(List)request.getAttribute("list");
	int pagesize=3;      //ָ��ÿҳ��ʾ�ļ�¼��
	list=pagination.getInitPage(list,Page,pagesize);     //��ʼ����ҳ��Ϣ
}else{
	Page=pagination.getPage(str);
	list=pagination.getAppointPage(Page);     //��ȡָ��ҳ������
}
%>
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
              <td width="437" valign="bottom"><font color="#66583D"><b>���Ź���&nbsp;</b></font>&gt; <font color="#FF0000"> ���Ų�ѯ</font></td>
            </tr>
          </table>
		  </td>
        </tr>
      </table>
      <table width="801" height="436" border="0" cellpadding="0" cellspacing="0" background="images/center2.jpg">
        <tr>
          <td height="436" valign="top" align="center">
        <%
        if(pagination.getRecordSize()>0){
        %>
         <table width="650" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="66583D">
            <tr align="center">
              <th width="46" height="20"><span class="word_white">���</span></th>
              <th width="109"><span class="word_white">��������</span></th>
              <th width="138"><span class="word_white">����ʱ��</span></th>
			  <th width="138"><span class="word_white">��������</span></th>
              <th width="203"><span class="word_white">��ע</span></th>
              <th width="88"><span class="word_white">����</span></th>
            </tr>
        <logic:iterate id="departmentForm" collection="<%=list%>"  indexId="number">
           <bean:define id="id" name="departmentForm" property="id"/>
           <%
           int employeeNumber=0;
           List employeeList=(List)request.getAttribute("employeeList");
           for(int i=0;i<employeeList.size();i++){
              EmployeeForm employeeForm=(EmployeeForm)employeeList.get(i);
              if(employeeForm.getEm_departmentId().equals(id))
              employeeNumber++;
           }                  
           %>                       
            <tr align="center" bgcolor="#FFFFFF">           
              <td height="20"><bean:write name="departmentForm" property="id"/></td>
              <td><bean:write name="departmentForm" property="dt_name"/></td>              
              <td><bean:write name="departmentForm" property="dt_createTime"/></td>
              <td><%=employeeNumber%></td>
			  <td><bean:write name="departmentForm" property="dt_bz"/></td>
              <td><a href="javascript:deleteForm('<%=id%>')">ɾ��</a></td>
            </tr>
         </logic:iterate>
          </table>
           <table width="650">
             <tr>
               <td>  <div align="right"><%=pagination.printCtrl(Page,"method=queryDepartment")%></div></td>
             </tr>
           </table>         
         <%}%>
            <table width="650">
              <tr align="right">
                <td><a href="department_insert.jsp">��Ӳ���</a></td>
              </tr>
          </table></td>
        </tr>
      </table>
	  <jsp:include page="down.jsp" flush="true" />
    </td>
  </tr>
</table>
</body>
</html:html>
