//=======================================================================
//시스템구분 : CONSOLE
//실행  환경  : TOMCAT, MySql, JAVA
//프로그램명 : 
//기      능    : 시스템 수정 완료 
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
//								시스템 장비  수정  완료  
//=======================================================================
public class ServerEditInsCmd extends BaseCommand{
	public String str="testabc";
	public String checkbox="";
	
	public ServerEditInsCmd() {
		setNextPage("/server/server_editIns.jsp");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		ResultSetTray rsTray      = null;	// 수정할 SeqNo 불러오기 
		ResultSetTray rsTray2     = null;	// os_type 가 NT(W)일 경우 수정할 PORT , OLD_PORT 구하기
		ResultSetTray rsTray3     = null;	// 수정(PORT_UPDATE)업데이트 하기
		ResultSetTray rsTray4     = null;	// TEMP_TYPE 이UNIX(U) 일 경우 수정할  PORT , OLD_PORT 구하기
		ResultSetTray rsTray5     = null;	// UPDATE TBL_SYSTEM 
		ResultSetTray rsTray6     = null;	// TBL_SYSTEM_HISTORY 삽입   
		ResultSetTray rsTray7     = null;	// ervice_id != pre_svc일경우 삭제  

		
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
			
			rsTray=dao.ListEditSeqNo(getConnection(),reqTray);	   						// 수정할 SeqNo 불러오기 
			 seqNo = rsTray.getInt("ifnull(max(seqno),0)+1");							// seqNo 값 불러옴 
	
			if (os_type.equals("W") && temp_type.equals("W")){ 	  					    // os_type 값을 비교 
			rsTray2=dao.ListEditSeqPortW(getConnection(),reqTray);  					// os_type 가 NT(W)일 경우 수정할 PORT , OLD_PORT 구하기
			rsTray3=dao.ListEditSeqPortUp(getConnection(),reqTray , seqNo , rsTray2); 	// 수정(PORT_UPDATE)업데이트 하기
			}
			else if(os_type.equals("W") &&  temp_type.equals("U")){		
			rsTray4=dao.ListEditSeqPortU(getConnection(),reqTray);  					// TEMP_TYPE 이UNIX(U) 일 경우 수정할  PORT , OLD_PORT 구하기
					new_port = rsTray4.getInt("port");
			}
			
			rsTray5=dao.UPDATE_TBL_SYSTEM(getConnection(),reqTray,new_port);			// UPDATE TBL_SYSTEM 
			rsTray6=dao.TblSystem_History_In(getConnection(),reqTray,new_port);			// TBL_SYSTEM_HISTORY 삽입   
			
			if(service_id != pre_svc){
			rsTray7=dao.TBL_UserSystemDel(getConnection(),reqTray);    					// ervice_id != pre_svc일경우 삭제  
			}

			//System.out.println(rsTray2);
			
		} catch (AppException ex) {
		throw ex;
	}
	catch (Exception ex) {
		throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)占쏙옙占쏙옙 占싹뱄옙 占쏙옙占쏙옙 占쌩삼옙", ex);
	}
		finally{
			request.setAttribute("rsTray", rsTray); 	// 포트 번호 
			request.setAttribute("rsTray2", rsTray2);   //소속서비스 
			request.setAttribute("rsTray3", rsTray3);   //담당자
			request.setAttribute("rsTray4", rsTray4);   //제조사 
			request.setAttribute("rsTray5", rsTray5);   //수정할 목록 불러 오기  
			request.setAttribute("rsTray6", rsTray6);   //수정할 목록 불러 오기   
			System.out.println(rsTray5);
			System.out.println(port);

		}
	}
	
	
	
	
	
}
