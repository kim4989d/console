//=======================================================================
//�ý��۱��� : CONSOLE
//����  ȯ��  : TOMCAT, MySql, JAVA
//���α׷��� : 
//��      ��    : �ý��� ��� ��� (���� )
//Ư��  ����  :  
//��	 ��  ��   : �� �� �� 
//��         ¥  : 2009-02-06
//======================================================================
package console.user_board.cmd;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import console.common.cmd.BaseCommand;
import console.common.execption.AppException;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.user_window.dao.UserDao;
import console.common.util.CommonUtil;


//=======================================================================
//						�ý��� ��� ��� (����)
//=======================================================================
public class UserBoardCmd extends BaseCommand{
	public String str="testabc";
	public String checkbox="";
	
	public UserBoardCmd() {
		setNextPage("/user_board/board.jsp");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		ResultSetTray rsTray     = null;
		ResultSetTray UserWindowList     = null;
		ResultSetTray checkoptiontray     = null;
		
//		String cmd=reqTray.get("cmd");
//		String write="";
		
		try {
			UserDao dao = new UserDao();
			
			checkoptiontray	=	dao.ServerCheckBoxList(getConnection(),reqTray);
			checkbox 		=	CommonUtil.ServerSelectBox(checkoptiontray,reqTray);  // Select �� �ҷ��� (DBó�� )
			
			// ���̺� ��� ������ �ش� HISTORY�� �ش� ������ ������ ���� 
			// TBL_SYSTEM �� ���� ����� service_id�� ���� �ý��� ���� ����
			// rsTray  	   = dao.EquipmentListDel(getConnection(),reqTray);  		  // ����  TBL_USER_SYSTEM
			// EquipmentCount = dao.EquipmentCount(getConnection()  ,reqTray); 		  // ��ü ��� ���  
			UserWindowList = dao.UserWindowList(getConnection(), reqTray);
			
		} catch (AppException ex) {
		throw ex;
	}
	catch (Exception ex) {
		throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)���� �Ϲ� ���� �߻�", ex);
	}
		finally{
			request.setAttribute("rsTray", UserWindowList);
			//request.setAttribute("rsTray2", UserWindowList);
			//request.setAttribute("checkbox",checkbox);
		}
	}
	
	
	
	
	
}
