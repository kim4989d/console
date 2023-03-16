//=======================================================================
//�ý��۱��� : CONSOLE
//����  ȯ��  : TOMCAT, MySql, JAVA
//���α׷��� : 
//��      ��    : �ý��� ��� ���(����)
//Ư��  ����  :  
//��	 ��  ��   : �� �� �� 
//��         ¥  : 2009-02-06
//======================================================================
package console.server.cmd;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import console.common.cmd.BaseCommand;
import console.common.execption.AppException;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.server.dao.ListDao;
import console.common.util.CommonUtil;


//=======================================================================
//						�ý��� ��� ��� (����)
//=======================================================================
public class ServerListDelOkCmd extends BaseCommand{
	public String str="testabc";
	public String checkbox="";
	
	public ServerListDelOkCmd() {
		setNextPage("/server/server_del_ok.jsp");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		ResultSetTray rsTray_H     = null;
		ResultSetTray rsTray2     = null;
		ResultSetTray rsTray3    = null;
		ResultSetTray rsTray4     = null;
		
		ResultSetTray checkoptiontray     = null;
		
//		String cmd=reqTray.get("cmd");
//		String write="";
		
		try {
			ListDao dao = new ListDao();
			
			checkoptiontray=dao.ServerCheckBoxList(getConnection(),reqTray);
			////checkbox =	CommonUtil.ServerSelectBox(checkoptiontray,reqTray);  // Select �� �ҷ��� (DBó�� )
			
			// ���̺� ��� ������ �ش� HISTORY�� �ش� ������ ������ ���� 
			// TBL_SYSTEM �� ���� ����� service_id�� ���� �ý��� ���� ����
			rsTray_H=dao.EquipmentListDelInsert(getConnection(),reqTray);  		// ���� ��  HISTORY �� ������ ������ �ҷ���
			rsTray2=dao.EquipmentListDel(getConnection(),reqTray, rsTray_H);    // ���� �� HISTORY �� ����
			rsTray3=dao.EquipmentListDelOk(getConnection(),reqTray);		    // ����  TBL_SYSTEM
			rsTray4=dao.EquipmentListDelOk2(getConnection(),reqTray);           // ����  TBL_USER_SYSTEM
			
		} catch (AppException ex) {
		throw ex;
	}
	catch (Exception ex) {
		throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)���� �Ϲ� ���� �߻�", ex);
	}
		finally{
			//request.setAttribute("rsTray", rsTray);
			//request.setAttribute("checkbox",checkbox);
		}
	}
	
	
	
	
	
}
