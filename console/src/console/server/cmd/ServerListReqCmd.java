//=======================================================================
//�ý��۱��� : CONSOLE
//����  ȯ��  : TOMCAT, MySql, JAVA
//���α׷��� : 
//��      ��    : �ý��� ���  
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
//						�ý��� ��� �ϴ� â 
//=======================================================================
public class ServerListReqCmd extends BaseCommand{
	public String str="testabc";
	public String checkbox="";

	
	public ServerListReqCmd() {
		setNextPage("/server/server_req.jsp");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		ResultSetTray rsTray     = null;
		ResultSetTray rsTray2     = null;
		ResultSetTray rsTray3     = null;
		ResultSetTray rsTray4     = null;
		ResultSetTray rsTray5     = null;
		ResultSetTray checkoptiontray = null;
		
		
//		String cmd=reqTray.get("cmd");
//		String write="";
		
		try {
			ListDao dao = new ListDao();
			
			checkoptiontray=dao.ServerCheckBoxList(getConnection(),reqTray);
//			checkbox=	CommonUtil.ServerSelectBox(checkoptiontray,reqTray);

			rsTray=dao.ListReq(getConnection(),reqTray);	 // ��Ʈ ��ȣ 
			rsTray2=dao.ListReq2(getConnection(),reqTray);   // �Ҽ� ����  
			rsTray3=dao.ListReq3(getConnection(),reqTray);   // ����� 
			rsTray4=dao.ListReq4(getConnection(),reqTray);   // ������ 
			
			
			
			//System.out.println(rsTray2);
			
		} catch (AppException ex) {
		throw ex;
	}
	catch (Exception ex) {
		throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)���� �Ϲ� ���� �߻�", ex);
	}
		finally{
			request.setAttribute("rsTray", rsTray); 	// ��Ʈ ��ȣ 
			request.setAttribute("rsTray2", rsTray2);   //�ҼӼ��� 
			request.setAttribute("rsTray3", rsTray3);   //�����
			request.setAttribute("rsTray4", rsTray4);   //������ 
			System.out.println(rsTray2);
		}
	}
	
	
	
	
	
}
