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
public class AdminUserJoinSysNameCmd extends BaseCommand{
	public String str="testabc";
	public String checkbox="";
	
	public AdminUserJoinSysNameCmd() {
		setNextPage("/admin/admin_user_join_sysname.jsp");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		ResultSetTray rsTray     = null;
		ResultSetTray rsTray2     = null;
		ResultSetTray checkoptiontray     = null;
		
		try {
			AdminDao dao = new AdminDao();
	
			rsTray=dao.JoinSysName(getConnection(),reqTray); 	// ���� ���� ��� �ҷ� ���� 
			rsTray2=dao.JoinSysName2(getConnection(),reqTray); 	// ���� ���� ��� �ҷ� ����2 
			
		} catch (AppException ex) {
		throw ex;
	}
	catch (Exception ex) {
		throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)", ex);
	}
		finally{
			request.setAttribute("rsTray", rsTray);  // ���� ���� ��� �ҷ� ����  
			request.setAttribute("rsTray2", rsTray2);  // ���� ���� ��� �ҷ� ����  
		}
	}
	
	
	
	
	
}
