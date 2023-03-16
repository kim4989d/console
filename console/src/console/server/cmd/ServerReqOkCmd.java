//=======================================================================
//시스템구분 : CONSOLE
//실행  환경  : TOMCAT, MySql, JAVA
//프로그램명 : 
//기      능    : 시스템 장비 등록 
//특이  사항  :  
//작	 성  자   : 김 명 진 
//날         짜  : 2009-02-06
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
//								시스템 장비 등록 하기 
//=======================================================================
public class ServerReqOkCmd extends BaseCommand{  
	public String str="testabc";
	public String checkbox="";

	
	public ServerReqOkCmd() {
		setNextPage("/server/server_req_ok.jsp");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		ResultSetTray rsTray     = null;		 // TBL_SYSTEM => system_id 값을 비교
		ResultSetTray rsTray2     = null;		 // service_id , charger_id 값을 비교
		ResultSetTray rsTray3     = null;		 // OS_TYPE값이 "W" 이면 실행
		ResultSetTray rsTray4     = null;		 // 시스템 등록 하기 
		ResultSetTray rsTray5     = null;		 // 시스템 HISTORY 등록 하기
		ResultSetTray checkoptiontray = null;
		int port = 0;
//		String message="";
		
//		String cmd=reqTray.get("cmd");
//		String write="";
//		시스템 장비 등록 하기 	
		try {
			ListDao dao = new ListDao();
			
			checkoptiontray=dao.ServerCheckBoxList(getConnection(),reqTray);	 //채크 박스 리스트 불러 오기 
			checkbox =	CommonUtil.ServerSelectBox(checkoptiontray,reqTray); //select 박스 목록 
			
			String PARA = reqTray.getString("PARA");	      			 // $PARA = $_SERVER["QUERY_STRING"];
			
			rsTray=dao.ServerReqOk(getConnection(),reqTray);   			 //TBL_SYSTEM => system_id 값을 비교
			
			int cnt = Integer.parseInt(rsTray.get("cnt"));				 //cnt(총 레코드수를 불러옴), 중복 체크 
			
		if(cnt>0){  //해당 아이디가 존재할 경우 페이지로 이동
					setNextPage("server.do?cmd=server_duplicate&i=1&"+PARA);	
			}
		else{		// 해당 아이디가 존재하지 않을 경우 나머지 구문 실행 
			//rsTray2=dao.ServerReqOk2(getConnection(),reqTray);			//service_id , charger_id 값을 비교
		
/**
 * ******************* 시연용 임시 설정******************** 			
		if(rsTray2.getRowCount()==0){									//서비스 담당자인지 
					setNextPage("server.do?cmd=server_duplicate&i=2"+PARA);
		}
		else{
		
			//해당 포트 번호 구해옴 "W" 일 경우 
				
				System.out.println("============================");	
				System.out.println(reqTray.getString("os_type"));
				System.out.println("============================");	
				
			if(reqTray.getString("os_type").equals("W") || reqTray.getString("os_type")=="W")//OS_TYPE값이 "W" 이면 실행	
			{
				rsTray3=dao.ServerReqOk3(getConnection(),reqTray); 
				port = Integer.parseInt(rsTray3.get("port"));
				}
	//		}else{																 //OS_TYPE "U" 일경우는 해당 포트가 필요 없음. 
	//			//port = 23;	         										 //고정 포트 사용 하기 UNIX
	//			}
				rsTray4=dao.ServerReqOk4(getConnection(),reqTray,port);			 //시스템 등록 하기
				rsTray5=dao.ServerReqOk5(getConnection(),reqTray,port);			 //시스템HITORY 등록 하기 
				
				
	//		   QUERY문 확인 하기 위한 
				System.out.println(rsTray);    									 //  TBL_SYSTEM => system_id 값을 비교
				System.out.println(rsTray2);   									 // service_id , charger_id 값을 비교
				System.out.println(rsTray3);   									 // OS_TYPE 값이  'W' 이면 실행 시킴
				System.out.println(rsTray4);   									 // 시스템 등록 하기 
				System.out.println(rsTray5);   									 // 시스템 HISTORY 등록 하기
			
			}
**************************************************************/

			rsTray4=dao.ServerReqOk4(getConnection(),reqTray,port);			 //시스템 등록 하기
			rsTray5=dao.ServerReqOk5(getConnection(),reqTray,port);			 //시스템HITORY 등록 하기 
		
		}
			
		} catch (AppException ex) {
		throw ex;
	}
	catch (Exception ex) {
		throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)占쏙옙占쏙옙 占싹뱄옙 占쏙옙占쏙옙 占쌩삼옙", ex);
	}
		finally{
			request.setAttribute("rsTray", rsTray);						//  TBL_SYSTEM => system_id 값을 비교
			request.setAttribute("rsTray2", rsTray2);   				// service_id , charger_id 값을 비교
			request.setAttribute("rsTray3", rsTray3);   				// OS_TYPE 값이  'W' 이면 실행 시킴
			request.setAttribute("rsTray4", rsTray4);   				// 시스템 등록 하기
			request.setAttribute("rsTray5", rsTray5);   				// 시스템 HISTORY 등록 하기 
			
		}
	}
	
}
