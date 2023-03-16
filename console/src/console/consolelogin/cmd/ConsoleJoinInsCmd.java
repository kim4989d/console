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

import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import console.common.cmd.BaseCommand;
import console.common.execption.AppException;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.common.util.CommonUtil;
import console.consolelogin.dao.ConsoleJoinDao;

//=======================================================================
//								�α��� â  
//=======================================================================
public class ConsoleJoinInsCmd extends BaseCommand{
	public String str="testabc";
	public String checkbox="";
	
	public ConsoleJoinInsCmd() {
		setNextPage("/consolelogin/console_joinIns.jsp");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		ResultSetTray IdRepeat2      = null;  // ���̵� �ߺ� �˻� 
		ResultSetTray HpDuplicate 	 = null;  // �ڵ��� �ߺ� �˻�  
		ResultSetTray consolejoinin  = null;  // ����� ���� ��û ��� 
		ResultSetTray App_Service    = null;  // ��û ���� ��� 
		ResultSetTray App_Services   = null;  // ��û ���� ���(�ټ�)
		ResultSetTray Service_Id     = null;  // ��û�� ���񽺿�  service_id ���ϱ� 
		ResultSetTray rsTray7 	     = null;  // 
		ResultSetTray rsTray8 	     = null;  // temp_sys_id
		ResultSetTray rsTray9        = null;  // 
		
		ResultSetTray checkoptiontray     = null;

		int cnt = 0;					// ���̵� �ߺ� �˻� 
		int temp_len = 0;				// ��û ���� ���� 
		String svc_id = "";				// ���� ��û ���̵�
		String service_id = "";			// ��û ���� �ڸ��� 
		String service_id2 = "";		// ��û ���� �ڸ���2
		
		try {
			
			ConsoleJoinDao dao = new ConsoleJoinDao();
			
			if (reqTray.get("uKind").equals("O") && reqTray.get("service_id").equals("")) //����� �� ���� id Ȯ�� 
			{ setNextPage("/consolelogin/console_joinIns.jsp?value=1"); }
			
			if ((reqTray.get("uKind").equals("G")  || reqTray.get("uKind").equals("M")) && reqTray.get("sys_id").equals("")) //sys_id�� ������� 
			{ setNextPage("/consolelogin/console_joinIns.jsp?value=2"); }    
						
			IdRepeat2 = dao.IdRepeat2(getConnection(), reqTray);  						 //�Ƶ��� �ߺ� �˻� 
			cnt = Integer.parseInt(IdRepeat2.getString("cnt"));
			if(cnt > 0 ) 
			{ setNextPage("/consolelogin/console_joinIns.jsp?value=3"); }
			
			
			HpDuplicate = dao.HpDuplicate(getConnection(), reqTray); 				     // �ڵ��� �ߺ� �˻� 
			cnt = Integer.parseInt(HpDuplicate.getString("cnt"));
			if(cnt > 0 )
			{ setNextPage("/consolelogin/console_joinIns.jsp?value=4"); }
					
			

			//'����� ������ TBL_USER ����ϴ� ����(��� ������ ������ insert�� �� )
			consolejoinin = dao.consolejoinin(getConnection(), reqTray);				 //���� ��û �Ϸ� ������ 

				
		//'����� ���� ���п� �Ϲݻ���ڴ� TBL_USER_SYSTEM ����ڴ� TBL_SVC_USER �� ��� �ϴºκ�
		if(reqTray.get("uKind").equals("O")){
				//$svc_id=$row["service_id"];
				
				temp_len = 0; 
				StringTokenizer tokens = new StringTokenizer(reqTray.get("service_id"),","); //��û ���� ���� �ľ� 
				for( int x = 1; tokens.hasMoreElements(); x++ ){ 
			     System.out.println( "����" + x + " = " + tokens.nextToken() ); 
			     temp_len = +x;
				 }		 
				  
				if (temp_len == 0){
				App_Service = dao.App_Service(getConnection(), reqTray); 					//��û ���� ��� 
				}else{

				service_id = "";	   
				service_id = reqTray.getString("service_id");			   					// ��û ���� �ڸ��� 
				
				String[] temp_svc_id = service_id.split(",");
				
				for(int i=0; i<temp_svc_id.length; i++){
				System.out.println( "����" + (i) + " = " +temp_svc_id[i] ); 
				App_Services = dao.AppServices(getConnection(), reqTray, temp_svc_id[i]);	//��û �Ϸ� ������2-1
					}
				}
			
			
		}else{
			temp_len = 0; 
			StringTokenizer tokens = new StringTokenizer(reqTray.get("sys_id"),","); 		//���� ���� �ľ� 
			  for( int x = 1; tokens.hasMoreElements(); x++ ){ 
		     System.out.println( "����" + x + " = " + tokens.nextToken() ); 
		     temp_len = +x;
			  }
			  if (temp_len==0){
				Service_Id = dao.Service_Id(getConnection(), reqTray);						//��û ���� ���� �ľ�
				
				svc_id = "";
				svc_id = Service_Id.get("service_id");
				System.out.println(Service_Id.get("service_id"));
			
				
				
				rsTray7 = dao.consolejoinins3(getConnection(), reqTray, svc_id); //���� ��û �Ϸ� ������ 3
					
				
					
			  }else{
				    service_id2 = "";
 
					service_id2 = reqTray.getString("sys_id");					// ��û ���� �ڸ��� 
					String[] temp_sys_id = service_id2.split(",");

					for( int x = 0; x < temp_sys_id.length; x++ )
					{ 
					System.out.println( "����" + (x) + " = " +temp_sys_id[x] );   
						
					rsTray8 = dao.temp_sys_id(getConnection(), reqTray,  temp_sys_id[x]);
					
					service_id = "";
					service_id = rsTray8.get("service_id");
					
					rsTray9 = dao.consolejoinins4(getConnection(), reqTray, service_id , temp_sys_id[x]);
					}
			  	 } 
			}
			// mysql �ѹ� ó�� �κ� ���� �۾� �ؾ��� 
		
		} catch (AppException ex) {
		throw ex;
	}
	catch (Exception ex) {
		throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)���� �Ϲ� ���� �߻�", ex);
	}
		finally{
//			request.setAttribute("rsTray", rsTray);    //	���� ��û �Ϸ� ������1	
//			request.setAttribute("rsTray2", rsTray2);  //	���� ��û �Ϸ� ������2 
//			request.setAttribute("rsTray3", rsTray3);  //	���� ��û �Ϸ� ������3 
//			request.setAttribute("rsTray4", rsTray4);  //   ����� �з�2
//			request.setAttribute("rsTray5", rsTray5);  //   ���� ���� ��� �ҷ� ����
//			request.setAttribute("rsTray6", rsTray6);  //   ��û �ý��� �ҷ� ���� 			
//			request.setAttribute("checkbox",checkbox); //   CHECK �ڽ� 
		}
	}

}
