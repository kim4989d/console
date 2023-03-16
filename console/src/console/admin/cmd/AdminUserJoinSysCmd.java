package console.admin.cmd;
//=======================================================================
//�ý��۱��� : CONSOLE
//����  ȯ��  : TOMCAT, MySql, JAVA
//���α׷��� : 
//��      ��     : ȸ������ (system ��� ���� �ֱ� )
//Ư��  ����   :  
//======================================================================


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import console.common.cmd.BaseCommand;
import console.common.execption.AppException;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.common.util.CommonUtil;
import console.admin.dao.AdminDao;

//=======================================================================
//								system ��� ���� �ֱ�   
//=======================================================================
public class AdminUserJoinSysCmd extends BaseCommand{
	public String str="testabc";
	public String checkbox="";
	
	public AdminUserJoinSysCmd() {
		setNextPage("/admin/admin_user_join_sys.jsp");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		ResultSetTray rsTray     = null;			// ���� ���� ��� �ҷ� ���� 
		ResultSetTray rsTray2     = null;			// ��� �ý��� ��� �ҷ� ���� 
		try {
			AdminDao dao = new AdminDao();
			
	
			rsTray=dao.service_list(getConnection(), reqTray); 	// ���� ���� ��� �ҷ� ����
			rsTray2= dao.app_system(getConnection(), reqTray);  // ��� �ý��� ��� �ҷ� ���� 
			
			
			
		} catch (AppException ex) {
		throw ex;
	}
	catch (Exception ex) {
		throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)", ex);
	}
		finally{
			request.setAttribute("rsTray", rsTray); 	 // ���� ���� ��� �ҷ� ����
			request.setAttribute("rsTray2", rsTray2);    // ��� �ý��� ��� �ҷ� ���� 
		}
	}
	
	
	
	
	
}
