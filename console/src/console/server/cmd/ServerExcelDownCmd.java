//=======================================================================
//�ý��۱��� : CONSOLE
//����  ȯ��  : TOMCAT, MySql, JAVA
//���α׷��� : 
//��      ��    : ���� �ٿ� �ε� 
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
//								���� �ٿ� �ε� 
//=======================================================================
public class ServerExcelDownCmd extends BaseCommand{
	public String str="testabc";
	public String checkbox="";
	
	public ServerExcelDownCmd() {
		setNextPage("/server/exceldown.jsp");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		ResultSetTray rsTray     = null;
		ResultSetTray rsTray2     = null;
		ResultSetTray checkoptiontray     = null;
		ResultSetTray checkoptiontray2     = null;
//		String cmd=reqTray.get("cmd");
//		String write="";
		
		try {
			ListDao dao = new ListDao();
		
//			checkoptiontray=dao.ServerCheckBoxList(getConnection(),reqTray);
//			checkbox =	CommonUtil.SelectBox(checkoptiontray,reqTray); // Select �� �ҷ��� (DBó�� )
						
			//rsTray=dao.EquipmentCount(getConnection(),reqTray);  /��ü ���ڵ带 ���ؿ� 
			rsTray2=dao.exceldown(getConnection(),reqTray);      //������� �ҷ��� (���� ����)
			
			System.out.println("=========================");
			System.out.println(rsTray);
			System.out.println(rsTray2);
			System.out.println("=========================");
		} catch (AppException ex) {
		throw ex;
	}
	catch (Exception ex) {
		throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)���� �Ϲ� ���� �߻�", ex);
	}
		finally{
			request.setAttribute("rsTray", rsTray);
			request.setAttribute("rsTray2", rsTray2);  //ȭ�鿡 �ѷ��� ��� ��� 
		//	request.setAttribute("checkbox",checkbox);
		}
	}
	
	
	
	
	
}
