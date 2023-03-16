//=======================================================================
//�ý��۱��� : CONSOLE
//����  ȯ��  : TOMCAT, MySql, JAVA
//���α׷��� : 
//��      ��     : ȸ������ (system ��� ���� �ֱ� )
//Ư��  ����  :  
//��	 ��  ��   : �� �� �� 
//��         ¥  : 2009-02-06
//======================================================================
package console.consolelogin.cmd;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import console.common.cmd.BaseCommand;
import console.common.execption.AppException;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.common.util.CommonUtil;
import console.consolelogin.dao.ConsoleJoinDao;

//=======================================================================
//								system ��� ���� �ֱ�   
//=======================================================================
public class ConsoleJoinSysCmd extends BaseCommand{
	public String str="testabc";
	public String checkbox="";
	
	public ConsoleJoinSysCmd() {
		setNextPage("/consolelogin/console_join_sys.jsp");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		ResultSetTray service_list     = null;			// ���� ���� ��� �ҷ� ���� 
		ResultSetTray app_system       = null;			// ��� �ý��� ��� �ҷ� ���� 
		
		try {
			ConsoleJoinDao dao = new ConsoleJoinDao();

			service_list=dao.service_list(getConnection(), reqTray); 	// ���� ���� ��� �ҷ� ����
			app_system= dao.app_system(getConnection(), reqTray);  		// ��� �ý��� ��� �ҷ� ���� 
			
			
			
		} catch (AppException ex) {
		throw ex;
	}
	catch (Exception ex) {
		throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)���� �Ϲ� ���� �߻�", ex);
	}
		finally{
			request.setAttribute("rsTray", service_list); 	 // ���� ���� ��� �ҷ� ����
			request.setAttribute("rsTray2", app_system);     // ��� �ý��� ��� �ҷ� ���� 

		}
	}
	
	
	
	
	
}
