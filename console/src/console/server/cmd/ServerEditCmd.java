//=======================================================================
//시스템구분 : CONSOLE
//실행  환경  : TOMCAT, MySql, JAVA
//프로그램명 : 
//기      능    : 시스템 수정 
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
//								시스템 수정  하는 창 
//=======================================================================
public class ServerEditCmd extends BaseCommand{
	public String str="testabc";
	public String checkbox="";
	
	public ServerEditCmd() {
		setNextPage("/server/server_edit.jsp");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		ResultSetTray rsTray     = null;
		ResultSetTray rsTray2     = null;
		ResultSetTray rsTray3     = null;
		ResultSetTray rsTray4     = null;
		ResultSetTray rsTray5     = null;
		ResultSetTray rsTray6     = null;
		ResultSetTray checkoptiontray = null;
		String  NT_port = "0";
		String port = "0";
		
//		String cmd=reqTray.get("cmd");
//		String write="";
		
		try {
			ListDao dao = new ListDao();
			
			//checkoptiontray=dao.ServerCheckBoxList(getConnection(),reqTray);
			//checkbox=	CommonUtil.ServerSelectBox(checkoptiontray,reqTray);
			
			rsTray=dao.ListReq(getConnection(),reqTray);	 // 포트 번호 
			rsTray2=dao.ListReq2(getConnection(),reqTray);   // 소속 서비스  
			rsTray3=dao.ListReq3(getConnection(),reqTray);   // 담당자 
			rsTray4=dao.ListReq4(getConnection(),reqTray);   // 제조사 
			rsTray5=dao.ListEdit(getConnection(),reqTray);	 // 수정할 목록 불러오기  
			
			
			for(int i=0;i<rsTray5.getRowCount();i++){
			System.out.println("###################### "+rsTray5.get("fixedflag"));
			}
			
			
			
			
			if(rsTray5.getString("ostype").equals("W"))
			{
				port = rsTray5.getString("port");
				rsTray6=dao.ListEditPort(getConnection(),reqTray,port); 
				NT_port = rsTray6.getString("seqno");
			}if(NT_port.equals("0") || NT_port.equals(""))
			{
				NT_port = (port);
			}
			
			
//			
//			if(rsTray5.getInt("port") != 0)
//			{
//				if (rsTray5.get("ostype").equals("W")){
//				port = rsTray5.getInt("port");
//				rsTray6=dao.ListEditPort(getConnection(),reqTray,port); 
//				
//				System.out.println("============================");
//				System.out.println((rsTray6.getString("seqno")));		   // 포트 번호 	
//				System.out.println("============================");
//																		   //몇번 포트 인지 받아옴 
//				}
//			}
			
			
			
			
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
			request.setAttribute("NT_port", port	);	//윈도우 시스템 포트 번호 불러 오기 
			
//			System.out.println(rsTray5);
//			System.out.println(port);

		}
	}
	
	
	
	
	
}
