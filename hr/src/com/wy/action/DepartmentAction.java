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
import com.wy.form.ManagerForm;

public class DepartmentAction extends DispatchAction {
	private ObjectDao objectDao;

	public ObjectDao getObjectDao() {
		return objectDao;
	}

	public void setObjectDao(ObjectDao objectDao) {
		this.objectDao = objectDao;
	}

	// ���Ų쿴����
	public ActionForward queryDepartment(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		List list = objectDao.getObjectList("from DepartmentForm order by id desc");
		request.setAttribute("list", list);
		request.setAttribute("employeeList", objectDao.getObjectList("from EmployeeForm"));
		return mapping.findForward("queryDepartment");
	}

	// ������Ϣ����
	public ActionForward insertDepartment(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		DepartmentForm departmentForm = (DepartmentForm) form;
		DepartmentForm departmentform = (DepartmentForm)objectDao
				.getObjectForm("from DepartmentForm where dt_name='"
						+ departmentForm.getDt_name() + "'");
		if (departmentform== null) {
			System.out.println(departmentForm.getDt_name());
			objectDao.insertObjectForm(departmentForm);
			return queryDepartment(mapping, form, request, response);
		} else {
			request.setAttribute("result", "���ܹ��ظ��ύ������");
			return mapping.findForward("operationDepartment");
		}
	}
	
	//������Ϣɾ��
	public ActionForward deleteDepartment(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		DepartmentForm departmentform = (DepartmentForm)objectDao
		.getObjectForm("from DepartmentForm where id='"
				+ request.getParameter("id") + "'");	
		if(objectDao.deleteObjectForm(departmentform)){			
		}else{
			request.setAttribute("result", "ɾ��������Ϣʧ�ܣ�����");
		}
		return mapping.findForward("operationDepartment");
	}
	
	
	
}
