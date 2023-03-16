//=======================================================================
//�ý��۱��� : CONSOLE
//����  ȯ��  : TOMCAT, MySql, JAVA
//���α׷��� : 
//��      ��    : ȸ������
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
//										�α��� â  
//=======================================================================
public class ConsoleJoinCmd extends BaseCommand{
	public String str="testabc";
	public String checkbox="";
	
	public ConsoleJoinCmd() {
		setNextPage("/consolelogin/console_join.jsp");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		ResultSetTray Company_Id      = null;  		 // �Ҽӻ� �ҷ����� 
		ResultSetTray User_Id         = null;        // ������ �ҷ����� 
		ResultSetTray User_Id2        = null;        // ������ �ҷ����� 2		
		
		ResultSetTray checkoptiontray     = null;
		
		try {
			ConsoleJoinDao dao = new ConsoleJoinDao();

			Company_Id	=	dao.Company_Id(getConnection(),reqTray); 	   	   	   // �Ҽӻ� �ҷ����� 
			User_Id		=	dao.User_Id   (getConnection(),reqTray);	   		   // ������ �ҷ����� 
			User_Id2	=	dao.User_Id2  (getConnection(),reqTray);	  		   // ������ �ҷ����� 2
			
		} catch (AppException ex) {
		throw ex;
	}
	catch (Exception ex) {
		throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)���� �Ϲ� ���� �߻�", ex);
		}
		finally{
			request.setAttribute("rsTray", Company_Id);    // �Ҽӻ� �ҷ����� 
			request.setAttribute("rsTray2", User_Id);  	   // ������ �ҷ����� 
			request.setAttribute("rsTray3", User_Id2);     // ������ �ҷ����� 2
			//request.setAttribute("checkbox",checkbox);
		}
	}
	
	
	
	
	
}
