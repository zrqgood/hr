<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.wy.form.DepartmentForm"/>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>
<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>����������Դ����ϵͳ--��Ƹ����</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
</head>
<script language="JavaScript">
function deleteForm(date){
if(confirm("ȷ��Ҫɾ����Ա����Ϣ��")){
window.location.href="employee.do?method=deleteEmployee&em_serialNumber="+date;
}
}
</script>
<jsp:useBean id="pagination" class="com.wy.tool.MyPagination" scope="session"></jsp:useBean>
<%
//����ķ����������ύ�ķ���
String condition="method=queryEmployee";
Integer departmentId=null;
if(request.getAttribute("departmentId")!=null){
departmentId=Integer.valueOf((String)request.getAttribute("departmentId"));
condition="method=queryEmploye&departmentId="+departmentId+"";
}



//����ķ����ǻ�ȡ�������͵�����
List departmentList=(List)request.getAttribute("departmentList");



//�����Ƿ�ҳ����
String str=request.getParameter("Page");
int Page=1;
List list=null;
if(str==null){
	list=(List)request.getAttribute("list");
	int pagesize=11;      //ָ��ÿҳ��ʾ�ļ�¼��

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
              <td width="437" valign="bottom"><font color="#66583D"><b>Ա������&nbsp;</b></font>&gt; <font color="#FF0000"> Ա����ѯ</font></td>
            </tr>
          </table>
		  </td>
        </tr>
      </table>
      <table width="801" height="436" border="0" cellpadding="0" cellspacing="0" background="images/center2.jpg">
        <tr>
          <td height="436" valign="top" align="center">
          
<table  height="19">
  <tr align="center"> 
    <td> 
    <b>���Ų�ѯ</b>&nbsp;&nbsp;
	 <logic:iterate id="departmentForm" collection="<%=departmentList%>"  indexId="number">
	    <bean:define id="id" name="departmentForm" property="id"/>
	    <a href="employee.do?method=queryEmployee&departmentId=<%=id%>"><bean:write name="departmentForm" property="dt_name"/></a>&nbsp;&nbsp;
	</logic:iterate>
	<a href="employee.do?method=queryEmployee"><b>Ա��ȫ����ѯ<b></a>
	</td> 
	  
  </tr>
</table>
<br>          
        <%
        if(pagination.getRecordSize()>0){
        %>

         <table width="739" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="66583D">
           <tr align="center">
             <th width="66" height="19" class="word_white">Ա�����</th>
             <th width="66" class="word_white">����</th>
             <th width="57" class="word_white">�Ա�</th>
             <th width="93" class="word_white">����</th>
             <th width="60" class="word_white">����</th>
             <th width="106" class="word_white">ѧ��</th>
             <th width="123" class="word_white">�μӹ���ʱ��</th>
             <th width="125" class="word_white">����</th>
           </tr>
           <logic:iterate id="employeeForm" collection="<%=list%>"  indexId="number"> <bean:define id="em_serialNumber" name="employeeForm" property="em_serialNumber"/> <bean:define id="em_departmentId" name="employeeForm" property="em_departmentId"/>
           <%
         String departmentName=null;
         for(int i=0;i<departmentList.size();i++){
            DepartmentForm  departmentForm=(DepartmentForm)departmentList.get(i);
             if(em_departmentId.equals(departmentForm.getId()))
             departmentName=departmentForm.getDt_name();
         }
         %>
           <tr align="center" bgcolor="#ffffff">
             <td height="25"><a href="#"><%=em_serialNumber%></a></td>
             <td><a href="employee.do?method=queryOneEmployee&em_serialNumber=<%=em_serialNumber%>"><bean:write name="employeeForm" property="em_name"/></a></td>
             <td><bean:write name="employeeForm" property="em_sex"/></td>
             <td><%=departmentName%></td>
             <td><bean:write name="employeeForm" property="em_typework"/></td>
             <td><bean:write name="employeeForm" property="em_culture"/></td>
             <td><bean:write name="employeeForm" property="em_startime"/></td>
             <td>
               <%if(departmentId==null){%>
               <a href="employee.do?method=forwardUpdateEmployee&em_serialNumber=<%=em_serialNumber%>">�޸�</a> &nbsp;&nbsp;<a href="javascript:deleteForm('<%=em_serialNumber%>')">ɾ��</a>
               <%}else{out.print("����������");}%>
             </td>
           </tr>
           </logic:iterate>
         </table>
         <table width="650">
             <tr>
               <td>  <div align="right"><%=pagination.printCtrl(Page,condition)%></div></td>
             </tr>
           </table>         
         <%}%>
         
      <%if(departmentId==null){%>
          <table width="650">
              <tr align="right">
                <td><a href="employee.do?method=forwardInsertEmployee">���Ա����Ϣ</a></td>
              </tr>
          </table>
      <%}%>
		  </td>
        </tr>
      </table>
	  <jsp:include page="down.jsp" flush="true" />
    </td>
  </tr>
</table>
</body>
</html:html>
