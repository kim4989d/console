package console.common.cmd;

import java.util.HashMap;
import java.util.Map;

/**
 * 
 * @author 김현호
 * 작성요일 2009.1.13
 * 설명: 페이지 flag 
 */


public class CommandManager {
	
	public Map getCommandMapping() {
		Map map = new HashMap();

		map.put("list",          "console.list.cmd.BoardCmd");
		map.put("read",          "console.list.cmd.ReadCmd");
		map.put("write",         "console.list.cmd.InsertCmd");
		
		
		//---------------------------로그인---------------------------------------------------	
		map.put("console_login",         "console.login.cmd.LoginCmd");
		
		// 회원가입 페이지 				계정등록 신청 페이지 
		map.put("console_join",          "console.consolelogin.cmd.ConsoleJoinCmd");     
		
		// 아이디 중복 확인 페이지               계정등록시 아이디 중복 검사 하기 
		map.put("console_id_repeat",	 "console.consolelogin.cmd.ConsoleIdRepeatCmd");
		
		// 회원 가입 확인 페이지 			계정 등록 완료 / 실패 
		map.put("console_joinIns",		"console.consolelogin.cmd.ConsoleJoinInsCmd");	
		
		// 회원가입(장비) 
		map.put("console_join_sys",      "console.consolelogin.cmd.ConsoleJoinSysCmd");
		
		// 회원가입(장비)
		map.put("console_join_sys_name", "console.consolelogin.cmd.ConsoleJoinSysNameCmd");   
		
	
	//-------------------------------------------------------------------------------------	
		
		
		

//		---------------------------신청현황 ---------------------------------------------------	
		map.put("require_unix_list",          		"console.require.cmd.RequireUnixCmd");		 //unix 작업신청 현황 List
		map.put("unix_work_pop", 					"console.require.cmd.RequireAccountCmd");	 //(pop-up)승인/반려 처리 Page 			 
		map.put("unix_equip_list", 					"console.require.cmd.RequireEquipListCmd");  //(pop-up)등록시스템 List 			
		map.put("unix_update", 						"console.require.cmd.RequireUnixUpdateCmd"); //(pop-up)등록시스템 List 			

		
		map.put("require_user_list", 				"console.require.cmd.RequireUserCmd"); 		 		//user 계정신청 현황  			
		map.put("require_user_update_list", 		"console.require.cmd.RequireUserUpdateCmd"); 		//user 계정신청 현황  			

		map.put("require_test", 		"console.require.cmd.RequireTestCmd"); 		//user 계정신청 현황  			

//		map.put("require_write",          		"console.require.cmd.InsertCmd");
//		map.put("require_update",          		"console.require.cmd.UupdateCmd");
//		map.put("require_delete",          		"console.require.cmd.DeleteCmd");
		
		
		
		
		
		
		
			

	//---------------------------작업관리---------------------------------------------------	
		//작업관리 작업중인 세션
		map.put("work_list",          "console.work.cmd.WorkCmd");
		map.put("work_write",          "console.work.cmd.InsertCmd");
		map.put("work_update",          "console.work.cmd.UupdateCmd");
		map.put("work_delete",          "console.work.cmd.DeleteCmd");
	
		//작업관리 작업완료 세션			
		map.put("worked_list",          "console.worked.cmd.WorkedCmd");		
	//-------------------------------------------------------------------------------------
	
		
		
	//---------------------------서비스관리---------------------------------------------------	
		/*
		* name   : 이충섭
		* e-mail : 
		* date   : 2009-02-07 
		*  
		* name   : 최승주
		* e-mail : halfodys@gmail.com
		* date   : 2009-02-07
		* memo   : service_list를 require에서 사용하고 있음 service_admin_list로 대처
		*/
		
		map.put("service_list",           "console.service.cmd.ListCmd");
		map.put("service_write",          "console.service.cmd.InsertCmd");
		map.put("service_update",         "console.service.cmd.UupdateCmd");
		map.put("service_delete",         "console.service.cmd.DeleteCmd");

		//서비스현황 list 조회
		map.put("service_admin_list",     "console.service.cmd.ServiceCmd");

		//서비스 정보수정  팝업
		map.put("service_edit",     	  "console.service.cmd.ServiceUpdateCmd");
		
		//서비스 정보수정 팝업
		map.put("service_oper_reg",       "console.service.cmd.ServiceOperRegCmd");						
	//-------------------------------------------------------------------------------------
	
		
		
	//---------------------------장비관리---------------------------------------------------	
	// 	작성자  : 김명진 
	// 	시스템구분 : 장비 관리  
	//	기      능     : 장비 관리 전체 Cmd 
	// 	날 	짜      :  09 - 1 - 29	
		

		// 장비 목록(장비접속)   해당 장비들에 리스트 (장비접속) 
		map.put("server_list",          "console.server.cmd.ServerListCmd");    
		
		//	시스템장비 등록          페이지에서 장비 등록 버튼을 클릭하면 해당 페이지가 팝업형식으로 띄어줌
		map.put("server_req",			"console.server.cmd.ServerListReqCmd"); 
		
		// 등록 처리 			  장비를 등록해서 해당 리스트 페이지로 다시 이동 함 
		map.put("server_req_ok",		"console.server.cmd.ServerReqOkCmd");	
		
		//	중복 확인                     등록할 장비 id 중복 비교 
		map.put("server_duplicate",		"console.server.cmd.ServerDuplicateCmd");  
		
		//  엑셀 다운 로드		 장비 리스트를 엑셀로 다운로드 
		map.put("exceldown", 			"console.server.cmd.ServerExcelDownCmd");
		
		//	장비 관리 페이지         해당 장비들에 리스트(삭제)
		map.put("server_del",			"console.server.cmd.ServerListDelCmd");  
		
		//  장비 삭제 완료           삭제가 완료되면 해당 페이지로 다시 이동 
		map.put("server_del_ok",		"console.server.cmd.ServerListDelOkCmd"); 

		//  장비 수정 			수정할 장비에 대한 목록을 불러옴 
		map.put("server_edit",			"console.server.cmd.ServerEditCmd");
		
		 // 장비 수정 완료          수정할 장비 목록을 다시 insert 함 
		map.put("server_editIns",		"console.server.cmd.ServerEditInsCmd");	  
		
		
		map.put("server_write",          "console.server.cmd.InsertCmd");
		map.put("server_update",          "console.server.cmd.UupdateCmd");
		map.put("server_delete",          "console.server.cmd.DeleteCmd");
	
	//-------------------------------------------------------------------------------------
		
	
		
	//---------------------------사용자관리---------------------------------------------------	
		map.put("admin_user_reapeat",          		"console.admin.cmd.AdminUseridReapeatCmd");
		map.put("admin_user_join",          		"console.admin.cmd.AdminUserJoinCmd");
		map.put("admin_user_joinins",          		"console.admin.cmd.AdminUserJoinInsCmd");
		map.put("admin_user_joinsys",         		"console.admin.cmd.AdminUserJoinSysCmd");
		map.put("admin_user_joinname",          	"console.admin.cmd.AdminUserJoinSysNameCmd");
		
		
		//사용자 목록 보여주기 
		map.put("admin_user_list",       "console.admin.cmd.AdminUserListCmd");
		
		//시스템 목록 보여주기 
		map.put("admin_user_system_list",       	"console.admin.cmd.AdminUserSystemListCmd");
		
		//사용자 수정 하기 
		map.put("admin_user_edit",		 "console.admin.cmd.AdminUserEditCmd");						//admin.do?cmd=admin_user_edit
		
		
		map.put("admin_write",           "console.admin.cmd.InsertCmd");
		map.put("admin_update",          "console.admin.cmd.UupdateCmd");
		map.put("admin_delete",          "console.admin.cmd.DeleteCmd");
	
	//-------------------------------------------------------------------------------------
		

	//---------------------------코드관리---------------------------------------------------	
	/*
	* name   : 최승주
	* e-mail : halfodys@gmail.com
	* date   : 2009-02-07 
	*/
	    //코드관리 : 회사코드 현황
		map.put("company_list",          "console.company.cmd.CompanyCmd");
	    //코드관리 : 제조사코드 현황
		map.put("product_list",          "console.product.cmd.ProductCmd");
	//-------------------------------------------------------------------------------------		
		
			
	/*************************** 일반사용자 설정 **********************************************/
	
	//-------------------------- Unix 작업신청   ----------------------------------------------
		map.put("unix_list", "console.user.regist.cmd.UnixJobCmd");
	//-------------------------- 일반 유저 메인  ----------------------------------------------
		map.put("user_main", 		"console.user_main.cmd.UserMainCmd"); //usermain.do
		
	//-------------------------- 윈도우 장비 목록   ----------------------------------------------
		
		map.put("user_unix_list", 		"console.user_unix.cmd.UserUnixCmd"); //usermain.do	유닉스 장비 목

	//-------------------------- 윈도우 장비 목록   ----------------------------------------------
		map.put("user_win_list", 	"console.user_window.cmd.UserWindowCmd"); //usermain.do 윈도우 장비 목록
	
	//-------------------------- 일반 사용자 게시판    ----------------------------------------------	
		map.put("user_main"	   , 	"console.user_main.cmd.UserBoardCmd"); //usermain.do
		map.put("user_board"	,	"console.user_board.cmd.UserBoardCmd");//게시판 
		
		map.put("user_uni_systemList",          "console.usermode.cmd.UserUniSystemListCmd");
		
		
		
		return map;
	}
}