function checkEmpty(form){
for(i=0;i<form.length;i++){
if(form.elements[i].value==""){
alert("����Ϣ����Ϊ��");
return false;
}
}
}
function quit(){
if(confirm("�����Ҫ�˳���")){
window.location.href="leave.jsp";
}
}







function clockon(bgclock){
	var now=new Date();
	var year=now.getYear();
	var month=now.getMonth();
	var date=now.getDate();
	var day=now.getDay();
	var hour=now.getHours();
	var minu=now.getMinutes();
	var sec=now.getSeconds();
	var week;
	month=month+1;
	if(month<10) month="0"+month;
	if(date<10) date="0"+date;
	if(hour<10) hour="0"+hour;
	if(minu<10) minu="0"+minu;
	if(sec<10) sec="0"+sec;
	var arr_week=new Array("������","����һ","���ڶ�","������","������","������","������");
	week=arr_week[day];
	var time="";
	time=year+"��"+month+"��"+date+"�� "+week+" "+hour+":"+minu+":"+sec;
	if(document.all){
		bgclock.innerHTML=""+time+""
	}
	var timer=setTimeout("clockon(bgclock)",200);
} 

function updatePassword(){
if(document.form.oldPassword.value==""){
window.alert("������ԭ��������");
return false;
}
if(document.form.oldPassword.value!=document.form.passwordOld.value){
window.alert("�������������ԭ�������벻һ��");
return false;
}
if(document.form.password.value==""){
window.alert("������������");
return false;
}
if(document.form.passwordSure.value==""){
window.alert("����������ȷ��");
return false;
}
if(document.form.password.value!=document.form.passwordSure.value){
window.alert("�������������������ȷ�ϲ�һ��");
return false;
}
return true;
}



