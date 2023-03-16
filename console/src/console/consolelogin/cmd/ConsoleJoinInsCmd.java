//=======================================================================
//시스템구분 : CONSOLE
//실행  환경  : TOMCAT, MySql, JAVA
//프로그램명 : 
//기      능    : 회원가입
//특이  사항  :  
//작	 성  자   : 김 명 진 
//날         짜  : 2009-02-06
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
//								로그인 창  
//=======================================================================
public class ConsoleJoinInsCmd extends BaseCommand{
	public String str="testabc";
	public String checkbox="";
	
	public ConsoleJoinInsCmd() {
		setNextPage("/consolelogin/console_joinIns.jsp");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		ResultSetTray IdRepeat2      = null;  // 아이디 중복 검사 
		ResultSetTray HpDuplicate 	 = null;  // 핸드폭 중복 검사  
		ResultSetTray consolejoinin  = null;  // 사용자 계정 신청 등록 
		ResultSetTray App_Service    = null;  // 신청 서비스 등록 
		ResultSetTray App_Services   = null;  // 신청 서비스 등록(다수)
		ResultSetTray Service_Id     = null;  // 신청한 서비스에  service_id 구하기 
		ResultSetTray rsTray7 	     = null;  // 
		ResultSetTray rsTray8 	     = null;  // temp_sys_id
		ResultSetTray rsTray9        = null;  // 
		
		ResultSetTray checkoptiontray     = null;

		int cnt = 0;					// 아이디 중복 검사 
		int temp_len = 0;				// 신청 서비스 갯수 
		String svc_id = "";				// 서비스 신청 아이디
		String service_id = "";			// 신청 서비스 자르기 
		String service_id2 = "";		// 신청 서비스 자르기2
		
		try {
			
			ConsoleJoinDao dao = new ConsoleJoinDao();
			
			if (reqTray.get("uKind").equals("O") && reqTray.get("service_id").equals("")) //담당자 와 서비스 id 확인 
			{ setNextPage("/consolelogin/console_joinIns.jsp?value=1"); }
			
			if ((reqTray.get("uKind").equals("G")  || reqTray.get("uKind").equals("M")) && reqTray.get("sys_id").equals("")) //sys_id가 없을경우 
			{ setNextPage("/consolelogin/console_joinIns.jsp?value=2"); }    
						
			IdRepeat2 = dao.IdRepeat2(getConnection(), reqTray);  						 //아디이 중복 검사 
			cnt = Integer.parseInt(IdRepeat2.getString("cnt"));
			if(cnt > 0 ) 
			{ setNextPage("/consolelogin/console_joinIns.jsp?value=3"); }
			
			
			HpDuplicate = dao.HpDuplicate(getConnection(), reqTray); 				     // 핸드폰 중복 검사 
			cnt = Integer.parseInt(HpDuplicate.getString("cnt"));
			if(cnt > 0 )
			{ setNextPage("/consolelogin/console_joinIns.jsp?value=4"); }
					
			

			//'사용자 계정을 TBL_USER 등록하는 쿼리(모든 계정은 무조건 insert로 들어감 )
			consolejoinin = dao.consolejoinin(getConnection(), reqTray);				 //계정 신청 완료 페이지 

				
		//'사용자 유형 구분에 일반사용자는 TBL_USER_SYSTEM 운용자는 TBL_SVC_USER 에 등록 하는부분
		if(reqTray.get("uKind").equals("O")){
				//$svc_id=$row["service_id"];
				
				temp_len = 0; 
				StringTokenizer tokens = new StringTokenizer(reqTray.get("service_id"),","); //신청 서비스 갯수 파악 
				for( int x = 1; tokens.hasMoreElements(); x++ ){ 
			     System.out.println( "문자" + x + " = " + tokens.nextToken() ); 
			     temp_len = +x;
				 }		 
				  
				if (temp_len == 0){
				App_Service = dao.App_Service(getConnection(), reqTray); 					//신청 서비스 등록 
				}else{

				service_id = "";	   
				service_id = reqTray.getString("service_id");			   					// 신청 서비스 자르기 
				
				String[] temp_svc_id = service_id.split(",");
				
				for(int i=0; i<temp_svc_id.length; i++){
				System.out.println( "문자" + (i) + " = " +temp_svc_id[i] ); 
				App_Services = dao.AppServices(getConnection(), reqTray, temp_svc_id[i]);	//신청 완료 페이지2-1
					}
				}
			
			
		}else{
			temp_len = 0; 
			StringTokenizer tokens = new StringTokenizer(reqTray.get("sys_id"),","); 		//서비스 갯수 파악 
			  for( int x = 1; tokens.hasMoreElements(); x++ ){ 
		     System.out.println( "문자" + x + " = " + tokens.nextToken() ); 
		     temp_len = +x;
			  }
			  if (temp_len==0){
				Service_Id = dao.Service_Id(getConnection(), reqTray);						//신청 서비스 갯수 파악
				
				svc_id = "";
				svc_id = Service_Id.get("service_id");
				System.out.println(Service_Id.get("service_id"));
			
				
				
				rsTray7 = dao.consolejoinins3(getConnection(), reqTray, svc_id); //계정 신청 완료 페이지 3
					
				
					
			  }else{
				    service_id2 = "";
 
					service_id2 = reqTray.getString("sys_id");					// 신청 서비스 자르기 
					String[] temp_sys_id = service_id2.split(",");

					for( int x = 0; x < temp_sys_id.length; x++ )
					{ 
					System.out.println( "문자" + (x) + " = " +temp_sys_id[x] );   
						
					rsTray8 = dao.temp_sys_id(getConnection(), reqTray,  temp_sys_id[x]);
					
					service_id = "";
					service_id = rsTray8.get("service_id");
					
					rsTray9 = dao.consolejoinins4(getConnection(), reqTray, service_id , temp_sys_id[x]);
					}
			  	 } 
			}
			// mysql 롤백 처리 부분 추후 작업 해야함 
		
		} catch (AppException ex) {
		throw ex;
	}
	catch (Exception ex) {
		throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)占쏙옙占쏙옙 占싹뱄옙 占쏙옙占쏙옙 占쌩삼옙", ex);
	}
		finally{
//			request.setAttribute("rsTray", rsTray);    //	계정 신청 완료 페이지1	
//			request.setAttribute("rsTray2", rsTray2);  //	계정 신청 완료 페이지2 
//			request.setAttribute("rsTray3", rsTray3);  //	계정 신청 완료 페이지3 
//			request.setAttribute("rsTray4", rsTray4);  //   사용자 분류2
//			request.setAttribute("rsTray5", rsTray5);  //   서비스 선택 목록 불러 오기
//			request.setAttribute("rsTray6", rsTray6);  //   신청 시스템 불러 오기 			
//			request.setAttribute("checkbox",checkbox); //   CHECK 박스 
		}
	}

}
