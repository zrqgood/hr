package com.wy.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.wy.dao.ObjectDao;
import com.wy.form.DepartmentForm;
import com.wy.form.EmployeeForm;
import com.wy.form.InviteJobForm;
import com.wy.form.ManagerForm;
import com.wy.tool.GetAutoNumber;

public class EmployeeAction extends DispatchAction {
	private ObjectDao objectDao;

	public ObjectDao getObjectDao() {
		return objectDao;
	}

	public void setObjectDao(ObjectDao objectDao) {
		this.objectDao = objectDao;
	}

	// ת��Ա��¼�õ�ҳ��
	
	public ActionForward forwardEmploye(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		this.saveToken(request);
		
		String condition = "from EmployeeForm order by id desc";
		List list = objectDao.getObjectList(condition);
		String autoNumber = "1";
		if (list.size() != 0) {
			EmployeeForm employeeform = (EmployeeForm) list.get(0);
			Integer em_serialNumber = Integer.valueOf(employeeform.getId()) + 1;
			autoNumber = String.valueOf(em_serialNumber);
		}
		autoNumber = GetAutoNumber.getMaxNuber(autoNumber);
		request.setAttribute("departmentList", objectDao
				.getObjectList("from DepartmentForm"));
		EmployeeForm employeeForm =(EmployeeForm)form;		
		String id = request.getParameter("id");
		InviteJobForm inviteJobForm = (InviteJobForm) objectDao
					.getObjectForm("from InviteJobForm where id='" + id + "'");
			employeeForm.setEm_serialNumber(autoNumber);//��Ա������Զ���ֵ
			employeeForm.setEm_name(inviteJobForm.getName());//��Ա��������ֵ
			employeeForm.setEm_afterschool(inviteJobForm.getAfterSchool());//��Ա���ı�ҵѧУ�Զ���ֵ
			employeeForm.setEm_sex(inviteJobForm.getSex());//��Ա�����Ա�ֵ
			employeeForm.setEm_born(inviteJobForm.getBorn());//��Ա���ĳ������ڸ�ֵ
			employeeForm.setEm_address(inviteJobForm.getAddress());//��Ա����ַ��ֵ
			employeeForm.setEm_culture(inviteJobForm.getTeachSchool());//��Ա�����Ļ��̶ȸ�ֵ
			employeeForm.setEm_tel(inviteJobForm.getTel());//��Ա���绰��ֵ
			employeeForm.setEm_speciality(inviteJobForm.getSpecialty());//��Ա����ѧרҵ��ֵ
			request.setAttribute("employeeForm", employeeForm);
			request.setAttribute("id", id);
			return mapping.findForward("forwardEmploy");
	
	}
	//Ա��¼��
	public ActionForward addEmployee(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		EmployeeForm employeeForm = (EmployeeForm) form;
	if (this.isTokenValid(request)) {
			this.resetToken(request);
			objectDao.insertObjectForm(employeeForm);
		} else {
		this.saveToken(request);
			request.setAttribute("result", "�����ظ��ύ������");
		}
	
		request.setAttribute("id", request.getParameter("id"));
		return mapping.findForward("operationEmployee");
	}
	
	
	

	// Ա���鿴��ϸ��Ϣ����
	public ActionForward queryOneEmployee(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		String em_serialNumber = request.getParameter("em_serialNumber");
		String condition = "from EmployeeForm where em_serialNumber='"
				+ em_serialNumber + "'";
		EmployeeForm employeeForm = (EmployeeForm) objectDao
				.getObjectForm(condition);
		request.setAttribute("employeeForm", employeeForm);
		request.setAttribute("departmentList", objectDao
				.getObjectList("from DepartmentForm"));
		return mapping.findForward("queryOneEmployee");
	}

	
	
	
	
	
	
	// Ա���鿴����
	public ActionForward queryEmployee(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		List list = null;
		String condition = "from EmployeeForm order by id desc";
		if (request.getParameter("departmentId") != null) {
			String em_departmentId = request.getParameter("departmentId");
			condition = "from EmployeeForm where em_departmentId='"
					+ em_departmentId + "' order by id desc";
			request.setAttribute("departmentId", em_departmentId);
		}
		list = objectDao.getObjectList(condition);
		request.setAttribute("list", list);
		request.setAttribute("departmentList", objectDao
				.getObjectList("from DepartmentForm"));
		return mapping.findForward("queryEmployee");
	}

	// ת�����Ա����ҳ��
	public ActionForward forwardInsertEmployee(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		this.saveToken(request);
		
		String condition = "from EmployeeForm order by id desc";
		List list = objectDao.getObjectList(condition);
		String autoNumber = "1";
		if (list.size() != 0) {
			EmployeeForm employeeform = (EmployeeForm) list.get(0);
			Integer em_serialNumber = Integer.valueOf(employeeform.getId()) + 1;
			autoNumber = String.valueOf(em_serialNumber);
		}
		autoNumber = GetAutoNumber.getMaxNuber(autoNumber);
		request.setAttribute("autoNumber", autoNumber);
		request.setAttribute("departmentList", objectDao
				.getObjectList("from DepartmentForm"));
		return mapping.findForward("forwardInsertEmployee");
	}
	
	

	// ���Ա��
	public ActionForward saveEmployee(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		EmployeeForm employeeForm = (EmployeeForm) form;
		if (this.isTokenValid(request)) {
			this.resetToken(request);
			objectDao.insertObjectForm(employeeForm);
		} else {
			this.saveToken(request);
			request.setAttribute("result", "�����ظ��ύ������");
		}
		return queryEmployee(mapping, form, request, response);
	}

	// ת���޸�Ա����ҳ��
	public ActionForward forwardUpdateEmployee(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		this.saveToken(request);
		String em_serialNumber = request.getParameter("em_serialNumber");
		String condition = "from EmployeeForm where em_serialNumber='"
				+ em_serialNumber + "'";

		EmployeeForm employeeForm = (EmployeeForm) objectDao
				.getObjectForm(condition);
		System.out.println("3213=" + employeeForm.getEm_sex());

		request.setAttribute("employeeForm", employeeForm);
		request.setAttribute("departmentList", objectDao
				.getObjectList("from DepartmentForm"));
		return mapping.findForward("forwardUpdateEmployee");
	}

	// �޸�Ա��
	public ActionForward updateEmployee(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		EmployeeForm employeeForm = (EmployeeForm) form;
		if (this.isTokenValid(request)) {
			this.resetToken(request);
			objectDao.updateObjectForm(employeeForm);
		} else {
			this.saveToken(request);
			request.setAttribute("result", "�����ظ��ύ������");
		}
		return queryEmployee(mapping, form, request, response);
	}

	// ɾ��Ա����Ϣ
	public ActionForward deleteEmployee(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String em_serialNumber = request.getParameter("em_serialNumber");
		String condition = "from EmployeeForm where em_serialNumber='"
				+ em_serialNumber + "'";
		EmployeeForm employeeForm = (EmployeeForm) objectDao
				.getObjectForm(condition);
		if (!objectDao.deleteObjectForm(employeeForm)) {
			request.setAttribute("result", "ɾ��Ա����Ϣʧ�ܣ����ܻ�������������Ϣ");
		}
		return mapping.findForward("operationEmployee");
	}

}
