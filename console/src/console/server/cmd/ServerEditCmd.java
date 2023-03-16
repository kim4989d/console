//=======================================================================
//�ý��۱��� : CONSOLE
//����  ȯ��  : TOMCAT, MySql, JAVA
//���α׷��� : 
//��      ��    : �ý��� ���� 
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
//								�ý��� ����  �ϴ� â 
//=======================================================================
public class ServerEditCmd extends BaseCommand{
	public String str="testabc";
	public String checkbox="";
	
	public ServerEditCmd() {
		setNextPage("/server/server_edit.jsp");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		ResultSetTray rsTray     = null;
		ResultSetTray rsTray2     = null;
		ResultSetTray rsTray3     = null;
		ResultSetTray rsTray4     = null;
		ResultSetTray rsTray5     = null;
		ResultSetTray rsTray6     = null;
		ResultSetTray checkoptiontray = null;
		String  NT_port = "0";
		String port = "0";
		
//		String cmd=reqTray.get("cmd");
//		String write="";
		
		try {
			ListDao dao = new ListDao();
			
			//checkoptiontray=dao.ServerCheckBoxList(getConnection(),reqTray);
			//checkbox=	CommonUtil.ServerSelectBox(checkoptiontray,reqTray);
			
			rsTray=dao.ListReq(getConnection(),reqTray);	 // ��Ʈ ��ȣ 
			rsTray2=dao.ListReq2(getConnection(),reqTray);   // �Ҽ� ����  
			rsTray3=dao.ListReq3(getConnection(),reqTray);   // ����� 
			rsTray4=dao.ListReq4(getConnection(),reqTray);   // ������ 
			rsTray5=dao.ListEdit(getConnection(),reqTray);	 // ������ ��� �ҷ�����  
			
			
			for(int i=0;i<rsTray5.getRowCount();i++){
			System.out.println("###################### "+rsTray5.get("fixedflag"));
			}
			
			
			
			
			if(rsTray5.getString("ostype").equals("W"))
			{
				port = rsTray5.getString("port");
				rsTray6=dao.ListEditPort(getConnection(),reqTray,port); 
				NT_port = rsTray6.getString("seqno");
			}if(NT_port.equals("0") || NT_port.equals(""))
			{
				NT_port = (port);
			}
			
			
//			
//			if(rsTray5.getInt("port") != 0)
//			{
//				if (rsTray5.get("ostype").equals("W")){
//				port = rsTray5.getInt("port");
//				rsTray6=dao.ListEditPort(getConnection(),reqTray,port); 
//				
//				System.out.println("============================");
//				System.out.println((rsTray6.getString("seqno")));		   // ��Ʈ ��ȣ 	
//				System.out.println("============================");
//																		   //��� ��Ʈ ���� �޾ƿ� 
//				}
//			}
			
			
			
			
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
			request.setAttribute("rsTray5", rsTray5);   //������ ��� �ҷ� ����  
			request.setAttribute("rsTray6", rsTray6);   //������ ��� �ҷ� ����  
			request.setAttribute("NT_port", port	);	//������ �ý��� ��Ʈ ��ȣ �ҷ� ���� 
			
//			System.out.println(rsTray5);
//			System.out.println(port);

		}
	}
	
	
	
	
	
}
