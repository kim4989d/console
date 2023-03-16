//=======================================================================
//�ý��۱��� : CONSOLE
//����  ȯ��  : TOMCAT, MySql, JAVA
//���α׷��� : 
//��      ��    : �ý��� ���� �Ϸ� 
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
//								�ý��� ���  ����  �Ϸ�  
//=======================================================================
public class ServerEditInsCmd extends BaseCommand{
	public String str="testabc";
	public String checkbox="";
	
	public ServerEditInsCmd() {
		setNextPage("/server/server_editIns.jsp");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		ResultSetTray rsTray      = null;	// ������ SeqNo �ҷ����� 
		ResultSetTray rsTray2     = null;	// os_type �� NT(W)�� ��� ������ PORT , OLD_PORT ���ϱ�
		ResultSetTray rsTray3     = null;	// ����(PORT_UPDATE)������Ʈ �ϱ�
		ResultSetTray rsTray4     = null;	// TEMP_TYPE ��UNIX(U) �� ��� ������  PORT , OLD_PORT ���ϱ�
		ResultSetTray rsTray5     = null;	// UPDATE TBL_SYSTEM 
		ResultSetTray rsTray6     = null;	// TBL_SYSTEM_HISTORY ����   
		ResultSetTray rsTray7     = null;	// ervice_id != pre_svc�ϰ�� ����  

		
		ResultSetTray checkoptiontray = null;
		int port = 0;
		int seqNo = 0;
		int new_port = 0;
//		String cmd=reqTray.get("cmd");
//		String write="";
		String os_type = reqTray.getString("os_type");  
		String temp_type = reqTray.getString("temp_type");   
		String service_id = reqTray.getString("service_id");  
		String pre_svc = reqTray.getString("pre_svc");     
		
		try {
			ListDao dao = new ListDao();
			
			checkoptiontray=dao.ServerCheckBoxList(getConnection(),reqTray);
			checkbox=	CommonUtil.ServerSelectBox(checkoptiontray,reqTray);
			
			rsTray=dao.ListEditSeqNo(getConnection(),reqTray);	   						// ������ SeqNo �ҷ����� 
			 seqNo = rsTray.getInt("ifnull(max(seqno),0)+1");							// seqNo �� �ҷ��� 
	
			if (os_type.equals("W") && temp_type.equals("W")){ 	  					    // os_type ���� �� 
			rsTray2=dao.ListEditSeqPortW(getConnection(),reqTray);  					// os_type �� NT(W)�� ��� ������ PORT , OLD_PORT ���ϱ�
			rsTray3=dao.ListEditSeqPortUp(getConnection(),reqTray , seqNo , rsTray2); 	// ����(PORT_UPDATE)������Ʈ �ϱ�
			}
			else if(os_type.equals("W") &&  temp_type.equals("U")){		
			rsTray4=dao.ListEditSeqPortU(getConnection(),reqTray);  					// TEMP_TYPE ��UNIX(U) �� ��� ������  PORT , OLD_PORT ���ϱ�
					new_port = rsTray4.getInt("port");
			}
			
			rsTray5=dao.UPDATE_TBL_SYSTEM(getConnection(),reqTray,new_port);			// UPDATE TBL_SYSTEM 
			rsTray6=dao.TblSystem_History_In(getConnection(),reqTray,new_port);			// TBL_SYSTEM_HISTORY ����   
			
			if(service_id != pre_svc){
			rsTray7=dao.TBL_UserSystemDel(getConnection(),reqTray);    					// ervice_id != pre_svc�ϰ�� ����  
			}

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
			System.out.println(rsTray5);
			System.out.println(port);

		}
	}
	
	
	
	
	
}
