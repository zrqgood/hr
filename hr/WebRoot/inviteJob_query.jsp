<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="java.util.List"/>
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
if(confirm("ȷ��Ҫɾ����ӦƸ��Ա��Ϣ��")){
window.location.href="inviteJob.do?method=deleteInviteJob&id="+date;
}
}
</script>
<jsp:useBean id="pagination" class="com.wy.tool.MyPagination" scope="session"></jsp:useBean>
<%
String condition="method=queryInviteJob";
Integer isstock=null;
if(request.getAttribute("isstock")!=null){
isstock=Integer.valueOf((String)request.getAttribute("isstock"));
condition="method=queryInviteJob&isstock="+isstock+"";
}


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
              <td width="437" valign="bottom"><font color="#66583D"><b>��Ƹ����&nbsp;</b></font>&gt; <font color="#FF0000"> ��Ƹ��ѯ</font></td>
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
<table width="641">
  <tr align="center"> 
    <td width="55" align="left"><a href="inviteJob.do?method=queryInviteJob&isstock=1">¼�ò�ѯ</a></td>
    <td width="561" align="left"><a href="inviteJob.do?method=queryInviteJob&isstock=0">��¼�ò�ѯ</a></td>
  </tr>
</table>

         <table width="650" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="66583D">
            <tr align="center">
              <th width="35" height="20" class="word_white">���</th>
              <th width="77" class="word_white">����</th>
              <th width="51" class="word_white">�Ա�</th>
			  <th width="95" class="word_white">ӦƸְ��</th>
			  <th width="95" class="word_white">ѧ��</th>
              <th width="81" class="word_white">��������</th>
              <th width="178" class="word_white">����</th>
            </tr>
           <logic:iterate id="inviteJobForm" collection="<%=list%>"  indexId="number">
             <bean:define id="inviteJobid" name="inviteJobForm" property="id"/>
             <bean:define id="isstockk" name="inviteJobForm" property="isstock"/>
            <tr align="center" bgcolor="#ffffff">
              <td height="25"><bean:write name="inviteJobForm" property="id"/></td>
              <td><bean:write name="inviteJobForm" property="name"/></td>
              <td><bean:write name="inviteJobForm" property="sex"/></td>
              <td><bean:write name="inviteJobForm" property="job"/></td>
              <td><bean:write name="inviteJobForm" property="teachSchool"/></td>
              <td><bean:write name="inviteJobForm" property="experience"/></td>
              <td><a href="inviteJob.do?method=queryOneInviteJob&id=<%=inviteJobid%>">��ϸ��ѯ</a>
              <%if(isstock==null){%>
              &nbsp;&nbsp;<a href="javascript:deleteForm('<%=inviteJobid%>')">ɾ��</a>    
              &nbsp;&nbsp;
              
              <%if(isstockk.equals("0")){ %>
              <a href="employee.do?method=forwardEmploye&id=<%=inviteJobid%>">¼��</a>         
              <%}else{
              out.print("��¼");
             } }%>
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
         
          <%if(isstock==null){%>
            <table width="650">
              <tr align="right">
                <td><a href="inviteJob_insert.jsp">���ӦƸ����Ϣ</a></td>
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
