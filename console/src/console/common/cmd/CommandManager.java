package console.common.cmd;

import java.util.HashMap;
import java.util.Map;

/**
 * 
 * @author ����ȣ
 * �ۼ����� 2009.1.13
 * ����: ������ flag 
 */


public class CommandManager {
	
	public Map getCommandMapping() {
		Map map = new HashMap();
		
		
		
		map.put("test",          "console.list.cmd.TestCmd");
		
		

		map.put("list",          "console.list.cmd.BoardCmd");
		map.put("read",          "console.list.cmd.ReadCmd");
		map.put("write",         "console.list.cmd.InsertCmd");
		
		
		//---------------------------�α���---------------------------------------------------	
		map.put("console_login",         "console.login.cmd.LoginCmd");
		
		// ȸ������ ������ 				������� ��û ������ 
		map.put("console_join",          "console.consolelogin.cmd.ConsoleJoinCmd");     
		
		// ���̵� �ߺ� Ȯ�� ������               ������Ͻ� ���̵� �ߺ� �˻� �ϱ� 
		map.put("console_id_repeat",	 "console.consolelogin.cmd.ConsoleIdRepeatCmd");
		
		// ȸ�� ���� Ȯ�� ������ 			���� ��� �Ϸ� / ���� 
		map.put("console_joinIns",		"console.consolelogin.cmd.ConsoleJoinInsCmd");	
		
		// ȸ������(���) 
		map.put("console_join_sys",      "console.consolelogin.cmd.ConsoleJoinSysCmd");
		
		// ȸ������(���)
		map.put("console_join_sys_name", "console.consolelogin.cmd.ConsoleJoinSysNameCmd");   
		
	
	//-------------------------------------------------------------------------------------	
		
		
		

//		---------------------------��û��Ȳ ---------------------------------------------------	
		map.put("require_unix_list",          		"console.require.cmd.RequireUnixCmd");		 //unix �۾���û ��Ȳ List
		map.put("unix_work_pop", 					"console.require.cmd.RequireAccountCmd");	 //(pop-up)����/�ݷ� ó�� Page 			 
		map.put("unix_equip_list", 					"console.require.cmd.RequireEquipListCmd");  //(pop-up)��Ͻý��� List 			
		map.put("unix_update", 						"console.require.cmd.RequireUnixUpdateCmd"); //(pop-up)��Ͻý��� List 			

		
		map.put("require_user_list", 				"console.require.cmd.RequireUserCmd"); 		 		//user ������û ��Ȳ  			
		map.put("require_user_update_list", 		"console.require.cmd.RequireUserUpdateCmd"); 		//user ������û ��Ȳ  			

		map.put("require_test", 		"console.require.cmd.RequireTestCmd"); 		//user ������û ��Ȳ  			

//		map.put("require_write",          		"console.require.cmd.InsertCmd");
//		map.put("require_update",          		"console.require.cmd.UupdateCmd");
//		map.put("require_delete",          		"console.require.cmd.DeleteCmd");
		
		
		
		
		
		
		
			

	//---------------------------�۾�����---------------------------------------------------	
		//�۾����� �۾����� ����
		map.put("work_list",          "console.work.cmd.WorkCmd");
		map.put("work_write",          "console.work.cmd.InsertCmd");
		map.put("work_update",          "console.work.cmd.UupdateCmd");
		map.put("work_delete",          "console.work.cmd.DeleteCmd");
	
		//�۾����� �۾��Ϸ� ����			
		map.put("worked_list",          "console.worked.cmd.WorkedCmd");		
	//-------------------------------------------------------------------------------------
	
		
		
	//---------------------------���񽺰���---------------------------------------------------	
		/*
		* name   : ���漷
		* e-mail : 
		* date   : 2009-02-07 
		*  
		* name   : �ֽ���
		* e-mail : halfodys@gmail.com
		* date   : 2009-02-07
		* memo   : service_list�� require���� ����ϰ� ���� service_admin_list�� ��ó
		*/
		
		map.put("service_list",           "console.service.cmd.ListCmd");
		map.put("service_write",          "console.service.cmd.InsertCmd");
		map.put("service_update",         "console.service.cmd.UupdateCmd");
		map.put("service_delete",         "console.service.cmd.DeleteCmd");

		//������Ȳ list ��ȸ
		map.put("service_admin_list",     "console.service.cmd.ServiceCmd");

		//���� ��������  �˾�
		map.put("service_edit",     	  "console.service.cmd.ServiceUpdateCmd");
		
		//���� �������� �˾�
		map.put("service_oper_reg",       "console.service.cmd.ServiceOperRegCmd");						
	//-------------------------------------------------------------------------------------
	
		
		
	//---------------------------������---------------------------------------------------	
	// 	�ۼ���  : ����� 
	// 	�ý��۱��� : ��� ����  
	//	��      ��     : ��� ���� ��ü Cmd 
	// 	�� 	¥      :  09 - 1 - 29	
		

		// ��� ���(�������)   �ش� ���鿡 ����Ʈ (�������) 
		map.put("server_list",          "console.server.cmd.ServerListCmd");    
		
		//	�ý������ ���          ���������� ��� ��� ��ư�� Ŭ���ϸ� �ش� �������� �˾��������� �����
		map.put("server_req",			"console.server.cmd.ServerListReqCmd"); 
		
		// ��� ó�� 			  ��� ����ؼ� �ش� ����Ʈ �������� �ٽ� �̵� �� 
		map.put("server_req_ok",		"console.server.cmd.ServerReqOkCmd");	
		
		//	�ߺ� Ȯ��                     ����� ��� id �ߺ� �� 
		map.put("server_duplicate",		"console.server.cmd.ServerDuplicateCmd");  
		
		//  ���� �ٿ� �ε�		 ��� ����Ʈ�� ������ �ٿ�ε� 
		map.put("exceldown", 			"console.server.cmd.ServerExcelDownCmd");
		
		//	��� ���� ������         �ش� ���鿡 ����Ʈ(����)
		map.put("server_del",			"console.server.cmd.ServerListDelCmd");  
		
		//  ��� ���� �Ϸ�           ������ �Ϸ�Ǹ� �ش� �������� �ٽ� �̵� 
		map.put("server_del_ok",		"console.server.cmd.ServerListDelOkCmd"); 

		//  ��� ���� 			������ ��� ���� ����� �ҷ��� 
		map.put("server_edit",			"console.server.cmd.ServerEditCmd");
		
		 // ��� ���� �Ϸ�          ������ ��� ����� �ٽ� insert �� 
		map.put("server_editIns",		"console.server.cmd.ServerEditInsCmd");	  
		
		
		map.put("server_write",          "console.server.cmd.InsertCmd");
		map.put("server_update",          "console.server.cmd.UupdateCmd");
		map.put("server_delete",          "console.server.cmd.DeleteCmd");
	
	//-------------------------------------------------------------------------------------
		
	
		
	//---------------------------����ڰ���---------------------------------------------------	
		map.put("admin_user_reapeat",          		"console.admin.cmd.AdminUseridReapeatCmd");
		map.put("admin_user_join",          		"console.admin.cmd.AdminUserJoinCmd");
		map.put("admin_user_joinins",          		"console.admin.cmd.AdminUserJoinInsCmd");
		map.put("admin_user_joinsys",         		"console.admin.cmd.AdminUserJoinSysCmd");
		map.put("admin_user_joinname",          	"console.admin.cmd.AdminUserJoinSysNameCmd");
		
		
		//����� ��� �����ֱ� 
		map.put("admin_user_list",       "console.admin.cmd.AdminUserListCmd");
		
		//�ý��� ��� �����ֱ� 
		map.put("admin_user_system_list",       	"console.admin.cmd.AdminUserSystemListCmd");
		
		//����� ���� �ϱ� 
		map.put("admin_user_edit",		 "console.admin.cmd.AdminUserEditCmd");						//admin.do?cmd=admin_user_edit
		
		
		map.put("admin_write",           "console.admin.cmd.InsertCmd");
		map.put("admin_update",          "console.admin.cmd.UupdateCmd");
		map.put("admin_delete",          "console.admin.cmd.DeleteCmd");
	
	//-------------------------------------------------------------------------------------
		

	//---------------------------�ڵ����---------------------------------------------------	
	/*
	* name   : �ֽ���
	* e-mail : halfodys@gmail.com
	* date   : 2009-02-07 
	*/
	    //�ڵ���� : ȸ���ڵ� ��Ȳ
		map.put("company_list",          "console.company.cmd.CompanyCmd");
	    //�ڵ���� : �������ڵ� ��Ȳ
		map.put("product_list",          "console.product.cmd.ProductCmd");
	//-------------------------------------------------------------------------------------		
		
			
	/*************************** �Ϲݻ���� ���� **********************************************/
	
	//-------------------------- Unix �۾���û   ----------------------------------------------
		map.put("unix_list", "console.user.regist.cmd.UnixJobCmd");
	//-------------------------- �Ϲ� ���� ����  ----------------------------------------------
		map.put("user_main", 		"console.user_main.cmd.UserMainCmd"); //usermain.do
		
	//-------------------------- ������ ��� ���   ----------------------------------------------
		
		map.put("user_unix_list", 		"console.user_unix.cmd.UserUnixCmd"); //usermain.do	���н� ��� ��

	//-------------------------- ������ ��� ���   ----------------------------------------------
		map.put("user_win_list", 	"console.user_window.cmd.UserWindowCmd"); //usermain.do ������ ��� ���
	
	//-------------------------- �Ϲ� ����� �Խ���    ----------------------------------------------	
		map.put("user_main"	   , 	"console.user_main.cmd.UserBoardCmd"); //usermain.do
		map.put("user_board"	,	"console.user_board.cmd.UserBoardCmd");//�Խ��� 
		
		map.put("user_uni_systemList",          "console.usermode.cmd.UserUniSystemListCmd");
		
		
		
		return map;
	}
}