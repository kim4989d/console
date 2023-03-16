package console.admin.cmd;
//=======================================================================
//�ý��۱��� : CONSOLE
//����  ȯ��  : TOMCAT, MySql, JAVA
//���α׷��� : 
//��      ��     : ȸ������ 
//Ư��  ����   :  
//======================================================================


import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import console.common.cmd.BaseCommand;
import console.common.execption.AppException;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.admin.dao.AdminDao;




public class AdminUserJoinInsCmd extends BaseCommand{
	public String str="testabc";
	
	public AdminUserJoinInsCmd() {
		setNextPage("/admin/admin_user_joinIns.jsp");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		ResultSetTray rsTray      = null;  // ���� ��û �Ϸ� ������1 
		ResultSetTray rsTray2     = null;  // ���� ��û �Ϸ� ������2 
		ResultSetTray rsTray3     = null;  // ���� ��û �Ϸ� ������3 
		ResultSetTray rsTray4     = null;  // ���̵� �ߺ� Ȯ�� 
		ResultSetTray rsTray5     = null;  // �ڵ��� �ߺ� Ȯ�� 
		ResultSetTray rsTray6     = null;  // svc_id
		ResultSetTray rsTray7 	  = null;  // 
		ResultSetTray rsTray8 	  = null;  // temp_sys_id
		ResultSetTray rsTray9     = null;  // 
		
		int cnt = 0;
		
		try {
			
			AdminDao dao = new AdminDao();
			
			
			if (reqTray.get("kind").equals("O") && reqTray.get("service_id").equals(""))
			{ setNextPage("/admin/admin_user_joinIns.jsp?value=1"); }
			
			if ((reqTray.get("kind").equals("G")  || reqTray.get("kind").equals("M")) && reqTray.get("sys_id").equals(""))
			{ setNextPage("/admin/admin_user_joinIns.jsp?value=2"); }
						
			rsTray = dao.IdRepeat2(getConnection(), reqTray);
			cnt = Integer.parseInt(rsTray.getString("cnt"));
			if(cnt > 0 ) 
			{ setNextPage("/admin/admin_user_joinIns.jsp?value=3"); }
			
			
			rsTray2 = dao.HpDuplicate(getConnection(), reqTray);
			cnt = Integer.parseInt(rsTray2.getString("cnt"));
			if(cnt > 0 )
			{ setNextPage("/admin/admin_user_joinIns.jsp?value=4"); }
					
			
			

				//'����� ������ TBL_USER ����ϴ� ����
			rsTray3 = dao.adminInsert(getConnection(), reqTray);								//���� ��û �Ϸ� ������ 
			

				
				//'����� ���� ���п� �Ϲݻ���ڴ� TBL_USER_SYSTEM ����ڴ� TBL_SVC_USER �� ��� �ϴºκ�
			if(reqTray.get("kind").equals("A")){
				//�ƹ��۾� ���� �ʴ´�.
			}
			else if(reqTray.get("kind").equals("O")){
				int temp_len = 0; 
				StringTokenizer tokens = new StringTokenizer(reqTray.get("service_id"),","); 	//��û ���� ���� �ľ� 
				
				for( int x = 1; tokens.hasMoreElements(); x++ ){ 
			     temp_len = +x;
				}		 
				  
				if (temp_len == 0){
					rsTray4 = dao.consolejoinins2(getConnection(), reqTray); 					//��û �Ϸ� ������2
				}else{
					rsTray5 = dao.consolejoinins2_1(getConnection(), reqTray);					//��û �Ϸ� ������2-1
				}
			}else if(reqTray.get("kind").equals("G") && reqTray.get("kind").equals("M")){
				int temp_len = 0; 
				StringTokenizer tokens = new StringTokenizer(reqTray.get("sys_id"),","); 		//���� ���� �ľ�
				
				for( int x = 1; tokens.hasMoreElements(); x++ ){ 
					temp_len = +x;
				}
				  if (temp_len==0){
					rsTray6 = dao.svc_id(getConnection(), reqTray);								//��û ���� ���� �ľ�
					
					String svc_id = "";
					svc_id = rsTray6.get("service_id");
					
					rsTray7 = dao.admdinUserSystmeIns(getConnection(), reqTray, svc_id);		//���� ��û �Ϸ� ������ 3
					
				 }else{
					  String service_id2 = "";


					service_id2 = reqTray.getString("sys_id");									// ��û ���� �ڸ��� 
					String[] temp_sys_id = service_id2.split(",");

					for( int x = 0; x < temp_sys_id.length; x++ )
					{ 
					System.out.println( "����" + (x) + " = " +temp_sys_id[x]);   
						
					rsTray8 = dao.temp_sys_id(getConnection(), reqTray,  temp_sys_id[x]);
					
					String service_id = "";
					service_id = rsTray8.get("service_id");
					
					rsTray9 = dao.consolejoinins4(getConnection(), reqTray, service_id , temp_sys_id[x]);			//�ѹ� ó�� �κ� 
					}
			  	 }
			}
				
			
		} catch (AppException ex) {
		throw ex;
	}
	catch (Exception ex) {
		throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)", ex);
	}
		finally{
		}
	}

}
