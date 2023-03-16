//=======================================================================
//�ý��۱��� : CONSOLE
//����  ȯ��  : TOMCAT, MySql, JAVA
//���α׷��� : 
//��      ��     : ȸ������ (system ��� ���� �ֱ� )
//Ư��  ����   :
//��   ��   �� : ��  ��  �� 
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
public class ConsoleJoinSysNameCmd extends BaseCommand{
	public String str="testabc";
	public String checkbox="";
	
	public ConsoleJoinSysNameCmd() {
		setNextPage("/consolelogin/console_join_sys_name.jsp");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		ResultSetTray JoinSysName     		= null;		
		ResultSetTray JoinSysName2    		= null;
		ResultSetTray checkoptiontray       = null;
		
		try {
			ConsoleJoinDao dao = new ConsoleJoinDao();
			
			JoinSysName=dao.JoinSysName(getConnection(),reqTray); 			// ���� ���� ��� �ҷ� ���� 
			JoinSysName2=dao.JoinSysName2(getConnection(),reqTray); 	    // ���� ���� ��� �ҷ� ����2 
			
		} catch (AppException ex) {
		throw ex;
	}
	catch (Exception ex) {
		throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)���� �Ϲ� ���� �߻�", ex);
	}
		finally{
			request.setAttribute("rsTray", JoinSysName);  // ���� ���� ��� �ҷ� ����  
			request.setAttribute("rsTray2", JoinSysName2);  // ���� ���� ��� �ҷ� ����  
		//	request.setAttribute("checkbox",checkbox);
		}
	}
	
	
	
	
	
}
