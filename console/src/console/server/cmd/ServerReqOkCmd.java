//=======================================================================
//�ý��۱��� : CONSOLE
//����  ȯ��  : TOMCAT, MySql, JAVA
//���α׷��� : 
//��      ��    : �ý��� ��� ��� 
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
//								�ý��� ��� ��� �ϱ� 
//=======================================================================
public class ServerReqOkCmd extends BaseCommand{  
	public String str="testabc";
	public String checkbox="";

	
	public ServerReqOkCmd() {
		setNextPage("/server/server_req_ok.jsp");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		ResultSetTray rsTray     = null;		 // TBL_SYSTEM => system_id ���� ��
		ResultSetTray rsTray2     = null;		 // service_id , charger_id ���� ��
		ResultSetTray rsTray3     = null;		 // OS_TYPE���� "W" �̸� ����
		ResultSetTray rsTray4     = null;		 // �ý��� ��� �ϱ� 
		ResultSetTray rsTray5     = null;		 // �ý��� HISTORY ��� �ϱ�
		ResultSetTray checkoptiontray = null;
		int port = 0;
//		String message="";
		
//		String cmd=reqTray.get("cmd");
//		String write="";
//		�ý��� ��� ��� �ϱ� 	
		try {
			ListDao dao = new ListDao();
			
			checkoptiontray=dao.ServerCheckBoxList(getConnection(),reqTray);	 //äũ �ڽ� ����Ʈ �ҷ� ���� 
			checkbox =	CommonUtil.ServerSelectBox(checkoptiontray,reqTray); //select �ڽ� ��� 
			
			String PARA = reqTray.getString("PARA");	      			 // $PARA = $_SERVER["QUERY_STRING"];
			
			rsTray=dao.ServerReqOk(getConnection(),reqTray);   			 //TBL_SYSTEM => system_id ���� ��
			
			int cnt = Integer.parseInt(rsTray.get("cnt"));				 //cnt(�� ���ڵ���� �ҷ���), �ߺ� üũ 
			
		if(cnt>0){  //�ش� ���̵� ������ ��� �������� �̵�
					setNextPage("server.do?cmd=server_duplicate&i=1&"+PARA);	
			}
		else{		// �ش� ���̵� �������� ���� ��� ������ ���� ���� 
			//rsTray2=dao.ServerReqOk2(getConnection(),reqTray);			//service_id , charger_id ���� ��
		
/**
 * ******************* �ÿ��� �ӽ� ����******************** 			
		if(rsTray2.getRowCount()==0){									//���� ��������� 
					setNextPage("server.do?cmd=server_duplicate&i=2"+PARA);
		}
		else{
		
			//�ش� ��Ʈ ��ȣ ���ؿ� "W" �� ��� 
				
				System.out.println("============================");	
				System.out.println(reqTray.getString("os_type"));
				System.out.println("============================");	
				
			if(reqTray.getString("os_type").equals("W") || reqTray.getString("os_type")=="W")//OS_TYPE���� "W" �̸� ����	
			{
				rsTray3=dao.ServerReqOk3(getConnection(),reqTray); 
				port = Integer.parseInt(rsTray3.get("port"));
				}
	//		}else{																 //OS_TYPE "U" �ϰ��� �ش� ��Ʈ�� �ʿ� ����. 
	//			//port = 23;	         										 //���� ��Ʈ ��� �ϱ� UNIX
	//			}
				rsTray4=dao.ServerReqOk4(getConnection(),reqTray,port);			 //�ý��� ��� �ϱ�
				rsTray5=dao.ServerReqOk5(getConnection(),reqTray,port);			 //�ý���HITORY ��� �ϱ� 
				
				
	//		   QUERY�� Ȯ�� �ϱ� ���� 
				System.out.println(rsTray);    									 //  TBL_SYSTEM => system_id ���� ��
				System.out.println(rsTray2);   									 // service_id , charger_id ���� ��
				System.out.println(rsTray3);   									 // OS_TYPE ����  'W' �̸� ���� ��Ŵ
				System.out.println(rsTray4);   									 // �ý��� ��� �ϱ� 
				System.out.println(rsTray5);   									 // �ý��� HISTORY ��� �ϱ�
			
			}
**************************************************************/

			rsTray4=dao.ServerReqOk4(getConnection(),reqTray,port);			 //�ý��� ��� �ϱ�
			rsTray5=dao.ServerReqOk5(getConnection(),reqTray,port);			 //�ý���HITORY ��� �ϱ� 
		
		}
			
		} catch (AppException ex) {
		throw ex;
	}
	catch (Exception ex) {
		throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)���� �Ϲ� ���� �߻�", ex);
	}
		finally{
			request.setAttribute("rsTray", rsTray);						//  TBL_SYSTEM => system_id ���� ��
			request.setAttribute("rsTray2", rsTray2);   				// service_id , charger_id ���� ��
			request.setAttribute("rsTray3", rsTray3);   				// OS_TYPE ����  'W' �̸� ���� ��Ŵ
			request.setAttribute("rsTray4", rsTray4);   				// �ý��� ��� �ϱ�
			request.setAttribute("rsTray5", rsTray5);   				// �ý��� HISTORY ��� �ϱ� 
			
		}
	}
	
}
