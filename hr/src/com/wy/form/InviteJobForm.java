package com.wy.form;

import org.apache.struts.action.ActionForm;

public class InviteJobForm extends ActionForm {
	private String id = null; // ���
	
	private String name = null; // ����

	private String sex = "��"; // �Ա�

	private String age = null; // ����

	private String born = null; // ��������

	private String job = null; // ӦƸְ��

	private String specialty = null; // רҵ

	private String experience = "��"; // ��������

	private String teachSchool = null; // ѧ��

	private String afterSchool = null; // ��ҵѧУ

	private String tel = null; // ��ϵ�绰

	private String createtime = null; // �Ǽ�ʱ��

	private String content = "Ӧ���ҵ�����޹�������"; // ��������

	private String isstock = null; // �Ƿ�¼��

	private String address = null; // ��ͥסַ
	


	

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAfterSchool() {
		return afterSchool;
	}

	public void setAfterSchool(String afterSchool) {
		this.afterSchool = afterSchool;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getBorn() {
		return born;
	}

	public void setBorn(String born) {
		this.born = born;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}


	public String getExperience() {
		return experience;
	}

	public void setExperience(String experience) {
		this.experience = experience;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getIsstock() {
		return isstock;
	}

	public void setIsstock(String isstock) {
		this.isstock = isstock;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getSpecialty() {
		return specialty;
	}

	public void setSpecialty(String specialty) {
		this.specialty = specialty;
	}

	public String getTeachSchool() {
		return teachSchool;
	}

	public void setTeachSchool(String teachSchool) {
		this.teachSchool = teachSchool;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

}
