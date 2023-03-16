package console.admin.cmd;
//=======================================================================
//시스템구분 : CONSOLE
//실행  환경  : TOMCAT, MySql, JAVA
//프로그램명 : 
//기      능     : 회원가입 
//특이  사항   :  
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
		ResultSetTray rsTray      = null;  // 계정 신청 완료 페이지1 
		ResultSetTray rsTray2     = null;  // 계정 신청 완료 페이지2 
		ResultSetTray rsTray3     = null;  // 계정 신청 완료 페이지3 
		ResultSetTray rsTray4     = null;  // 아이디 중복 확인 
		ResultSetTray rsTray5     = null;  // 핸드폰 중복 확인 
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
					
			
			

				//'사용자 계정을 TBL_USER 등록하는 쿼리
			rsTray3 = dao.adminInsert(getConnection(), reqTray);								//계정 신청 완료 페이지 
			

				
				//'사용자 유형 구분에 일반사용자는 TBL_USER_SYSTEM 운용자는 TBL_SVC_USER 에 등록 하는부분
			if(reqTray.get("kind").equals("A")){
				//아무작업 하지 않는다.
			}
			else if(reqTray.get("kind").equals("O")){
				int temp_len = 0; 
				StringTokenizer tokens = new StringTokenizer(reqTray.get("service_id"),","); 	//신청 서비스 갯수 파악 
				
				for( int x = 1; tokens.hasMoreElements(); x++ ){ 
			     temp_len = +x;
				}		 
				  
				if (temp_len == 0){
					rsTray4 = dao.consolejoinins2(getConnection(), reqTray); 					//신청 완료 페이지2
				}else{
					rsTray5 = dao.consolejoinins2_1(getConnection(), reqTray);					//신청 완료 페이지2-1
				}
			}else if(reqTray.get("kind").equals("G") && reqTray.get("kind").equals("M")){
				int temp_len = 0; 
				StringTokenizer tokens = new StringTokenizer(reqTray.get("sys_id"),","); 		//서비스 갯수 파악
				
				for( int x = 1; tokens.hasMoreElements(); x++ ){ 
					temp_len = +x;
				}
				  if (temp_len==0){
					rsTray6 = dao.svc_id(getConnection(), reqTray);								//신청 서비스 갯수 파악
					
					String svc_id = "";
					svc_id = rsTray6.get("service_id");
					
					rsTray7 = dao.admdinUserSystmeIns(getConnection(), reqTray, svc_id);		//계정 신청 완료 페이지 3
					
				 }else{
					  String service_id2 = "";


					service_id2 = reqTray.getString("sys_id");									// 신청 서비스 자르기 
					String[] temp_sys_id = service_id2.split(",");

					for( int x = 0; x < temp_sys_id.length; x++ )
					{ 
					System.out.println( "문자" + (x) + " = " +temp_sys_id[x]);   
						
					rsTray8 = dao.temp_sys_id(getConnection(), reqTray,  temp_sys_id[x]);
					
					String service_id = "";
					service_id = rsTray8.get("service_id");
					
					rsTray9 = dao.consolejoinins4(getConnection(), reqTray, service_id , temp_sys_id[x]);			//롤백 처리 부분 
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
