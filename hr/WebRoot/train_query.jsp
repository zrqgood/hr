<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.wy.form.EmployeeForm"/>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>
<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>����������Դ����ϵͳ--��ѵ����</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
</head>
<script language="JavaScript">
function deleteForm(date){
if(confirm("ȷ��Ҫɾ������ѵ��Ϣ��")){
window.location.href="train.do?method=deleteTrain&id="+date;
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
	int pagesize=15;      //ָ��ÿҳ��ʾ�ļ�¼��

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
              <td width="437" valign="bottom"><font color="#66583D"><b>��ѵ����&nbsp;</b></font>&gt; <font color="#FF0000"> ��ѵ��ѯ</font></td>
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
              <th width="44" height="20"><span class="word_white">���</span></th>
              <th width="44" height="20"><span class="word_white">��ѵ��</span></th>
              <th width="103"><span class="word_white">��ѵ����</span></th>  
			  <th width="131"><span class="word_white">��ѵʱ��</span></th>
              <th width="111"><span class="word_white">��ѵ�ص�</span></th>
              <th width="184"><span class="word_white">����</span></th>
            </tr>
        <logic:iterate id="trainForm" collection="<%=list%>"  indexId="number">
           <bean:define id="id" name="trainForm" property="id"/>
            <tr align="center" bgcolor="#FFFFFF">           
              <td height="20"><bean:write name="trainForm" property="id"/></td>
              <td><bean:write name="trainForm" property="tn_man"/></td>              
              <td><bean:write name="trainForm" property="tn_title"/></td>
              <td><bean:write name="trainForm" property="tn_time"/></td>
			  <td><bean:write name="trainForm" property="tn_address"/></td>
              <td><a href="train.do?method=queryOneTrain&id=<%=id%>">�鿴��ϸ��Ϣ</a>&nbsp;&nbsp; <a href="javascript:deleteForm('<%=id%>')">ɾ��</a></td>
            </tr>
         </logic:iterate>
          </table>
           <table width="650">
             <tr>
               <td>  <div align="right"><%=pagination.printCtrl(Page,"method=queryTrain")%></div></td>
             </tr>
           </table>         
         <%}%>
         
         
            <table width="650">
              <tr align="right">
                <td><a href="train_insert.jsp">�����ѵ��Ϣ</a></td>
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
