<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="java.util.List"/>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>
<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>����������Դ����ϵͳ--���͹���</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
</head>
<script language="JavaScript">
function deleteForm(date){
if(confirm("ȷ��Ҫɾ���˽�����Ϣ��")){
window.location.href="cj.do?method=deleteCj&id="+date;
}
}
</script>
<jsp:useBean id="pagination" class="com.wy.tool.MyPagination" scope="session"></jsp:useBean>
<%
String condition="method=queryCj";
String type=null;
if(request.getAttribute("type")!=null){
type=(String)request.getAttribute("type");
condition="method=queryCj&type="+type+"";
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
              <td width="437" valign="bottom"><font color="#66583D"><b>���͹���&nbsp;</b></font>&gt; <font color="#FF0000"> ���Ͳ�ѯ</font></td>
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
		    <td width="55" align="left"><a href="cj.do?method=queryCj&type=1">����</a></td>
		    <td width="561" align="left"><a href="cj.do?method=queryCj&type=0">�ͷ�</a></td>
		  </tr>
		</table>

         <table width="650" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="66583D">
            <tr align="center">
              <th width="41" height="20" class="word_white">���</th>
              <th width="184" class="word_white">��������</th>
              <th width="85" class="word_white">��������</th>
			  <th width="82" class="word_white">�������</th>
			  <th width="63" class="word_white">����ʱ��</th>    
              <th width="162" class="word_white">����</th>
            </tr>
           <logic:iterate id="cjForm" collection="<%=list%>"  indexId="number">
             <bean:define id="id" name="cjForm" property="id"/>     
             <bean:define id="cj_type" name="cjForm" property="cj_type"/>   
             <%
             if(cj_type.equals("1")){
             cj_type="����";
             }
             if(cj_type.equals("0")){
             cj_type="�ͷ�";
             }
             %>
            <tr align="center" bgcolor="#ffffff">
              <td height="25"><bean:write name="cjForm" property="id"/></td>
              <td><bean:write name="cjForm" property="cj_title"/></td>
              <td><%=cj_type%></td>
              <td><bean:write name="cjForm" property="cj_money"/></td>
              <td><bean:write name="cjForm" property="cj_time"/></td>             
              <td>
              <a href="cj.do?method=queryOneCj&id=<%=id%>">��ϸ��ѯ</a>
              <%if(type==null){%>
              &nbsp;&nbsp;<a href="javascript:deleteForm('<%=id%>')">ɾ��</a>    
              <%}%>
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
         
          <%if(type==null){%>
            <table width="650">
              <tr align="right">
                <td><a href="cj_insert.jsp">��ӽ�����Ϣ</a></td>
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
