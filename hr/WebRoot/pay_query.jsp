<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wy.form.PayForm" %>
<jsp:directive.page import="com.wy.form.EmployeeForm"/>
<jsp:directive.page import="java.util.List"/>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>
<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>����������Դ����ϵͳ--���˹���</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
</head>
<script language="JavaScript">
function deleteForm(date){
if(confirm("ȷ��Ҫɾ����Ա���Ĺ�����Ϣ��")){
window.location.href="pay.do?method=deletePay&id="+date;
}
}


function checkform1(){
if(document.form1.pay_month.value==""){
window.alert("������Ҫ��ѯ�����£����磺2007-12");
return false;
}
if(form1.pay_month.value.length >11){
window.alert("������ĸ�ʽ���ԣ� ���磺2007-12");
return false;
}

return true;
}






</script>
<jsp:useBean id="pagination" class="com.wy.tool.MyPagination" scope="session"></jsp:useBean>
<%

String result1="";
if(request.getAttribute("result1")!=null){
result1=(String)request.getAttribute("result1");
}
String result2="";
if(request.getAttribute("result2")!=null){
result2=(String)request.getAttribute("result2");
}



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
              <td width="437" valign="bottom"><font color="#66583D"><b>н�ʹ���&nbsp;</b></font>&gt; <font color="#FF0000"> н�ʲ�ѯ</font></td>
            </tr>
          </table>
		  </td>
        </tr>
      </table>
      <table width="801" height="436" border="0" cellpadding="0" cellspacing="0" background="images/center2.jpg">
        <tr>
          <td height="436" valign="top" align="center">

		  
		  
         <table width="481">
           <tr>
             <td width="224">
			  <form name="form1" method="post" action="" onsubmit="return checkform1()">
			 <table width="233">
               <tr>
                 <td><input name="sumbit1" type="submit" value="���²�ѯ"></td>
                 <td><input type="text" name="pay_month" value="<%=result2%>"></td>
               </tr>
             </table>
			  </form>
			 
			 </td>
             <td width="283">
			  <form name="form2" method="post" action="pay.do?method=queryPay">  
			 <table width="233">
               <tr>
                 <td><input name="sumbit2" type="submit" value="Ա����ѯ"></td>
                 <td>
				 <select name="emNumber">
				<%
                List employeeList=(List)request.getAttribute("employeeList");        
                for(int i=0;i<employeeList.size();i++){
                EmployeeForm employeeForm=(EmployeeForm)employeeList.get(i);
                %>
				 <option value="<%=employeeForm.getEm_serialNumber()%>" <%if(result1.equals(employeeForm.getEm_serialNumber())){out.print("selected");} %> ><%=employeeForm.getEm_serialNumber()%>&nbsp;&nbsp;<%=employeeForm.getEm_name()%></option>
				 <%}%>
                 </select>
				 
				 
				 </td>
               </tr>
             </table>
			 </form>
			 
			 </td>
           </tr>
         </table>
         <%
        if(pagination.getRecordSize()>0){
   
        %>
 
         <table border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="66583D">
            <tr align="center">
              <th width="57" height="20"><span class="word_white">Ա�����</span></th>
              <th width="57"><span class="word_white">Ա������</span></th>
              <th width="57"><span class="word_white">��ǰ�·�</span></th>
              <th width="57"><span class="word_white">��������</span></th>
			  <th width="55"><span class="word_white">�Ӱ��</span></th>
              <th width="55"><span class="word_white">�����</span></th>
              <th width="55"><span class="word_white">���ڷ�</span></th>
			  <th width="55"><span class="word_white">������</span></th>
			  <th width="55"><span class="word_white">���շ�</span></th>
			  <th width="57"><span class="word_white">ʵ������</span></th>
			  <th width="100"><span class="word_white">����</span></th>
            </tr>
        <logic:iterate id="payForm" collection="<%=list%>"  indexId="number" scope="request">
             <bean:define id="id" name="payForm" property="id"/>
             <bean:define id="pay_baseMoney" name="payForm" property="pay_baseMoney" type="Integer"/>
             <bean:define id="pay_overtime" name="payForm" property="pay_overtime" type="Integer"/>
             <bean:define id="pay_age" name="payForm" property="pay_age" type="Integer"/>
             <bean:define id="pay_check" name="payForm" property="pay_check" type="Integer"/>
             <bean:define id="pay_absent" name="payForm" property="pay_absent" type="Integer"/>
             <bean:define id="pay_safety" name="payForm" property="pay_safety" type="Integer"/>
            <tr align="center" bgcolor="#ffffff">
              <td height="25"><bean:write name="payForm" property="pay_emNumber"/></td>
              <td><bean:write name="payForm" property="pay_emName"/></td>
              <td><bean:write name="payForm" property="pay_month"/></td>
              <td><%=pay_baseMoney%></td>
              <td><%=pay_overtime*20%></td>
              <td><%=pay_age*50%></td>
              <td><%=pay_check%></td>
              <td><%=pay_absent%></td>
              <td><%=pay_safety%></td>
              <td><%=pay_baseMoney+pay_overtime*20+pay_age*50+pay_check-pay_absent-pay_safety%></td>
              <td>
      
              <a href="javascript:deleteForm('<%=id%>')">ɾ��</a>
     
              </td>
            </tr>
            </logic:iterate>
            
            
            
            
            
            
            
            
          </table>
           <table width="650">
             <tr>
               <td>  <div align="right"><%=pagination.printCtrl(Page,"method=queryPay")%></div></td>
             </tr>
           </table>         
       <%} %>
         
      
            <table width="650">
              <tr align="right">
                <td><a href="pay.do?method=forwardInsertPay">���н��</a></td>
              </tr>
          </table>
      
          </td>
        </tr>
      </table>
	  <jsp:include page="down.jsp" flush="true" />
    </td>
  </tr>
</table>
</body>
</html:html>
